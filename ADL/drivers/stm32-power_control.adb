------------------------------------------------------------------------------
--                                                                          --
--                     Copyright (C) 2016-2017, AdaCore                     --
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
--     3. Neither the name of the copyright holder nor the names of its     --
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

with STM32_SVD.RCC;       use STM32_SVD.RCC;
with STM32_SVD.SCB;       use STM32_SVD.SCB;
with System.Machine_Code; use System.Machine_Code;

package body STM32.Power_Control is

   --------------------------------------
   -- Disable_Backup_Domain_Protection --
   --------------------------------------

   procedure Disable_Backup_Domain_Protection is
   begin
      PWR_Periph.CR1.DBP := True;
   end Disable_Backup_Domain_Protection;

   -------------------------------------
   -- Enable_Backup_Domain_Protection --
   -------------------------------------

   procedure Enable_Backup_Domain_Protection is
   begin
      PWR_Periph.CR1.DBP := False;
   end Enable_Backup_Domain_Protection;

   -----------------------
   -- Enable_Wakeup_Pin --
   -----------------------

   procedure Enable_Wakeup_Pin (Pin      : Wakeup_Pin;
                                Enabled  : Boolean := True)
   is
   begin
      PWR_Periph.WKUPEPR.WKUPEN.Arr (Pin'Enum_Rep) := Enabled;
   end Enable_Wakeup_Pin;

   -----------------------------
   -- Set_Wakeup_Pin_Polarity --
   -----------------------------

   procedure Set_Wakeup_Pin_Polarity (Pin  : Wakeup_Pin;
                                      Pol  : Wakeup_Pin_Polarity;
                                      Pull : Wakeup_Pin_PullMode)
   is
   begin
      --  Polarity detection
      PWR_Periph.WKUPEPR.WKUPP.Arr (Pin'Enum_Rep) := Pol = Falling_Edge;
      --  Pull mode
      PWR_Periph.WKUPEPR.WKUPPUPD.Arr (Pin'Enum_Rep) := Pull'Enum_Rep;
   end Set_Wakeup_Pin_Polarity;

   -----------------
   -- Wakeup_Flag --
   -----------------

   function Wakeup_Flag (Pin : Wakeup_Pin) return Boolean
   is (PWR_Periph.WKUPFR.WKUPF.Arr (Pin'Enum_Rep));

   -----------------------
   -- Clear_Wakeup_Flag --
   -----------------------

   procedure Clear_Wakeup_Flag (Pin : Wakeup_Pin) is
   begin
      PWR_Periph.WKUPCR.WKUPC.Arr (Pin'Enum_Rep) := True;
   end Clear_Wakeup_Flag;

   -----------------------
   -- Clear_Wakeup_Flag --
   -----------------------

   procedure Clear_Wakeup_Flag (Pins : Wakeup_Pin_List) is
   begin
      for Pin of Pins loop
         PWR_Periph.WKUPCR.WKUPC.Arr (Pin'Enum_Rep) := True;
      end loop;
   end Clear_Wakeup_Flag;

   ------------------
   -- Standby_Flag --
   ------------------

   function Standby_Flag return Boolean
   is (PWR_Periph.CPUCR.SBF);

   ------------------------
   -- Clear_Standby_Flag --
   ------------------------

   procedure Clear_Standby_Flag is
   begin
      PWR_Periph.CPUCR.CSSF := True;
   end Clear_Standby_Flag;

   --------------------------
   -- Set_System_Stop_Mode --
   --------------------------

   procedure Set_System_Stop_Mode (Mode : System_Stop_Mode) is
   begin
      PWR_Periph.CR1.SVOS := Mode'Enum_Rep;
   end Set_System_Stop_Mode;

   ------------------------------
   -- Set_Power_Down_Deepsleep --
   ------------------------------

   procedure Set_Power_Down_Deepsleep (Enabled : Boolean := True) is
   begin
      if Enabled then
         --  Set system stop mode voltage scaling to SVOS5
         PWR_Periph.CR1.SVOS := System_Stop_Mode'Enum_Rep (SVOS_Scale_5);
      else
         --  Set system stop mode voltage scaling to SVOS3
         PWR_Periph.CR1.SVOS := System_Stop_Mode'Enum_Rep (SVOS_Scale_3);
      end if;
   end Set_Power_Down_Deepsleep;

   -----------------------------
   -- Set_Low_Power_Deepsleep --
   -----------------------------

   procedure Set_Low_Power_Deepsleep (Enabled : Boolean := True) is
   begin
      --  Set system stop mode voltage scaling to SVOS3
      PWR_Periph.CR1.SVOS := System_Stop_Mode'Enum_Rep (SVOS_Scale_3);
      PWR_Periph.CR1.LPDS := Enabled;
   end Set_Low_Power_Deepsleep;

   ------------------------
   -- Enter_Standby_Mode --
   ------------------------

   procedure Enter_Standby_Mode is
   begin
      for Pin in Wakeup_Pin'Range loop
         Clear_Wakeup_Flag (Pin);
      end loop;

      Clear_Standby_Flag;

      Set_Power_Down_Deepsleep;

      SCB_Periph.SCR.SLEEPDEEP := True;

      loop
         Asm ("wfi", Volatile => True);
      end loop;
   end Enter_Standby_Mode;

end STM32.Power_Control;
