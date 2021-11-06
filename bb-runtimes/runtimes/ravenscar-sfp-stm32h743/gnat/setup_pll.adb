------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--          Copyright (C) 2012-2019, Free Software Foundation, Inc.         --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

pragma Ada_2012; -- To work around pre-commit check?
pragma Suppress (All_Checks);

--  This initialization procedure mainly initializes the PLLs and
--  all derived clocks.

with Ada.Unchecked_Conversion;

with Interfaces.STM32;         use Interfaces, Interfaces.STM32;
with Interfaces.STM32.Flash;   use Interfaces.STM32.Flash;
with Interfaces.STM32.RCC;     use Interfaces.STM32.RCC;
with Interfaces.STM32.PWR;     use Interfaces.STM32.PWR;

with System.BB.Parameters;     use System.BB.Parameters;
with System.STM32;             use System.STM32;

procedure Setup_Pll is
   procedure Initialize_Clocks;
   procedure Reset_Clocks;

   ------------------------------
   -- Clock Tree Configuration --
   ------------------------------

   HSE_Enabled : constant Boolean := True; --  use high-speed external clock
   HSE_Bypass  : constant Boolean := True; --  bypass osc. with external clock

   HSI_Enabled : constant Boolean := False; --  use high-speed internal clock
   CSI_Enabled : constant Boolean :=
     (if not HSE_Enabled and not HSI_Enabled then True);
   --  Use low-power internal clock when HSE and HSI are disabled.

   LSE_Enabled : constant Boolean := False; --  use low-speed external clock
   LSI_Enabled : constant Boolean := False; --  use low-speed internal clock
   HSI48_Enabled : constant Boolean := False; --  use high-speed internal clock

   Activate_PLL1 : constant Boolean := True;
   Activate_PLL2 : constant Boolean := True;
   Activate_PLL3 : constant Boolean := True;

   -----------------------
   -- Initialize_Clocks --
   -----------------------

   procedure Initialize_Clocks
   is
      -------------------------------
      -- Compute Clock Frequencies --
      -------------------------------

      PLL1P_Value : constant := 2;
      PLL1Q_Value : constant := 4; --  200 MHz
      PLL1R_Value : constant := 8; --  100 MHz

      PLL2M_Value : constant := 2; --  4 MHz with HSE
      PLL2N_Value : constant := 240; --  960 MHz
      PLL2P_Value : constant := 4; --  240 MHz for ADCs
      PLL2Q_Value : constant := 20; --  48 MHz
      PLL2R_Value : constant := 8; --  120 MHz

      PLL2M : constant UInt6 := UInt6 (PLL2M_Value);
      PLL2N : constant UInt9 := UInt9 (PLL2N_Value - 1);
      PLL2P : constant UInt7 := UInt7 (PLL2P_Value - 1);
      PLL2Q : constant UInt7 := UInt7 (PLL2Q_Value - 1);
      PLL2R : constant UInt7 := UInt7 (PLL2R_Value - 1);

      PLL3M_Value : constant := 2; --  4 MHz with HSE
      PLL3N_Value : constant := 240; --  960 MHz
      PLL3P_Value : constant := 4; --  240 MHz
      PLL3Q_Value : constant := 20; --  48 MHz for USB
      PLL3R_Value : constant := 8; --  120 MHz

      PLL3M : constant UInt6 := UInt6 (PLL3M_Value);
      PLL3N : constant UInt9 := UInt9 (PLL3N_Value - 1);
      PLL3P : constant UInt7 := UInt7 (PLL3P_Value - 1);
      PLL3Q : constant UInt7 := UInt7 (PLL3Q_Value - 1);
      PLL3R : constant UInt7 := UInt7 (PLL3R_Value - 1);

      PLLCLKIN : constant Integer := 4_000_000;
      --  PLL input clock value
      PLL1M_Value : constant Integer := (if HSE_Enabled then HSE_Clock
        elsif HSI_Enabled then HSI_Clock else CSI_Clock) / PLLCLKIN;
      --  First divider DIVM1 is set to produce a 4Mhz clock to be compatible
      --  with the 4 MHz CSI RC clock.

      PLL1N_Value : constant Integer :=
        (PLL1P_Value * Clock_Frequency) / PLLCLKIN;
      --  Compute DIVN1 to generate the required PLLCLK frequency

      pragma Compile_Time_Error
        (Activate_PLL1 and PLL1M_Value not in PLLM_Range,
         "Invalid PLL1M clock configuration value");

      pragma Compile_Time_Error
        (Activate_PLL1 and PLL1N_Value not in PLLN_Range,
         "Invalid PLL1N clock configuration value");

      pragma Compile_Time_Error
        (Activate_PLL1 and PLL1R_Value not in PLLR_Range,
         "Invalid PLL1R clock configuration value");

      pragma Compile_Time_Error
        (Activate_PLL1 and
         (PLL1P_Value rem 2 /= 0 or PLL1P_Value not in PLL1P_Range),
         "Invalid PLL1P clock configuration value");

      pragma Compile_Time_Error
        (Activate_PLL1 and PLL1Q_Value not in PLLQ_Range,
         "Invalid PLL1Q clock configuration value");

      PLLVCO : constant Integer := PLLCLKIN * PLL1N_Value; --  PLL1N_OUT

      pragma Compile_Time_Error
        (Activate_PLL1 and PLLVCO not in PLLN_OUT_Range,
         "Invalid PLL1N clock configuration output value");

      PLLCLKOUT : constant Integer := PLLVCO / PLL1P_Value; --  PLLCLK

      pragma Compile_Time_Error
        (Activate_PLL1 and PLLCLKOUT not in PLLCLK_Range,
         "Invalid PLL1R clock configuration output value");

      PLL1M : constant UInt6 := UInt6 (PLL1M_Value);
      PLL1N : constant UInt9 := UInt9 (PLL1N_Value - 1);
      PLL1P : constant UInt7 := UInt7 (PLL1P_Value - 1);
      PLL1Q : constant UInt7 := UInt7 (PLL1Q_Value - 1);
      PLL1R : constant UInt7 := UInt7 (PLL1R_Value - 1);

      SW : constant SYSCLK_Source := (if Activate_PLL1 then SYSCLK_SRC_PLL
                                      elsif HSE_Enabled then SYSCLK_SRC_HSE
                                      elsif HSI_Enabled then SYSCLK_SRC_HSI
                                      else SYSCLK_SRC_CSI);

      SYSCLK : constant Integer := (if Activate_PLL1 then PLLCLKOUT
                                    elsif HSE_Enabled then HSE_Clock
                                    elsif HSI_Enabled then HSI_Clock
                                    else CSI_Clock);

      HCLK1 : constant Integer :=
               (if not AHB1_PRE.Enabled then SYSCLK
                else
                   (case AHB1_PRE.Value is
                       when DIV2   => SYSCLK / 2,
                       when DIV4   => SYSCLK / 4,
                       when DIV8   => SYSCLK / 8,
                       when DIV16  => SYSCLK / 16,
                       when DIV64  => SYSCLK / 64,
                       when DIV128 => SYSCLK / 128,
                       when DIV256 => SYSCLK / 256,
                       when DIV512 => SYSCLK / 512));
      HCLK2 : constant Integer :=
               (if not AHB2_PRE.Enabled then HCLK1
                else
                   (case AHB2_PRE.Value is
                       when DIV2   => HCLK1 / 2,
                       when DIV4   => HCLK1 / 4,
                       when DIV8   => HCLK1 / 8,
                       when DIV16  => HCLK1 / 16,
                       when DIV64  => HCLK1 / 64,
                       when DIV128 => HCLK1 / 128,
                       when DIV256 => HCLK1 / 256,
                       when DIV512 => HCLK1 / 512));
      PCLK1 : constant Integer :=
                (if not APB1_PRE.Enabled then HCLK2
                 else
                    (case APB1_PRE.Value is
                        when DIV2  => HCLK2 / 2,
                        when DIV4  => HCLK2 / 4,
                        when DIV8  => HCLK2 / 8,
                        when DIV16 => HCLK2 / 16));
      PCLK2 : constant Integer :=
                (if not APB2_PRE.Enabled then HCLK2
                 else
                    (case APB2_PRE.Value is
                        when DIV2  => HCLK2 / 2,
                        when DIV4  => HCLK2 / 4,
                        when DIV8  => HCLK2 / 8,
                        when DIV16 => HCLK2 / 16));
      PCLK3 : constant Integer :=
                (if not APB3_PRE.Enabled then HCLK2
                 else
                    (case APB3_PRE.Value is
                        when DIV2  => HCLK2 / 2,
                        when DIV4  => HCLK2 / 4,
                        when DIV8  => HCLK2 / 8,
                        when DIV16 => HCLK2 / 16));
      PCLK4 : constant Integer :=
                (if not APB4_PRE.Enabled then HCLK2
                 else
                    (case APB4_PRE.Value is
                        when DIV2  => HCLK2 / 2,
                        when DIV4  => HCLK2 / 4,
                        when DIV8  => HCLK2 / 8,
                        when DIV16 => HCLK2 / 16));

      function To_AHB is new Ada.Unchecked_Conversion
        (AHB_Prescaler, UInt4);
      function To_APB is new Ada.Unchecked_Conversion
        (APB_Prescaler, UInt3);

   begin

      pragma Compile_Time_Error
        (SYSCLK /= Clock_Frequency, "Cannot generate requested clock");

      --  Cannot be checked at compile time, depends on APB1_PRE to APB4_PRE
      pragma Assert
        (HCLK1 not in HCLK1_Range
           or else HCLK2 not in HCLK2_Range
           or else PCLK1 not in PCLK1_Range
           or else PCLK2 not in PCLK2_Range
           or else PCLK3 not in PCLK3_Range
           or else PCLK4 not in PCLK4_Range,
         "Invalid AHB/APB prescalers configuration");

      --  PWR initialization
      --  System.BB.MCU_Parameters.PWR_Initialize;

      if HSE_Enabled then
         --  Configure high-speed external clock, if enabled
         RCC_Periph.CR.HSEBYP := (if HSE_Bypass then 1 else 0);
         --  Enable security for HSERDY
         RCC_Periph.CR.HSECSSON := 1;
         --  Setup high-speed external clock
         RCC_Periph.CR.HSEON := 1;
         --  Wait for HSE stabilisation.
         loop
            exit when RCC_Periph.CR.HSERDY = 1;
         end loop;

      else
         if HSI_Enabled then
            --  Setup high-speed internal clock and wait for stabilisation.
            RCC_Periph.CR.HSION := 1;
            loop
               exit when RCC_Periph.CR.HSIRDY = 1;
            end loop;
         elsif CSI_Enabled then
            --  Setup low-power internal clock and wait for stabilization.
            RCC_Periph.CR.CSION := 1;
            loop
               exit when RCC_Periph.CR.CSIRDY = 1;
            end loop;
         end if;
      end if;

      if LSE_Enabled then
         --  Setup low-speed external clock and wait for stabilization.
         RCC_Periph.BDCR.LSEON := 1;
         loop
            exit when RCC_Periph.BDCR.LSERDY = 1;
         end loop;
      end if;

      if LSI_Enabled then
         --  Setup low-speed internal clock and wait for stabilization.
         RCC_Periph.CSR.LSION := 1;
         loop
            exit when RCC_Periph.CSR.LSIRDY = 1;
         end loop;
      end if;

      if HSI48_Enabled then
         --  Setup high-speed internal clock and wait for stabilization.
         RCC_Periph.CR.HSI48ON := 1;
         loop
            exit when RCC_Periph.CR.HSI48RDY = 1;
         end loop;
      end if;

      --  Activate PLL1 if enabled
      if Activate_PLL1 then
         --  Disable the main PLL before configuring it
         RCC_Periph.CR.PLL1ON := 0;

         --  Configure the PLL clock source, multiplication and division
         --  factors
         RCC_Periph.PLLCKSELR :=
           (PLLSRC => (if HSE_Enabled then PLL_SRC_HSE'Enum_Rep
                       elsif HSI_Enabled then PLL_SRC_HSI'Enum_Rep
                       else PLL_SRC_CSI'Enum_Rep),
            DIVM1  => PLL1M,
            others => <>);
         RCC_Periph.PLLCFGR :=
           (PLL1VCOSEL => 0, --  PLL wide VCO range from 192 to 836 MHz
            PLL1RGE => 2, --  PLL input clock range between 4 and 8 MHz
            PLL1FRACEN => 0, --  Disable fractional mode
            DIVP1EN  => 1, --  Enable PLL DIVP output (default)
            DIVQ1EN  => 1, --  Enable PLL DIVQ output (default)
            DIVR1EN  => 1, --  Enable PLL DIVR output (default)
            others => <>);
         RCC_Periph.PLL1DIVR :=
           (DIVN1 => PLL1N,
            DIVP1 => PLL1P,
            DIVQ1 => PLL1Q,
            DIVR1 => PLL1R,
            others => <>);

         --  Setup PLL and wait for stabilization.
         RCC_Periph.CR.PLL1ON := 1;
         loop
            exit when RCC_Periph.CR.PLL1RDY = 1;
         end loop;

         --  Set VCORE to VOS1
         PWR_Periph.D3CR.VOS := Scale_1'Enum_Rep;

      end if;

      --  Activate PLL2 if enabled
      if Activate_PLL2 then
         --  Disable the main PLL before configuring it
         RCC_Periph.CR.PLL2ON := 0;

         --  Configure the PLL clock source, multiplication and division
         --  factors
         RCC_Periph.PLLCKSELR.DIVM2 := PLL2M;
         RCC_Periph.PLLCFGR :=
           (PLL2VCOSEL => 0, --  PLL wide VCO range from 192 to 836 MHz
            PLL2RGE => 2, --  PLL input clock range between 4 and 8 MHz
            PLL2FRACEN => 0, --  Disable fractional mode
            DIVP2EN  => 1, --  Enable PLL DIVP output (default)
            DIVQ2EN  => 1, --  Enable PLL DIVQ output (default)
            DIVR2EN  => 1, --  Enable PLL DIVR output (default)
            others => <>);
         RCC_Periph.PLL2DIVR :=
           (DIVN2 => PLL2N,
            DIVP2 => PLL2P,
            DIVQ2 => PLL2Q,
            DIVR2 => PLL2R,
            others => <>);

         --  Setup PLL and wait for stabilization.
         RCC_Periph.CR.PLL2ON := 1;
         loop
            exit when RCC_Periph.CR.PLL2RDY = 1;
         end loop;
      end if;

      --  Activate PLL3 if enabled
      if Activate_PLL3 then
         --  Disable the main PLL before configuring it
         RCC_Periph.CR.PLL3ON := 0;

         --  Configure the PLL clock source, multiplication and division
         --  factors
         RCC_Periph.PLLCKSELR.DIVM3 := PLL3M;
         RCC_Periph.PLLCFGR :=
           (PLL3VCOSEL => 0, --  PLL wide VCO range from 192 to 836 MHz
            PLL3RGE => 2, --  PLL input clock range between 4 and 8 MHz
            PLL3FRACEN => 0, --  Disable fractional mode
            DIVP3EN  => 1, --  Enable PLL DIVP output (default)
            DIVQ3EN  => 1, --  Enable PLL DIVQ output (default)
            DIVR3EN  => 1, --  Enable PLL DIVR output (default)
            others => <>);
         RCC_Periph.PLL3DIVR :=
           (DIVN3 => PLL3N,
            DIVP3 => PLL3P,
            DIVQ3 => PLL3Q,
            DIVR3 => PLL3R,
            others => <>);

         --  Setup PLL and wait for stabilization.
         RCC_Periph.CR.PLL3ON := 1;
         loop
            exit when RCC_Periph.CR.PLL3RDY = 1;
         end loop;
      end if;

      --  Flash configuration must be done before increasing the frequency,
      --  otherwise the CPU won't be able to fetch new instructions.
      --  Constants for Flash read latency with VCORE Range in relation to
      --  AXI Interface clock frequency (MHz) (AXI clock is HCLK2):
      --  RM0433 STM32H743 pg. 159 table 17 chapter 4.3.8.

      if HCLK2 in FLASH_Latency_0 then
         FLASH_Latency := FWS0'Enum_Rep;
      elsif HCLK2 in FLASH_Latency_1 then
         FLASH_Latency := FWS1'Enum_Rep;
      elsif HCLK2 in FLASH_Latency_2 then
         FLASH_Latency := FWS2'Enum_Rep;
      elsif HCLK2 in FLASH_Latency_3 then
         FLASH_Latency := FWS3'Enum_Rep;
      elsif HCLK2 in FLASH_Latency_4 then
         FLASH_Latency := FWS4'Enum_Rep;
      end if;

      Flash_Periph.ACR.LATENCY := FLASH_Latency;

      --  Configure PER_CK clock
      RCC_Periph.D1CCIPR.CKPERSEL :=
        (if HSE_Enabled then PER_SRC_HSE'Enum_Rep
         elsif HSI_Enabled then PER_SRC_HSI'Enum_Rep
         else PER_SRC_CSI'Enum_Rep);

      --  Configure domain 1 clocks
      RCC_Periph.D1CFGR :=
        (HPRE   => To_AHB (AHB2_PRE), -- AHB2 peripheral clock
         D1CPRE => To_AHB (AHB1_PRE), --  AHB1 CPU clock
         D1PPRE => To_APB (APB3_PRE), --  APB3 peripheral clock
         others  => <>);

      --  Configure domain 2 clocks
      RCC_Periph.D2CFGR :=
        (D2PPRE1 => To_APB (APB1_PRE), --  APB1 peripheral clock
         D2PPRE2 => To_APB (APB2_PRE), --  APB2 peripheral clock
         others  => <>);

      --  Configure domain 3 clocks
      RCC_Periph.D3CFGR :=
        (D3PPRE => To_APB (APB4_PRE), --  APB4 peripheral clock
         others  => <>);

      --  Configure SYSCLK source clock
      RCC_Periph.CFGR.SW := SW'Enum_Rep;

      --  Test system clock switch status
      case SW is
         when SYSCLK_SRC_PLL =>
            loop
               exit when RCC_Periph.CFGR.SWS = SYSCLK_SRC_PLL'Enum_Rep;
            end loop;
         when SYSCLK_SRC_HSE =>
            loop
               exit when RCC_Periph.CFGR.SWS = SYSCLK_SRC_HSE'Enum_Rep;
            end loop;
         when SYSCLK_SRC_HSI =>
            loop
               exit when RCC_Periph.CFGR.SWS = SYSCLK_SRC_HSI'Enum_Rep;
            end loop;
         when SYSCLK_SRC_CSI =>
            loop
               exit when RCC_Periph.CFGR.SWS = SYSCLK_SRC_CSI'Enum_Rep;
            end loop;
      end case;

      --  Change VOR to level 0 (VOR0) = 480 MHz
      --  if Activate_PLL1 then System.BB.MCU_Parameters.PWR_Overdrive_Enable;

   end Initialize_Clocks;

   ------------------
   -- Reset_Clocks --
   ------------------

   procedure Reset_Clocks is
   begin
      --  Switch on high speed internal clock
      RCC_Periph.CR.HSION := 1;

      --  Reset CFGR regiser
      RCC_Periph.CFGR := (others => <>);

      --  Reset HSEON, CSSON and PLLON bits
      RCC_Periph.CR.HSEON := 0;
      RCC_Periph.CR.HSECSSON := 0;
      RCC_Periph.CR.PLL1ON := 0;

      --  Reset PLL configuration register
      RCC_Periph.PLLCFGR := (others => <>);

      --  Reset HSE bypass bit
      RCC_Periph.CR.HSEBYP := 0;

      --  Disable all interrupts
      RCC_Periph.CIER := (others => <>);
   end Reset_Clocks;

begin
   Reset_Clocks;
   Initialize_Clocks;
end Setup_Pll;
