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
--   @file    stm32f407xx.h   et al.                                        --
--   @author  MCD Application Team                                          --
--   @version V1.1.0                                                        --
--   @date    19-June-2014                                                  --
--   @brief   CMSIS STM32F407xx Device Peripheral Access Layer Header File. --
--                                                                          --
--   COPYRIGHT(c) 2014 STMicroelectronics                                   --
------------------------------------------------------------------------------

--  This file provides register definitions for the STM32F4 (ARM Cortex M4F)
--  microcontrollers from ST Microelectronics.

with STM32_SVD.EXTI; use STM32_SVD.EXTI;

package body STM32.EXTI is

   -------------------------------
   -- Enable_External_Interrupt --
   -------------------------------

   procedure Enable_External_Interrupt
     (Line    : External_Line_Number;
      Trigger : Interrupt_Triggers)
   is
      Index : constant Natural := External_Line_Number'Enum_Rep (Line);
   begin
      case Index is
         when 0 .. 21 =>
            EXTI_Periph.CPUIMR1.Arr (Index) := True;
            EXTI_Periph.RTSR1.TR.Arr (Index) :=
              Trigger in Interrupt_Rising_Edge  | Interrupt_Rising_Falling_Edge;
            EXTI_Periph.FTSR1.TR.Arr (Index) :=
              Trigger in Interrupt_Falling_Edge | Interrupt_Rising_Falling_Edge;
         when 22 .. 31 =>
            EXTI_Periph.CPUIMR1.Arr (Index) := True;
         when 32 .. 44 =>
            EXTI_Periph.CPUIMR2.MR.Arr (Index) := True;
         when 47 | 48 | 50 | 52 .. 60 =>
            EXTI_Periph.CPUIMR2.MR_1.Arr (Index) := True;
         when 85 | 86 =>
            EXTI_Periph.CPUIMR3.MR_1.Arr (Index) := True;
            EXTI_Periph.RTSR3.TR.Arr (Index) :=
              Trigger in Interrupt_Rising_Edge  | Interrupt_Rising_Falling_Edge;
            EXTI_Periph.FTSR3.TR.Arr (Index) :=
              Trigger in Interrupt_Falling_Edge | Interrupt_Rising_Falling_Edge;
         when others =>
            null;
      end case;
   end Enable_External_Interrupt;

   --------------------------------
   -- Disable_External_Interrupt --
   --------------------------------

   procedure Disable_External_Interrupt (Line : External_Line_Number) is
      Index : constant Natural := External_Line_Number'Enum_Rep (Line);
   begin
      case Index is
         when 0 .. 21 =>
            EXTI_Periph.CPUIMR1.Arr (Index) := False;
            EXTI_Periph.RTSR1.TR.Arr (Index) := False;
            EXTI_Periph.FTSR1.TR.Arr (Index) := False;
         when 22 .. 31 =>
            EXTI_Periph.CPUIMR1.Arr (Index) := False;
         when 32 .. 44 =>
            EXTI_Periph.CPUIMR2.MR.Arr (Index) := False;
         when 47 | 48 | 50 | 52 .. 60 =>
            EXTI_Periph.CPUIMR2.MR.Arr (Index) := False;
         when 85 | 86 =>
            EXTI_Periph.CPUIMR3.MR_1.Arr (Index) := False;
            EXTI_Periph.RTSR3.TR.Arr (Index) := False;
            EXTI_Periph.FTSR3.TR.Arr (Index) := False;
         when others =>
            null;
      end case;
   end Disable_External_Interrupt;

   ---------------------------
   -- Enable_External_Event --
   ---------------------------

   procedure Enable_External_Event
     (Line    : External_Line_Number;
      Trigger : Event_Triggers)
   is
      Index : constant Natural := External_Line_Number'Enum_Rep (Line);
   begin
      case Index is
         when 0 .. 21 =>
            EXTI_Periph.CPUEMR1.Arr (Index) := True;
            EXTI_Periph.RTSR1.TR.Arr (Index) :=
              Trigger in Interrupt_Rising_Edge  | Interrupt_Rising_Falling_Edge;
            EXTI_Periph.FTSR1.TR.Arr (Index) :=
              Trigger in Interrupt_Falling_Edge | Interrupt_Rising_Falling_Edge;
         when 22 .. 31 =>
            EXTI_Periph.CPUEMR1.Arr (Index) := True;
         when 32 .. 44 =>
            EXTI_Periph.CPUEMR2.MR.Arr (Index) := True;
         when 47 | 48 | 50 | 52 .. 63 =>
            EXTI_Periph.CPUEMR2.MR_1.Arr (Index) := True;
         when 49 | 51 =>
            EXTI_Periph.CPUEMR2.MR_1.Arr (Index) := True;
            if External_Line_Number'Enum_Rep (Line) = 49 then
               EXTI_Periph.RTSR2.TR49 :=
                 Trigger in Interrupt_Rising_Edge  | Interrupt_Rising_Falling_Edge;
               EXTI_Periph.FTSR2.TR49 :=
                 Trigger in Interrupt_Falling_Edge | Interrupt_Rising_Falling_Edge;
            else
               EXTI_Periph.RTSR2.TR51 :=
                 Trigger in Interrupt_Rising_Edge  | Interrupt_Rising_Falling_Edge;
               EXTI_Periph.FTSR2.TR51 :=
                 Trigger in Interrupt_Falling_Edge | Interrupt_Rising_Falling_Edge;
            end if;
         when 64 .. 76 =>
            EXTI_Periph.CPUEMR3.MR.Arr (Index) := True;
         when 85 | 86 =>
            EXTI_Periph.CPUEMR3.MR_1.Arr (Index) := True;
            EXTI_Periph.RTSR3.TR.Arr (Index) :=
              Trigger in Interrupt_Rising_Edge  | Interrupt_Rising_Falling_Edge;
            EXTI_Periph.FTSR3.TR.Arr (Index) :=
              Trigger in Interrupt_Falling_Edge | Interrupt_Rising_Falling_Edge;
         when 87 =>
            EXTI_Periph.CPUEMR3.MR_1.Arr (Index) := True;
         when others =>
            null;
      end case;
   end Enable_External_Event;

   ----------------------------
   -- Disable_External_Event --
   ----------------------------

   procedure Disable_External_Event (Line : External_Line_Number) is
      Index : constant Natural := External_Line_Number'Enum_Rep (Line);
   begin
      case Index is
         when 0 .. 21 =>
            EXTI_Periph.CPUEMR1.Arr (Index) := False;
            EXTI_Periph.RTSR1.TR.Arr (Index) := False;
            EXTI_Periph.FTSR1.TR.Arr (Index) := False;
         when 22 .. 31 =>
            EXTI_Periph.CPUEMR1.Arr (Index) := False;
         when 32 .. 44 =>
            EXTI_Periph.CPUEMR2.MR.Arr (Index) := False;
         when 47 | 48 | 50 | 52 .. 63 =>
            EXTI_Periph.CPUEMR2.MR_1.Arr (Index) := False;
         when 49 | 51 =>
            EXTI_Periph.CPUEMR2.MR_1.Arr (Index) := False;
            if External_Line_Number'Enum_Rep (Line) = 49 then
               EXTI_Periph.RTSR2.TR49 := False;
               EXTI_Periph.FTSR2.TR49 := False;
            else
               EXTI_Periph.RTSR2.TR51 := False;
               EXTI_Periph.FTSR2.TR51 := False;
            end if;
         when 64 .. 76 =>
            EXTI_Periph.CPUEMR3.MR.Arr (Index) := False;
         when 85 | 86 =>
            EXTI_Periph.CPUEMR3.MR_1.Arr (Index) := False;
            EXTI_Periph.RTSR3.TR.Arr (Index) := False;
            EXTI_Periph.FTSR3.TR.Arr (Index) := False;
         when 87 =>
            EXTI_Periph.CPUEMR3.MR_1.Arr (Index) := False;
         when others =>
            null;
      end case;
   end Disable_External_Event;

   ------------------
   -- Generate_SWI --
   ------------------

   procedure Generate_SWI (Line : External_Line_Number) is
      Index : constant Natural := External_Line_Number'Enum_Rep (Line);
   begin
      case Index is
         when 0 .. 21 =>
            EXTI_Periph.SWIER1.SWIER.Arr (Index) := True;
         when 49 =>
            EXTI_Periph.SWIER2.SWIER49 := True;
         when 51 =>
            EXTI_Periph.SWIER2.SWIER51 := True;
         when 82 =>
            EXTI_Periph.SWIER3.SWIER82 := True;
         when 84 .. 86 =>
            EXTI_Periph.SWIER3.SWIER.Arr (Index) := True;
         when others =>
            null;
      end case;
   end Generate_SWI;

   --------------------------------
   -- External_Interrupt_Pending --
   --------------------------------

   function External_Interrupt_Pending (Line : External_Line_Number)
     return Boolean
   is
      Index : constant Natural := External_Line_Number'Enum_Rep (Line);
   begin
      case Index is
         when 0 .. 21 =>
            return EXTI_Periph.CPUPR1.PR.Arr (Index);
         when 49 =>
            return EXTI_Periph.CPUPR2.PR49;
         when 51 =>
            return EXTI_Periph.CPUPR2.PR51;
         when 82 =>
            return EXTI_Periph.CPUPR3.PR82;
         when 84 .. 86 =>
            return EXTI_Periph.CPUPR3.PR.Arr (Index);
         when others =>
            return False;
      end case;
   end External_Interrupt_Pending;

   ------------------------------
   -- Clear_External_Interrupt --
   ------------------------------

   procedure Clear_External_Interrupt (Line : External_Line_Number) is
      --  yes, one to clear
      Index : constant Natural := External_Line_Number'Enum_Rep (Line);
   begin
      case Index is
         when 0 .. 21 =>
            EXTI_Periph.CPUPR1.PR.Arr (Index) := True;
         when 49 =>
            EXTI_Periph.CPUPR2.PR49 := True;
         when 51 =>
            EXTI_Periph.CPUPR2.PR51 := True;
         when 82 =>
            EXTI_Periph.CPUPR3.PR82 := True;
         when 84 .. 86 =>
            EXTI_Periph.CPUPR3.PR.Arr (Index) := True;
         when others =>
            null;
      end case;
   end Clear_External_Interrupt;

end STM32.EXTI;
