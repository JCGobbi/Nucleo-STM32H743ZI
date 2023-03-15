------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--          Copyright (C) 2012-2016, Free Software Foundation, Inc.         --
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

with Interfaces.STM32;

package System.STM32 is
   pragma No_Elaboration_Code_All;
   pragma Preelaborate (System.STM32);

   subtype Frequency is Interfaces.STM32.UInt32;

   --  See RM0433 rev. 7 pg. 334 chapter 8.5, and pg. 335 for clock tree
   type RCC_System_Clocks is record
      SYSCLK    : Frequency;
      HCLK1     : Frequency; --  CPU clock
      HCLK2     : Frequency; --  AHBs peripheral clocks
      PCLK1     : Frequency; --  APB1 peripheral clock (D2PPRE1)
      PCLK2     : Frequency; --  APB2 peripheral clock (D2PPRE2)
      PCLK3     : Frequency; --  APB3 peripheral clock (D1PPRE)
      PCLK4     : Frequency; --  APB4 peripheral clock (D3PPRE)
      TIMCLK1   : Frequency; --  APB1 timer clock for TIMs 2 .. 7, 12 .. 14
      TIMCLK2   : Frequency; --  APB2 timer clock for TIMs 1, 8, 15 .. 17
      TIMCLK3   : Frequency; --  APB1 timer clock for HRTIM1
   end record;

   function System_Clocks return RCC_System_Clocks;

   --  MODER constants
   subtype GPIO_MODER_Values is Interfaces.STM32.UInt2;
   Mode_IN  : constant GPIO_MODER_Values := 0;
   Mode_OUT : constant GPIO_MODER_Values := 1;
   Mode_AF  : constant GPIO_MODER_Values := 2;
   Mode_AN  : constant GPIO_MODER_Values := 3;

   --  OTYPER constants
   subtype GPIO_OTYPER_Values is Interfaces.STM32.Bit;
   Push_Pull  : constant GPIO_OTYPER_Values := 0;
   Open_Drain : constant GPIO_OTYPER_Values := 1;

   --  OSPEEDR constants
   subtype GPIO_OSPEEDR_Values is Interfaces.STM32.UInt2;
   Speed_2MHz   : constant GPIO_OSPEEDR_Values := 0; -- Low speed
   Speed_25MHz  : constant GPIO_OSPEEDR_Values := 1; -- Medium speed
   Speed_50MHz  : constant GPIO_OSPEEDR_Values := 2; -- Fast speed
   Speed_100MHz : constant GPIO_OSPEEDR_Values := 3; -- High speed

   --  PUPDR constants
   subtype GPIO_PUPDR_Values is Interfaces.STM32.UInt2;
   No_Pull   : constant GPIO_PUPDR_Values := 0;
   Pull_Up   : constant GPIO_PUPDR_Values := 1;
   Pull_Down : constant GPIO_PUPDR_Values := 2;

   --  AFL constants
   AF_USART1  : constant Interfaces.STM32.UInt4 := 7;
   AF_USART3  : constant Interfaces.STM32.UInt4 := 7;

   type MCU_ID_Register is record
      DEV_ID   : Interfaces.STM32.UInt12;
      Reserved : Interfaces.STM32.UInt4;
      REV_ID   : Interfaces.STM32.UInt16;
   end record with Pack, Size => 32;

   --  RCC constants

   type PLL_Source is
     (PLL_SRC_HSI,
      PLL_SRC_CSI,
      PLL_SRC_HSE)
     with Size => 2;

   for PLL_Source use
     (PLL_SRC_HSI   => 2#00#,
      PLL_SRC_CSI   => 2#01#,
      PLL_SRC_HSE   => 2#10#);

   type SYSCLK_Source is
     (SYSCLK_SRC_HSI,
      SYSCLK_SRC_CSI,
      SYSCLK_SRC_HSE,
      SYSCLK_SRC_PLL)
     with Size => 3;

   for SYSCLK_Source use
     (SYSCLK_SRC_HSI => 2#000#,
      SYSCLK_SRC_CSI => 2#001#,
      SYSCLK_SRC_HSE => 2#010#,
      SYSCLK_SRC_PLL => 2#011#);

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

   type MCO1_Clock_Selection is
     (MCOSEL_HSI,
      MCOSEL_LSE,
      MCOSEL_HSE,
      MCOSEL_PLL1,
      MCOSEL_HSI48)
     with Size => 3;

   type MCO2_Clock_Selection is
     (MCOSEL_SYSCLK,
      MCOSEL_PLL2,
      MCOSEL_HSE,
      MCOSEL_PLL1,
      MCOSEL_CSI,
      MCOSEL_LSI)
     with Size => 3;

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

   type HSI_Divisor is
     (HSI_DIV1,
      HSI_DIV2,
      HSI_DIV4,
      HSI_DIV8)
     with Size => 2;

   type PER_Source is
     (PER_SRC_HSI,
      PER_SRC_CSI,
      PER_SRC_HSE)
     with Size => 2;

   --  Constants for RCC CR register

   subtype PLLM_Range   is Integer range 1 ..  63;
   subtype PLLN_Range   is Integer range 4 .. 512;
   subtype PLL1P_Range  is Integer range 2 .. 128; --  Only even numbers
   subtype PLL23P_Range is Integer range 1 .. 128;
   subtype PLLQ_Range   is Integer range 1 .. 128;
   subtype PLLR_Range   is Integer range 1 .. 128;

   subtype HSECLK_Range    is Integer range   4_000_000 ..  50_000_000;
   subtype PLLM_OUT_Range  is Integer range   1_000_000 ..  16_000_000;
   subtype PLLN_OUT_Range  is Integer range 150_000_000 .. 960_000_000;
   subtype PLL1P_OUT_Range is Integer range   1_500_000 .. 480_000_000;
   subtype PLL2P_OUT_Range is Integer range   1_500_000 .. 300_000_000;
   subtype PLL3P_OUT_Range is Integer range   1_500_000 .. 200_000_000;
   subtype PLL1Q_OUT_Range is Integer range   1_500_000 .. 400_000_000;
   subtype PLL2Q_OUT_Range is Integer range   1_500_000 .. 300_000_000;
   subtype PLL3Q_OUT_Range is Integer range   1_500_000 .. 200_000_000;
   subtype PLLCLK_Range    is Integer range 192_000_000 .. 836_000_000;
   subtype SYSCLK_Range    is Integer range           1 .. 480_000_000;
   subtype HCLK1_Range     is Integer range           1 .. 480_000_000;
   subtype HCLK2_Range     is Integer range           1 .. 240_000_000;
   subtype PCLK1_Range     is Integer range           1 .. 120_000_000;
   subtype PCLK2_Range     is Integer range           1 .. 120_000_000;
   subtype PCLK3_Range     is Integer range           1 .. 120_000_000;
   subtype PCLK4_Range     is Integer range           1 .. 120_000_000;

   --  Constants for Flash read latency with VCORE Range in relation to
   --  AXI Interface clock frequency (MHz) (AXI clock is HCLK2):
   --  RM0433 STM32H743 pg. 159 table 17 chapter 4.3.8.

   --  VCORE range                VOS3 |      VOS2 |      VOS1 |      VOS0
   --  000: Zero wait state    0 -  45 |   0 -  55 |   0 -  70 |   0 -  70
   --  001: One wait state    45 -  90 |  55 - 110 |  70 - 140 |  70 - 140
   --  010: Two wait sates    90 - 135 | 110 - 165 | 140 - 210 | 140 - 210
   --  011: Three wait sates 135 - 180 | 165 - 225 | 210 - 225 | 210 - 225
   --  100: Four wait sates  180 - 225 |       225 |           | 225 - 240

   subtype FLASH_Latency_0 is Integer range           1 ..  70_000_000;
   subtype FLASH_Latency_1 is Integer range  71_000_000 .. 140_000_000;
   subtype FLASH_Latency_2 is Integer range 141_000_000 .. 210_000_000;
   subtype FLASH_Latency_3 is Integer range 211_000_000 .. 225_000_000;
   subtype FLASH_Latency_4 is Integer range 226_000_000 .. 240_000_000;

   --  Flash wait states
   type FLASH_WS is (FWS0, FWS1, FWS2, FWS3, FWS4)
     with Size => 4;

   FLASH_Latency : Interfaces.STM32.UInt4 := FLASH_WS'Enum_Rep (FWS4);

   type VCORE_Scaling_Selection is
     (Scale_3,
      Scale_2,
      Scale_1);

   for VCORE_Scaling_Selection use
     (Scale_3 => 2#01#,
      Scale_2 => 2#10#,
      Scale_1 => 2#11#);

   MCU_ID : MCU_ID_Register
     with Volatile, Address => System'To_Address (16#E00E_1000#);
   --  DBGMCU_IDC Identity code register, also at CPU address 16#5C00_1000#.
   --  RM0433 rev 7 pg. 3189 chapter 60.5.8.

   DEV_ID_STM32F40xxx : constant := 16#413#; --  STM32F40xxx/41xxx
   DEV_ID_STM32F42xxx : constant := 16#419#; --  STM32F42xxx/43xxx
   DEV_ID_STM32F46xxx : constant := 16#434#; --  STM32F469xx/479xx
   DEV_ID_STM32F74xxx : constant := 16#449#; --  STM32F74xxx/75xxx
   DEV_ID_STM32F76xxx : constant := 16#451#; --  STM32F76xxx/77xxx
   DEV_ID_STM32F334xx : constant := 16#438#; --  STM32F334xx
   DEV_ID_STM32G474x2 : constant := 16#468#; --  STM32G474xx category 2
   DEV_ID_STM32G474x3 : constant := 16#469#; --  STM32G474xx category 3
   DEV_ID_STM32G474x4 : constant := 16#479#; --  STM32G474xx category 4
   DEV_ID_STM32H743   : constant := 16#450#; --  STM32H742/743/753/750

end System.STM32;
