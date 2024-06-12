------------------------------------------------------------------------------
--                                                                          --
--                    Copyright (C) 2015, AdaCore                           --
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
--   @file    stm32f4xx_hal_dma.c                                           --
--   @author  MCD Application Team                                          --
--   @version V1.1.0                                                        --
--   @date    19-June-2014                                                  --
--   @brief   DMA HAL module driver.                                        --
--                                                                          --
--   COPYRIGHT(c) 2014 STMicroelectronics                                   --
------------------------------------------------------------------------------

with Ada.Unchecked_Conversion;
with System.Storage_Elements;

with STM32_SVD.DMA;    use STM32_SVD.DMA;
with STM32_SVD.DMAMUX; use STM32_SVD.DMAMUX;

package body STM32.DMA is

   type DMA_Stream_Record is record
      --  configuration register
      CR   : S0CR_Register;
      --  number of data register
      NDTR : S0NDTR_Register;
      --  peripheral address register
      PAR  : UInt32;
      --  memory 0 address register
      M0AR : UInt32;
      --  memory 1 address register (for double buffer mode)
      M1AR : UInt32;
      --  fifo control register
      FCR  : S0FCR_Register;
   end record with Volatile;

   for DMA_Stream_Record use record
      CR   at 16#00#  range 0 .. 31;
      NDTR at 16#04#  range 0 .. 31;
      PAR  at 16#08#  range 0 .. 31;
      M0AR at 16#0C#  range 0 .. 31;
      M1AR at 16#10#  range 0 .. 31;
      FCR  at 16#14#  range 0 .. 31;
   end record;

   type DMA_Stream is access all DMA_Stream_Record;

   function Get_Stream
     (Port : DMA_Controller;
      Num  : DMA_Stream_Selector) return DMA_Stream
     with Inline;

   procedure Set_Interrupt_Enabler
     (This_Stream : DMA_Stream;
      Source      : DMA_Interrupt;
      Value       : Boolean);
   --  An internal routine, used to enable and disable the specified interrupt

   ----------------
   -- Get_Stream --
   ----------------

   function Get_Stream
     (Port : DMA_Controller;
      Num  : DMA_Stream_Selector) return DMA_Stream
   is
      Addr : System.Address;
      function To_Stream is new Ada.Unchecked_Conversion
        (System.Address, DMA_Stream);
   begin
      case Num is
         when Stream_1 =>
            Addr := Port.S0CR'Address;
         when Stream_2 =>
            Addr := Port.S1CR'Address;
         when Stream_3 =>
            Addr := Port.S2CR'Address;
         when Stream_4 =>
            Addr := Port.S3CR'Address;
         when Stream_5 =>
            Addr := Port.S4CR'Address;
         when Stream_6 =>
            Addr := Port.S5CR'Address;
         when Stream_7 =>
            Addr := Port.S6CR'Address;
         when Stream_8 =>
            Addr := Port.S7CR'Address;
      end case;

      return To_Stream (Addr);
   end Get_Stream;

   ------------
   -- Enable --
   ------------

   procedure Enable
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector)
   is
   begin
      Get_Stream (This, Stream).CR.EN := True;
   end Enable;

   -------------
   -- Enabled --
   -------------

   function Enabled
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector)
      return Boolean
   is
   begin
      return Get_Stream (This, Stream).CR.EN;
   end Enabled;

   -------------
   -- Disable --
   -------------

   procedure Disable
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector)
   is
   begin
      Get_Stream (This, Stream).CR.EN := False;
   end Disable;

   -----------
   -- Reset --
   -----------

   procedure Reset
     (This   : in out DMA_Controller;
      Stream : DMA_Stream_Selector)
   is
      This_Stream : DMA_Stream renames Get_Stream (This, Stream);
   begin
      Disable (This, Stream);

      This_Stream.CR := (others => <>);
      This_Stream.NDTR.NDT := 0;
      This_Stream.PAR := 0;
      This_Stream.M0AR := 0;
      This_Stream.M1AR := 0;

      --  Clear all stream status flags
      Clear_All_Status (This, Stream);
   end Reset;

   ----------------------------
   -- Set_Double_Buffer_Mode --
   ----------------------------

   procedure Set_Double_Buffer_Mode
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector;
      Enable : Boolean)
   is
   begin
      Get_Stream (This, Stream).CR.DBM := Enable;
   end Set_Double_Buffer_Mode;

   -----------------------------
   -- Set_Bufferable_Transfer --
   -----------------------------

   procedure Set_Bufferable_Transfer
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector;
      Enable : Boolean)
   is
   begin
      Get_Stream (This, Stream).CR.TRBUFF := Enable;
   end Set_Bufferable_Transfer;

   -----------------------------
   -- Set_Burst_Mode_Transfer --
   -----------------------------

   procedure Set_Burst_Mode_Transfer
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector;
      Device : DMA_Device;
      Mode   : DMA_Burst_Transfer_Mode)
   is
   begin
      case Device is
         when Memory =>
            Get_Stream (This, Stream).CR.MBURST := Mode'Enum_Rep;
         when Peripheral =>
            Get_Stream (This, Stream).CR.PBURST := Mode'Enum_Rep;
      end case;
   end Set_Burst_Mode_Transfer;

   -------------------------
   -- Configure_Data_Flow --
   -------------------------

   procedure Configure_Data_Flow
     (This        : DMA_Controller;
      Stream      : DMA_Stream_Selector;
      Source      : Address;
      Destination : Address;
      Data_Count  : UInt16)
   is
      This_Stream : DMA_Stream renames Get_Stream (This, Stream);
      function W is new Ada.Unchecked_Conversion
        (Address, UInt32);
   begin
      --  the following assignment has NO EFFECT if flow is controlled by
      --  peripheral. The hardware resets it to 16#FFFF#, see RM0090 10.3.15.
      This_Stream.NDTR.NDT := Data_Count;

      case DMA_Data_Transfer_Direction'Val (This_Stream.CR.DIR) is
         when Memory_To_Peripheral =>
            This_Stream.M0AR := W (Source);
            This_Stream.PAR  := W (Destination);
         when Peripheral_To_Memory | Memory_To_Memory =>
            This_Stream.PAR  := W (Source);
            This_Stream.M0AR := W (Destination);
      end case;
   end Configure_Data_Flow;

   --------------------
   -- Start_Transfer --
   --------------------

   procedure Start_Transfer
     (This        : DMA_Controller;
      Stream      : DMA_Stream_Selector;
      Source      : Address;
      Destination : Address;
      Data_Count  : UInt16)
   is
   begin
      Disable (This, Stream);

      Configure_Data_Flow
        (This,
         Stream,
         Source      => Source,
         Destination => Destination,
         Data_Count => Data_Count);

      Enable (This, Stream);
   end Start_Transfer;

   ---------------------------
   -- Set_Interrupt_Enabler --
   ---------------------------

   procedure Set_Interrupt_Enabler
     (This_Stream : DMA_Stream;
      Source      : DMA_Interrupt;
      Value       : Boolean)
   is
   begin
      case Source is
         when Transfer_Error_Interrupt =>
            This_Stream.CR.TEIE := Value;
         when Half_Transfer_Complete_Interrupt =>
            This_Stream.CR.HTIE := Value;
         when Transfer_Complete_Interrupt =>
            This_Stream.CR.TCIE := Value;
         when Direct_Mode_Error_Interrupt =>
            This_Stream.CR.DMEIE := Value;
      end case;
   end Set_Interrupt_Enabler;

   ----------------------
   -- Enable_Interrupt --
   ----------------------

   procedure Enable_Interrupt
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector;
      Source : DMA_Interrupt)
   is
   begin
      Set_Interrupt_Enabler (Get_Stream (This, Stream), Source, True);
   end Enable_Interrupt;

   -----------------------
   -- Interrupt_Enabled --
   -----------------------

   function Interrupt_Enabled
     (This        : DMA_Controller;
      Stream      : DMA_Stream_Selector;
      Source      : DMA_Interrupt)
      return Boolean
   is
      Result      : Boolean;
      This_Stream : DMA_Stream renames Get_Stream (This, Stream);
      --  this is a bit heavy, considering it will be called from interrupt
      --  handlers.
      --  TODO: consider a much lower level implementation, based on bit-masks.
   begin
      case Source is
         when Transfer_Error_Interrupt =>
            Result := This_Stream.CR.TEIE;
         when Half_Transfer_Complete_Interrupt =>
            Result := This_Stream.CR.HTIE;
         when Transfer_Complete_Interrupt =>
            Result := This_Stream.CR.TCIE;
         when Direct_Mode_Error_Interrupt =>
            Result := This_Stream.CR.DMEIE;
      end case;
      return Result;
   end Interrupt_Enabled;

   -----------------------
   -- Disable_Interrupt --
   -----------------------

   procedure Disable_Interrupt
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector;
      Source : DMA_Interrupt)
   is
   begin
      Set_Interrupt_Enabler (Get_Stream (This, Stream), Source, False);
   end Disable_Interrupt;

   ------------------------------------
   -- Start_Transfer_with_Interrupts --
   ------------------------------------

   procedure Start_Transfer_with_Interrupts
     (This               : DMA_Controller;
      Stream             : DMA_Stream_Selector;
      Source             : Address;
      Destination        : Address;
      Data_Count         : UInt16;
      Enabled_Interrupts : Interrupt_Selections := (others => True))
   is
   begin
      Disable (This, Stream);

      Configure_Data_Flow
        (This,
         Stream,
         Source      => Source,
         Destination => Destination,
         Data_Count  => Data_Count);

      for Selected_Interrupt in Enabled_Interrupts'Range loop
         if Enabled_Interrupts (Selected_Interrupt) then
            Enable_Interrupt (This, Stream, Selected_Interrupt);
         end if;
      end loop;

      Enable (This, Stream);
   end Start_Transfer_with_Interrupts;

   --------------------
   -- Abort_Transfer --
   --------------------

   procedure Abort_Transfer
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector;
      Result : out DMA_Error_Code)
   is
      Max_Abort_Time : constant Time_Span := Seconds (1);
      Timeout        : Time;
      This_Stream    : DMA_Stream renames Get_Stream (This, Stream);
   begin
      Disable (This, Stream);
      Timeout := Clock + Max_Abort_Time;
      loop
         exit when not This_Stream.CR.EN;
         if Clock > Timeout then
            Result := DMA_Timeout_Error;
            return;
         end if;
      end loop;
      Result := DMA_No_Error;
   end Abort_Transfer;

   -------------------------
   -- Poll_For_Completion --
   -------------------------

   procedure Poll_For_Completion
     (This           : in out DMA_Controller;
      Stream         : DMA_Stream_Selector;
      Expected_Level : DMA_Transfer_Level;
      Timeout        : Time_Span;
      Result         : out DMA_Error_Code)
   is
      Deadline : constant Time := Clock + Timeout;
   begin
      Result := DMA_No_Error;  -- initially anyway

      Polling : loop
         if Expected_Level = Full_Transfer then
            exit Polling when
              Status (This, Stream, Transfer_Complete_Indicated);
         else
            exit Polling when
              Status (This, Stream, Half_Transfer_Complete_Indicated);
         end if;

         if Status (This, Stream, Transfer_Error_Indicated)
         then
            Clear_Status (This, Stream, Transfer_Error_Indicated);

            Result := DMA_Device_Error;
            return;
         end if;

         if Clock > Deadline then
            Result := DMA_Timeout_Error;
            return;
         end if;
      end loop Polling;

      Clear_Status (This, Stream, Half_Transfer_Complete_Indicated);

      if Expected_Level = Full_Transfer then
         Clear_Status (This, Stream, Transfer_Complete_Indicated);
      else
         Clear_Status (This, Stream, Half_Transfer_Complete_Indicated);
      end if;
   end Poll_For_Completion;

   ------------
   -- Status --
   ------------

   function Status
     (This    : DMA_Controller;
      Stream  : DMA_Stream_Selector;
      Flag    : DMA_Status_Flag)
      return Boolean
   is
   begin
      case Stream is
         when Stream_1 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  return This.LISR.FEIF0;
               when Direct_Mode_Error_Indicated =>
                  return This.LISR.DMEIF0;
               when Transfer_Error_Indicated =>
                  return This.LISR.TEIF0;
               when Half_Transfer_Complete_Indicated =>
                  return This.LISR.HTIF0;
               when Transfer_Complete_Indicated =>
                  return This.LISR.TCIF0;
            end case;

         when Stream_2 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  return This.LISR.FEIF1;
               when Direct_Mode_Error_Indicated =>
                  return This.LISR.DMEIF1;
               when Transfer_Error_Indicated =>
                  return This.LISR.TEIF1;
               when Half_Transfer_Complete_Indicated =>
                  return This.LISR.HTIF1;
               when Transfer_Complete_Indicated =>
                  return This.LISR.TCIF1;
            end case;

         when Stream_3 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  return This.LISR.FEIF2;
               when Direct_Mode_Error_Indicated =>
                  return This.LISR.DMEIF2;
               when Transfer_Error_Indicated =>
                  return This.LISR.TEIF2;
               when Half_Transfer_Complete_Indicated =>
                  return This.LISR.HTIF2;
               when Transfer_Complete_Indicated =>
                  return This.LISR.TCIF2;
            end case;

         when Stream_4 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  return This.LISR.FEIF3;
               when Direct_Mode_Error_Indicated =>
                  return This.LISR.DMEIF3;
               when Transfer_Error_Indicated =>
                  return This.LISR.TEIF3;
               when Half_Transfer_Complete_Indicated =>
                  return This.LISR.HTIF3;
               when Transfer_Complete_Indicated =>
                  return This.LISR.TCIF3;
            end case;

         when Stream_5 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  return This.HISR.FEIF4;
               when Direct_Mode_Error_Indicated =>
                  return This.HISR.DMEIF4;
               when Transfer_Error_Indicated =>
                  return This.HISR.TEIF4;
               when Half_Transfer_Complete_Indicated =>
                  return This.HISR.HTIF4;
               when Transfer_Complete_Indicated =>
                  return This.HISR.TCIF4;
            end case;

         when Stream_6 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  return This.HISR.FEIF5;
               when Direct_Mode_Error_Indicated =>
                  return This.HISR.DMEIF5;
               when Transfer_Error_Indicated =>
                  return This.HISR.TEIF5;
               when Half_Transfer_Complete_Indicated =>
                  return This.HISR.HTIF5;
               when Transfer_Complete_Indicated =>
                  return This.HISR.TCIF5;
            end case;

         when Stream_7 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  return This.HISR.FEIF6;
               when Direct_Mode_Error_Indicated =>
                  return This.HISR.DMEIF6;
               when Transfer_Error_Indicated =>
                  return This.HISR.TEIF6;
               when Half_Transfer_Complete_Indicated =>
                  return This.HISR.HTIF6;
               when Transfer_Complete_Indicated =>
                  return This.HISR.TCIF6;
            end case;

         when Stream_8 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  return This.HISR.FEIF7;
               when Direct_Mode_Error_Indicated =>
                  return This.HISR.DMEIF7;
               when Transfer_Error_Indicated =>
                  return This.HISR.TEIF7;
               when Half_Transfer_Complete_Indicated =>
                  return This.HISR.HTIF7;
               when Transfer_Complete_Indicated =>
                  return This.HISR.TCIF7;
            end case;
      end case;
   end Status;

   ------------------
   -- Clear_Status --
   ------------------

   procedure Clear_Status
     (This   : in out DMA_Controller;
      Stream : DMA_Stream_Selector;
      Flag   : DMA_Status_Flag)
   is
   begin
      case Stream is
         when Stream_1 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  This.LIFCR.CTEIF0 := True;
               when Direct_Mode_Error_Indicated =>
                  This.LIFCR.CDMEIF0 := True;
               when Transfer_Error_Indicated =>
                  This.LIFCR.CTEIF0 := True;
               when Half_Transfer_Complete_Indicated =>
                  This.LIFCR.CHTIF0 := True;
               when Transfer_Complete_Indicated =>
                  This.LIFCR.CTCIF0 := True;
            end case;

         when Stream_2 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  This.LIFCR.CTEIF1 := True;
               when Direct_Mode_Error_Indicated =>
                  This.LIFCR.CDMEIF1 := True;
               when Transfer_Error_Indicated =>
                  This.LIFCR.CTEIF1 := True;
               when Half_Transfer_Complete_Indicated =>
                  This.LIFCR.CHTIF1 := True;
               when Transfer_Complete_Indicated =>
                  This.LIFCR.CTCIF1 := True;
            end case;

         when Stream_3 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  This.LIFCR.CTEIF2 := True;
               when Direct_Mode_Error_Indicated =>
                  This.LIFCR.CDMEIF2 := True;
               when Transfer_Error_Indicated =>
                  This.LIFCR.CTEIF2 := True;
               when Half_Transfer_Complete_Indicated =>
                  This.LIFCR.CHTIF2 := True;
               when Transfer_Complete_Indicated =>
                  This.LIFCR.CTCIF2 := True;
            end case;

         when Stream_4 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  This.LIFCR.CTEIF3 := True;
               when Direct_Mode_Error_Indicated =>
                  This.LIFCR.CDMEIF3 := True;
               when Transfer_Error_Indicated =>
                  This.LIFCR.CTEIF3 := True;
               when Half_Transfer_Complete_Indicated =>
                  This.LIFCR.CHTIF3 := True;
               when Transfer_Complete_Indicated =>
                  This.LIFCR.CTCIF3 := True;
            end case;

         when Stream_5 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  This.HIFCR.CTEIF4 := True;
               when Direct_Mode_Error_Indicated =>
                  This.HIFCR.CDMEIF4 := True;
               when Transfer_Error_Indicated =>
                  This.HIFCR.CTEIF4 := True;
               when Half_Transfer_Complete_Indicated =>
                  This.HIFCR.CHTIF4 := True;
               when Transfer_Complete_Indicated =>
                  This.HIFCR.CTCIF4 := True;
            end case;

         when Stream_6 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  This.HIFCR.CTEIF5 := True;
               when Direct_Mode_Error_Indicated =>
                  This.HIFCR.CDMEIF5 := True;
               when Transfer_Error_Indicated =>
                  This.HIFCR.CTEIF5 := True;
               when Half_Transfer_Complete_Indicated =>
                  This.HIFCR.CHTIF5 := True;
               when Transfer_Complete_Indicated =>
                  This.HIFCR.CTCIF5 := True;
            end case;

         when Stream_7 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  This.HIFCR.CTEIF6 := True;
               when Direct_Mode_Error_Indicated =>
                  This.HIFCR.CDMEIF6 := True;
               when Transfer_Error_Indicated =>
                  This.HIFCR.CTEIF6 := True;
               when Half_Transfer_Complete_Indicated =>
                  This.HIFCR.CHTIF6 := True;
               when Transfer_Complete_Indicated =>
                  This.HIFCR.CTCIF6 := True;
            end case;

         when Stream_8 =>
            case Flag is
               when FIFO_Error_Indicated =>
                  This.HIFCR.CTEIF7 := True;
               when Direct_Mode_Error_Indicated =>
                  This.HIFCR.CDMEIF7 := True;
               when Transfer_Error_Indicated =>
                  This.HIFCR.CTEIF7 := True;
               when Half_Transfer_Complete_Indicated =>
                  This.HIFCR.CHTIF7 := True;
               when Transfer_Complete_Indicated =>
                  This.HIFCR.CTCIF7 := True;
            end case;
      end case;
   end Clear_Status;

   ----------------------
   -- Clear_All_Status --
   ----------------------

   procedure Clear_All_Status
     (This   : in out DMA_Controller;
      Stream : DMA_Stream_Selector)
   is
   begin
      for Flag in DMA_Status_Flag'Range loop
         Clear_Status (This, Stream, Flag);
      end loop;
   end Clear_All_Status;

   ----------------------
   -- Set_Items_Number --
   ----------------------

   procedure Set_Items_Number
     (This       : DMA_Controller;
      Stream     : DMA_Stream_Selector;
      Data_Count : UInt16)
   is
      This_Stream : DMA_Stream renames Get_Stream (This, Stream);
   begin
      This_Stream.NDTR.NDT := Data_Count;
   end Set_Items_Number;

   -----------------------
   -- Items_Transferred --
   -----------------------

   function Items_Transferred
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector)
      return UInt16
   is
      ndt : constant UInt16 := Current_Items_Number (This, Stream);
      items : UInt16;
   begin
      if Operating_Mode (This, Stream) = Peripheral_Flow_Control_Mode then
         items := 16#ffff# - ndt;
      else
         items := ndt;
      end if;
      return items;
   end Items_Transferred;

   -------------------------
   -- Current_Items_Number --
   -------------------------

   function Current_Items_Number
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector)
      return UInt16
   is
      This_Stream : DMA_Stream renames Get_Stream (This, Stream);
   begin
      return This_Stream.NDTR.NDT;
   end Current_Items_Number;

   -------------------
   -- Circular_Mode --
   -------------------

   function Circular_Mode
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector)
      return Boolean
   is
   begin
      return Get_Stream (This, Stream).CR.CIRC;
   end Circular_Mode;

   ------------------------
   -- Transfer_Direction --
   ------------------------

   function Transfer_Direction
     (This : DMA_Controller;  Stream : DMA_Stream_Selector)
      return DMA_Data_Transfer_Direction
   is
   begin
      return DMA_Data_Transfer_Direction'Val (Get_Stream (This, Stream).CR.DIR);
   end Transfer_Direction;

   ---------------------------
   -- Peripheral_Data_Width --
   ---------------------------

   function Peripheral_Data_Width
     (This : DMA_Controller;  Stream : DMA_Stream_Selector)
      return DMA_Data_Transfer_Widths
   is
   begin
      return DMA_Data_Transfer_Widths'Val
        (Get_Stream (This, Stream).CR.PSIZE);
   end Peripheral_Data_Width;

   -----------------------
   -- Memory_Data_Width --
   -----------------------

   function Memory_Data_Width
     (This : DMA_Controller;  Stream : DMA_Stream_Selector)
      return DMA_Data_Transfer_Widths
   is
   begin
      return DMA_Data_Transfer_Widths'Val
        (Get_Stream (This, Stream).CR.MSIZE);
   end Memory_Data_Width;

   ----------------------
   -- Selected_Channel --
   ----------------------

   function Selected_Channel
     (This : DMA_Controller;  Stream : DMA_Stream_Selector)
      return DMA_Channel_Selector
   is
   begin
      if Get_Stream (This, Stream).CR.EN = True then
         if This'Address = DMA1_Periph'Address then
            case Stream is
               when Stream_1 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C0CR.DMAREQ_ID);
               when Stream_2 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C1CR.DMAREQ_ID);
               when Stream_3 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C2CR.DMAREQ_ID);
               when Stream_4 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C3CR.DMAREQ_ID);
               when Stream_5 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C4CR.DMAREQ_ID);
               when Stream_6 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C5CR.DMAREQ_ID);
               when Stream_7 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C6CR.DMAREQ_ID);
               when Stream_8 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C7CR.DMAREQ_ID);
            end case;
         elsif This'Address = DMA2_Periph'Address then
            case Stream is
               when Stream_1 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C8CR.DMAREQ_ID);
               when Stream_2 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C9CR.DMAREQ_ID);
               when Stream_3 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C10CR.DMAREQ_ID);
               when Stream_4 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C11CR.DMAREQ_ID);
               when Stream_5 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C12CR.DMAREQ_ID);
               when Stream_6 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C13CR.DMAREQ_ID);
               when Stream_7 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C14CR.DMAREQ_ID);
               when Stream_8 =>
                  return DMA_Channel_Selector'Val (DMAMUX1_Periph.C15CR.DMAREQ_ID);
            end case;
         end if;
      end if;
      return DMA_Channel_Selector'First;
   end Selected_Channel;

   --------------------
   -- Operating_Mode --
   --------------------

   function Operating_Mode
     (This : DMA_Controller;  Stream : DMA_Stream_Selector)
      return DMA_Mode
   is
   begin
      if Get_Stream (This, Stream).CR.PINC then
         return Peripheral_Flow_Control_Mode;
      elsif Get_Stream (This, Stream).CR.CIRC then
         return Circular_Mode;
      end if;
      return Normal_Mode;
   end Operating_Mode;

   --------------
   -- Priority --
   --------------

   function Priority
     (This : DMA_Controller;  Stream : DMA_Stream_Selector)
      return DMA_Priority_Level
   is
   begin
      return DMA_Priority_Level'Val (Get_Stream (This, Stream).CR.PL);
   end Priority;

   ---------------
   -- Configure --
   ---------------

   procedure Configure
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector;
      Config : DMA_Stream_Configuration)
   is
      --  see HAL_DMA_Init in STM32F4xx_HAL_Driver\Inc\stm32f4xx_hal_dma.h
      This_Stream : DMA_Stream renames Get_Stream (This, Stream);
   begin
      --  RM0433, chapter 15.5.5 says the configuration and FIFO bits registers
      --  only may be written when EN = 0, so we must disable the stream
      --  before configuring it.
      Disable (This, Stream);

      if This'Address = DMA1_Periph'Address then
         case Stream is
            when Stream_1 =>
               DMAMUX1_Periph.C0CR.DMAREQ_ID := Config.Channel'Enum_Rep;
            when Stream_2 =>
               DMAMUX1_Periph.C1CR.DMAREQ_ID := Config.Channel'Enum_Rep;
            when Stream_3 =>
               DMAMUX1_Periph.C2CR.DMAREQ_ID := Config.Channel'Enum_Rep;
            when Stream_4 =>
               DMAMUX1_Periph.C3CR.DMAREQ_ID := Config.Channel'Enum_Rep;
            when Stream_5 =>
               DMAMUX1_Periph.C4CR.DMAREQ_ID := Config.Channel'Enum_Rep;
            when Stream_6 =>
               DMAMUX1_Periph.C5CR.DMAREQ_ID := Config.Channel'Enum_Rep;
            when Stream_7 =>
               DMAMUX1_Periph.C6CR.DMAREQ_ID := Config.Channel'Enum_Rep;
            when Stream_8 =>
               DMAMUX1_Periph.C7CR.DMAREQ_ID := Config.Channel'Enum_Rep;
         end case;
      elsif This'Address = DMA2_Periph'Address then
         case Stream is
            when Stream_1 =>
               DMAMUX1_Periph.C8CR.DMAREQ_ID := Config.Channel'Enum_Rep;
            when Stream_2 =>
               DMAMUX1_Periph.C9CR.DMAREQ_ID := Config.Channel'Enum_Rep;
            when Stream_3 =>
               DMAMUX1_Periph.C10CR.DMAREQ_ID := Config.Channel'Enum_Rep;
            when Stream_4 =>
               DMAMUX1_Periph.C11CR.DMAREQ_ID := Config.Channel'Enum_Rep;
            when Stream_5 =>
               DMAMUX1_Periph.C12CR.DMAREQ_ID := Config.Channel'Enum_Rep;
            when Stream_6 =>
               DMAMUX1_Periph.C13CR.DMAREQ_ID := Config.Channel'Enum_Rep;
            when Stream_7 =>
               DMAMUX1_Periph.C14CR.DMAREQ_ID := Config.Channel'Enum_Rep;
            when Stream_8 =>
               DMAMUX1_Periph.C15CR.DMAREQ_ID := Config.Channel'Enum_Rep;
         end case;
      end if;

      This_Stream.CR.DIR := Config.Direction'Enum_Rep;

      This_Stream.CR.PINC := Config.Increment_Peripheral_Address;
      This_Stream.CR.MINC := Config.Increment_Memory_Address;
      This_Stream.CR.PSIZE :=
        DMA_Data_Transfer_Widths'Enum_Rep (Config.Peripheral_Data_Format);
      This_Stream.CR.MSIZE :=
        DMA_Data_Transfer_Widths'Enum_Rep (Config.Memory_Data_Format);
      This_Stream.CR.PL :=
        DMA_Priority_Level'Enum_Rep (Config.Priority);

      case Config.Operation_Mode is
         when Normal_Mode =>
            This_Stream.CR.PINC   := False; --  DMA is the flow controller
            This_Stream.CR.CIRC   := False; --  Disable circular mode
         when Peripheral_Flow_Control_Mode =>
            This_Stream.CR.PINC   := True;  --  Peripheral is the flow ctrl.
            This_Stream.CR.CIRC   := False; --  Disable circular mode
         when Circular_Mode =>
            This_Stream.CR.PINC := False; --  DMA is the flow controller
            This_Stream.CR.CIRC   := True;  --  Enable circular mode
      end case;

   end Configure;

   -------------
   -- Aligned --
   -------------

   function Aligned (This : Address;  Width : DMA_Data_Transfer_Widths)
      return Boolean
   is
      use System.Storage_Elements;
   begin
      case Width is
         when Words =>
            return To_Integer (This) mod 4 = 0;
         when HalfWords =>
            return To_Integer (This) mod 2 = 0;
         when Bytes =>
            return True;
      end case;
   end Aligned;

   --------------------------------
   -- Set_DMAMUX_Synchronization --
   --------------------------------

   procedure Set_DMAMUX_Synchronization
     (This    : DMA_Controller;
      Stream  : DMA_Stream_Selector;
      Enabled : Boolean)
   is
   begin
      if This'Address = DMA1_Periph'Address then
         case Stream is
            when Stream_1 =>
               DMAMUX1_Periph.C0CR.SE := Enabled;
            when Stream_2 =>
               DMAMUX1_Periph.C1CR.SE := Enabled;
            when Stream_3 =>
               DMAMUX1_Periph.C2CR.SE := Enabled;
            when Stream_4 =>
               DMAMUX1_Periph.C3CR.SE := Enabled;
            when Stream_5 =>
               DMAMUX1_Periph.C4CR.SE := Enabled;
            when Stream_6 =>
               DMAMUX1_Periph.C5CR.SE := Enabled;
            when Stream_7 =>
               DMAMUX1_Periph.C6CR.SE := Enabled;
            when Stream_8 =>
               DMAMUX1_Periph.C7CR.SE := Enabled;
         end case;
      elsif This'Address = DMA2_Periph'Address then
         case Stream is
            when Stream_1 =>
               DMAMUX1_Periph.C8CR.SE := Enabled;
            when Stream_2 =>
               DMAMUX1_Periph.C9CR.SE := Enabled;
            when Stream_3 =>
               DMAMUX1_Periph.C10CR.SE := Enabled;
            when Stream_4 =>
               DMAMUX1_Periph.C11CR.SE := Enabled;
            when Stream_5 =>
               DMAMUX1_Periph.C12CR.SE := Enabled;
            when Stream_6 =>
               DMAMUX1_Periph.C13CR.SE := Enabled;
            when Stream_7 =>
               DMAMUX1_Periph.C14CR.SE := Enabled;
            when Stream_8 =>
               DMAMUX1_Periph.C15CR.SE := Enabled;
         end case;
      end if;
   end Set_DMAMUX_Synchronization;

   ------------------------------------
   -- DMAMUX_Synchronization_Enabled --
   ------------------------------------

   function DMAMUX_Synchronization_Enabled
     (This    : DMA_Controller;
      Stream  : DMA_Stream_Selector) return Boolean
   is
   begin
      if This'Address = DMA1_Periph'Address then
         case Stream is
            when Stream_1 =>
               return DMAMUX1_Periph.C0CR.SE;
            when Stream_2 =>
               return DMAMUX1_Periph.C1CR.SE;
            when Stream_3 =>
               return DMAMUX1_Periph.C2CR.SE;
            when Stream_4 =>
               return DMAMUX1_Periph.C3CR.SE;
            when Stream_5 =>
               return DMAMUX1_Periph.C4CR.SE;
            when Stream_6 =>
               return DMAMUX1_Periph.C5CR.SE;
            when Stream_7 =>
               return DMAMUX1_Periph.C6CR.SE;
            when Stream_8 =>
               return DMAMUX1_Periph.C7CR.SE;
         end case;
      else --  This'Address = DMA2_Periph'Address
         case Stream is
            when Stream_1 =>
               return DMAMUX1_Periph.C8CR.SE;
            when Stream_2 =>
               return DMAMUX1_Periph.C9CR.SE;
            when Stream_3 =>
               return DMAMUX1_Periph.C10CR.SE;
            when Stream_4 =>
               return DMAMUX1_Periph.C11CR.SE;
            when Stream_5 =>
               return DMAMUX1_Periph.C12CR.SE;
            when Stream_6 =>
               return DMAMUX1_Periph.C13CR.SE;
            when Stream_7 =>
               return DMAMUX1_Periph.C14CR.SE;
            when Stream_8 =>
               return DMAMUX1_Periph.C15CR.SE;
         end case;
      end if;
   end DMAMUX_Synchronization_Enabled;

   ----------------------
   -- Set_DMAMUX_Event --
   ----------------------

   procedure Set_DMAMUX_Event
     (This    : DMA_Controller;
      Stream  : DMA_Stream_Selector;
      Enabled : Boolean)
   is
   begin
      if This'Address = DMA1_Periph'Address then
         case Stream is
            when Stream_1 =>
               DMAMUX1_Periph.C0CR.EGE := Enabled;
            when Stream_2 =>
               DMAMUX1_Periph.C1CR.EGE := Enabled;
            when Stream_3 =>
               DMAMUX1_Periph.C2CR.EGE := Enabled;
            when Stream_4 =>
               DMAMUX1_Periph.C3CR.EGE := Enabled;
            when Stream_5 =>
               DMAMUX1_Periph.C4CR.EGE := Enabled;
            when Stream_6 =>
               DMAMUX1_Periph.C5CR.EGE := Enabled;
            when Stream_7 =>
               DMAMUX1_Periph.C6CR.EGE := Enabled;
            when Stream_8 =>
               DMAMUX1_Periph.C7CR.EGE := Enabled;
         end case;
      elsif This'Address = DMA2_Periph'Address then
         case Stream is
            when Stream_1 =>
               DMAMUX1_Periph.C8CR.EGE := Enabled;
            when Stream_2 =>
               DMAMUX1_Periph.C9CR.EGE := Enabled;
            when Stream_3 =>
               DMAMUX1_Periph.C10CR.EGE := Enabled;
            when Stream_4 =>
               DMAMUX1_Periph.C11CR.EGE := Enabled;
            when Stream_5 =>
               DMAMUX1_Periph.C12CR.EGE := Enabled;
            when Stream_6 =>
               DMAMUX1_Periph.C13CR.EGE := Enabled;
            when Stream_7 =>
               DMAMUX1_Periph.C14CR.EGE := Enabled;
            when Stream_8 =>
               DMAMUX1_Periph.C15CR.EGE := Enabled;
         end case;
      end if;
   end Set_DMAMUX_Event;

   --------------------------
   -- DMAMUX_Event_Enabled --
   --------------------------

   function DMAMUX_Event_Enabled
     (This    : DMA_Controller;
      Stream  : DMA_Stream_Selector) return Boolean
   is
   begin
      if This'Address = DMA1_Periph'Address then
         case Stream is
            when Stream_1 =>
               return DMAMUX1_Periph.C0CR.EGE;
            when Stream_2 =>
               return DMAMUX1_Periph.C1CR.EGE;
            when Stream_3 =>
               return DMAMUX1_Periph.C2CR.EGE;
            when Stream_4 =>
               return DMAMUX1_Periph.C3CR.EGE;
            when Stream_5 =>
               return DMAMUX1_Periph.C4CR.EGE;
            when Stream_6 =>
               return DMAMUX1_Periph.C5CR.EGE;
            when Stream_7 =>
               return DMAMUX1_Periph.C6CR.EGE;
            when Stream_8 =>
               return DMAMUX1_Periph.C7CR.EGE;
         end case;
      else --  This'Address = DMA2_Periph'Address
         case Stream is
            when Stream_1 =>
               return DMAMUX1_Periph.C8CR.EGE;
            when Stream_2 =>
               return DMAMUX1_Periph.C9CR.EGE;
            when Stream_3 =>
               return DMAMUX1_Periph.C10CR.EGE;
            when Stream_4 =>
               return DMAMUX1_Periph.C11CR.EGE;
            when Stream_5 =>
               return DMAMUX1_Periph.C12CR.EGE;
            when Stream_6 =>
               return DMAMUX1_Periph.C13CR.EGE;
            when Stream_7 =>
               return DMAMUX1_Periph.C14CR.EGE;
            when Stream_8 =>
               return DMAMUX1_Periph.C15CR.EGE;
         end case;
      end if;
   end DMAMUX_Event_Enabled;

   --------------------------------------
   -- Configure_DMAMUX_Synchronization --
   --------------------------------------

   procedure Configure_DMAMUX_Synchronization
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector;
      Config : DMAMUX_Synchronization_Configuration)
   is
   begin
      if This'Address = DMA1_Periph'Address then
         case Stream is
            when Stream_1 =>
               DMAMUX1_Periph.C0CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C0CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C0CR.NBREQ := Config.DMA_Req'Enum_Rep;
            when Stream_2 =>
               DMAMUX1_Periph.C1CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C1CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C1CR.NBREQ := Config.DMA_Req'Enum_Rep;
            when Stream_3 =>
               DMAMUX1_Periph.C2CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C2CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C2CR.NBREQ := Config.DMA_Req'Enum_Rep;
            when Stream_4 =>
               DMAMUX1_Periph.C3CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C3CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C3CR.NBREQ := Config.DMA_Req'Enum_Rep;
            when Stream_5 =>
               DMAMUX1_Periph.C4CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C4CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C4CR.NBREQ := Config.DMA_Req'Enum_Rep;
            when Stream_6 =>
               DMAMUX1_Periph.C5CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C5CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C5CR.NBREQ := Config.DMA_Req'Enum_Rep;
            when Stream_7 =>
               DMAMUX1_Periph.C6CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C6CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C6CR.NBREQ := Config.DMA_Req'Enum_Rep;
            when Stream_8 =>
               DMAMUX1_Periph.C7CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C7CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C7CR.NBREQ := Config.DMA_Req'Enum_Rep;
         end case;
      elsif This'Address = DMA2_Periph'Address then
         case Stream is
            when Stream_1 =>
               DMAMUX1_Periph.C8CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C8CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C8CR.NBREQ := Config.DMA_Req'Enum_Rep;
            when Stream_2 =>
               DMAMUX1_Periph.C9CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C9CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C9CR.NBREQ := Config.DMA_Req'Enum_Rep;
            when Stream_3 =>
               DMAMUX1_Periph.C10CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C10CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C10CR.NBREQ := Config.DMA_Req'Enum_Rep;
            when Stream_4 =>
               DMAMUX1_Periph.C11CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C11CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C11CR.NBREQ := Config.DMA_Req'Enum_Rep;
            when Stream_5 =>
               DMAMUX1_Periph.C12CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C12CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C12CR.NBREQ := Config.DMA_Req'Enum_Rep;
            when Stream_6 =>
               DMAMUX1_Periph.C13CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C13CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C13CR.NBREQ := Config.DMA_Req'Enum_Rep;
            when Stream_7 =>
               DMAMUX1_Periph.C14CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C14CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C14CR.NBREQ := Config.DMA_Req'Enum_Rep;
            when Stream_8 =>
               DMAMUX1_Periph.C15CR.SYNC_ID := Config.Input'Enum_Rep;
               DMAMUX1_Periph.C15CR.SPOL := Config.Polarity'Enum_Rep;
               DMAMUX1_Periph.C15CR.NBREQ := Config.DMA_Req'Enum_Rep;
         end case;
      end if;
   end Configure_DMAMUX_Synchronization;

   -------------------------------------------
   -- Set_Synchronization_Overrun_Interrupt --
   -------------------------------------------

   procedure Set_Synchronization_Overrun_Interrupt
     (This    : DMA_Controller;
      Stream  : DMA_Stream_Selector;
      Enabled : Boolean)
   is
   begin
      if This'Address = DMA1_Periph'Address then
         case Stream is
            when Stream_1 =>
               DMAMUX1_Periph.C0CR.SOIE := Enabled;
            when Stream_2 =>
               DMAMUX1_Periph.C1CR.SOIE := Enabled;
            when Stream_3 =>
               DMAMUX1_Periph.C2CR.SOIE := Enabled;
            when Stream_4 =>
               DMAMUX1_Periph.C3CR.SOIE := Enabled;
            when Stream_5 =>
               DMAMUX1_Periph.C4CR.SOIE := Enabled;
            when Stream_6 =>
               DMAMUX1_Periph.C5CR.SOIE := Enabled;
            when Stream_7 =>
               DMAMUX1_Periph.C6CR.SOIE := Enabled;
            when Stream_8 =>
               DMAMUX1_Periph.C7CR.SOIE := Enabled;
         end case;
      elsif This'Address = DMA2_Periph'Address then
         case Stream is
            when Stream_1 =>
               DMAMUX1_Periph.C8CR.SOIE := Enabled;
            when Stream_2 =>
               DMAMUX1_Periph.C9CR.SOIE := Enabled;
            when Stream_3 =>
               DMAMUX1_Periph.C10CR.SOIE := Enabled;
            when Stream_4 =>
               DMAMUX1_Periph.C11CR.SOIE := Enabled;
            when Stream_5 =>
               DMAMUX1_Periph.C12CR.SOIE := Enabled;
            when Stream_6 =>
               DMAMUX1_Periph.C13CR.SOIE := Enabled;
            when Stream_7 =>
               DMAMUX1_Periph.C14CR.SOIE := Enabled;
            when Stream_8 =>
               DMAMUX1_Periph.C15CR.SOIE := Enabled;
         end case;
      end if;
   end Set_Synchronization_Overrun_Interrupt;

   -----------------------------------------------
   -- Synchronization_Overrun_Interrupt_Enabled --
   -----------------------------------------------

   function Synchronization_Overrun_Interrupt_Enabled
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector)
      return Boolean
   is
   begin
      if This'Address = DMA1_Periph'Address then
         case Stream is
            when Stream_1 =>
               return DMAMUX1_Periph.C0CR.SOIE;
            when Stream_2 =>
               return DMAMUX1_Periph.C1CR.SOIE;
            when Stream_3 =>
               return DMAMUX1_Periph.C2CR.SOIE;
            when Stream_4 =>
               return DMAMUX1_Periph.C3CR.SOIE;
            when Stream_5 =>
               return DMAMUX1_Periph.C4CR.SOIE;
            when Stream_6 =>
               return DMAMUX1_Periph.C5CR.SOIE;
            when Stream_7 =>
               return DMAMUX1_Periph.C6CR.SOIE;
            when Stream_8 =>
               return DMAMUX1_Periph.C7CR.SOIE;
         end case;
      else --  This'Address = DMA2_Periph'Address
         case Stream is
            when Stream_1 =>
               return DMAMUX1_Periph.C8CR.SOIE;
            when Stream_2 =>
               return DMAMUX1_Periph.C9CR.SOIE;
            when Stream_3 =>
               return DMAMUX1_Periph.C10CR.SOIE;
            when Stream_4 =>
               return DMAMUX1_Periph.C11CR.SOIE;
            when Stream_5 =>
               return DMAMUX1_Periph.C12CR.SOIE;
            when Stream_6 =>
               return DMAMUX1_Periph.C13CR.SOIE;
            when Stream_7 =>
               return DMAMUX1_Periph.C14CR.SOIE;
            when Stream_8 =>
               return DMAMUX1_Periph.C15CR.SOIE;
         end case;
      end if;
   end Synchronization_Overrun_Interrupt_Enabled;

   ------------------------------------
   -- Synchronization_Overrun_Status --
   ------------------------------------

   function Synchronization_Overrun_Status
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector)
      return Boolean
   is
   begin
      if This'Address = DMA1_Periph'Address then
         return Boolean'Val (DMAMUX1_Periph.CSR.SOF and 2 ** Stream'Enum_Rep);
      else --  This'Address = DMA2_Periph'Address
         return Boolean'Val (DMAMUX1_Periph.CSR.SOF and Shift_Left (2 ** Stream'Enum_Rep, 8));
      end if;
   end Synchronization_Overrun_Status;

   ------------------------------------------
   -- Clear_Synchronization_Overrun_Status --
   ------------------------------------------

   procedure Clear_Synchronization_Overrun_Status
     (This   : DMA_Controller;
      Stream : DMA_Stream_Selector)
   is
   begin
      if This'Address = DMA1_Periph'Address then
         DMAMUX1_Periph.CFR.CSOF := DMAMUX1_Periph.CFR.CSOF or 2 ** Stream'Enum_Rep;
      else --  This'Address = DMA2_Periph'Address
         DMAMUX1_Periph.CFR.CSOF := DMAMUX1_Periph.CFR.CSOF or Shift_Left (2 ** Stream'Enum_Rep, 8);
      end if;
   end Clear_Synchronization_Overrun_Status;

   ----------------------------------
   -- Set_DMAMUX_Request_Generator --
   ----------------------------------

   procedure Set_DMAMUX_Request_Generator
     (Channel : DMAMUX_Req_Gen_Channel;
      Enabled   : Boolean)
   is
   begin
      case Channel is
         when Channel_1 =>
            DMAMUX1_Periph.RG0CR.GE := Enabled;
         when Channel_2 =>
            DMAMUX1_Periph.RG1CR.GE := Enabled;
         when Channel_3 =>
            DMAMUX1_Periph.RG2CR.GE := Enabled;
         when Channel_4 =>
            DMAMUX1_Periph.RG3CR.GE := Enabled;
         when Channel_5 =>
            DMAMUX1_Periph.RG4CR.GE := Enabled;
         when Channel_6 =>
            DMAMUX1_Periph.RG5CR.GE := Enabled;
         when Channel_7 =>
            DMAMUX1_Periph.RG6CR.GE := Enabled;
         when Channel_8 =>
            DMAMUX1_Periph.RG7CR.GE := Enabled;
      end case;
   end Set_DMAMUX_Request_Generator;

   --------------------------------------
   -- DMAMUX_Request_Generator_Enabled --
   --------------------------------------

   function DMAMUX_Request_Generator_Enabled
     (Channel : DMAMUX_Req_Gen_Channel) return Boolean
   is
   begin
      case Channel is
         when Channel_1 =>
            return DMAMUX1_Periph.RG0CR.GE;
         when Channel_2 =>
            return DMAMUX1_Periph.RG1CR.GE;
         when Channel_3 =>
            return DMAMUX1_Periph.RG2CR.GE;
         when Channel_4 =>
            return DMAMUX1_Periph.RG3CR.GE;
         when Channel_5 =>
            return DMAMUX1_Periph.RG4CR.GE;
         when Channel_6 =>
            return DMAMUX1_Periph.RG5CR.GE;
         when Channel_7 =>
            return DMAMUX1_Periph.RG6CR.GE;
         when Channel_8 =>
            return DMAMUX1_Periph.RG7CR.GE;
      end case;
   end DMAMUX_Request_Generator_Enabled;

   ----------------------------------------
   -- Configure_DMAMUX_Request_Generator --
   ----------------------------------------

   procedure Configure_DMAMUX_Request_Generator
     (Channel : DMAMUX_Req_Gen_Channel;
      Config  : DMAMUX_Req_Gen_Configuration)
   is
   begin
      case Channel is
         when Channel_1 =>
            DMAMUX1_Periph.RG0CR.SIG_ID := Config.Input'Enum_Rep;
            DMAMUX1_Periph.RG0CR.GPOL := Config.Polarity'Enum_Rep;
            DMAMUX1_Periph.RG0CR.GNBREQ := Config.DMA_Req'Enum_Rep;
         when Channel_2 =>
            DMAMUX1_Periph.RG1CR.SIG_ID := Config.Input'Enum_Rep;
            DMAMUX1_Periph.RG1CR.GPOL := Config.Polarity'Enum_Rep;
            DMAMUX1_Periph.RG1CR.GNBREQ := Config.DMA_Req'Enum_Rep;
         when Channel_3 =>
            DMAMUX1_Periph.RG2CR.SIG_ID := Config.Input'Enum_Rep;
            DMAMUX1_Periph.RG2CR.GPOL := Config.Polarity'Enum_Rep;
            DMAMUX1_Periph.RG2CR.GNBREQ := Config.DMA_Req'Enum_Rep;
         when Channel_4 =>
            DMAMUX1_Periph.RG3CR.SIG_ID := Config.Input'Enum_Rep;
            DMAMUX1_Periph.RG3CR.GPOL := Config.Polarity'Enum_Rep;
            DMAMUX1_Periph.RG3CR.GNBREQ := Config.DMA_Req'Enum_Rep;
         when Channel_5 =>
            DMAMUX1_Periph.RG4CR.SIG_ID := Config.Input'Enum_Rep;
            DMAMUX1_Periph.RG4CR.GPOL := Config.Polarity'Enum_Rep;
            DMAMUX1_Periph.RG4CR.GNBREQ := Config.DMA_Req'Enum_Rep;
         when Channel_6 =>
            DMAMUX1_Periph.RG5CR.SIG_ID := Config.Input'Enum_Rep;
            DMAMUX1_Periph.RG5CR.GPOL := Config.Polarity'Enum_Rep;
            DMAMUX1_Periph.RG5CR.GNBREQ := Config.DMA_Req'Enum_Rep;
         when Channel_7 =>
            DMAMUX1_Periph.RG6CR.SIG_ID := Config.Input'Enum_Rep;
            DMAMUX1_Periph.RG6CR.GPOL := Config.Polarity'Enum_Rep;
            DMAMUX1_Periph.RG6CR.GNBREQ := Config.DMA_Req'Enum_Rep;
         when Channel_8 =>
            DMAMUX1_Periph.RG7CR.SIG_ID := Config.Input'Enum_Rep;
            DMAMUX1_Periph.RG7CR.GPOL := Config.Polarity'Enum_Rep;
            DMAMUX1_Periph.RG7CR.GNBREQ := Config.DMA_Req'Enum_Rep;
      end case;
   end Configure_DMAMUX_Request_Generator;

   -----------------------------------
   -- Set_Trigger_Overrun_Interrupt --
   -----------------------------------

   procedure Set_Trigger_Overrun_Interrupt
     (Channel : DMAMUX_Req_Gen_Channel;
      Enabled : Boolean)
   is
   begin
      case Channel is
         when Channel_1 =>
            DMAMUX1_Periph.RG0CR.OIE := Enabled;
         when Channel_2 =>
            DMAMUX1_Periph.RG1CR.OIE := Enabled;
         when Channel_3 =>
            DMAMUX1_Periph.RG2CR.OIE := Enabled;
         when Channel_4 =>
            DMAMUX1_Periph.RG3CR.OIE := Enabled;
         when Channel_5 =>
            DMAMUX1_Periph.RG4CR.OIE := Enabled;
         when Channel_6 =>
            DMAMUX1_Periph.RG5CR.OIE := Enabled;
         when Channel_7 =>
            DMAMUX1_Periph.RG6CR.OIE := Enabled;
         when Channel_8 =>
            DMAMUX1_Periph.RG7CR.OIE := Enabled;
      end case;
   end Set_Trigger_Overrun_Interrupt;

   ---------------------------------------
   -- Trigger_Overrun_Interrupt_Enabled --
   ---------------------------------------

   function Trigger_Overrun_Interrupt_Enabled
     (Channel : DMAMUX_Req_Gen_Channel)
      return Boolean
   is
   begin
      case Channel is
         when Channel_1 =>
            return DMAMUX1_Periph.RG0CR.OIE;
         when Channel_2 =>
            return DMAMUX1_Periph.RG1CR.OIE;
         when Channel_3 =>
            return DMAMUX1_Periph.RG2CR.OIE;
         when Channel_4 =>
            return DMAMUX1_Periph.RG3CR.OIE;
         when Channel_5 =>
            return DMAMUX1_Periph.RG4CR.OIE;
         when Channel_6 =>
            return DMAMUX1_Periph.RG5CR.OIE;
         when Channel_7 =>
            return DMAMUX1_Periph.RG6CR.OIE;
         when Channel_8 =>
            return DMAMUX1_Periph.RG7CR.OIE;
      end case;
   end Trigger_Overrun_Interrupt_Enabled;

   ----------------------------
   -- Trigger_Overrun_Status --
   ----------------------------

   function Trigger_Overrun_Status
     (Channel : DMAMUX_Req_Gen_Channel)
      return Boolean
   is
   begin
      return Boolean'Val (DMAMUX1_Periph.RGSR.OF_k and 2 ** Channel'Enum_Rep);
   end Trigger_Overrun_Status;

   ----------------------------------
   -- Clear_Trigger_Overrun_Status --
   ----------------------------------

   procedure Clear_Trigger_Overrun_Status
     (Channel : DMAMUX_Req_Gen_Channel)
   is
   begin
      DMAMUX1_Periph.RGCFR.COF := DMAMUX1_Periph.RGCFR.COF or 2 ** Channel'Enum_Rep;
   end Clear_Trigger_Overrun_Status;

end STM32.DMA;
