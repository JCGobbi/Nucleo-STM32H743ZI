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
pragma Restrictions (No_Elaboration_Code);

package STM32.RCC is

   procedure AHB_Force_Reset with Inline;
   procedure AHB_Release_Reset with Inline;
   procedure APB1_Force_Reset with Inline;
   procedure APB1_Release_Reset with Inline;
   procedure APB2_Force_Reset with Inline;
   procedure APB2_Release_Reset with Inline;
   procedure APB3_Force_Reset with Inline;
   procedure APB3_Release_Reset with Inline;
   procedure APB4_Force_Reset with Inline;
   procedure APB4_Release_Reset with Inline;

   ---------------------------------------------------------------------------
   --  Clock Configuration  --------------------------------------------------
   ---------------------------------------------------------------------------

   ---------------
   -- HSE Clock --
   ---------------

   procedure Set_HSE_Clock
     (Enable     : Boolean;
      Bypass     : Boolean := False;
      Enable_CSS : Boolean := False)
     with Post => HSE_Clock_Enabled = Enable;

   function HSE_Clock_Enabled return Boolean;

   ---------------
   -- LSE Clock --
   ---------------

   type HSE_Capability is
     (Lowest_Drive,
      Low_Drive,
      High_Drive,
      Highest_Drive)
     with Size => 2;

   procedure Set_LSE_Clock
     (Enable     : Boolean;
      Bypass     : Boolean := False;
      Enable_CSS : Boolean := False;
      Capability : HSE_Capability)
     with Post => LSE_Clock_Enabled = Enable;

   function LSE_Clock_Enabled return Boolean;

   ---------------
   -- HSI Clock --
   ---------------

   type HSI_Prescaler is
     (HSI_DIV1,
      HSI_DIV2,
      HSI_DIV4,
      HSI_DIV8)
     with Size => 2;

   procedure Set_HSI_Clock
     (Enable : Boolean;
      Value  : HSI_Prescaler)
     with Post => HSI_Clock_Enabled = Enable;
   --  The HSI clock can't be disabled if it is used directly (via SW mux) as
   --  system clock or if the HSI is selected as reference clock for PLL1 with
   --  PLL1 enabled (PLL1ON bit set to ‘1’).

   function HSI_Clock_Enabled return Boolean;

   -----------------
   -- HSI48 Clock --
   -----------------

   procedure Set_HSI48_Clock (Enable : Boolean)
     with Post => HSI48_Clock_Enabled = Enable;

   function HSI48_Clock_Enabled return Boolean;

   ---------------
   -- LSI Clock --
   ---------------

   procedure Set_LSI_Clock (Enable : Boolean)
     with Post => LSI_Clock_Enabled = Enable;

   function LSI_Clock_Enabled return Boolean;

   ---------------
   -- CSI Clock --
   ---------------

   procedure Set_CSI_Clock (Enable : Boolean)
     with Post => CSI_Clock_Enabled = Enable;

   function CSI_Clock_Enabled return Boolean;

   ------------------
   -- System Clock --
   ------------------

   type SYSCLK_Source is
     (SYSCLK_SRC_HSI,
      SYSCLK_SRC_CSI,
      SYSCLK_SRC_HSE,
      SYSCLK_SRC_PLL1)
     with Size => 3;

   for SYSCLK_Source use
     (SYSCLK_SRC_HSI => 2#000#,
      SYSCLK_SRC_CSI => 2#001#,
      SYSCLK_SRC_HSE => 2#010#,
      SYSCLK_SRC_PLL1 => 2#011#);

   procedure Configure_System_Clock_Mux (Source : SYSCLK_Source);

   -------------------------------
   -- Domains 1, 2 and 3 Clocks --
   -------------------------------

   type AHB_Prescaler_Enum is
     (DIV2,  DIV4,   DIV8,   DIV16,
      DIV64, DIV128, DIV256, DIV512)
     with Size => 3;

   type AHB_Prescaler is record
      Enabled : Boolean := False;
      Value   : AHB_Prescaler_Enum := AHB_Prescaler_Enum'First;
   end record with Size => 4;

   for AHB_Prescaler use record
      Enabled at 0 range 3 .. 3;
      Value   at 0 range 0 .. 2;
   end record;

   type AHB_Clock_Range is (AHB_1, AHB_2);

   procedure Configure_AHB_Clock_Prescaler
     (Bus   : AHB_Clock_Range;
      Value : AHB_Prescaler);
   --  The AHB1 clock bus is the CPU clock selected by the D1CPRE prescaler.
   --  The AHB2 clock bus is the AXI, AHB1 and AHB2 peripheral clock selected
   --  by the HPRE prescaler. Example to create a variable:
   --  AHB_PRE  : AHB_Prescaler := (Enabled => True, Value => DIV2);

   type APB_Prescaler_Enum is
     (DIV2,  DIV4,  DIV8,  DIV16)
     with Size => 2;

   type APB_Prescaler is record
      Enabled : Boolean;
      Value   : APB_Prescaler_Enum := APB_Prescaler_Enum'First;
   end record with Size => 3;

   for APB_Prescaler use record
      Enabled at 0 range 2 .. 2;
      Value   at 0 range 0 .. 1;
   end record;

   type APB_Clock_Range is (APB_1, APB_2, APB_3, APB_4);

   procedure Configure_APB_Clock_Prescaler
     (Bus   : APB_Clock_Range;
      Value : APB_Prescaler);
   --  The APB1 clock bus is the APB1 peripheral clock selected by the D2PPRE1
   --  prescaler.
   --  The APB2 clock bus is the APB2 peripheral clock selected by the D2PPRE2
   --  prescaler.
   --  The APB3 clock bus is the APB3 peripheral clock selected by the D1PPRE
   --  prescaler.
   --  The APB4 clock bus is the APB4 peripheral clock selected by the D3PPRE
   --  prescaler. Example to create a variable:
   --  APB_PRE  : APB_Prescaler := (Enabled => True, Value => DIV2);

   ----------------
   -- PLL Clocks --
   ----------------

   type PLL_Source is
     (PLL_SRC_HSI,
      PLL_SRC_CSI,
      PLL_SRC_HSE)
     with Size => 2;

   for PLL_Source use
     (PLL_SRC_HSI   => 2#00#,
      PLL_SRC_CSI   => 2#01#,
      PLL_SRC_HSE   => 2#10#);

   procedure Configure_PLL_Source_Mux (Source : PLL_Source);

   type PLL_Range is (PLL_1, PLL_2, PLL_3);

   subtype PLLM_Range   is Integer range 1 ..  63;
   subtype PLLN_Range   is Integer range 4 .. 512;
   subtype PLLP_Range   is Integer range 1 .. 128; --  PLL1P only even numbers
   subtype PLLQ_Range   is Integer range 1 .. 128;
   subtype PLLR_Range   is Integer range 1 .. 128;

   type PLL_Input_Frequency is
     (Clock_1_To_2MHz,
      Clock_2_To_4MHz,
      Clock_4_To_8MHz,
      Clock_8_To_16MHz);

   type PLL_VCO_Selector is
     (Wide_192_To_836MHz,
      Medium_150_To_420MHz);

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
     with Pre => (if PLL = PLL_1 then PLLP rem 2 = 0);
   --  Configure PLL according with RM0433 rev 7 Chapter 8.5.5 section "PLL
   --  initialization phase pg 345. If the PLL will operate in fractional mode
   --  turn on the Fractional_Mode and set the corret value of the fractional
   --  divider in the Sigma_Delta modulator.

   procedure Configure_PLL_Fraction
     (PLL      : PLL_Range;
      Fraction : UInt13);
   --  Tune the frequency in fractional mode on-the-fly.

   ---------------
   -- PER Clock --
   ---------------

   type PER_Source is
     (PER_SRC_HSI,
      PER_SRC_CSI,
      PER_SRC_HSE)
     with Size => 2;

   procedure Configure_PER_Source_Mux (Source : PER_Source);

   ---------------
   -- TIM Clock --
   ---------------

   type TIM_Source is (Factor_2, Factor_4);

   procedure Configure_TIM_Source (Source : TIM_Source);
   --  Select the clock frequency of all the timers connected to APB1 and APB2
   --  domains.
   --  When 0 (Factor_2), APB1 and APB2 Timer clocks are equal to APB1 and APB2
   --  Peripheral clocks when D2PPREx is 1 or 2, else they are equal to 2x APB1
   --  and APB2.
   --  When 1 (Factor_4), APB1 and APB2 Timer clocks are equal to APB1 and APB2
   --  Peripheral clocks when D2PPREx is 1, 2 or 4, else they are equal to 4x
   --  APB1 and APB2.

   -------------------
   -- Output Clocks --
   -------------------

   type MCO_Source is
     (Option_1,
      Option_2,
      HSE,
      Option_4,
      Option_5,
      Option_6)
     with Size => 3;
   --  List of MCO sources
   --            MCO1   MCO2
   --  Option_1  HSI    SYSCLK
   --  Option_2  LSE    PLL2P
   --  Option_4  PLL1Q  PLL1P
   --  Option_5  HSI48  CSI
   --  Option_6         LSI

   type MCO_Prescaler is
     (MCOPRE_Disabled,
      MCOPRE_DIV1, --  Bypass
      MCOPRE_DIV2,
      MCOPRE_DIV3,
      MCOPRE_DIV4,
      MCOPRE_DIV5,
      MCOPRE_DIV6,
      MCOPRE_DIV7,
      MCOPRE_DIV8,
      MCOPRE_DIV9,
      MCOPRE_DIV10,
      MCOPRE_DIV11,
      MCOPRE_DIV12,
      MCOPRE_DIV13,
      MCOPRE_DIV14,
      MCOPRE_DIV15)
     with Size => 4;

   type MCO_Range is (MCO_1, MCO_2);

   procedure Configure_MCO_Output_Clock
     (MCO    : MCO_Range;
      Source : MCO_Source;
      Value  : MCO_Prescaler)
     with Pre => (if MCO = MCO_1 then Source /= Option_6);
   --  Select the source for micro-controller clock output.

   ------------------
   -- Flash Memory --
   ------------------

   --  Flash wait states
   type FLASH_Wait_State is (FWS0, FWS1, FWS2, FWS3, FWS4)
     with Size => 4;

   procedure Set_FLASH_Latency (Latency : FLASH_Wait_State);
   --  Constants for Flash read latency with VCORE Range in relation to
   --  AXI Interface clock frequency (MHz) (AXI clock is HCLK2):
   --  RM0433 STM32H743 pg. 159 table 17 chapter 4.3.8.

   --  VCORE range                VOS3 |      VOS2 |      VOS1 |      VOS0
   --  000: Zero wait state    0 -  45 |   0 -  55 |   0 -  70 |   0 -  70
   --  001: One wait state    45 -  90 |  55 - 110 |  70 - 140 |  70 - 140
   --  010: Two wait sates    90 - 135 | 110 - 165 | 140 - 210 | 140 - 210
   --  011: Three wait sates 135 - 180 | 165 - 225 | 210 - 225 | 210 - 225
   --  100: Four wait sates  180 - 225 |       225 |           | 225 - 240

   procedure Set_CPU_Cache (Enable : Boolean);

   -------------------
   -- VCORE Scaling --
   -------------------

   type VCORE_Scaling_Selection is
     (Scale_3,
      Scale_2,
      Scale_1);

   for VCORE_Scaling_Selection use
     (Scale_3 => 2#01#,
      Scale_2 => 2#10#,
      Scale_1 => 2#11#);

   procedure Set_VCORE_Scaling (Scale : VCORE_Scaling_Selection);

   procedure PWR_Overdrive_Enable;
   --  The system maximum frequency can be reached by boosting the voltage
   --  scaling level to VOS0. This is done through the ODEN bit in the
   --  SYSCFG_PWRCR register, after configuring level VOS1.
   --  See RM0433 ver 7 pg. 277 chapter 6.6.2 for this sequence.

end STM32.RCC;
