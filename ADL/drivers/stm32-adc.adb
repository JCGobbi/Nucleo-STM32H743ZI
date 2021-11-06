------------------------------------------------------------------------------
--                                                                          --
--                  Copyright (C) 2015-2017, AdaCore                        --
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
--                                                                          --
--  This file is based on:                                                  --
--                                                                          --
--   @file    stm32f4xx_hal_adc.c                                           --
--   @author  MCD Application Team                                          --
--   @version V1.3.1                                                        --
--   @date    25-March-2015                                                 --
--   @brief   Header file of ADC HAL module.                                --
--                                                                          --
--   COPYRIGHT(c) 2014 STMicroelectronics                                   --
------------------------------------------------------------------------------

with STM32_SVD.ADC;        use STM32_SVD.ADC;
                           use STM32_SVD;

package body STM32.ADC is

   procedure Set_Sequence_Position
     (This    : in out Analog_To_Digital_Converter;
      Channel : Analog_Input_Channel;
      Rank    : Regular_Channel_Rank)
     with Inline;

   procedure Set_Sampling_Time
     (This        : in out Analog_To_Digital_Converter;
      Channel     : Analog_Input_Channel;
      Sample_Time : Channel_Sampling_Times)
     with Inline,
       Pre => Conversion_Started (This) = False and
         Injected_Conversion_Started (This) = False;

   procedure Set_Injected_Channel_Sequence_Position
     (This    : in out Analog_To_Digital_Converter;
      Channel : Analog_Input_Channel;
      Rank    : Injected_Channel_Rank)
     with Inline;

   procedure Set_Injected_Channel_Offset
     (This    : in out Analog_To_Digital_Converter;
      Channel : Analog_Input_Channel;
      Rank    : Injected_Channel_Rank;
      Offset  : Injected_Data_Offset)
     with Inline;

   ------------
   -- Enable --
   ------------

   procedure Enable (This : in out Analog_To_Digital_Converter) is
   begin
      --  After reset, the ADCs are in deep power-down mode and boost mode off,
      --  for operation with clock < 20 MHz. For normal operation the following
      --  bits should be set. See RM0433 rev 7 sections 25.4.6 and 25.6.3.
      This.CR.DEEPPWD := False; --  deep-sleep mode off
      This.CR.ADVREGEN := True; --  turn on internal voltage regulator
      --  Wait for LDO output voltage ready (only for devices revision V).
      loop
         exit when This.ISR.LDORDY = True;
      end loop;

      This.CR.BOOST := True; --  For ADC frequency > 20 MHz.

      --  The software procedure to enable the ADC is described in RM0433 rev 7
      --  Chapter 25.4.9 pg 937.
      if not This.CR.ADEN then
         --  Clear the ADRDY bit
         This.ISR.ADRDY := True;
         This.CR.ADEN := True;

         loop
            exit when This.ISR.ADRDY = True;
         end loop;
      end if;
   end Enable;

   -------------
   -- Disable --
   -------------

   procedure Disable (This : in out Analog_To_Digital_Converter) is
   begin
      This.CR.ADDIS := True;
   end Disable;

   -------------
   -- Enabled --
   -------------

   function Enabled (This : Analog_To_Digital_Converter) return Boolean is
     (This.CR.ADEN = True);

   --------------
   -- Disabled --
   --------------

   function Disabled (This : Analog_To_Digital_Converter) return Boolean is
     (This.CR.ADEN = False);

   --------------------
   -- Configure_Unit --
   --------------------

   procedure Configure_Unit
     (This       : in out Analog_To_Digital_Converter;
      Resolution : ADC_Resolution;
      Alignment  : Data_Alignment)
   is
   begin
      This.CFGR.RES := ADC_Resolution'Enum_Rep (Resolution);
      case Alignment is
         when Right_Aligned =>
            This.CFGR2.LSHIFT := No_Left_Shift'Enum_Rep;
         when Left_Aligned =>
            if Resolution = ADC_Resolution_14_Bits or
                 Resolution = ADC_Resolution_14_Bits_V
            then
               This.CFGR2.LSHIFT := Shift_Left_2_Bits'Enum_Rep;
            elsif Resolution = ADC_Resolution_12_Bits or
                    Resolution = ADC_Resolution_12_Bits_V
            then
               This.CFGR2.LSHIFT := Shift_Left_4_Bits'Enum_Rep;
            elsif Resolution = ADC_Resolution_10_Bits
            then
               This.CFGR2.LSHIFT := Shift_Left_6_Bits'Enum_Rep;
            else --  for 16 bits and 8 bits
               This.CFGR2.LSHIFT := No_Left_Shift'Enum_Rep;
            end if;
      end case;
   end Configure_Unit;

   ------------------------
   -- Current_Resolution --
   ------------------------

   function Current_Resolution
     (This : Analog_To_Digital_Converter)
      return ADC_Resolution
   is (ADC_Resolution'Val (This.CFGR.RES));

   -----------------------
   -- Current_Alignment --
   -----------------------

   function Current_Alignment
     (This : Analog_To_Digital_Converter)
      return Data_Alignment
   is
   begin
      if This.CFGR2.LSHIFT = No_Left_Shift'Enum_Rep then
         return Right_Aligned;
      else
         return Left_Aligned;
      end if;
   end Current_Alignment;

   ---------------------------
   -- Set_Differential_Mode --
   ---------------------------

   procedure Set_Differential_Mode
     (This    : in out Analog_To_Digital_Converter;
      Channel : Analog_Input_Channel;
      Mode    : Differential_Mode)
   is
   begin
      case Mode is
         when Single_Ended =>
            This.DIFSEL.DIFSEL :=
              This.DIFSEL.DIFSEL and not (2 ** Integer (Channel) - 1);
         when Differential =>
            This.DIFSEL.DIFSEL :=
              This.DIFSEL.DIFSEL or (2 ** Integer (Channel) - 1);
      end case;
   end Set_Differential_Mode;

   -----------------------------------
   -- Configure_Regular_Conversions --
   -----------------------------------

   procedure Configure_Regular_Conversions
     (This        : in out Analog_To_Digital_Converter;
      Continuous  : Boolean;
      Trigger     : Regular_Channel_Conversion_Trigger;
      Conversions : Regular_Channel_Conversions)
   is
   begin
      This.CFGR.CONT := Continuous;

      if Trigger.Enabler /= Trigger_Disabled then
         This.CFGR.EXTSEL :=
           External_Events_Regular_Group'Enum_Rep (Trigger.Event);
         This.CFGR.EXTEN := External_Trigger'Enum_Rep (Trigger.Enabler);
         --  ADSTART need to be set (RM0433 pg. 945 chapter 25.4.19).
         This.CR.ADSTART := True;
      else
         This.CFGR.EXTSEL := 0;
         This.CFGR.EXTEN := 0;
      end if;

      for Rank in Conversions'Range loop
         declare
            Conversion : Regular_Channel_Conversion renames Conversions (Rank);
         begin
            Configure_Regular_Channel
              (This, Conversion.Channel, Rank, Conversion.Sample_Time);

            --  We check the VBat first because that channel is also used for
            --  the temperature sensor channel on some MCUs, in which case the
            --  VBat conversion is the only one done. This order reflects that
            --  hardware behavior.
            if VBat_Conversion (This, Conversion.Channel) then
               Enable_VBat_Connection (This);
            elsif VRef_TemperatureSensor_Conversion (This, Conversion.Channel)
            then
               Enable_VRef_TemperatureSensor_Connection (This);
            end if;
         end;
      end loop;

      This.SQR1.L := UInt4 (Conversions'Length - 1);  -- biased rep
   end Configure_Regular_Conversions;

   ----------------------------------
   -- Regular_Conversions_Expected --
   ----------------------------------

   function Regular_Conversions_Expected (This : Analog_To_Digital_Converter)
     return Natural is
     (Natural (This.SQR1.L) + 1);

   -----------------------
   -- Scan_Mode_Enabled --
   -----------------------

   function Scan_Mode_Enabled (This : Analog_To_Digital_Converter)
                               return Boolean
     is (This.SQR1.L /= UInt4 (0));

   ------------------------------------
   -- Configure_Injected_Conversions --
   ------------------------------------

   procedure Configure_Injected_Conversions
     (This          : in out Analog_To_Digital_Converter;
      AutoInjection : Boolean;
      Trigger       : Injected_Channel_Conversion_Trigger;
      Conversions   : Injected_Channel_Conversions)
   is
   begin
      --  Injected channels cannot be converted continuously. The only
      --  exception is when an injected channel is configured to be converted
      --  automatically after regular channels in continuous mode. See note in
      --  RM0433 rev 7 Chapter 25.4.15, pg 941, and "Auto-injection mode"
      --  section in Chapter 25.4.20 on pg 949.
      This.CFGR.JAUTO := AutoInjection;

      if Trigger.Enabler /= Trigger_Disabled then
         This.JSQR.JEXTEN := External_Trigger'Enum_Rep (Trigger.Enabler);
         This.JSQR.JEXTSEL := External_Events_Injected_Group'Enum_Rep (Trigger.Event);
         --  JADSTART need to be set (RM0433 rev 7 Chapter 25.4.19 pg. 945).
         This.CR.JADSTART := True;
      else
         This.JSQR.JEXTEN := 0;
         This.JSQR.JEXTSEL := 0;
      end if;

      for Rank in Conversions'Range loop
         declare
            Conversion : Injected_Channel_Conversion renames
              Conversions (Rank);
         begin
            Configure_Injected_Channel
              (This,
               Conversion.Channel,
               Rank,
               Conversion.Sample_Time,
               Conversion.Offset);

            --  We check the VBat first because that channel is also used for
            --  the temperature sensor channel on some MCUs, in which case the
            --  VBat conversion is the only one done. This order reflects that
            --  hardware behavior.
            if VBat_Conversion (This, Conversion.Channel) then
               Enable_VBat_Connection (This);
            elsif VRef_TemperatureSensor_Conversion (This, Conversion.Channel)
            then
               Enable_VRef_TemperatureSensor_Connection (This);
            end if;
         end;
      end loop;

      This.JSQR.JL := UInt2 (Conversions'Length - 1);  -- biased rep
   end Configure_Injected_Conversions;

   -----------------------------------
   -- Injected_Conversions_Expected --
   -----------------------------------

   function Injected_Conversions_Expected (This : Analog_To_Digital_Converter)
     return Natural is
     (Natural (This.JSQR.JL) + 1);

   ----------------------------
   -- Enable_VBat_Connection --
   ----------------------------

   procedure Enable_VBat_Connection (This : Analog_To_Digital_Converter) is
   begin
      if This'Address = ADC1_Base or
         This'Address = ADC2_Base
      then
         ADC12_Common_Periph.CCR.VBATEN := True;
      else
         ADC3_Common_Periph.CCR.VBATEN := True;
      end if;
   end Enable_VBat_Connection;

   ------------------
   -- VBat_Enabled --
   ------------------

   function VBat_Enabled (This : Analog_To_Digital_Converter) return Boolean is
   begin
      if This'Address = ADC1_Base or
         This'Address = ADC2_Base
      then
         return ADC12_Common_Periph.CCR.VBATEN;
      else
         return ADC3_Common_Periph.CCR.VBATEN;
      end if;
   end VBat_Enabled;

   ----------------------------------------------
   -- Enable_VRef_TemperatureSensor_Connection --
   ----------------------------------------------

   procedure Enable_VRef_TemperatureSensor_Connection
     (This : Analog_To_Digital_Converter)
   is
   begin
      if This'Address = ADC1_Base or
         This'Address = ADC2_Base
      then
         ADC12_Common_Periph.CCR.VREFEN := True;
         ADC12_Common_Periph.CCR.TSEN := True;
      else
         ADC3_Common_Periph.CCR.VREFEN := True;
         ADC3_Common_Periph.CCR.TSEN := True;
      end if;
      delay until (Clock + Temperature_Sensor_Stabilization);
   end Enable_VRef_TemperatureSensor_Connection;

   ------------------------------------
   -- VRef_TemperatureSensor_Enabled --
   ------------------------------------

   function VRef_TemperatureSensor_Enabled
     (This : Analog_To_Digital_Converter) return Boolean
   is
   begin
      if This'Address = ADC1_Base or
        This'Address = ADC2_Base
      then
         return ADC12_Common_Periph.CCR.VREFEN and ADC12_Common_Periph.CCR.TSEN;
      else
         return ADC3_Common_Periph.CCR.VREFEN and ADC3_Common_Periph.CCR.TSEN;
      end if;
   end VRef_TemperatureSensor_Enabled;

   ---------------------------------
   -- Configure_Common_Properties --
   ---------------------------------

   procedure Configure_Common_Properties
     (This           : in out Analog_To_Digital_Converter;
      Mode           : Multi_ADC_Mode_Selections;
      Prescaler      : ADC_Prescaler;
      Clock_Mode     : ADC_Clock_Mode;
      DMA_Mode       : Data_Management;
      Sampling_Delay : Sampling_Delay_Selections)
   is
   begin
      if This'Address = ADC1_Base or
         This'Address = ADC2_Base
      then
         ADC12_Common_Periph.CCR.DUAL := Mode'Enum_Rep;
         ADC12_Common_Periph.CCR.PRESC := Prescaler'Enum_Rep;
         ADC12_Common_Periph.CCR.CKMODE := Clock_Mode'Enum_Rep;
         ADC12_Common_Periph.CCR.DELAY_k := Sampling_Delay'Enum_Rep;
      else --  ADC3
         ADC3_Common_Periph.CCR.DUAL := Mode'Enum_Rep;
         ADC3_Common_Periph.CCR.PRESC := Prescaler'Enum_Rep;
         ADC3_Common_Periph.CCR.CKMODE := Clock_Mode'Enum_Rep;
         ADC3_Common_Periph.CCR.DELAY_k := Sampling_Delay'Enum_Rep;
      end if;
      This.CFGR.DMNGT := DMA_Mode'Enum_Rep;
   end Configure_Common_Properties;

   -------------------------------
   -- Configure_Regular_Channel --
   -------------------------------

   procedure Configure_Regular_Channel
     (This        : in out Analog_To_Digital_Converter;
      Channel     : Analog_Input_Channel;
      Rank        : Regular_Channel_Rank;
      Sample_Time : Channel_Sampling_Times)
   is
   begin
      Set_Sampling_Time (This, Channel, Sample_Time);
      Set_Sequence_Position (This, Channel, Rank);
   end Configure_Regular_Channel;

   --------------------------------
   -- Configure_Injected_Channel --
   --------------------------------

   procedure Configure_Injected_Channel
     (This        : in out Analog_To_Digital_Converter;
      Channel     : Analog_Input_Channel;
      Rank        : Injected_Channel_Rank;
      Sample_Time : Channel_Sampling_Times;
      Offset      : Injected_Data_Offset)
   is
   begin
      Set_Sampling_Time (This, Channel, Sample_Time);
      Set_Injected_Channel_Sequence_Position (This, Channel, Rank);
      Set_Injected_Channel_Offset (This, Channel, Rank, Offset);
   end Configure_Injected_Channel;

   ----------------------
   -- Start_Conversion --
   ----------------------

   procedure Start_Conversion (This : in out Analog_To_Digital_Converter) is
   begin
      if External_Trigger'Val (This.CFGR.EXTEN) /= Trigger_Disabled then
         return;
      end if;

      if This'Address = ADC1_Base or --  master channel
         This'Address = ADC3_Base --  independent channel
      then
         This.CR.ADSTART := True;
      elsif This'Address = ADC2_Base then --  slave channel
         if Multi_ADC_Mode_Selections'Val (ADC12_Common_Periph.CCR.DUAL) = Independent
         then
            This.CR.ADSTART := True;
         end if;
      end if;
   end Start_Conversion;

   ---------------------
   -- Stop_Conversion --
   ---------------------

   procedure Stop_Conversion (This : in out Analog_To_Digital_Converter) is
   begin
      This.CR.ADSTP := True;
   end Stop_Conversion;

   ------------------------
   -- Conversion_Started --
   ------------------------

   function Conversion_Started (This : Analog_To_Digital_Converter)
      return Boolean
   is
      (This.CR.ADSTART);

   ----------------------
   -- Conversion_Value --
   ----------------------

   function Conversion_Value
     (This : Analog_To_Digital_Converter)
      return UInt32
   is
   begin
      return This.DR;
   end Conversion_Value;

   ---------------------------
   -- Data_Register_Address --
   ---------------------------

   function Data_Register_Address
     (This : Analog_To_Digital_Converter)
      return System.Address
   is
      (This.DR'Address);

   -------------------------------
   -- Start_Injected_Conversion --
   -------------------------------

   procedure Start_Injected_Conversion
     (This : in out Analog_To_Digital_Converter)
   is
   begin
      This.CR.JADSTART := True;
   end Start_Injected_Conversion;

   ---------------------------------
   -- Injected_Conversion_Started --
   ---------------------------------

   function Injected_Conversion_Started (This : Analog_To_Digital_Converter)
     return Boolean
   is
     (This.CR.JADSTART);

   -------------------------------
   -- Injected_Conversion_Value --
   -------------------------------

   function Injected_Conversion_Value
     (This : Analog_To_Digital_Converter;
      Rank : Injected_Channel_Rank)
      return UInt32
   is
   begin
      case Rank is
         when 1 =>
            return This.JDR1;
         when 2 =>
            return This.JDR2;
         when 3 =>
            return This.JDR3;
         when 4 =>
            return This.JDR4;
      end case;
   end Injected_Conversion_Value;

   --------------------------------
   -- Multimode_Conversion_Value --
   --------------------------------

   function Multimode_Conversion_Value
     (This  : Analog_To_Digital_Converter;
      Value : CDR_Data) return UInt16
   is
   begin
      case Value is
         when Master =>
            if This'Address = ADC1_Base or
               This'Address = ADC2_Base
            then
               return ADC12_Common_Periph.CDR.RDATA_MST;
            else
               return ADC3_Common_Periph.CDR.RDATA_MST;
            end if;
         when Slave =>
            if This'Address = ADC1_Base or
               This'Address = ADC2_Base
            then
               return ADC12_Common_Periph.CDR.RDATA_SLV;
            else
               return ADC3_Common_Periph.CDR.RDATA_SLV;
            end if;
      end case;
   end Multimode_Conversion_Value;

   --------------------------------
   -- Multimode_Conversion_Value --
   --------------------------------

   function Multimode_Conversion_Value
     (This : Analog_To_Digital_Converter) return UInt32
   is
   begin
      if This'Address = ADC1_Base or
         This'Address = ADC2_Base
      then
         return ADC12_Common_Periph.CDR2;
      else
         return ADC3_Common_Periph.CDR2;
      end if;
   end Multimode_Conversion_Value;

   -------------------------------
   -- Enable_Discontinuous_Mode --
   -------------------------------

   procedure Enable_Discontinuous_Mode
     (This    : in out Analog_To_Digital_Converter;
      Regular : Boolean;  -- if False, enabling for Injected channels
      Count   : Discontinuous_Mode_Channel_Count)
   is
   begin
      if Regular then
         This.CFGR.JDISCEN := False;
         This.CFGR.DISCEN := True;
      else -- Injected
         This.CFGR.DISCEN := False;
         This.CFGR.JDISCEN := True;
      end if;
      This.CFGR.DISCNUM := UInt3 (Count - 1);  -- biased
   end Enable_Discontinuous_Mode;

   ----------------------------------------
   -- Disable_Discontinuous_Mode_Regular --
   ---------------------------------------

   procedure Disable_Discontinuous_Mode_Regular
     (This : in out Analog_To_Digital_Converter)
   is
   begin
      This.CFGR.DISCEN := False;
   end Disable_Discontinuous_Mode_Regular;

   -----------------------------------------
   -- Disable_Discontinuous_Mode_Injected --
   -----------------------------------------

   procedure Disable_Discontinuous_Mode_Injected
     (This : in out Analog_To_Digital_Converter)
   is
   begin
      This.CFGR.JDISCEN := False;
   end Disable_Discontinuous_Mode_Injected;

   ----------------------------------------
   -- Discontinuous_Mode_Regular_Enabled --
   ----------------------------------------

   function Discontinuous_Mode_Regular_Enabled
     (This : Analog_To_Digital_Converter)
      return Boolean
   is (This.CFGR.DISCEN);

   -----------------------------------------
   -- Discontinuous_Mode_Injected_Enabled --
   -----------------------------------------

   function Discontinuous_Mode_Injected_Enabled
     (This : Analog_To_Digital_Converter)
      return Boolean
   is (This.CFGR.JDISCEN);

   ---------------------------
   -- AutoInjection_Enabled --
   ---------------------------

   function AutoInjection_Enabled
     (This : Analog_To_Digital_Converter)
      return Boolean
   is (This.CFGR.JAUTO);

   ----------------
   -- Enable_DMA --
   ----------------

   procedure Enable_DMA (This : in out Analog_To_Digital_Converter) is
   begin
      This.CFGR.DMNGT := Data_Management'Enum_Rep (DMA_One_Shot_Mode);
   end Enable_DMA;

   -----------------
   -- Disable_DMA --
   -----------------

   procedure Disable_DMA (This : in out Analog_To_Digital_Converter) is
   begin
      This.CFGR.DMNGT := Data_Management'Enum_Rep (Regular_Data_In_DR);
   end Disable_DMA;

   -----------------
   -- DMA_Enabled --
   -----------------

   function DMA_Enabled (This : Analog_To_Digital_Converter) return Boolean is
     (This.CFGR.DMNGT = Data_Management'Enum_Rep (DMA_One_Shot_Mode) or
      This.CFGR.DMNGT = Data_Management'Enum_Rep (DMA_Circular_Mode));

   ------------------------------------
   -- Enable_DMA_After_Last_Transfer --
   ------------------------------------

   procedure Enable_DMA_After_Last_Transfer
     (This : in out Analog_To_Digital_Converter)
   is
   begin
      This.CFGR.DMNGT := Data_Management'Enum_Rep (DMA_Circular_Mode);
   end Enable_DMA_After_Last_Transfer;

   -------------------------------------
   -- Disable_DMA_After_Last_Transfer --
   -------------------------------------

   procedure Disable_DMA_After_Last_Transfer
     (This : in out Analog_To_Digital_Converter)
   is
   begin
      This.CFGR.DMNGT := Data_Management'Enum_Rep (DMA_One_Shot_Mode);
   end Disable_DMA_After_Last_Transfer;

   -------------------------------------
   -- DMA_Enabled_After_Last_Transfer --
   -------------------------------------

   function DMA_Enabled_After_Last_Transfer
     (This : Analog_To_Digital_Converter)
      return Boolean
   is (This.CFGR.DMNGT = Data_Management'Enum_Rep (DMA_Circular_Mode));

   ------------------------------
   -- Watchdog_Enable_Channels --
   ------------------------------

   procedure Watchdog_Enable_Channels
     (This : in out Analog_To_Digital_Converter;
      Mode : Multiple_Channels_Watchdog;
      Low  : Watchdog_Threshold;
      High : Watchdog_Threshold)
   is
   begin
      This.HTR1.HTR1 := High;
      This.LTR1.LTR1 := Low;

      --  Enable all channel mode
      This.CFGR.AWD1SGL := False;
      case Mode is
         when Watchdog_All_Regular_Channels =>
            This.CFGR.AWD1EN := True;
         when Watchdog_All_Injected_Channels =>
            This.CFGR.JAWD1EN := True;
         when Watchdog_All_Both_Kinds =>
            This.CFGR.AWD1EN := True;
            This.CFGR.JAWD1EN := True;
      end case;
   end Watchdog_Enable_Channels;

   -----------------------------
   -- Watchdog_Enable_Channel --
   -----------------------------

   procedure Watchdog_Enable_Channel
     (This    : in out Analog_To_Digital_Converter;
      Mode    : Single_Channel_Watchdog;
      Channel : Analog_Input_Channel;
      Low     : Watchdog_Threshold;
      High    : Watchdog_Threshold)
   is
   begin
      This.HTR1.HTR1 := High;
      This.LTR1.LTR1 := Low;

      --  Set then channel
      This.CFGR.AWD1CH := Channel;
      --  Enable single channel mode
      This.CFGR.AWD1SGL := True;

      case Mode is
         when Watchdog_Single_Regular_Channel =>
            This.CFGR.AWD1EN := True;
         when Watchdog_Single_Injected_Channel =>
            This.CFGR.JAWD1EN := True;
         when Watchdog_Single_Both_Kinds =>
            This.CFGR.AWD1EN := True;
            This.CFGR.JAWD1EN := True;
      end case;
   end Watchdog_Enable_Channel;

   ----------------------
   -- Watchdog_Disable --
   ----------------------

   procedure Watchdog_Disable (This : in out Analog_To_Digital_Converter) is
   begin
      This.CFGR.AWD1EN := False;
      This.CFGR.JAWD1EN := False;

      --  Clearing the single-channel bit (AWDSGL) is not required to disable,
      --  per the RM0433 rev 7 Table 214, section 25.4.30, but seems cleanest.
      This.CFGR.AWD1SGL := False;
   end Watchdog_Disable;

   ----------------------
   -- Watchdog_Enabled --
   ----------------------

   function Watchdog_Enabled (This : Analog_To_Digital_Converter)
     return Boolean
   is
      (This.CFGR.AWD1EN or This.CFGR.JAWD1EN);
   --  Per the RM0433 rev 7 Table 214, section 25.4.30,

   ------------------------------
   -- Watchdog_Enable_Channels --
   ------------------------------
   procedure Watchdog_Enable_Channels
     (This     : in out Analog_To_Digital_Converter;
      Watchdog : Analog_Window_Watchdog;
      Channels : Analog_Input_Channels;
      Low      : Watchdog_Threshold;
      High     : Watchdog_Threshold)
   is
   begin
      case Watchdog is
         when Watchdog_2 =>
            This.HTR2.HTR2 := High;
            This.LTR2.LTR2 := Low;
            for Channel of Channels loop
               This.AWD2CR.AWD2CH := This.AWD2CR.AWD2CH or (2 ** Natural (Channel));
            end loop;
         when Watchdog_3 =>
            This.HTR3.HTR3 := High;
            This.LTR3.LTR3 := Low;
            for Channel of Channels loop
               This.AWD3CR.AWD3CH := This.AWD3CR.AWD3CH or (2 ** Natural (Channel));
            end loop;
      end case;
   end Watchdog_Enable_Channels;

   -------------------------------
   -- Watchdog_Disable_Channels --
   -------------------------------
   procedure Watchdog_Disable_Channels
     (This     : in out Analog_To_Digital_Converter;
      Watchdog : Analog_Window_Watchdog;
      Channels : Analog_Input_Channels)
   is
   begin
      case Watchdog is
         when Watchdog_2 =>
            for Channel of Channels loop
               This.AWD2CR.AWD2CH := This.AWD2CR.AWD2CH and not (2 ** Natural (Channel));
            end loop;
         when Watchdog_3 =>
            for Channel of Channels loop
               This.AWD3CR.AWD3CH := This.AWD3CR.AWD3CH and not (2 ** Natural (Channel));
            end loop;
      end case;
   end Watchdog_Disable_Channels;

   ----------------------
   -- Watchdog_Disable --
   ----------------------

   procedure Watchdog_Disable
     (This     : in out Analog_To_Digital_Converter;
      Watchdog : Analog_Window_Watchdog)
   is
   begin
      case Watchdog is
         when Watchdog_2 =>
            This.AWD2CR.AWD2CH := 16#000#;
         when Watchdog_3 =>
            This.AWD3CR.AWD3CH := 16#000#;
      end case;
   end Watchdog_Disable;

   ----------------------
   -- Watchdog_Enabled --
   ----------------------

   function Watchdog_Enabled
     (This     : Analog_To_Digital_Converter;
      Watchdog : Analog_Window_Watchdog) return Boolean
   is
   begin
      case Watchdog is
         when Watchdog_2 =>
            return This.AWD2CR.AWD2CH /= 16#000#;
         when Watchdog_3 =>
            return This.AWD3CR.AWD3CH /= 16#000#;
      end case;
   end Watchdog_Enabled;

   ------------
   -- Status --
   ------------

   function Status
     (This : Analog_To_Digital_Converter;
      Flag : ADC_Status_Flag)
      return Boolean
   is
   begin
      case Flag is
         when ADC_Ready =>
            return This.ISR.ADRDY;
         when Regular_Channel_Conversion_Completed =>
            return This.ISR.EOC;
         when Regular_Sequence_Conversion_Completed =>
            return This.ISR.EOS;
         when Injected_Channel_Conversion_Completed =>
            return This.ISR.JEOC;
         when Injected_Sequence_Conversion_Completed =>
            return This.ISR.JEOS;
         when Analog_Watchdog_1_Event_Occurred =>
            return This.ISR.AWD.Arr (1);
         when Analog_Watchdog_2_Event_Occurred =>
            return This.ISR.AWD.Arr (2);
         when Analog_Watchdog_3_Event_Occurred =>
            return This.ISR.AWD.Arr (3);
         when Regular_Channel_Sampling_Completed =>
            return This.ISR.EOSMP;
         when Overrun =>
            return This.ISR.OVR;
         when Injected_Context_Queue_Overflow =>
            return This.ISR.JQOVF;
         when LDO_Voltage_Regulator_Ready =>
            return This.ISR.LDORDY;
      end case;
   end Status;

   ------------------
   -- Clear_Status --
   ------------------

   procedure Clear_Status
     (This : in out Analog_To_Digital_Converter;
      Flag : ADC_Status_Flag)
   is
   begin
      case Flag is
         when ADC_Ready =>
            This.ISR.ADRDY := True;
         when Regular_Channel_Conversion_Completed =>
            This.ISR.EOC := True;
         when Regular_Sequence_Conversion_Completed =>
            This.ISR.EOS := True;
         when Injected_Channel_Conversion_Completed =>
            This.ISR.JEOC := True;
         when Injected_Sequence_Conversion_Completed =>
            This.ISR.JEOS := True;
         when Analog_Watchdog_1_Event_Occurred =>
            This.ISR.AWD.Arr (1) := True;
         when Analog_Watchdog_2_Event_Occurred =>
            This.ISR.AWD.Arr (2) := True;
         when Analog_Watchdog_3_Event_Occurred =>
            This.ISR.AWD.Arr (3) := True;
         when Regular_Channel_Sampling_Completed =>
            This.ISR.EOSMP := True;
         when Overrun =>
            This.ISR.OVR := True;
         when Injected_Context_Queue_Overflow =>
            This.ISR.JQOVF := True;
         when LDO_Voltage_Regulator_Ready =>
            null;
      end case;
   end Clear_Status;

   ---------------------
   -- Poll_For_Status --
   ---------------------

   procedure Poll_For_Status
     (This    : in out Analog_To_Digital_Converter;
      Flag    : ADC_Status_Flag;
      Success : out Boolean;
      Timeout : Time_Span := Time_Span_Last)
   is
      Deadline : constant Time := Clock + Timeout;
   begin
      Success := False;
      while Clock < Deadline loop
         if Status (This, Flag) then
            Success := True;
            exit;
         end if;
      end loop;
   end Poll_For_Status;

   -----------------------
   -- Enable_Interrupts --
   -----------------------

   procedure Enable_Interrupts
     (This   : in out Analog_To_Digital_Converter;
      Source : ADC_Interrupts)
   is
   begin
      case Source is
         when ADC_Ready =>
            This.IER.ADRDYIE := True;
         when Regular_Channel_Conversion_Complete =>
            This.IER.EOCIE := True;
         when Regular_Sequence_Conversion_Complete =>
            This.IER.EOSIE := True;
         when Injected_Channel_Conversion_Complete =>
            This.IER.JEOCIE := True;
         when Injected_Sequence_Conversion_Complete =>
            This.IER.JEOSIE := True;
         when Analog_Watchdog_1_Event_Occurr =>
            This.IER.AWD1IE := True;
         when Analog_Watchdog_2_Event_Occurr =>
            This.IER.AWD2IE := True;
         when Analog_Watchdog_3_Event_Occurr =>
            This.IER.AWD3IE := True;
         when Regular_Channel_Sampling_Completed =>
            This.IER.EOSMPIE := True;
         when Overrun =>
            This.IER.OVRIE := True;
         when Injected_Context_Queue_Overflow =>
            This.IER.JQOVFIE := True;
      end case;
   end Enable_Interrupts;

   -----------------------
   -- Interrupt_Enabled --
   -----------------------

   function Interrupt_Enabled
     (This   : Analog_To_Digital_Converter;
      Source : ADC_Interrupts)
     return Boolean
   is
   begin
      case Source is
         when ADC_Ready =>
            return This.IER.ADRDYIE;
         when Regular_Channel_Conversion_Complete =>
            return This.IER.EOCIE;
         when Regular_Sequence_Conversion_Complete =>
            return This.IER.EOSIE;
         when Injected_Channel_Conversion_Complete =>
            return This.IER.JEOCIE;
         when Injected_Sequence_Conversion_Complete =>
            return This.IER.JEOSIE;
         when Analog_Watchdog_1_Event_Occurr =>
            return This.IER.AWD1IE;
         when Analog_Watchdog_2_Event_Occurr =>
            return This.IER.AWD2IE;
         when Analog_Watchdog_3_Event_Occurr =>
            return This.IER.AWD3IE;
         when Regular_Channel_Sampling_Completed =>
            return This.IER.EOSMPIE;
         when Overrun =>
            return This.IER.OVRIE;
         when Injected_Context_Queue_Overflow =>
            return This.IER.JQOVFIE;
      end case;
   end Interrupt_Enabled;

   ------------------------
   -- Disable_Interrupts --
   ------------------------

   procedure Disable_Interrupts
     (This   : in out Analog_To_Digital_Converter;
      Source : ADC_Interrupts)
   is
   begin
      case Source is
         when ADC_Ready =>
            This.IER.ADRDYIE := False;
         when Regular_Channel_Conversion_Complete =>
            This.IER.EOCIE := False;
         when Regular_Sequence_Conversion_Complete =>
            This.IER.EOSIE := False;
         when Injected_Channel_Conversion_Complete =>
            This.IER.JEOCIE := False;
         when Injected_Sequence_Conversion_Complete =>
            This.IER.JEOSIE := False;
         when Analog_Watchdog_1_Event_Occurr =>
            This.IER.AWD1IE := False;
         when Analog_Watchdog_2_Event_Occurr =>
            This.IER.AWD2IE := False;
         when Analog_Watchdog_3_Event_Occurr =>
            This.IER.AWD3IE := False;
         when Regular_Channel_Sampling_Completed =>
            This.IER.EOSMPIE := False;
         when Overrun =>
            This.IER.OVRIE := False;
         when Injected_Context_Queue_Overflow =>
            This.IER.JQOVFIE := False;
      end case;
   end Disable_Interrupts;

   -----------------------------
   -- Clear_Interrupt_Pending --
   -----------------------------

   procedure Clear_Interrupt_Pending
     (This   : in out Analog_To_Digital_Converter;
      Source : ADC_Interrupts)
   is
   begin
      case Source is
         when ADC_Ready =>
            This.ISR.ADRDY := True;
         when Regular_Channel_Conversion_Complete =>
            This.ISR.EOC := True;
         when Regular_Sequence_Conversion_Complete =>
            This.ISR.EOS := True;
         when Injected_Channel_Conversion_Complete =>
            This.ISR.JEOC := True;
         when Injected_Sequence_Conversion_Complete =>
            This.ISR.JEOS := True;
         when Analog_Watchdog_1_Event_Occurr =>
            This.ISR.AWD.Arr (1) := True;
         when Analog_Watchdog_2_Event_Occurr =>
            This.ISR.AWD.Arr (2) := True;
         when Analog_Watchdog_3_Event_Occurr =>
            This.ISR.AWD.Arr (3) := True;
         when Regular_Channel_Sampling_Completed =>
            This.ISR.EOSMP := True;
         when Overrun =>
            This.ISR.OVR := True;
         when Injected_Context_Queue_Overflow =>
            This.ISR.JQOVF := True;
      end case;
   end Clear_Interrupt_Pending;

   ---------------------------
   -- Set_Sequence_Position --
   ---------------------------

   procedure Set_Sequence_Position
     (This    : in out Analog_To_Digital_Converter;
      Channel : Analog_Input_Channel;
      Rank    : Regular_Channel_Rank)
   is
   begin
      case Rank is
         when 1 =>
            This.SQR1.SQ1 := Channel;
         when 2 =>
            This.SQR1.SQ2 := Channel;
         when 3 =>
            This.SQR1.SQ3 := Channel;
         when 4 =>
            This.SQR1.SQ4 := Channel;
         when 5 =>
            This.SQR2.SQ5 := Channel;
         when 6 =>
            This.SQR2.SQ6 := Channel;
         when 7 =>
            This.SQR2.SQ7 := Channel;
         when 8 =>
            This.SQR2.SQ8 := Channel;
         when 9 =>
            This.SQR2.SQ9 := Channel;
         when 10 =>
            This.SQR3.SQ10 := Channel;
         when 11 =>
            This.SQR3.SQ11 := Channel;
         when 12 =>
            This.SQR3.SQ12 := Channel;
         when 13 =>
            This.SQR3.SQ13 := Channel;
         when 14 =>
            This.SQR3.SQ14 := Channel;
         when 15 =>
            This.SQR4.SQ15 := Channel;
         when 16 =>
            This.SQR4.SQ16 := Channel;
      end case;
   end Set_Sequence_Position;

   --------------------------------------------
   -- Set_Injected_Channel_Sequence_Position --
   --------------------------------------------

   procedure Set_Injected_Channel_Sequence_Position
     (This    : in out Analog_To_Digital_Converter;
      Channel : Analog_Input_Channel;
      Rank    : Injected_Channel_Rank)
   is
   begin
      case Rank is
         when 1 =>
            This.JSQR.JSQ1 := Channel;
         when 2 =>
            This.JSQR.JSQ2 := Channel;
         when 3 =>
            This.JSQR.JSQ3 := Channel;
         when 4 =>
            This.JSQR.JSQ4 := Channel;
      end case;
   end Set_Injected_Channel_Sequence_Position;

   -----------------------
   -- Set_Sampling_Time --
   -----------------------

   procedure Set_Sampling_Time
     (This        : in out Analog_To_Digital_Converter;
      Channel     : Analog_Input_Channel;
      Sample_Time : Channel_Sampling_Times)
   is
   begin
      case Channel is
         when 0 .. 9 =>
            This.SMPR1.SMP.Arr (Natural (Channel)) :=
              Channel_Sampling_Times'Enum_Rep (Sample_Time);
         when 10 .. 19 =>
            This.SMPR2.SMP.Arr (Natural (Channel)) :=
              Channel_Sampling_Times'Enum_Rep (Sample_Time);
      end case;
   end Set_Sampling_Time;

   ---------------------------------
   -- Set_Injected_Channel_Offset --
   ---------------------------------

   procedure Set_Injected_Channel_Offset
     (This    : in out Analog_To_Digital_Converter;
      Channel : Analog_Input_Channel;
      Rank    : Injected_Channel_Rank;
      Offset  : Injected_Data_Offset)
   is
   begin
      case Rank is
         when 1 =>
            This.OFR1.OFFSET1_CH := Channel;
            This.OFR1.OFFSET1 := Offset;
         when 2 =>
            This.OFR2.OFFSET2_CH := Channel;
            This.OFR2.OFFSET2 := Offset;
         when 3 =>
            This.OFR3.OFFSET3_CH := Channel;
            This.OFR3.OFFSET3 := Offset;
         when 4 =>
            This.OFR4.OFFSET4_CH := Channel;
            This.OFR4.OFFSET4 := Offset;
      end case;
   end Set_Injected_Channel_Offset;

end STM32.ADC;
