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

with Ada.Unchecked_Conversion;
with STM32_SVD.RCC;    use STM32_SVD.RCC;
with STM32_SVD.PWR;    use STM32_SVD.PWR;
with STM32_SVD.SYSCFG; use STM32_SVD.SYSCFG;
with STM32_SVD.Flash;  use STM32_SVD.Flash;

package body STM32.RCC is

   function To_AHB1RSTR_T is new Ada.Unchecked_Conversion
     (UInt32, AHB1RSTR_Register);
   function To_AHB2RSTR_T is new Ada.Unchecked_Conversion
     (UInt32, AHB2RSTR_Register);
   function To_AHB3RSTR_T is new Ada.Unchecked_Conversion
     (UInt32, AHB3RSTR_Register);
   function To_AHB4RSTR_T is new Ada.Unchecked_Conversion
     (UInt32, AHB4RSTR_Register);
   function To_APB1LRSTR_T is new Ada.Unchecked_Conversion
     (UInt32, APB1LRSTR_Register);
   function To_APB1HRSTR_T is new Ada.Unchecked_Conversion
     (UInt32, APB1HRSTR_Register);
   function To_APB2RSTR_T is new Ada.Unchecked_Conversion
     (UInt32, APB2RSTR_Register);
   function To_APB3RSTR_T is new Ada.Unchecked_Conversion
     (UInt32, APB3RSTR_Register);
   function To_APB4RSTR_T is new Ada.Unchecked_Conversion
     (UInt32, APB4RSTR_Register);

   ---------------------------------------------------------------------------
   -------  Enable/Disable/Reset Routines  -----------------------------------
   ---------------------------------------------------------------------------

   procedure AHB_Force_Reset is
   begin
      RCC_Periph.AHB1RSTR := To_AHB1RSTR_T (16#FFFF_FFFF#);
      RCC_Periph.AHB2RSTR := To_AHB2RSTR_T (16#FFFF_FFFF#);
      RCC_Periph.AHB3RSTR := To_AHB3RSTR_T (16#FFFF_FFFF#);
      RCC_Periph.AHB4RSTR := To_AHB4RSTR_T (16#FFFF_FFFF#);
   end AHB_Force_Reset;

   procedure AHB_Release_Reset is
   begin
      RCC_Periph.AHB1RSTR := To_AHB1RSTR_T (0);
      RCC_Periph.AHB2RSTR := To_AHB2RSTR_T (0);
      RCC_Periph.AHB3RSTR := To_AHB3RSTR_T (0);
      RCC_Periph.AHB4RSTR := To_AHB4RSTR_T (0);
   end AHB_Release_Reset;

   procedure APB1_Force_Reset is
   begin
      RCC_Periph.APB1LRSTR := To_APB1LRSTR_T (16#FFFF_FFFF#);
      RCC_Periph.APB1HRSTR := To_APB1HRSTR_T (16#FFFF_FFFF#);
   end APB1_Force_Reset;

   procedure APB1_Release_Reset is
   begin
      RCC_Periph.APB1LRSTR := To_APB1LRSTR_T (0);
      RCC_Periph.APB1HRSTR := To_APB1HRSTR_T (0);
   end APB1_Release_Reset;

   procedure APB2_Force_Reset is
   begin
      RCC_Periph.APB2RSTR := To_APB2RSTR_T (16#FFFF_FFFF#);
   end APB2_Force_Reset;

   procedure APB2_Release_Reset is
   begin
      RCC_Periph.APB2RSTR := To_APB2RSTR_T (0);
   end APB2_Release_Reset;

   procedure APB3_Force_Reset is
   begin
      RCC_Periph.APB3RSTR := To_APB3RSTR_T (16#FFFF_FFFF#);
   end APB3_Force_Reset;

   procedure APB3_Release_Reset is
   begin
      RCC_Periph.APB3RSTR := To_APB3RSTR_T (0);
   end APB3_Release_Reset;

   procedure APB4_Force_Reset is
   begin
      RCC_Periph.APB4RSTR := To_APB4RSTR_T (16#FFFF_FFFF#);
   end APB4_Force_Reset;

   procedure APB4_Release_Reset is
   begin
      RCC_Periph.APB4RSTR := To_APB4RSTR_T (0);
   end APB4_Release_Reset;

   procedure Backup_Domain_Reset is
   begin
      RCC_Periph.BDCR.BDRST := True;
      RCC_Periph.BDCR.BDRST := False;
   end Backup_Domain_Reset;

   ---------------------------------------------------------------------------
   --  Clock Configuration  --------------------------------------------------
   ---------------------------------------------------------------------------

   -------------------
   -- Set_HSE Clock --
   -------------------

   procedure Set_HSE_Clock
     (Enable     : Boolean;
      Bypass     : Boolean := False;
      Enable_CSS : Boolean := False)
   is
   begin
      if Enable and not RCC_Periph.CR.HSEON then
         RCC_Periph.CR.HSEON := True;
         loop
            exit when RCC_Periph.CR.HSERDY;
         end loop;
      end if;
      RCC_Periph.CR.HSEBYP := Bypass;
      RCC_Periph.CR.HSECSSON := Enable_CSS;
   end Set_HSE_Clock;

   -----------------------
   -- HSE Clock_Enabled --
   -----------------------

   function HSE_Clock_Enabled return Boolean is
   begin
      return RCC_Periph.CR.HSEON;
   end HSE_Clock_Enabled;

   -------------------
   -- Set_LSE Clock --
   -------------------

   procedure Set_LSE_Clock
     (Enable     : Boolean;
      Bypass     : Boolean := False;
      Enable_CSS : Boolean := False;
      Capability : HSE_Capability)
   is
   begin
      if Enable and not RCC_Periph.BDCR.LSEON then
         RCC_Periph.BDCR.LSEON := True;
         loop
            exit when RCC_Periph.BDCR.LSERDY;
         end loop;
      end if;
      RCC_Periph.BDCR.LSEBYP := Bypass;
      RCC_Periph.BDCR.LSECSSON := Enable_CSS;
      RCC_Periph.BDCR.LSEDRV := Capability'Enum_Rep;
   end Set_LSE_Clock;

   -----------------------
   -- LSE Clock_Enabled --
   -----------------------

   function LSE_Clock_Enabled return Boolean is
   begin
      return RCC_Periph.BDCR.LSEON;
   end LSE_Clock_Enabled;

   -------------------
   -- Set_HSI_Clock --
   -------------------

   procedure Set_HSI_Clock
     (Enable : Boolean;
      Value  : HSI_Prescaler)
   is
   begin
      if Enable then
         if not RCC_Periph.CR.HSION then
            RCC_Periph.CR.HSION := True;
            loop
               exit when RCC_Periph.CR.HSIRDY;
            end loop;
         end if;

         RCC_Periph.CR.HSIDIV := Value'Enum_Rep;

         loop
            exit when RCC_Periph.CR.HSIDIVF;
         end loop;
      else
         RCC_Periph.CR.HSION := False;
      end if;
   end Set_HSI_Clock;

   -----------------------
   -- HSI_Clock_Enabled --
   -----------------------

   function HSI_Clock_Enabled return Boolean is
   begin
      return RCC_Periph.CR.HSION;
   end HSI_Clock_Enabled;

   ---------------------
   -- Set_HSI48 Clock --
   ---------------------

   procedure Set_HSI48_Clock (Enable : Boolean) is
   begin
      if Enable and not RCC_Periph.CR.HSI48ON then
         RCC_Periph.CR.HSI48ON := True;
         loop
            exit when RCC_Periph.CR.HSI48RDY;
         end loop;
      end if;
   end Set_HSI48_Clock;

   -------------------------
   -- HSI48 Clock_Enabled --
   -------------------------

   function HSI48_Clock_Enabled return Boolean is
   begin
      return RCC_Periph.CR.HSI48ON;
   end HSI48_Clock_Enabled;

   -------------------
   -- Set_LSI Clock --
   -------------------

   procedure Set_LSI_Clock (Enable : Boolean) is
   begin
      if Enable and not RCC_Periph.CSR.LSION then
         RCC_Periph.CSR.LSION := True;
         loop
            exit when RCC_Periph.CSR.LSIRDY;
         end loop;
      end if;
   end Set_LSI_Clock;

   -----------------------
   -- LSI Clock_Enabled --
   -----------------------

   function LSI_Clock_Enabled return Boolean is
   begin
      return RCC_Periph.CSR.LSION;
   end LSI_Clock_Enabled;

   -------------------
   -- Set_CSI Clock --
   -------------------

   procedure Set_CSI_Clock (Enable : Boolean) is
   begin
      if Enable and not RCC_Periph.CR.CSION then
         RCC_Periph.CR.CSION := True;
         loop
            exit when RCC_Periph.CR.CSIRDY;
         end loop;
      end if;
   end Set_CSI_Clock;

   -----------------------
   -- CSI Clock_Enabled --
   -----------------------

   function CSI_Clock_Enabled return Boolean is
   begin
      return RCC_Periph.CR.CSION;
   end CSI_Clock_Enabled;

   --------------------------------
   -- Configure_System_Clock_Mux --
   --------------------------------

   procedure Configure_System_Clock_Mux (Source : SYSCLK_Clock_Source)
   is
   begin
      RCC_Periph.CFGR.SW := Source'Enum_Rep;
      loop
         exit when RCC_Periph.CFGR.SWS = Source'Enum_Rep;
      end loop;
   end Configure_System_Clock_Mux;

   -----------------------------------
   -- Configure_AHB_Clock_Prescaler --
   -----------------------------------

   procedure Configure_AHB_Clock_Prescaler
     (Bus   : AHB_Clock_Range;
      Value : AHB_Prescaler)
   is
      function To_AHB is new Ada.Unchecked_Conversion
        (AHB_Prescaler, UInt4);
   begin
      case Bus is
         when AHB_1 =>
            RCC_Periph.D1CFGR.D1CPRE := To_AHB (Value);
         when AHB_2 =>
            RCC_Periph.D1CFGR.HPRE := To_AHB (Value);
      end case;
   end Configure_AHB_Clock_Prescaler;

   -----------------------------------
   -- Configure_APB_Clock_Prescaler --
   -----------------------------------

   procedure Configure_APB_Clock_Prescaler
     (Bus   : APB_Clock_Range;
      Value : APB_Prescaler)
   is
      function To_APB is new Ada.Unchecked_Conversion
        (APB_Prescaler, UInt3);
   begin
      case Bus is
         when APB_1 =>
            RCC_Periph.D2CFGR.D2PPRE1 := To_APB (Value);
         when APB_2 =>
            RCC_Periph.D2CFGR.D2PPRE2 := To_APB (Value);
         when APB_3 =>
            RCC_Periph.D1CFGR.D1PPRE := To_APB (Value);
         when APB_4 =>
            RCC_Periph.D3CFGR.D3PPRE := To_APB (Value);
      end case;
   end Configure_APB_Clock_Prescaler;

   ------------------------------
   -- Configure_PLL_Source_Mux --
   ------------------------------

   procedure Configure_PLL_Source_Mux (Source : PLL_Clock_Source) is
   begin
         RCC_Periph.PLLCKSELR.PLLSRC := Source'Enum_Rep;
   end Configure_PLL_Source_Mux;

   -------------------
   -- Configure_PLL --
   -------------------

   procedure Configure_PLL
     (PLL             : PLL_Range;
      Enable          : Boolean;
      Fractional_Mode : Boolean;
      Fraction        : UInt13 := 16#0#;
      PLLM            : PLLM_Range;
      PLLN            : PLLN_Range;
      PLLP            : PLLP_Range;
      Enable_Output_P : Boolean;
      PLLQ            : PLLQ_Range;
      Enable_Output_Q : Boolean;
      PLLR            : PLLR_Range;
      Enable_Output_R : Boolean;
      Input           : PLL_Input_Frequency;
      VCO             : PLL_VCO_Selector)
   is
   begin
      case PLL is
         when PLL_1 =>
            --  Disable the main PLL before configuring it
            RCC_Periph.CR.PLL1ON := False;

            if Enable then
               --  Configure multiplication and division factors
               RCC_Periph.PLLCKSELR.DIVM1 := UInt6 (PLLM);

               if Fractional_Mode then
                  RCC_Periph.PLL1FRACR.FRACN1 := Fraction;
               end if;

               RCC_Periph.PLLCFGR :=
                 (PLL1VCOSEL => VCO = Medium_150_To_420MHz,
                  PLL1RGE    => Input'Enum_Rep,
                  PLL1FRACEN => Fractional_Mode,
                  DIVP1EN    => Enable_Output_P,
                  DIVQ1EN    => Enable_Output_Q,
                  DIVR1EN    => Enable_Output_R,
                  others     => <>);

               RCC_Periph.PLL1DIVR :=
                 (DIVN1 => UInt9 (PLLN - 1),
                  DIVP1 => UInt7 (PLLP - 1),
                  DIVQ1 => UInt7 (PLLQ - 1),
                  DIVR1 => UInt7 (PLLR - 1),
                  others => <>);

               --  Setup PLL and wait for stabilization.
               RCC_Periph.CR.PLL1ON := Enable;
               loop
                  exit when RCC_Periph.CR.PLL1RDY;
               end loop;
            end if;

         when PLL_2 =>
            --  Disable the main PLL before configuring it
            RCC_Periph.CR.PLL2ON := False;

            if Enable then
               --  Configure multiplication and division factors
               RCC_Periph.PLLCKSELR.DIVM2 := UInt6 (PLLM);

               if Fractional_Mode then
                  RCC_Periph.PLL2FRACR.FRACN2 := Fraction;
               end if;

               RCC_Periph.PLLCFGR :=
                 (PLL2VCOSEL => VCO = Medium_150_To_420MHz,
                  PLL2RGE    => Input'Enum_Rep,
                  PLL2FRACEN => Fractional_Mode,
                  DIVP2EN    => Enable_Output_P,
                  DIVQ2EN    => Enable_Output_Q,
                  DIVR2EN    => Enable_Output_R,
                  others     => <>);

               RCC_Periph.PLL2DIVR :=
                 (DIVN2 => UInt9 (PLLN - 1),
                  DIVP2 => UInt7 (PLLP - 1),
                  DIVQ2 => UInt7 (PLLQ - 1),
                  DIVR2 => UInt7 (PLLR - 1),
                  others => <>);

               --  Setup PLL and wait for stabilization.
               RCC_Periph.CR.PLL2ON := Enable;
               loop
                  exit when RCC_Periph.CR.PLL2RDY;
               end loop;
            end if;

         when PLL_3 =>
            --  Disable the main PLL before configuring it
            RCC_Periph.CR.PLL3ON := False;

            if Enable then
               --  Configure multiplication and division factors
               RCC_Periph.PLLCKSELR.DIVM3 := UInt6 (PLLM);

               if Fractional_Mode then
                  RCC_Periph.PLL3FRACR.FRACN3 := Fraction;
               end if;

               RCC_Periph.PLLCFGR :=
                 (PLL3VCOSEL => VCO = Medium_150_To_420MHz,
                  PLL3RGE    => Input'Enum_Rep,
                  PLL3FRACEN => Fractional_Mode,
                  DIVP3EN    => Enable_Output_P,
                  DIVQ3EN    => Enable_Output_Q,
                  DIVR3EN    => Enable_Output_R,
                  others     => <>);

               RCC_Periph.PLL3DIVR :=
                 (DIVN3 => UInt9 (PLLN - 1),
                  DIVP3 => UInt7 (PLLP - 1),
                  DIVQ3 => UInt7 (PLLQ - 1),
                  DIVR3 => UInt7 (PLLR - 1),
                  others => <>);

               --  Setup PLL and wait for stabilization.
               RCC_Periph.CR.PLL3ON := Enable;
               loop
                  exit when RCC_Periph.CR.PLL3RDY;
               end loop;
            end if;

      end case;
   end Configure_PLL;

   ----------------------------
   -- Configure_PLL_Fraction --
   ----------------------------

   procedure Configure_PLL_Fraction
     (PLL      : PLL_Range;
      Fraction : UInt13)
   is
   begin
      case PLL is
         when PLL_1 =>
            RCC_Periph.PLLCFGR.PLL1FRACEN := False;
            RCC_Periph.PLL1FRACR.FRACN1 := Fraction;
            RCC_Periph.PLLCFGR.PLL1FRACEN := True;
         when PLL_2 =>
            RCC_Periph.PLLCFGR.PLL2FRACEN := False;
            RCC_Periph.PLL2FRACR.FRACN2 := Fraction;
            RCC_Periph.PLLCFGR.PLL2FRACEN := True;
         when PLL_3 =>
            RCC_Periph.PLLCFGR.PLL3FRACEN := False;
            RCC_Periph.PLL3FRACR.FRACN3 := Fraction;
            RCC_Periph.PLLCFGR.PLL3FRACEN := True;
      end case;
   end Configure_PLL_Fraction;

   ------------------------------
   -- Configure_PER_Source_Mux --
   ------------------------------

   procedure Configure_PER_Source_Mux (Source : PER_Clock_Source)
   is
   begin
      RCC_Periph.D1CCIPR.CKPERSEL := Source'Enum_Rep;
   end Configure_PER_Source_Mux;

   -------------------------------
   -- Configure_TIM_Source_Mode --
   -------------------------------

   procedure Configure_TIM_Source_Mode (Source : TIM_Source_Mode)
   is
   begin
      RCC_Periph.CFGR.TIMPRE := Source = Factor_4;
   end Configure_TIM_Source_Mode;

   --------------------------------
   -- Configure_MCO_Output_Clock --
   --------------------------------

   procedure Configure_MCO_Output_Clock
     (MCO    : MCO_Range;
      Source : MCO_Clock_Source;
      Value  : MCO_Prescaler)
   is
   begin
      case MCO is
         when MCO_1 =>
            RCC_Periph.CFGR.MCO1SEL := Source'Enum_Rep;
            RCC_Periph.CFGR.MCO1PRE := Value'Enum_Rep;
         when MCO_2 =>
            RCC_Periph.CFGR.MCO2SEL := Source'Enum_Rep;
            RCC_Periph.CFGR.MCO2PRE := Value'Enum_Rep;
      end case;
   end Configure_MCO_Output_Clock;

   -----------------------
   -- Set_FLASH_Latency --
   -----------------------

   procedure Set_FLASH_Latency (Latency : FLASH_Wait_State)
   is
   begin
      Flash_Periph.ACR.LATENCY := Latency'Enum_Rep;
   end Set_FLASH_Latency;

   -----------------------
   -- Set_VCORE_Scaling --
   -----------------------

   procedure Set_VCORE_Scaling (Scale : VCORE_Scaling_Selection)
   is
   begin
      PWR_Periph.D3CR.VOS := Scale'Enum_Rep;
   end Set_VCORE_Scaling;

   --------------------------
   -- PWR_Overdrive_Enable --
   --------------------------

   procedure PWR_Overdrive_Enable
   is
   begin
      --  The system maximum frequency with VOS1 is 400 MHz, but 480 MHz can be
      --  reached by boosting the voltage scaling level to VOS0. This is done
      --  through the ODEN bit in the SYSCFG_PWRCR register, after configuring
      --  level VOS1. See RM0433 ver 7 pg. 277 chapter 6.6.2 for this sequence.

      if PWR_Periph.D3CR.VOS /= Scale_1'Enum_Rep then
         PWR_Periph.D3CR.VOS := Scale_1'Enum_Rep; --  Set VOS1
      end if;
      RCC_Periph.APB4ENR.SYSCFGEN := True; --  Enable SYSCFG clock
      SYSCFG_Periph.PWRCR.ODEN := True;

      --  Wait for stabilization
      --  loop
      --     exit when PWR_Periph.D3CR.VOSRDY;
      --  end loop;

   end PWR_Overdrive_Enable;

end STM32.RCC;
