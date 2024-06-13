------------------------------------------------------------------------------
--                                                                          --
--                  Copyright (C) 2015-2018, AdaCore                        --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of STMicroelectronics nor the names of its       --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

with System;          use System;
with STM32.Device;
with Ada.Assertions;  use Ada.Assertions;

with STM32_SVD.RCC;
with STM32_SVD.FDCAN; use STM32_SVD.FDCAN;

package body STM32.CAN is

   -------------------
   -- Set_Init_Mode --
   -------------------

   procedure Set_Init_Mode
     (This    : in out CAN_Controller;
      Enabled : Boolean)
   is
      Deadline : constant Time := Clock + Default_Timeout;
      Success : Boolean;
   begin
      This.CCCR.INIT := Enabled;

      while Clock < Deadline loop
         if Enabled then
            Success := Is_Init_Mode (This);
         else
            Success := not Is_Init_Mode (This);
         end if;
         exit when Success;
      end loop;
   end Set_Init_Mode;

   ---------------------
   -- Enter_Init_Mode --
   ---------------------

   procedure Enter_Init_Mode
     (This : in out CAN_Controller)
   is
   begin
      Set_Init_Mode (This, True);
      This.CCCR.CCE := True; --  Enable configuration change
   end Enter_Init_Mode;

   ------------------
   -- Is_Init_Mode --
   ------------------

   function Is_Init_Mode (This : CAN_Controller) return Boolean is
      (This.CCCR.INIT);

   --------------------
   -- Exit_Init_Mode --
   --------------------

   procedure Exit_Init_Mode
     (This : in out CAN_Controller)
   is
   begin
      Set_Init_Mode (This, False);
   end Exit_Init_Mode;

   --------------------
   -- Set_Sleep_Mode --
   --------------------
   --  The FDCAN can be set into power down mode controlled by clock stop
   --  request input via CC control register CCCR[CSR]. As long as the clock
   --  stop request is active, bit CCCR[CSR] is read as 1.
   --  When all pending transmission requests have completed, the FDCAN waits
   --  until bus idle state is detected. Then the FDCAN sets then CCCR[INIT] to
   --  1 to prevent any further CAN transfers. Now the FDCAN acknowledges that
   --  it is ready for power down by setting CCCR[CSA] to 1. In this state,
   --  before the clocks are switched off, further register accesses can be
   --  made. A write access to CCCR[INIT] has no effect. Now the module clock
   --  inputs may be switched off.
   --  To leave power down mode, the application has to turn on the module
   --  clocks before resetting CC control register flag CCCR.CSR. The FDCAN
   --  acknowledges this by resetting CCCR[CSA]. Afterwards, the application
   --  can restart CAN communication by resetting bit CCCR[INIT].

   procedure Set_Sleep_Mode
     (This    : in out CAN_Controller;
      Enabled : Boolean)
   is
      Deadline : constant Time := Clock + Default_Timeout;
      Success : Boolean;
   begin
      This.CCCR.CSR := Enabled;

      while Clock < Deadline loop
         if Enabled then
            Success := Is_Sleep_Mode (This);
         else
            Success := not Is_Sleep_Mode (This);
         end if;
         exit when Success;
      end loop;
   end Set_Sleep_Mode;

   -----------
   -- Sleep --
   -----------

   procedure Sleep (This : in out CAN_Controller) is
   begin
      Set_Sleep_Mode (This, True);
      STM32_SVD.RCC.RCC_Periph.APB1HENR.FDCANEN := False; --  Disable clock
   end Sleep;

   -------------------
   -- Is_Sleep_Mode --
   -------------------

   function Is_Sleep_Mode (This : CAN_Controller) return Boolean is
      (This.CCCR.CSA);

   ------------
   -- Wakeup --
   ------------

   procedure Wakeup (This : in out CAN_Controller) is
   begin
      STM32_SVD.RCC.RCC_Periph.APB1HENR.FDCANEN := True; --  Enable clock
      Set_Sleep_Mode (This, False);
      Exit_Init_Mode (This);
   end Wakeup;

   -------------------------------
   -- Configure_Clock_Prescaler --
   -------------------------------

   procedure Configure_Clock_Prescaler
     (This    : CAN_Controller;
      Divider : Clock_Divider)
   is
   begin
      --  FDCAN1 should be initialized in order to use clock prescaler
      if This'Address = STM32_SVD.FDCAN1_Base then
         --  Bypass clock calibration
         CAN_CCU_Periph.CCFG.BCC := True;
         --  Configure clock divider
         CAN_CCU_Periph.CCFG.CDIV := Divider'Enum_Rep;
      else
         raise STM32.Device.Unknown_Device;
      end if;
   end Configure_Clock_Prescaler;

   ---------------------------------
   -- Configure_Clock_Calibration --
   ---------------------------------

   procedure Configure_Clock_Calibration
     (This        : in out CAN_Controller;
      Time_Quanta : UInt5;
      Length      : Calibration_Field_Length;
      Min_Period  : UInt8;
      Watchdog    : UInt16)
   is
   begin
      --  FDCAN1 should be initialized in order to use clock calibration.
      if This'Address = STM32_SVD.FDCAN1_Base then
         --  Do not bypass clock calibration
         CAN_CCU_Periph.CCFG.BCC := False;
         CAN_CCU_Periph.CCFG :=
           (TQBT   => Time_Quanta,
            CFL    => Length = Bits_64,
            OCPM   => Min_Period,
            others => <>);
         --  Configure the start value of the calibration watchdog counter.
         CAN_CCU_Periph.CWD.WDC := Watchdog;
         --  Set baudrate prescalers to inactive
         This.NBTP.NBRP := 0;
         This.DBTP.DBRP := 0;
      else
         raise STM32.Device.Unknown_Device;
      end if;
   end Configure_Clock_Calibration;

   -----------------------------
   -- Reset_Clock_Calibration --
   -----------------------------

   procedure Reset_Clock_Calibration
     (This : CAN_Controller)
   is
   begin
      --  FDCAN1 should be initialized in order to use clock calibration
      if This'Address = STM32_SVD.FDCAN1_Base then
         CAN_CCU_Periph.CCFG.SWR := True;
      else
         raise STM32.Device.Unknown_Device;
      end if;
   end Reset_Clock_Calibration;

   ---------------------------
   -- Get_Calibration_State --
   ---------------------------

   function Get_Calibration_State return Calibration_State is
   begin
      return Calibration_State'Enum_Val (CAN_CCU_Periph.CSTAT.CALS);
   end Get_Calibration_State;

   ----------------------------
   -- Get_Calibration_Values --
   ----------------------------

   procedure Get_Calibration_Values
     (Time_Quanta : out UInt11;
      Min_Period  : out UInt18;
      Watchdog    : out UInt16)
   is
   begin
      Time_Quanta := CAN_CCU_Periph.CSTAT.TQC;
      Min_Period := CAN_CCU_Periph.CSTAT.OCPC;
      Watchdog := CAN_CCU_Periph.CWD.WDV;
   end Get_Calibration_Values;

   --------------------------
   -- Calculate_Bit_Timing --
   --------------------------

   procedure Calculate_Bit_Timing
     (This           : aliased CAN_Controller;
      Speed_N        : Bit_Rate_Range_N;
      Speed_D        : Bit_Rate_Range_D;
      Sample_Point_N : Sample_Point_Range;
      Sample_Point_D : Sample_Point_Range;
      Tolerance      : Clock_Tolerance;
      Bit_Timing_N   : out Bit_Timing_Config_N;
      Bit_Timing_D   : out Bit_Timing_Config_D)
   is
      use STM32.Device;

      --  Input clock to FDCAN
      Clock_In : Float;
      --  Clock divisor
      Clock_Div : UInt4;
      --  Time Quanta in one Bit Time in Nominal (Arbitration) phase
      Time_Quanta_N : Float;
      --  Time Quanta in one Bit Time in Data phase
      Time_Quanta_D : Float;
      --  Found Bit Time Quanta value for Nominal (Arbitration) phase.
      BTQ_N : Boolean := False;
      --  Found Bit Time Quanta value for Data phase.
      BTQ_D : Boolean := False;

      function Maxim (A : Float; B : Float) return Float is
        (if A > B then A else B);

   begin
      --  The CAN clock frequency comes from three sources: APB1 peripheral
      --  (PCLK1), PLLQ or HSE clock.
      Clock_In := Float (Get_Clock_Frequency (This));

      --  Clock divisor for the CAN kernel clock
      Clock_Div := (if CAN_CCU_Periph.CCFG.CDIV = 0 then 1 else
                       CAN_CCU_Periph.CCFG.CDIV * 2);
      --  The nominal kernel clock is divided by the clock divider.
      Clock_In := Clock_In / Float (Clock_Div);

      --  Calculations for Nominal (arbitration) phase
      --  Assure the clock frequency is high enough.
      pragma Assert
        (Integer (Clock_In / (Speed_N * 1_000.0 *
         Float (Time_Quanta_Prescaler_N'First))) < Bit_Time_Quanta_N'First,
         "CAN clock frequency too low for Nominal bit rate.");
      --  Assure the clock frequency is low enough.
      pragma Assert
        (Integer (Clock_In / (Speed_N * 1_000.0 *
         Float (Time_Quanta_Prescaler_N'Last))) > Bit_Time_Quanta_N'Last,
         "CAN clock frequency too high for Nominal bit rate.");

      for I in Time_Quanta_Prescaler_N'First .. Time_Quanta_Prescaler_N'Last loop
         --  Choose the minimum divisor for the maximum number of Time Quanta.
         Time_Quanta_N := Clock_In / (Speed_N * 1000.0 * Float (I));

         --  Test if number of quanta in bit time < minimum number of quanta
         if Integer (Time_Quanta_N) < Bit_Time_Quanta_N'First then
            exit;
         --  Test if number of quanta in bit time <= maximum number of quanta
         --  and if Sample Point <= SYNC_SEG + maximum of (PROP_SEG + PHASE_SEG1)
         elsif Integer (Time_Quanta_N) <= Bit_Time_Quanta_N'Last and
           Integer (Time_Quanta_N * Sample_Point_N / 100.0) <=
             (Segment_Sync_Quanta + Segment_1_Quanta_N'Last)
         then
            --  Calculate time segments
            Bit_Timing_N.Time_Segment_1 :=
              Integer (Time_Quanta_N * Sample_Point_N / 100.0) - Segment_Sync_Quanta;
            --  Casting a float to integer rounds it to the near integer.
            Bit_Timing_N.Time_Segment_2 :=
              Integer (Time_Quanta_N) - Segment_Sync_Quanta - Bit_Timing_N.Time_Segment_1;

            Bit_Timing_N.Resynch_Jump_Width := Bit_Timing_N.Time_Segment_2;

            --  We want a division that gives tolerance inside tolerance range.
            if Tolerance >= abs (Clock_In - Float (Integer (Time_Quanta_N) * I) *
                 Speed_N * 1000.0) * 100.0 / Clock_In and
              Tolerance <= Float (Bit_Timing_N.Resynch_Jump_Width) /
                Float (20 * Integer (Time_Quanta_N)) and
              Tolerance <= Float (Bit_Timing_N.Time_Segment_2) /
                Float (2 * (13 * Integer (Time_Quanta_N)))
            then
               Bit_Timing_N.Quanta_Prescaler := I;
               BTQ_N := True;

               --  Calculations for Data phase
               --  Assure the clock frequency is high enough.
               pragma Assert
                 (Integer (Clock_In / (Speed_D * 1_000.0 *
                  Float (Time_Quanta_Prescaler_D'First))) < Bit_Time_Quanta_D'First,
                  "CAN clock frequency too low for Data bit rate.");
               --  Assure the clock frequency is low enough.
               pragma Assert
                 (Integer (Clock_In / (Speed_D * 1_000.0 *
                  Float (Time_Quanta_Prescaler_D'Last))) > Bit_Time_Quanta_D'Last,
                  "CAN clock frequency too high for Data bit rate.");

               for J in Time_Quanta_Prescaler_D'First .. Time_Quanta_Prescaler_D'Last loop
                  --  Choose the minimum divisor for the maximum number of Time Quanta.
                  Time_Quanta_D := Clock_In / (Speed_D * 1000.0 * Float (J));

                  --  Test if number of quanta in bit time < minimum number of quanta
                  if Integer (Time_Quanta_D) < Bit_Time_Quanta_D'First then
                     exit;
                  --  Test if number of quanta in bit time <= maximum number of quanta
                  --  and if Sample Point <= SYNC_SEG + maximum of (PROP_SEG + PHASE_SEG1)
                  elsif Integer (Time_Quanta_D) <= Bit_Time_Quanta_D'Last and
                    Integer (Time_Quanta_D * Sample_Point_D / 100.0) <=
                      (Segment_Sync_Quanta + Segment_1_Quanta_D'Last)
                  then
                     --  Calculate time segments
                     Bit_Timing_D.Time_Segment_1 :=
                       Integer (Time_Quanta_D * Sample_Point_D / 100.0) - Segment_Sync_Quanta;
                     --  Casting a float to integer rounds it to the near integer.
                     Bit_Timing_D.Time_Segment_2 :=
                       Integer (Time_Quanta_D) - Segment_Sync_Quanta - Bit_Timing_D.Time_Segment_1;

                     Bit_Timing_D.Resynch_Jump_Width := Bit_Timing_D.Time_Segment_2;

                     --  We want a division that gives tolerance inside tolerance range.
                     if Tolerance >= abs (Clock_In - Float (Integer (Time_Quanta_D) * J) *
                          Speed_D * 1000.0) * 100.0 / Clock_In and
                       Tolerance <= Float (Bit_Timing_D.Resynch_Jump_Width) /
                         Float (20 * Integer (Time_Quanta_D)) and
                       Tolerance <= Float (Bit_Timing_N.Time_Segment_2) /
                         (2.0 * Float (6 * Integer (Time_Quanta_D) - Bit_Timing_D.Time_Segment_2) *
                           Float (Bit_Timing_D.Quanta_Prescaler) / Float (Bit_Timing_N.Quanta_Prescaler) +
                             7.0 * Float (Integer (Time_Quanta_N))) and
                       Tolerance <= (Float (Bit_Timing_D.Resynch_Jump_Width) -
                         Maxim (0.0, Float (Bit_Timing_N.Quanta_Prescaler) / Float (J) - 1.0)) /
                           (2.0 * (Float (2 * Integer (Time_Quanta_N) - Bit_Timing_N.Time_Segment_2) *
                             Float (Bit_Timing_N.Quanta_Prescaler) / Float (J) +
                               Float (Bit_Timing_D.Time_Segment_2 + 4 * Integer (Time_Quanta_D))))
                     then
                        Bit_Timing_D.Quanta_Prescaler := J;
                        BTQ_D := True;
                        exit;
                     end if;
                  end if;
               end loop;

               pragma Assert
                 (not BTQ_D, "Can't find a division factor for Data bit rate within tolerance.");

               exit;
            end if;
         end if;
      end loop;

      pragma Assert
        (not BTQ_N, "Can't find a division factor for Nominal bit rate within tolerance.");

   end Calculate_Bit_Timing;

   --------------------------
   -- Configure_Bit_Timing --
   --------------------------

   procedure Configure_Bit_Timing
     (This         : in out CAN_Controller;
      Bit_Timing_N : Bit_Timing_Config_N;
      Bit_Timing_D : Bit_Timing_Config_D)
   is
   begin
      This.NBTP :=
        (NTSEG2         => UInt7 (Bit_Timing_N.Time_Segment_2 - 1),
         Reserved_7_7   => 0,
         NTSEG1         => UInt8 (Bit_Timing_N.Time_Segment_1 - 1),
         NBRP           => UInt9 (Bit_Timing_N.Quanta_Prescaler - 1),
         NSJW           => UInt7 (Bit_Timing_N.Resynch_Jump_Width - 1));

      This.DBTP :=
        (DSJW           => UInt4 (Bit_Timing_D.Resynch_Jump_Width - 1),
         DTSEG2         => UInt4 (Bit_Timing_D.Time_Segment_2 - 1),
         DTSEG1         => UInt5 (Bit_Timing_D.Time_Segment_1 - 1),
         Reserved_13_15 => 0,
         DBRP           => UInt5 (Bit_Timing_D.Quanta_Prescaler - 1),
         Reserved_21_22 => 0,
         TDC            => This.DBTP.TDC,
         Reserved_24_31 => 0);
   end Configure_Bit_Timing;

   ------------------------
   -- Set_Operating_Mode --
   ------------------------

   procedure Set_Operating_Mode
     (This : in out CAN_Controller;
      Mode : Operating_Mode)
   is
   begin
      case Mode is
         when Normal =>
            This.CCCR.TEST := False;
            This.TEST.LBCK := False;
            This.CCCR.MON := False;
            This.CCCR.ASM := False;

         when Loopback =>
            --  Enable write access to CCCR.TEST register.
            This.CCCR.TEST := True;
            This.TEST.LBCK := True;
            This.CCCR.MON := False;
            This.CCCR.ASM := False;

         when Silent =>
            This.CCCR.TEST := False;
            This.TEST.LBCK := False;
            This.CCCR.MON := True;
            This.CCCR.ASM := False;

         when Silent_Loopback =>
            --  Enable write access to CCCR.TEST register.
            This.CCCR.TEST := True;
            This.TEST.LBCK := True;
            This.CCCR.MON := True;
            This.CCCR.ASM := False;

         when Restricted =>
            This.CCCR.TEST := False;
            This.TEST.LBCK := False;
            This.CCCR.MON := False;
            This.CCCR.ASM := True;
      end case;
   end Set_Operating_Mode;

   ------------------------
   -- Is_Restricted_Mode --
   ------------------------

   function Is_Restricted_Mode
     (This : CAN_Controller) return Boolean
   is
   begin
      return This.CCCR.ASM = True;
   end Is_Restricted_Mode;

   ----------------------
   -- Set_Frame_Format --
   ----------------------

   procedure Set_Frame_Format
     (This  : in out CAN_Controller;
      Frame : Frame_Format)
   is
   begin
      case Frame is
         when Classic =>
            This.CCCR.FDOE := False;
            This.CCCR.BRSE := False;

         when FD_No_BRS =>
            This.CCCR.FDOE := True;
            This.CCCR.BRSE := False;

         when FD_BRS =>
            This.CCCR.FDOE := True;
            This.CCCR.BRSE := True;
      end case;
   end Set_Frame_Format;

   ------------------------
   -- Set_Edge_Filtering --
   ------------------------

   procedure Set_Edge_Filtering
     (This    : in out CAN_Controller;
      Enabled : Boolean)
   is
   begin
      This.CCCR.EFBI := Enabled;
   end Set_Edge_Filtering;

   ----------------------
   -- Set_Non_ISO_Mode --
   ----------------------

   procedure Set_Non_ISO_Mode
     (This    : in out CAN_Controller;
      Enabled : Boolean)
   is
   begin
      This.CCCR.NISO := Enabled;
   end Set_Non_ISO_Mode;

   ---------------
   -- Configure --
   ---------------

   procedure Configure
     (This                : in out CAN_Controller;
      Mode                : Operating_Mode;
      Frame               : Frame_Format;
      Auto_Retransmission : Boolean;
      Exception_Handling  : Boolean;
      Edge_Filtering      : Boolean;
      Pause_Transmission  : Boolean;
      Non_ISO_Operation   : Boolean;
      Bit_Timing_N        : Bit_Timing_Config_N;
      Bit_Timing_D        : Bit_Timing_Config_D)
   is
   begin
      Wakeup (This);

      Enter_Init_Mode (This);

      This.CCCR :=
        (DAR    => not Auto_Retransmission,
         PXHD   => Exception_Handling,
         EFBI   => Edge_Filtering,
         TXP    => Pause_Transmission,
         NISO   => Non_ISO_Operation,
         others => <>);

      Configure_Bit_Timing (This, Bit_Timing_N, Bit_Timing_D);

      Set_Operating_Mode (This, Mode);
      Set_Frame_Format (This, Frame);

      Exit_Init_Mode (This);
   end Configure;

   -------------------------------------
   -- Configure_Tx_Delay_Compensation --
   -------------------------------------

   procedure Configure_Tx_Delay_Compensation
     (This   : in out CAN_Controller;
      Offset : UInt7;
      Window : UInt7)
   is
   begin
      This.TDCR.TDCO := Offset;
      This.TDCR.TDCF := Window;
   end Configure_Tx_Delay_Compensation;

   -------------------------------
   -- Set_Tx_Delay_Compensation --
   -------------------------------

   procedure Set_Tx_Delay_Compensation
     (This    : in out CAN_Controller;
      Enabled : Boolean)
   is
   begin
      This.DBTP.TDC := Enabled;
   end Set_Tx_Delay_Compensation;

   ---------------------------------
   -- Configure_Timestamp_Counter --
   ---------------------------------

   procedure Configure_Timestamp_Counter
     (This      : in out CAN_Controller;
      Prescaler : Timestamp_Prescaler)
   is
   begin
      This.TSCC.TCP := UInt4 (Prescaler - 1);
   end Configure_Timestamp_Counter;

   ---------------------------
   -- Set_Timestamp_Counter --
   ---------------------------

   procedure Set_Timestamp_Counter
     (This : in out CAN_Controller;
      Mode : Timestamp_Select)
   is
   begin
      This.TSCC.TSS := Mode'Enum_Rep;
   end Set_Timestamp_Counter;

   -----------------------------
   -- Clear_Timestamp_Counter --
   -----------------------------

   procedure Clear_Timestamp_Counter (This : in out CAN_Controller) is
   begin
      This.TSCV.TSC := 0;
   end Clear_Timestamp_Counter;

   ---------------------------
   -- Get_Timestamp_Counter --
   ---------------------------

   function Get_Timestamp_Counter (This : CAN_Controller) return UInt16 is
   begin
      return This.TSCV.TSC;
   end Get_Timestamp_Counter;

   -------------------------------
   -- Configure_Timeout_Counter --
   -------------------------------

   procedure Configure_Timeout_Counter
     (This    : in out CAN_Controller;
      Mode    : Timeout_Mode;
      Period  : UInt16)
   is
   begin
      This.TOCC.TOS := Mode'Enum_Rep;
      This.TOCC.TOP := Period;
   end Configure_Timeout_Counter;

   -------------------------
   -- Set_Timeout_Counter --
   -------------------------

   procedure Set_Timeout_Counter
     (This    : in out CAN_Controller;
      Enabled : Boolean)
   is
   begin
      This.TOCC.ETOC := Enabled;
   end Set_Timeout_Counter;

   ---------------------------
   -- Reset_Timeout_Counter --
   ---------------------------

   procedure Reset_Timeout_Counter (This : in out CAN_Controller) is
   begin
      if This.TOCC.TOS = Continuous'Enum_Rep then
         This.TOCV.TOC := 0;
      end if;
   end Reset_Timeout_Counter;

   -------------------------
   -- Get_Timeout_Counter --
   -------------------------

   function Get_Timeout_Counter (This : CAN_Controller) return UInt16 is
   begin
      return This.TSCV.TSC;
   end Get_Timeout_Counter;

   ----------------------
   -- Set_RAM_Watchdog --
   ----------------------

   procedure Set_RAM_Watchdog
     (This  : in out CAN_Controller;
      Value : UInt8)
   is
   begin
      This.RWD.WDC := Value;
   end Set_RAM_Watchdog;

   ----------------------
   -- Get_RAM_Watchdog --
   ----------------------

   function Get_RAM_Watchdog (This : CAN_Controller) return UInt8 is
   begin
      return This.RWD.WDV;
   end Get_RAM_Watchdog;

   ----------------------------------
   -- Set_Transmitter_Delay_Offset --
   ----------------------------------

   procedure Set_Transmitter_Delay_Offset
     (This   : in out CAN_Controller;
      Offset : UInt7)
   is
   begin
      This.TDCR.TDCO := Offset;
   end Set_Transmitter_Delay_Offset;

   ----------------------------------
   -- Set_Transmitter_Delay_Window --
   ----------------------------------

   procedure Set_Transmitter_Delay_Window
     (This   : in out CAN_Controller;
      Window : UInt7)
   is
   begin
      This.TDCR.TDCF := Window;
   end Set_Transmitter_Delay_Window;

   ---------------------------
   -- Configure_Message_Ram --
   ---------------------------

   procedure Configure_Message_Ram
     (This    : in out CAN_Controller;
      Message : Message_RAM_Size)
   is
      FLSSA : constant UInt14 := 0;
      --  Filter list standard start address (relative to SRAMCAN_Base).
      FLESA : constant UInt14 := FLSSA + Filter_Std_Elmt_Size * Message.Filter_Std_Size;
      --  Filter list extended start address.

      RF0SA : constant UInt14 := FLESA + Filter_Ext_Elmt_Size * Message.Filter_Ext_Size;
      --  Rx FIFO 0 start address.
      RF1SA : constant UInt14 := RF0SA + Rx_Fifo_Elmt_Size * Message.Rx_Fifo_0_Size;
      --  Rx FIFO 1 start address.
      RBLSA : constant UInt14 := RF1SA + Rx_Fifo_Elmt_Size * Message.Rx_Fifo_1_Size;
      --  Rx buffer list start address.

      TEFSA : constant UInt14 := RBLSA + Rx_Buffer_Elmt_Size * Message.Rx_Buffer_Size;
      --  Tx event FIFO start address.
      TBLSA : constant UInt14 := TEFSA + Tx_Event_Elmt_Size * Message.Tx_Event_Size;
      --  Tx buffer list start address.

      End_Address : constant UInt14 := TBLSA + Tx_Buffer_Elmt_Size * Message.Tx_Buffer_Size;
      --  Last address of the Message RAM.

      --  Assure that the message is not greater then the memory.
      pragma Assert (End_Address > Message_RAM_Offset'Last, "Message RAM overflow.");

   begin
      --  Standard filter list start address.
      This.SIDFC.FLSSA := Message.Start_Address + FLSSA;
      --  Standard filter elements number.
      This.SIDFC.LSS := UInt8 (Message.Filter_Std_Size);
      --  Extended filter list start address.
      This.XIDFC.FLESA := Message.Start_Address + FLESA;
      --  Extended filter elements number.
      This.XIDFC.LSE := UInt8 (Message.Filter_Ext_Size);

      --  Rx FIFO 0 start address.
      This.RXF0C.F0SA := Message.Start_Address + RF0SA;
      --  Rx FIFO 0 elements number.
      This.RXF0C.F0S := UInt7 (Message.Rx_Fifo_0_Size);
      --  Rx FIFO 1 start address.
      This.RXF1C.F1SA := Message.Start_Address + RF1SA;
      --  Rx FIFO 1 elements number.
      This.RXF1C.F1S := UInt7 (Message.Rx_Fifo_1_Size);
      --  Rx Buffer list start address.
      This.RXBC.RBSA := Message.Start_Address + RBLSA;

      --  Tx Event FIFO start address.
      This.TXEFC.EFSA := Message.Start_Address + TEFSA;
      --  Tx Event FIFO elements number.
      This.TXEFC.EFS := UInt6 (Message.Tx_Event_Size);
      --  Tx Buffer list start address.
      This.TXBC.TBSA := Message.Start_Address + TBLSA;
      --  Dedicated Tx Buffers number.
      This.TXBC.NDTB := UInt6 (Message.Tx_Buffer_Size);
      --  Tx FIFO/Queue elements number.
      This.TXBC.TFQS := UInt6 (Message.Tx_FifoQ_Size);

      --  Flush the allocated Message RAM area
      Message_Ram (Message.Start_Address .. End_Address) := (others => 0);
   end Configure_Message_Ram;

   -----------------------------
   -- Configure_Global_Filter --
   -----------------------------

   procedure Configure_Global_Filter
     (This         : in out CAN_Controller;
      Remote_Std   : Remote_Frames_Mode;
      Remote_Ext   : Remote_Frames_Mode;
      NonMatch_Std : NonMatching_Frames_Mode;
      NonMatch_Ext : NonMatching_Frames_Mode)
   is
   begin
      This.GFC :=
        (RRFS   => Remote_Std = Reject,
         RRFE   => Remote_Ext = Reject,
         ANFS   => NonMatch_Std'Enum_Rep,
         ANFE   => NonMatch_Ext'Enum_Rep,
         others => <>);
   end Configure_Global_Filter;

   --------------------------------
   -- Configure_Extended_ID_Mask --
   --------------------------------

   procedure Configure_Extended_ID_Mask
     (This : in out CAN_Controller;
      Mask : CAN_Extended_Id)
   is
   begin
      This.XIDAM.EIDM := Mask;
   end Configure_Extended_ID_Mask;

   --------------------------
   -- Configure_Std_Filter --
   --------------------------

   procedure Configure_Std_Filter
     (This    : in out CAN_Controller;
      Bank_Nr : Filter_Bank_Std_Nr;
      ID_Type : Filter_Type;
      Config  : Filter_Configuration;
      SFID_1  : CAN_Standard_Id;
      SFID_2  : CAN_Standard_Id)
   is
      Filter_Address : constant UInt14 :=
        This.SIDFC.FLSSA + (Bank_Nr - 1) * Filter_Std_Elmt_Size;
      Filter_Element : Filter_Std_Element
        with Address => Message_Ram (Filter_Address)'Address;
   begin
      Filter_Element :=
        (SFT       => ID_Type'Enum_Rep,
         SFEC      => Config'Enum_Rep,
         SFID1     => SFID_1,
         Reserved0 => 0,
         SFID2     => SFID_2);
   end Configure_Std_Filter;

   -------------------------------
   -- Set_Std_Filter_Activation --
   -------------------------------

   procedure Set_Std_Filter_Activation
     (This    : in out CAN_Controller;
      Bank_Nr : Filter_Bank_Std_Nr;
      Config  : Filter_Configuration)
   is
      Filter_Address : constant UInt14 :=
        This.SIDFC.FLSSA + (Bank_Nr - 1) * Filter_Std_Elmt_Size;
      Filter_Element : Filter_Std_Element
        with Address => Message_Ram (Filter_Address)'Address;
   begin
      Filter_Element.SFEC := Config'Enum_Rep;
   end Set_Std_Filter_Activation;

   --------------------------
   -- Configure_Ext_Filter --
   --------------------------

   procedure Configure_Ext_Filter
     (This    : in out CAN_Controller;
      Bank_Nr : Filter_Bank_Ext_Nr;
      ID_Type : Filter_Type;
      Config  : Filter_Configuration;
      EFID_1  : CAN_Extended_Id;
      EFID_2  : CAN_Extended_Id)
   is
      Filter_Address : constant UInt14 :=
        This.XIDFC.FLESA + (Bank_Nr - 1) * Filter_Ext_Elmt_Size;
      Filter_Element : Filter_Ext_Element
        with Address => Message_Ram (Filter_Address)'Address;
   begin
      Filter_Element :=
        (EFEC      => Config'Enum_Rep,
         EFID1     => EFID_1,
         EFT       => ID_Type'Enum_Rep,
         Reserved0 => 0,
         EFID2     => EFID_2);
   end Configure_Ext_Filter;

   -------------------------------
   -- Set_Ext_Filter_Activation --
   -------------------------------

   procedure Set_Ext_Filter_Activation
     (This    : in out CAN_Controller;
      Bank_Nr : Filter_Bank_Ext_Nr;
      Config  : Filter_Configuration)
   is
      Filter_Address : constant UInt14 :=
        This.XIDFC.FLESA + (Bank_Nr - 1) * Filter_Ext_Elmt_Size;
      Filter_Element : Filter_Ext_Element
        with Address => Message_Ram (Filter_Address)'Address;
   begin
      Filter_Element.EFEC := Config'Enum_Rep;
   end Set_Ext_Filter_Activation;

   -----------------------
   -- Configure_Rx_Fifo --
   -----------------------

   procedure Configure_Rx_Fifo
     (This      : in out CAN_Controller;
      Fifo      : Rx_Fifo_Nr;
      Mode      : Fifo_Operating_Mode;
      Watermark : Rx_Fifo_Watermark_Level)
   is
   begin
      case Fifo is
         when FIFO_0 =>
            This.RXF0C.F0OM := Mode = Overwrite;
            This.RXF0C.F0WM := Watermark;
         when FIFO_1 =>
            This.RXF1C.F1OM := Mode = Overwrite;
            This.RXF1C.F1WM := Watermark;
      end case;
   end Configure_Rx_Fifo;

   ---------------------------
   -- Get_Rx_Fifo_Fill_Level --
   ---------------------------

   function Get_Rx_Fifo_Fill_Level
     (This : CAN_Controller;
      Fifo : Rx_Fifo_Nr) return UInt7
   is
   begin
      case Fifo is
         when FIFO_0 =>
            return This.RXF0S.F0FL;
         when FIFO_1 =>
            return This.RXF1S.F1FL;
      end case;
   end Get_Rx_Fifo_Fill_Level;

   --------------------------
   -- Read_Rx_Fifo_Message --
   --------------------------

   function Read_Rx_Fifo_Message
     (This : in out CAN_Controller;
      Fifo : Rx_Fifo_Nr) return Rx_Buffer_Message
   is
      Index : UInt14;
      Rx_Fifo_Address : UInt14;
      Rx_Message : Rx_Buffer_Message;
   begin
      case Fifo is
         when FIFO_0 =>
            --  Check that the Rx FIFO has an allocated area into the RAM.
            Assert (This.RXF0C.F0S = 0,
                    "Rx FIFO 0 has not allocated area into Message RAM.");
            --  Check that the Rx FIFO 0 is not empty
            Assert (This.RXF0S.F0FL = 0, "Rx FIFO 0 is empty.");
            --  Retrieve the Rx FIFO 0 GetIndex.
            --  Check that the Rx FIFO 0 is full & overwrite mode is on.
            if This.RXF0S.F0F and This.RXF0C.F0OM then
               --  When overwrite status is on discard first message in FIFO.
               Index := UInt14 (This.RXF0S.F0GI) + 1;
            else
               Index := UInt14 (This.RXF0S.F0GI);
            end if;
            --  Calculate Rx FIFO 0 element address.
            Rx_Fifo_Address := This.RXF0C.F0SA + Index * Rx_Fifo_Elmt_Size;
         when FIFO_1 =>
            --  Check that the Rx FIFO has an allocated area into the RAM.
            Assert (This.RXF1C.F1S = 0,
                    "Rx FIFO 1 has not allocated area into Message RAM.");
            --  Check that the Rx FIFO 1 is not empty
            Assert (This.RXF1S.F1FL = 0, "Rx FIFO 1 is empty.");
            --  Retrieve the Rx FIFO 1 GetIndex.
            --  Check that the Rx FIFO 1 is full & overwrite mode is on.
            if This.RXF1S.F1F and This.RXF1C.F1OM then
               --  When overwrite status is on discard first message in FIFO.
               Index := UInt14 (This.RXF1S.F1GI) + 1;
            else
               Index := UInt14 (This.RXF1S.F1GI);
            end if;
            --  Calculate Rx FIFO 1 element address.
            Rx_Fifo_Address := This.RXF1C.F1SA + Index * Rx_Fifo_Elmt_Size;
      end case;

      declare
         Rx_Fifo : Rx_Buffer_Element
           with Address => Message_Ram (Rx_Fifo_Address)'Address;
      begin
         --  Fill the Rx FIFO header
         Rx_Message.ESI := Rx_Fifo.ESI;
         Rx_Message.XTD := Rx_Fifo.XTD;
         Rx_Message.RTR := Rx_Fifo.RTR;
         Rx_Message.ID := Rx_Fifo.ID;
         Rx_Message.ANMF := Rx_Fifo.ANMF;

          --  Test if received frame did not match any Rx filter element to get
          --  filter index according to RXGFC[LSS] register
         if Rx_Message.ANMF then
            Rx_Message.FIDX := 0;
         else
            Rx_Message.FIDX := Natural (Rx_Fifo.FIDX) + 1;
         end if;

         Rx_Message.FDF := Rx_Fifo.FDF;
         Rx_Message.BRS := Rx_Fifo.BRS;

         Rx_Message.DLC := Data_Length (Rx_Fifo.DLC);

         Rx_Message.RXTS := Natural (Rx_Fifo.RXTS);

         --  Fill the Rx Data array
         if Rx_Fifo.DLC > 0 then
            for I in 0 .. Natural (Rx_Fifo.DLC) - 1 loop
               Rx_Message.Data (I) := Rx_Fifo.Data.Arr (I / 4).Arr (I rem 4);
            end loop;
         end if;
      end;

      --  Acknowledge the Rx FIFO that the oldest element is read so that it
      --  increments the GetIndex.
      case Fifo is
         when FIFO_0 =>
            This.RXF0A.F0AI := UInt6 (Index);
         when FIFO_1 =>
            This.RXF1A.F1AI := UInt6 (Index);
      end case;

      return Rx_Message;
   end Read_Rx_Fifo_Message;

   ---------------------
   -- Receive_Message --
   ---------------------

   procedure Receive_Message
     (This    : in out CAN_Controller;
      Fifo    : Rx_Fifo_Nr;
      Message : out Rx_Buffer_Message;
      Success : out Boolean;
      Timeout : Time_Span := Default_Timeout)
   is
      Deadline : constant Time := Clock + Timeout;
   begin
      loop
         Success := Clock < Deadline;
         exit when not Success or Get_Rx_Fifo_Fill_Level (This, Fifo) > 0;
      end loop;

      if Success then
         Message := Read_Rx_Fifo_Message (This, Fifo);
      end if;
   end Receive_Message;

   -------------------------
   -- Is_Rx_Fifo_Msg_Lost --
   -------------------------

   function Is_Rx_Fifo_Msg_Lost
     (This : CAN_Controller;
      Fifo : Rx_Fifo_Nr) return Boolean
   is
   begin
      case Fifo is
         when FIFO_0 =>
            return This.RXF0S.RF0L;
         when FIFO_1 =>
            return This.RXF1S.RF1L;
      end case;
   end Is_Rx_Fifo_Msg_Lost;

   ---------------------
   -- Is_Rx_Fifo_Full --
   ---------------------

   function Is_Rx_Fifo_Full
     (This : CAN_Controller;
      Fifo : Rx_Fifo_Nr) return Boolean
   is
   begin
      case Fifo is
         when FIFO_0 =>
            return This.RXF0S.F0F;
         when FIFO_1 =>
            return This.RXF1S.F1F;
      end case;
   end Is_Rx_Fifo_Full;

   ---------------------------
   -- Get_Rx_Fifo_Get_Index --
   ---------------------------

   function Get_Rx_Fifo_Get_Index
     (This : CAN_Controller;
      Fifo : Rx_Fifo_Nr) return UInt6
   is
   begin
      case Fifo is
         when FIFO_0 =>
            return This.RXF0S.F0GI;
         when FIFO_1 =>
            return This.RXF1S.F1GI;
      end case;
   end Get_Rx_Fifo_Get_Index;

   ---------------------------
   -- Get_Rx_Fifo_Put_Index --
   ---------------------------

   function Get_Rx_Fifo_Put_Index
     (This : CAN_Controller;
      Fifo : Rx_Fifo_Nr) return UInt6
   is
   begin
      case Fifo is
         when FIFO_0 =>
            return This.RXF0S.F0PI;
         when FIFO_1 =>
            return This.RXF1S.F1PI;
      end case;
   end Get_Rx_Fifo_Put_Index;

   --------------------------------
   -- Is_Rx_Buffer_Msg_Available --
   --------------------------------

   function Is_Rx_Buffer_Msg_Available
     (This : CAN_Controller;
      Bank : Rx_Buffer_Bank_Nr) return Boolean
   is
   begin
      if Bank <= Rx_Buffer_Bank_Nr'Last / 2 then
         return This.NDAT1.Arr (Natural (Bank - 1));
      else
         return This.NDAT2.Arr (Natural (Bank - 1));
      end if;
   end Is_Rx_Buffer_Msg_Available;

   -----------------------------------
   -- Clear_Rx_Buffer_Msg_Available --
   -----------------------------------

   procedure Clear_Rx_Buffer_Msg_Available
     (This : in out CAN_Controller;
      Bank : Rx_Buffer_Bank_Nr)
   is
   begin
      if Bank <= Rx_Buffer_Bank_Nr'Last / 2 then
         --  Check new message reception on the selected buffer.
         if This.NDAT1.Arr (Natural (Bank - 1)) then
            --  Clear the New Data flag of the current Rx buffer.
            This.NDAT1.Arr (Natural (Bank - 1)) := True;
         end if;
      else
         --  Check new message reception on the selected buffer.
         if This.NDAT2.Arr (Natural (Bank - 1)) then
            --  Clear the New Data flag of the current Rx buffer.
            This.NDAT2.Arr (Natural (Bank - 1)) := True;
         end if;
      end if;
   end Clear_Rx_Buffer_Msg_Available;

   ----------------------------
   -- Read_Rx_Buffer_Message --
   ----------------------------

   function Read_Rx_Buffer_Message
     (This : in out CAN_Controller;
      Bank : Rx_Buffer_Bank_Nr) return Rx_Buffer_Message
   is
      Rx_Message : Rx_Buffer_Message;
   begin
      --  Check that the selected buffer has an allocated area into the RAM.
      Assert (Bank > (This.TXEFC.EFSA - This.RXBC.RBSA),
              "Rx buffer has not allocated area into Message RAM.");

      declare
      --  Calculate Rx buffer element address.
         Rx_Buffer_Address : constant UInt14 :=
           This.RXBC.RBSA + (Bank - 1) * Rx_Buffer_Elmt_Size;
         Rx_Buffer : Rx_Buffer_Element
           with Address => Message_Ram (Rx_Buffer_Address)'Address;
      begin
         --  Fill the Rx FIFO header
         Rx_Message.ESI := Rx_Buffer.ESI;
         Rx_Message.XTD := Rx_Buffer.XTD;
         Rx_Message.RTR := Rx_Buffer.RTR;
         Rx_Message.ID := Rx_Buffer.ID;
         Rx_Message.ANMF := Rx_Buffer.ANMF;

          --  Test if received frame did not match any Rx filter element to get
          --  filter index according to RXGFC[LSS] register
         if Rx_Message.ANMF then
            Rx_Message.FIDX := 0;
         else
            Rx_Message.FIDX := Natural (Rx_Buffer.FIDX) + 1;
         end if;

         Rx_Message.FDF := Rx_Buffer.FDF;
         Rx_Message.BRS := Rx_Buffer.BRS;

         Rx_Message.DLC := Data_Length (Rx_Buffer.DLC);

         Rx_Message.RXTS := Natural (Rx_Buffer.RXTS);

         --  Fill the Rx Data array
         if Rx_Buffer.DLC > 0 then
            for I in 0 .. Natural (Rx_Buffer.DLC) - 1 loop
               Rx_Message.Data (I) := Rx_Buffer.Data.Arr (I / 4).Arr (I rem 4);
            end loop;
         end if;
      end;

      --  Clear the New Data flag of the current Rx buffer
      if Bank <= Rx_Buffer_Bank_Nr'Last / 2 then
         This.NDAT1.Arr (Natural (Bank - 1)) := True;
      else
         This.NDAT2.Arr (Natural (Bank - 1)) := True;
      end if;

      return Rx_Message;
   end Read_Rx_Buffer_Message;

   ---------------------
   -- Receive_Message --
   ---------------------

   procedure Receive_Message
     (This    : in out CAN_Controller;
      Bank    : Rx_Buffer_Bank_Nr;
      Message : out Rx_Buffer_Message;
      Success : out Boolean;
      Timeout : Time_Span := Default_Timeout)
   is
      Deadline : constant Time := Clock + Timeout;
   begin
      loop
         Success := Clock < Deadline;
         exit when not Success or Is_Rx_Buffer_Msg_Available (This, Bank);
      end loop;

      if Success then
         Message := Read_Rx_Buffer_Message (This, Bank);
      end if;
   end Receive_Message;

   -----------------------------
   -- Configure_Tx_Event_Fifo --
   -----------------------------

   procedure Configure_Tx_Event_Fifo
     (This      : in out CAN_Controller;
      Watermark : Tx_Event_Fifo_Watermark_Level)
   is
   begin
      This.TXEFC.EFWM := Watermark;
   end Configure_Tx_Event_Fifo;

   -----------------------------
   -- Get_Tx_Event_Fill_Level --
   -----------------------------

   function Get_Tx_Event_Fill_Level
     (This : CAN_Controller) return UInt6
   is
   begin
      return This.TXEFS.EFFL;
   end Get_Tx_Event_Fill_Level;

   ---------------------------
   -- Read_Tx_Event_Message --
   ---------------------------

   function Read_Tx_Event_Message
     (This : in out CAN_Controller) return Tx_Event_Message
   is
      Index : UInt14;
      Tx_Message : Tx_Event_Message;
   begin
      --  Check that the Tx Event FIFO has an allocated area into the RAM.
      Assert (This.TXEFC.EFS = 0,
              "Tx Event FIFO has not allocated area into Message RAM.");
      --  Check that the Tx Event FIFO is not empty
      Assert (This.TXEFS.EFFL = 0, "Tx Event FIFO is empty.");
      --  Retrieve the Tx Event FIFO GetIndex.
      Index := UInt14 (This.TXEFS.EFGI);

      declare
         --  Calculate Tx Event FIFO element address.
         Tx_Event_Address : constant UInt14 :=
           This.TXEFC.EFSA + Index * Tx_Event_Elmt_Size;
         Tx_Event : Tx_Event_Element
           with Address => Message_Ram (Tx_Event_Address)'Address;
      begin
         Tx_Message.ESI := Tx_Event.ESI;
         Tx_Message.XTD := Tx_Event.XTD;
         Tx_Message.RTR := Tx_Event.RTR;
         Tx_Message.ID := Tx_Event.ID;
         Tx_Message.MM := Tx_Event.MM;
         Tx_Message.ET := Tx_Event.ET;
         Tx_Message.EDL := Tx_Event.EDL;
         Tx_Message.BRS := Tx_Event.BRS;
         Tx_Message.DLC := Data_Length (Tx_Event.DLC);
         Tx_Message.TXTS := Natural (Tx_Event.TXTS);
      end;
      --  Acknowledge the Tx Event FIFO that the oldest element is read so
      --  that it increments the GetIndex.
      This.TXEFA.EFAI := UInt5 (Index);

      return Tx_Message;
   end Read_Tx_Event_Message;

   ------------------------------
   -- Get_High_Prio_Msg_Status --
   ------------------------------

   function Get_High_Prio_Msg_Status
     (This : CAN_Controller) return High_Prio_Message_Status
   is
      Result : High_Prio_Message_Status;
   begin
      Result.Filter_List := This.HPMS.FLST;
      Result.Filter_Index := Natural (This.HPMS.FIDX);
      Result.Message_Storage := This.HPMS.MSI;

      --  The message index is only valid when the message was stored in Rx
      --  FIFO 0 or FIFO 1.
      case Result.Message_Storage is
         when 0 | 1 =>
            Result.Message_Index := 0;
         when 2 | 3 =>
            Result.Message_Index := Natural (This.HPMS.BIDX);
      end case;

      return Result;
   end Get_High_Prio_Msg_Status;

   --------------------------
   -- Is_Tx_Event_Msg_Lost --
   --------------------------

   function Is_Tx_Event_Msg_Lost
     (This : CAN_Controller) return Boolean
   is
   begin
      return This.TXEFS.TEFL;
   end Is_Tx_Event_Msg_Lost;
   --  Tx event FIFO element lost, also set after write attempt to Tx event
   --  FIFO of size 0. This bit is a copy of interrupt flag IR[TEFL]. When
   --  IR[TEFL] is reset, this bit is also reset.

   ----------------------
   -- Is_Tx_Event_Full --
   ----------------------

   function Is_Tx_Event_Full
     (This : CAN_Controller) return Boolean
   is
   begin
      return This.TXEFS.EFF;
   end Is_Tx_Event_Full;

   ----------------------------
   -- Get_Tx_Event_Put_Index --
   ----------------------------

   function Get_Tx_Event_Put_Index
     (This : CAN_Controller) return UInt5
   is
   begin
      return This.TXEFS.EFPI;
   end Get_Tx_Event_Put_Index;

   ----------------------------
   -- Get_Tx_Event_Get_Index --
   ----------------------------

   function Get_Tx_Event_Get_Index
     (This : CAN_Controller) return UInt5
   is
   begin
      return This.TXEFS.EFGI;
   end Get_Tx_Event_Get_Index;

   ------------------------
   -- Set_Tx_Buffer_Mode --
   ------------------------

   procedure Set_Tx_Buffer_Mode
     (This : in out CAN_Controller;
      Mode : Tx_Buffer_Mode)
   is
   begin
      This.TXBC.TFQM := Mode = Queue;
   end Set_Tx_Buffer_Mode;

   -----------------------
   -- Is_Tx_Buffer_Full --
   -----------------------

   function Is_Tx_Buffer_Full
     (This : CAN_Controller) return Boolean
   is
   begin
      return This.TXFQS.TFQF;
   end Is_Tx_Buffer_Full;

   ----------------------------
   -- Write_Tx_FifoQ_Message --
   ----------------------------

   procedure Write_Tx_FifoQ_Message
     (This     : in out CAN_Controller;
      Bank     : out Tx_FifoQ_Bank_Nr;
      Message  : Tx_Buffer_Message;
      Transmit : Boolean)
   is
      function To_UInt4 (DLC : DLC_Range) return UInt4;
      --  Convert DLC_Natural number to UInt4.
      function To_UInt4 (DLC : DLC_Range) return UInt4 is
         Value : UInt4;
      begin
         case DLC is
            when 0 .. 8 =>
               Value := UInt4 (DLC);
            when 12 | 16 | 20 | 24 =>
               Value := UInt4 (DLC / 4 + 6);
            when 32 | 48 =>
               Value := UInt4 (DLC / 16 + 11);
            when 64 =>
               Value := UInt4 (15);
         end case;
         return Value;
      end To_UInt4;

      Index : UInt14;
   begin
      --  Check that the Tx FIFO/Queue has an allocated area into the RAM.
      Assert (This.TXBC.TFQS = 0,
              "Tx FIFO/Queue has not allocated area into Message RAM.");
      --  Check that the Tx FIFO/Queue is not full
      Assert (This.TXFQS.TFQF, "Tx FIFO/Queue is full.");
      --  Retrieve the Tx Fifo/Queue PutIndex.
      Index := UInt14 (This.TXFQS.TFQPI);

      declare
         Tx_FifoQ_Address : constant UInt14 :=
           This.TXBC.TBSA + Index * Tx_FifoQ_Elmt_Size;
         Tx_FifoQ : Tx_Buffer_Element
           with Address => Message_Ram (Tx_FifoQ_Address)'Address;
      begin
         --  Fill the Tx FIFO/Queue header
         Tx_FifoQ.ESI := Message.ESI;
         Tx_FifoQ.XTD := Message.XTD;
         Tx_FifoQ.RTR := Message.RTR;
         Tx_FifoQ.ID := Message.ID;
         Tx_FifoQ.MM := Message.MM;
         Tx_FifoQ.EFC := Message.EFC;
         Tx_FifoQ.FDF := Message.FDF;
         Tx_FifoQ.BRS := Message.BRS;

         Tx_FifoQ.DLC := To_UInt4 (Message.DLC);

         --  Fill the Tx FIFO/Queue data
         if Message.DLC > 0 then
            for I in 0 .. Message.DLC - 1 loop
               Tx_FifoQ.Data.Arr (I / 4).Arr (I rem 4) := Message.Data (I);
            end loop;
         end if;
      end;

      --  Store the latest Tx FIFO/Queue Request Buffer Index.
      Bank := Index + 1;

      if Transmit then
         --  Activate the corresponding bank transmission request with an
         --  Add Request to that bank. This increments the Put Index to the
         --  next free Tx FIFO/Queue element.
         This.TXBAR.Arr (Natural (Index)) := True;
      end if;
   end Write_Tx_FifoQ_Message;

   ----------------------
   -- Transmit_Message --
   ----------------------

   procedure Transmit_Message
     (This    : in out CAN_Controller;
      Message : Tx_Buffer_Message;
      Success : out Boolean;
      Timeout : Time_Span := Default_Timeout)
   is
      Deadline : constant Time := Clock + Timeout;
      Bank : Tx_FifoQ_Bank_Nr;
   begin
      Success := not Is_Tx_Buffer_Full (This);
      if Success then
         Write_Tx_FifoQ_Message (This, Bank, Message, True);
         while not Transmission_Successful (This, Bank) and Success loop
            Success := Clock < Deadline;
         end loop;
      end if;
   end Transmit_Message;

   ----------------------------
   -- Write_Tx_Buffer_Message --
   ----------------------------

   procedure Write_Tx_Buffer_Message
     (This     : in out CAN_Controller;
      Bank     : Tx_Buffer_Bank_Nr;
      Message  : Tx_Buffer_Message;
      Transmit : Boolean)
   is
      function To_UInt4 (DLC : DLC_Range) return UInt4;
      --  Convert DLC_Natural number to UInt4.
      function To_UInt4 (DLC : DLC_Range) return UInt4 is
         Value : UInt4;
      begin
         case DLC is
            when 0 .. 8 =>
               Value := UInt4 (DLC);
            when 12 | 16 | 20 | 24 =>
               Value := UInt4 (DLC / 4 + 6);
            when 32 | 48 =>
               Value := UInt4 (DLC / 16 + 11);
            when 64 =>
               Value := UInt4 (15);
         end case;
         return Value;
      end To_UInt4;

   begin
      --  Check that the selected Tx buffer has an allocated area into the RAM.
      Assert (Bank > UInt14 (This.TXBC.NDTB),
              "Tx Buffer has not allocated area into Message RAM.");
      --  Check that there is no transmission request pending for the selected buffer
      Assert (This.TXBRP.Arr (Natural (Bank - 1)),
              "Transmission request is pending for the selected buffer.");

      declare
         Tx_Buffer_Address : constant UInt14 :=
           This.TXBC.TBSA + (Bank - 1) * Tx_Buffer_Elmt_Size;
         Tx_Buffer : Tx_Buffer_Element
           with Address => Message_Ram (Tx_Buffer_Address)'Address;
      begin
         --  Fill the Tx FIFO/Queue header
         Tx_Buffer.ESI := Message.ESI;
         Tx_Buffer.XTD := Message.XTD;
         Tx_Buffer.RTR := Message.RTR;
         Tx_Buffer.ID := Message.ID;
         Tx_Buffer.MM := Message.MM;
         Tx_Buffer.EFC := Message.EFC;
         Tx_Buffer.FDF := Message.FDF;
         Tx_Buffer.BRS := Message.BRS;

         Tx_Buffer.DLC := To_UInt4 (Message.DLC);

         --  Fill the Tx FIFO/Queue data
         if Message.DLC > 0 then
            for I in 0 .. Message.DLC - 1 loop
               Tx_Buffer.Data.Arr (I / 4).Arr (I rem 4) := Message.Data (I);
            end loop;
         end if;
      end;

      if Transmit then
         --  Activate the corresponding bank transmission request with an
         --  Add Request to that bank. This increments the Put Index to the
         --  next free Tx FIFO element.
         This.TXBAR.Arr (Natural (Bank - 1)) := True;
      end if;
   end Write_Tx_Buffer_Message;

   ----------------------
   -- Transmit_Message --
   ----------------------

   procedure Transmit_Message
     (This    : in out CAN_Controller;
      Bank    : Tx_Buffer_Bank_Nr;
      Message : Tx_Buffer_Message;
      Success : out Boolean;
      Timeout : Time_Span := Default_Timeout)
   is
      Deadline : constant Time := Clock + Timeout;
   begin
      Success := not Is_Tx_Buffer_Full (This);
      if Success then
         Write_Tx_Buffer_Message (This, Bank, Message, True);
         while not Transmission_Successful (This, Bank) and Success loop
            Success := Clock < Deadline;
         end loop;
      end if;
   end Transmit_Message;

   --------------------------
   -- Transmission_Request --
   --------------------------

   procedure Transmission_Request
     (This : in out CAN_Controller;
      Bank : Tx_Buffer_Bank_Nr)
   is
   begin
      This.TXBAR.Arr (Natural (Bank - 1)) := True;
   end Transmission_Request;

   ---------------------------
   -- Is_Tx_Request_Pending --
   ---------------------------

   function Is_Tx_Request_Pending
     (This : CAN_Controller;
      Bank : Tx_Buffer_Bank_Nr) return Boolean
   is
   begin
      --  Each Tx buffer has its own transmission request pending bit.
      return This.TXBRP.Arr (Natural (Bank - 1));
   end Is_Tx_Request_Pending;

   -----------------------------
   -- Transmission_Successful --
   -----------------------------

   function Transmission_Successful
     (This : CAN_Controller;
      Bank : Tx_Buffer_Bank_Nr) return Boolean
   is
   begin
      --  Each Tx buffer has its own transmission request pending bit.
      return This.TXBTO.Arr (Natural (Bank - 1));
   end Transmission_Successful;

   -----------------------------
   -- Abort_Tx_Buffer_Request --
   -----------------------------

   procedure Abort_Tx_Buffer_Request
     (This : in out CAN_Controller;
      Bank : Tx_Buffer_Bank_Nr)
   is
   begin
      --  Each Tx buffer has its own transmission request pending bit.
      This.TXBCR.Arr (Natural (Bank - 1)) := True;
   end Abort_Tx_Buffer_Request;

   ------------------------------
   -- Abort_Tx_Buffer_Finished --
   ------------------------------

   function Abort_Tx_Buffer_Finished
     (This : CAN_Controller;
      Bank : Tx_Buffer_Bank_Nr) return Boolean
   is
   begin
      --  Each Tx buffer has its own buffer cancelation finished bit.
      return This.TXBCF.Arr (Natural (Bank - 1));
   end Abort_Tx_Buffer_Finished;

   -----------------------------
   -- Get_Tx_Buffer_Put_Index --
   -----------------------------

   function Get_Tx_Buffer_Put_Index
     (This : CAN_Controller) return UInt5
   is
   begin
      return This.TXFQS.TFQPI;
   end Get_Tx_Buffer_Put_Index;

   -----------------------------
   -- Get_Tx_Buffer_Get_Index --
   -----------------------------

   function Get_Tx_Buffer_Get_Index
     (This : CAN_Controller) return UInt5
   is
   begin
      return This.TXFQS.TFGI;
   end Get_Tx_Buffer_Get_Index;

   ----------------------------
   -- Get_Tx_Fifo_Free_Level --
   ----------------------------

   function Get_Tx_Fifo_Free_Level
     (This : CAN_Controller) return UInt6
   is
   begin
      return This.TXFQS.TFFL;
   end Get_Tx_Fifo_Free_Level;

   -----------------------------
   -- Set_Tx_Buffer_Interrupt --
   -----------------------------

   procedure Set_Tx_Buffer_Interrupt
     (This    : in out CAN_Controller;
      Bank    : Tx_Buffer_Bank_Nr;
      Enabled : Boolean)
   is
   begin
      This.TXBTO.Arr (Natural (Bank - 1)) := Enabled;
   end Set_Tx_Buffer_Interrupt;

   -----------------------------------
   -- Set_Tx_Buffer_Abort_Interrupt --
   -----------------------------------

   procedure Set_Tx_Buffer_Abort_Interrupt
     (This    : in out CAN_Controller;
      Bank    : Tx_Buffer_Bank_Nr;
      Enabled : Boolean)
   is
   begin
      This.TXBCF.Arr (Natural (Bank - 1)) := Enabled;
   end Set_Tx_Buffer_Abort_Interrupt;

   -----------------------
   -- Interrupt_Enabled --
   -----------------------

   function Interrupt_Enabled
     (This   : CAN_Controller;
      Source : CAN_Interrupt) return Boolean
   is
   begin
      case Source is
         when Rx_FIFO_0_Msg_Pending =>
            return This.IE.RF0NE;
         when Rx_FIFO_0_Watermark =>
            return This.IE.RF0WE;
         when Rx_FIFO_0_Full =>
            return This.IE.RF0FE;
         when Rx_FIFO_0_Msg_Lost =>
            return This.IE.RF0LE;
         when Rx_FIFO_1_Msg_Pending =>
            return This.IE.RF1NE;
         when Rx_FIFO_1_Watermark =>
            return This.IE.RF1WE;
         when Rx_FIFO_1_Full =>
            return This.IE.RF1FE;
         when Rx_FIFO_1_Msg_Lost =>
            return This.IE.RF1LE;
         when High_Prio_Msg_Received =>
            return This.IE.HPME;
         when Transmission_Completed =>
            return This.IE.TCE;
         when Transmission_Abort_Finished =>
            return This.IE.TCFE;
         when Tx_FIFO_Empty =>
            return This.IE.TFEE;
         when Tx_Event_Fifo_Pending =>
            return This.IE.TEFNE;
         when Tx_Event_Fifo_Watermark =>
            return This.IE.TEFWE;
         when Tx_Event_Fifo_Full =>
            return This.IE.TEFFE;
         when Tx_Event_Fifo_Msg_Lost =>
            return This.IE.TEFLE;
         when Timestanp_Wraparound =>
            return This.IE.TSWE;
         when Rx_Msg_RAM_Access_Failure =>
            return This.IE.MRAFE;
         when Timeout_Occurred =>
            return This.IE.TOOE;
         when Rx_Buffer_Msg_Stored =>
            return This.IE.DRXE;
         when Error_Logging_Overflow =>
            return This.IE.ELOE;
         when Error_Passive =>
            return This.IE.EPE;
         when Error_Warning =>
            return This.IE.EWE;
         when Bus_Off =>
            return This.IE.BOE;
         when Msg_RAM_Watchdog =>
            return This.IE.WDIE;
         when Error_Arbitration_Phase =>
            return This.IE.PEAE;
         when Error_Data_Phase =>
            return This.IE.PEDE;
         when Access_Reserved_Address =>
            return This.IE.ARAE;
         when Calibration_State_Changed =>
            return CAN_CCU_Periph.IE.CSCE;
         when Calibration_Watchdog_Event =>
            return CAN_CCU_Periph.IE.CWEE;
      end case;
   end Interrupt_Enabled;

   -----------------------
   -- Enable_Interrupts --
   -----------------------

   procedure Enable_Interrupts
     (This   : in out CAN_Controller;
      Source : CAN_Interrupt)
   is
   begin
      case Source is
         when Rx_FIFO_0_Msg_Pending =>
            This.IE.RF0NE := True;
         when Rx_FIFO_0_Watermark =>
            This.IE.RF0WE := True;
         when Rx_FIFO_0_Full =>
            This.IE.RF0FE := True;
         when Rx_FIFO_0_Msg_Lost =>
            This.IE.RF0LE := True;
         when Rx_FIFO_1_Msg_Pending =>
            This.IE.RF1NE := True;
         when Rx_FIFO_1_Watermark =>
            This.IE.RF1WE := True;
         when Rx_FIFO_1_Full =>
            This.IE.RF1FE := True;
         when Rx_FIFO_1_Msg_Lost =>
            This.IE.RF1LE := True;
         when High_Prio_Msg_Received =>
            This.IE.HPME := True;
         when Transmission_Completed =>
            This.IE.TCE := True;
         when Transmission_Abort_Finished =>
            This.IE.TCFE := True;
         when Tx_FIFO_Empty =>
            This.IE.TFEE := True;
         when Tx_Event_Fifo_Pending =>
            This.IE.TEFNE := True;
         when Tx_Event_Fifo_Watermark =>
            This.IE.TEFWE := True;
         when Tx_Event_Fifo_Full =>
            This.IE.TEFFE := True;
         when Tx_Event_Fifo_Msg_Lost =>
            This.IE.TEFLE := True;
         when Timestanp_Wraparound =>
            This.IE.TSWE := True;
         when Rx_Msg_RAM_Access_Failure =>
            This.IE.MRAFE := True;
         when Timeout_Occurred =>
            This.IE.TOOE := True;
         when Rx_Buffer_Msg_Stored =>
            This.IE.DRXE := True;
         when Error_Logging_Overflow =>
            This.IE.ELOE := True;
         when Error_Passive =>
            This.IE.EPE := True;
         when Error_Warning =>
            This.IE.EWE := True;
         when Bus_Off =>
            This.IE.BOE := True;
         when Msg_RAM_Watchdog =>
            This.IE.WDIE := True;
         when Error_Arbitration_Phase =>
            This.IE.PEAE := True;
         when Error_Data_Phase =>
            This.IE.PEDE := True;
         when Access_Reserved_Address =>
            This.IE.ARAE := True;
         when Calibration_State_Changed =>
            CAN_CCU_Periph.IE.CSCE := True;
         when Calibration_Watchdog_Event =>
            CAN_CCU_Periph.IE.CWEE := True;
      end case;

      if Source /= Calibration_State_Changed and
        Source /= Calibration_Watchdog_Event
      then
         --  Enable Interrupt Line according to Interrupt setting
         if Get_Individual_Interrupt_Line (This, Source) = Line_0 and
           not Interrupt_Line_Enabled (This, Line_0)
         then
            Set_Interrupt_Line (This, Line_0, True);
         elsif Get_Individual_Interrupt_Line (This, Source) = Line_1 and
           not Interrupt_Line_Enabled (This, Line_1)
         then
            Set_Interrupt_Line (This, Line_1, True);
         end if;
      end if;
   end Enable_Interrupts;

   ------------------------
   -- Disable_Interrupts --
   ------------------------

   procedure Disable_Interrupts
     (This   : in out CAN_Controller;
      Source : CAN_Interrupt)
   is
   begin
      case Source is
         when Rx_FIFO_0_Msg_Pending =>
            This.IE.RF0NE := False;
         when Rx_FIFO_0_Watermark =>
            This.IE.RF0WE := False;
         when Rx_FIFO_0_Full =>
            This.IE.RF0FE := False;
         when Rx_FIFO_0_Msg_Lost =>
            This.IE.RF0LE := False;
         when Rx_FIFO_1_Msg_Pending =>
            This.IE.RF1NE := False;
         when Rx_FIFO_1_Watermark =>
            This.IE.RF1WE := False;
         when Rx_FIFO_1_Full =>
            This.IE.RF1FE := False;
         when Rx_FIFO_1_Msg_Lost =>
            This.IE.RF1LE := False;
         when High_Prio_Msg_Received =>
            This.IE.HPME := False;
         when Transmission_Completed =>
            This.IE.TCE := False;
         when Transmission_Abort_Finished =>
            This.IE.TCFE := False;
         when Tx_FIFO_Empty =>
            This.IE.TFEE := False;
         when Tx_Event_Fifo_Pending =>
            This.IE.TEFNE := False;
         when Tx_Event_Fifo_Watermark =>
            This.IE.TEFWE := False;
         when Tx_Event_Fifo_Full =>
            This.IE.TEFFE := False;
         when Tx_Event_Fifo_Msg_Lost =>
            This.IE.TEFLE := False;
         when Timestanp_Wraparound =>
            This.IE.TSWE := False;
         when Rx_Msg_RAM_Access_Failure =>
            This.IE.MRAFE := False;
         when Timeout_Occurred =>
            This.IE.TOOE := False;
         when Rx_Buffer_Msg_Stored =>
            This.IE.DRXE := False;
         when Error_Logging_Overflow =>
            This.IE.ELOE := False;
         when Error_Passive =>
            This.IE.EPE := False;
         when Error_Warning =>
            This.IE.EWE := False;
         when Bus_Off =>
            This.IE.BOE := False;
         when Msg_RAM_Watchdog =>
            This.IE.WDIE := False;
         when Error_Arbitration_Phase =>
            This.IE.PEAE := False;
         when Error_Data_Phase =>
            This.IE.PEDE := False;
         when Access_Reserved_Address =>
            This.IE.ARAE := False;
         when Calibration_State_Changed =>
            CAN_CCU_Periph.IE.CSCE := False;
         when Calibration_Watchdog_Event =>
            CAN_CCU_Periph.IE.CWEE := False;
      end case;
   end Disable_Interrupts;

   ------------
   -- Status --
   ------------

   function Status
     (This   : CAN_Controller;
      Source : CAN_Interrupt) return Boolean
   is
   begin
      case Source is
         when Rx_FIFO_0_Msg_Pending =>
            return This.IR.RF0N;
         when Rx_FIFO_0_Watermark =>
            return This.IR.RF0W;
         when Rx_FIFO_0_Full =>
            return This.IR.RF0F;
         when Rx_FIFO_0_Msg_Lost =>
            return This.IR.RF0L;
         when Rx_FIFO_1_Msg_Pending =>
            return This.IR.RF1N;
         when Rx_FIFO_1_Watermark =>
            return This.IR.RF1W;
         when Rx_FIFO_1_Full =>
            return This.IR.RF1F;
         when Rx_FIFO_1_Msg_Lost =>
            return This.IR.RF1L;
         when High_Prio_Msg_Received =>
            return This.IR.HPM;
         when Transmission_Completed =>
            return This.IR.TC;
         when Transmission_Abort_Finished =>
            return This.IR.TCF;
         when Tx_FIFO_Empty =>
            return This.IR.TFE;
         when Tx_Event_Fifo_Pending =>
            return This.IR.TEFN;
         when Tx_Event_Fifo_Watermark =>
            return This.IR.TEFW;
         when Tx_Event_Fifo_Full =>
            return This.IR.TEFF;
         when Tx_Event_Fifo_Msg_Lost =>
            return This.IR.TEFL;
         when Timestanp_Wraparound =>
            return This.IR.TSW;
         when Rx_Msg_RAM_Access_Failure =>
            return This.IR.MRAF;
         when Timeout_Occurred =>
            return This.IR.TOO;
         when Rx_Buffer_Msg_Stored =>
            return This.IR.DRX;
         when Error_Logging_Overflow =>
            return This.IR.ELO;
         when Error_Passive =>
            return This.IR.EP;
         when Error_Warning =>
            return This.IR.EW;
         when Bus_Off =>
            return This.IR.BO;
         when Msg_RAM_Watchdog =>
            return This.IR.WDI;
         when Error_Arbitration_Phase =>
            return This.IR.PEA;
         when Error_Data_Phase =>
            return This.IR.PED;
         when Access_Reserved_Address =>
            return This.IR.ARA;
         when Calibration_State_Changed =>
            return CAN_CCU_Periph.IR.CSC;
         when Calibration_Watchdog_Event =>
            return CAN_CCU_Periph.IR.CWE;
      end case;
   end Status;

   -----------------------------
   -- Clear_Pending_Interrupt --
   -----------------------------

   procedure Clear_Pending_Interrupt
     (This   : in out CAN_Controller;
      Source : CAN_Interrupt)
   is
   begin
      case Source is
         when Rx_FIFO_0_Msg_Pending =>
            This.IR.RF0N := True;
         when Rx_FIFO_0_Watermark =>
            This.IR.RF0W := True;
         when Rx_FIFO_0_Full =>
            This.IR.RF0F := True;
         when Rx_FIFO_0_Msg_Lost =>
            This.IR.RF0L := True;
         when Rx_FIFO_1_Msg_Pending =>
            This.IR.RF1N := True;
         when Rx_FIFO_1_Watermark =>
            This.IR.RF1W := True;
         when Rx_FIFO_1_Full =>
            This.IR.RF1F := True;
         when Rx_FIFO_1_Msg_Lost =>
            This.IR.RF1L := True;
         when High_Prio_Msg_Received =>
            This.IR.HPM := True;
         when Transmission_Completed =>
            This.IR.TC := True;
         when Transmission_Abort_Finished =>
            This.IR.TCF := True;
         when Tx_FIFO_Empty =>
            This.IR.TFE := True;
         when Tx_Event_Fifo_Pending =>
            This.IR.TEFN := True;
         when Tx_Event_Fifo_Watermark =>
            This.IR.TEFW := True;
         when Tx_Event_Fifo_Full =>
            This.IR.TEFF := True;
         when Tx_Event_Fifo_Msg_Lost =>
            This.IR.TEFL := True;
         when Timestanp_Wraparound =>
            This.IR.TSW := True;
         when Rx_Msg_RAM_Access_Failure =>
            This.IR.MRAF := True;
         when Timeout_Occurred =>
            This.IR.TOO := True;
         when Rx_Buffer_Msg_Stored =>
            This.IR.DRX := True;
         when Error_Logging_Overflow =>
            This.IR.ELO := True;
         when Error_Passive =>
            This.IR.EP := True;
         when Error_Warning =>
            This.IR.EW := True;
         when Bus_Off =>
            This.IR.BO := True;
         when Msg_RAM_Watchdog =>
            This.IR.WDI := True;
         when Error_Arbitration_Phase =>
            This.IR.PEA := True;
         when Error_Data_Phase =>
            This.IR.PED := True;
         when Access_Reserved_Address =>
            This.IR.ARA := True;
         when Calibration_State_Changed =>
            CAN_CCU_Periph.IR.CSC := True;
         when Calibration_Watchdog_Event =>
            CAN_CCU_Periph.IR.CWE := True;
      end case;
   end Clear_Pending_Interrupt;

   ----------------------------
   -- Interrupt_Line_Enabled --
   ----------------------------

   function Interrupt_Line_Enabled
     (This   : CAN_Controller;
      Source : Interrupt_Line) return Boolean
   is
   begin
      return This.ILE.EINT.Arr (Source'Enum_Rep);
   end Interrupt_Line_Enabled;

   ------------------------
   -- Set_Interrupt_Line --
   ------------------------

   procedure Set_Interrupt_Line
     (This    : in out CAN_Controller;
      Source  : Interrupt_Line;
      Enabled : Boolean)
   is
   begin
      This.ILE.EINT.Arr (Source'Enum_Rep) := Enabled;
   end Set_Interrupt_Line;

   -----------------------------------
   -- Set_Individual_Interrupt_Line --
   -----------------------------------

   procedure Set_Individual_Interrupt_Line
     (This   : in out CAN_Controller;
      Source : CAN_Interrupt;
      Line   : Interrupt_Line)
   is
   begin
      case Source is
         when Rx_FIFO_0_Msg_Pending =>
            This.ILS.RF0NL := Line = Line_1;
         when Rx_FIFO_0_Watermark =>
            This.ILS.RF0WL := Line = Line_1;
         when Rx_FIFO_0_Full =>
            This.ILS.RF0FL := Line = Line_1;
         when Rx_FIFO_0_Msg_Lost =>
            This.ILS.RF0LL := Line = Line_1;
         when Rx_FIFO_1_Msg_Pending =>
            This.ILS.RF1NL := Line = Line_1;
         when Rx_FIFO_1_Watermark =>
            This.ILS.RF1WL := Line = Line_1;
         when Rx_FIFO_1_Full =>
            This.ILS.RF1FL := Line = Line_1;
         when Rx_FIFO_1_Msg_Lost =>
            This.ILS.RF1LL := Line = Line_1;
         when High_Prio_Msg_Received =>
            This.ILS.HPML := Line = Line_1;
         when Transmission_Completed =>
            This.ILS.TCL := Line = Line_1;
         when Transmission_Abort_Finished =>
            This.ILS.TCFL := Line = Line_1;
         when Tx_FIFO_Empty =>
            This.ILS.TFEL := Line = Line_1;
         when Tx_Event_Fifo_Pending =>
            This.ILS.TEFNL := Line = Line_1;
         when Tx_Event_Fifo_Watermark =>
            This.ILS.TEFWL := Line = Line_1;
         when Tx_Event_Fifo_Full =>
            This.ILS.TEFFL := Line = Line_1;
         when Tx_Event_Fifo_Msg_Lost =>
            This.ILS.TEFLL := Line = Line_1;
         when Timestanp_Wraparound =>
            This.ILS.TSWL := Line = Line_1;
         when Rx_Msg_RAM_Access_Failure =>
            This.ILS.MRAFL := Line = Line_1;
         when Timeout_Occurred =>
            This.ILS.TOOL := Line = Line_1;
         when Rx_Buffer_Msg_Stored =>
            This.ILS.DRXL := Line = Line_1;
         when Error_Logging_Overflow =>
            This.ILS.ELOL := Line = Line_1;
         when Error_Passive =>
            This.ILS.EPL := Line = Line_1;
         when Error_Warning =>
            This.ILS.EWL := Line = Line_1;
         when Bus_Off =>
            This.ILS.BOL := Line = Line_1;
         when Msg_RAM_Watchdog =>
            This.ILS.WDIL := Line = Line_1;
         when Error_Arbitration_Phase =>
            This.ILS.PEAL := Line = Line_1;
         when Error_Data_Phase =>
            This.ILS.PEDL := Line = Line_1;
         when Access_Reserved_Address =>
            This.ILS.ARAL := Line = Line_1;
         when others =>
            raise STM32.Device.Unknown_Device;
      end case;
   end Set_Individual_Interrupt_Line;

   -----------------------------------
   -- Get_Individual_Interrupt_Line --
   -----------------------------------

   function Get_Individual_Interrupt_Line
     (This   : CAN_Controller;
      Source : CAN_Interrupt) return Interrupt_Line
   is
   begin
      case Source is
         when Rx_FIFO_0_Msg_Pending =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.RF0NL));
         when Rx_FIFO_0_Watermark =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.RF0WL));
         when Rx_FIFO_0_Full =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.RF0FL));
         when Rx_FIFO_0_Msg_Lost =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.RF0LL));
         when Rx_FIFO_1_Msg_Pending =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.RF1NL));
         when Rx_FIFO_1_Watermark =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.RF1WL));
         when Rx_FIFO_1_Full =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.RF1FL));
         when Rx_FIFO_1_Msg_Lost =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.RF1LL));
         when High_Prio_Msg_Received =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.HPML));
         when Transmission_Completed =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.TCL));
         when Transmission_Abort_Finished =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.TCFL));
         when Tx_FIFO_Empty =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.TFEL));
         when Tx_Event_Fifo_Pending =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.TEFNL));
         when Tx_Event_Fifo_Watermark =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.TEFWL));
         when Tx_Event_Fifo_Full =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.TEFFL));
         when Tx_Event_Fifo_Msg_Lost =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.TEFLL));
         when Timestanp_Wraparound =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.TSWL));
         when Rx_Msg_RAM_Access_Failure =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.MRAFL));
         when Timeout_Occurred =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.TOOL));
         when Rx_Buffer_Msg_Stored =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.DRXL));
         when Error_Logging_Overflow =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.ELOL));
         when Error_Passive =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.EPL));
         when Error_Warning =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.EWL));
         when Bus_Off =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.BOL));
         when Msg_RAM_Watchdog =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.WDIL));
         when Error_Arbitration_Phase =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.PEAL));
         when Error_Data_Phase =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.PEDL));
         when Access_Reserved_Address =>
            return Interrupt_Line'Enum_Val (Boolean'Pos (This.ILS.ARAL));
         when others =>
            raise STM32.Device.Unknown_Device;
      end case;
   end Get_Individual_Interrupt_Line;

   -------------------------
   -- Get_Protocol_Status --
   -------------------------

   procedure Get_Protocol_Status
     (This   : CAN_Controller;
      Status : out Protocol_Status)
   is
   begin
      Status.Last_Error_Code := Last_Error_Code_Enum'Enum_Val (This.PSR.LEC);
      Status.Communication_Activity := Communication_Activity_Enum'Enum_Val (This.PSR.ACT);
      Status.Error_Passive := This.PSR.EP;
      Status.Error_Counter_Warning := This.PSR.EW;
      Status.Bus_Off := This.PSR.BO;
      Status.Data_Last_Error_Code := Last_Error_Code_Enum'Enum_Val (This.PSR.DLEC);
      Status.Rx_ESI_Flag := This.PSR.RESI;
      Status.Rx_BRS_Flag := This.PSR.RBRS;
      Status.Rx_FDF_Flag := This.PSR.REDL;
      Status.Protocol_Exception := This.PSR.PXE;
      Status.Tx_Delay_Compensation := This.PSR.TDCV;
   end Get_Protocol_Status;

   -----------------------
   -- Get_Error_Counter --
   -----------------------

   function Get_Error_Counter
     (This : CAN_Controller) return Error_Counter
   is
      Result : Error_Counter;
   begin
      Result.Tx_Error_Counter := This.ECR.TEC;
      Result.Rx_Error_Counter := This.ECR.REC;
      Result.Rx_Error_Passive := This.ECR.RP;
      Result.Error_Logging := This.ECR.CEL;
      return Result;
   end Get_Error_Counter;

end STM32.CAN;
