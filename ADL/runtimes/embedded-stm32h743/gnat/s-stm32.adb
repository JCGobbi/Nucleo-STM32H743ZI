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

with Ada.Unchecked_Conversion;

with System.BB.Parameters;

with Interfaces;            use Interfaces;
with Interfaces.STM32;      use Interfaces.STM32;
with Interfaces.STM32.RCC;  use Interfaces.STM32.RCC;

package body System.STM32 is

   package Param renames System.BB.Parameters;

   HPRE_Presc_Table : constant array (AHB_Prescaler_Enum) of UInt32 :=
     (2, 4, 8, 16, 64, 128, 256, 512);

   PPRE_Presc_Table : constant array (APB_Prescaler_Enum) of UInt32 :=
     (2, 4, 8, 16);

   -------------------
   -- System_Clocks --
   -------------------

   function System_Clocks return RCC_System_Clocks
   is
      Source : constant SYSCLK_Source :=
        SYSCLK_Source'Val (RCC_Periph.CFGR.SWS);

      Result : RCC_System_Clocks;

   begin
      --  System clock Mux
      case Source is
         --  HSE as source
         when SYSCLK_SRC_HSE =>
            Result.SYSCLK := Param.HSE_Clock;

         --  HSI as source
         when SYSCLK_SRC_HSI =>
            Result.SYSCLK :=
              Param.HSI_Clock / (2 ** Natural (RCC_Periph.CR.HSIDIV));

         --  HSE as source
         when SYSCLK_SRC_CSI =>
            Result.SYSCLK := Param.CSI_Clock;

         --  PLL1 as source
         when SYSCLK_SRC_PLL =>
            declare
               Pllm : constant UInt32 := UInt32 (RCC_Periph.PLLCKSELR.DIVM1);
               --  Get the correct value of Pll M divisor
               Plln : constant UInt32 :=
                 UInt32 (RCC_Periph.PLL1DIVR.DIVN1 + 1);
               --  Get the correct value of Pll N multiplier
               Pllp : constant UInt32 :=
                 UInt32 (RCC_Periph.PLL1DIVR.DIVP1 + 1);
               --  Get the correct value of Pll P divisor
               PLLSRC : constant PLL_Source :=
                 PLL_Source'Val (RCC_Periph.PLLCKSELR.PLLSRC);
               --  Get PLL Source Mux
               PLLCLK : UInt32;
            begin
               case PLLSRC is
                  when PLL_SRC_HSE => --  HSE as source
                     PLLCLK := ((Param.HSE_Clock / Pllm) * Plln) / Pllp;
                  when PLL_SRC_HSI => --  HSI as source
                     PLLCLK := ((Param.HSI_Clock / Pllm) * Plln) / Pllp;
                  when PLL_SRC_CSI => --  CSI as source
                     PLLCLK := ((Param.CSI_Clock / Pllm) * Plln) / Pllp;
               end case;
               Result.SYSCLK := PLLCLK;
            end;
      end case;

      declare
         function To_AHBP is new Ada.Unchecked_Conversion
           (UInt4, AHB_Prescaler);
         function To_APBP is new Ada.Unchecked_Conversion
           (UInt3, APB_Prescaler);

         --  Get value of AHB1_PRE (D1CPRE prescaler)
         HPRE1 : constant AHB_Prescaler := To_AHBP (RCC_Periph.D1CFGR.D1CPRE);
         HPRE1_Div : constant UInt32 := (if HPRE1.Enabled
                                         then HPRE_Presc_Table (HPRE1.Value)
                                         else 1);
         --  Get the value of AHB2_PRE (HPRE prescaler)
         HPRE2 : constant AHB_Prescaler := To_AHBP (RCC_Periph.D1CFGR.HPRE);
         HPRE2_Div : constant UInt32 := (if HPRE2.Enabled
                                         then HPRE_Presc_Table (HPRE2.Value)
                                         else 1);
         --  Get the value of APB1_PRE (D2PPRE1 prescaler)
         PPRE1 : constant APB_Prescaler := To_APBP (RCC_Periph.D2CFGR.D2PPRE1);
         PPRE1_Div : constant UInt32 := (if PPRE1.Enabled
                                         then PPRE_Presc_Table (PPRE1.Value)
                                         else 1);
         --  Get the value of APB2_PRE (D2PPRE2 prescaler)
         PPRE2 : constant APB_Prescaler := To_APBP (RCC_Periph.D2CFGR.D2PPRE2);
         PPRE2_Div : constant UInt32 := (if PPRE2.Enabled
                                         then PPRE_Presc_Table (PPRE2.Value)
                                         else 1);
         --  Get the value of APB3_PRE (D1PPRE prescaler)
         PPRE3 : constant APB_Prescaler := To_APBP (RCC_Periph.D1CFGR.D1PPRE);
         PPRE3_Div : constant UInt32 := (if PPRE3.Enabled
                                         then PPRE_Presc_Table (PPRE3.Value)
                                         else 1);
         --  Get the value of APB4_PRE (D3PPRE prescaler)
         PPRE4 : constant APB_Prescaler := To_APBP (RCC_Periph.D3CFGR.D3PPRE);
         PPRE4_Div : constant UInt32 := (if PPRE4.Enabled
                                         then PPRE_Presc_Table (PPRE4.Value)
                                         else 1);

      begin
         Result.HCLK1 := Result.SYSCLK / HPRE1_Div;
         Result.HCLK2 := Result.HCLK1 / HPRE2_Div;
         Result.PCLK1 := Result.HCLK2 / PPRE1_Div;
         Result.PCLK2 := Result.HCLK2 / PPRE2_Div;
         Result.PCLK3 := Result.HCLK2 / PPRE3_Div;
         Result.PCLK4 := Result.HCLK2 / PPRE4_Div;

         --  Timer clocks
         --  If APB1 (D2PPRE1) and APB2 (D2PPRE2) prescaler (D2PPRE1, D2PPRE2
         --  in the RCC_D2CFGR register) are configured to a division factor of
         --  1 or 2 with RCC_CFGR.TIMPRE = 0 (or also 4 with RCC_CFGR.TIMPRE
         --  = 1), then TIMxCLK = PCLKx.
         --  Otherwise, the timer clock frequencies are set to twice to the
         --  frequency of the APB domain to which the timers are connected with
         --  RCC_CFGR.TIMPRE = 0, so TIMxCLK = 2 x PCLKx (or TIMxCLK =
         --  4 x PCLKx with RCC_CFGR.TIMPRE = 1).

         case RCC_Periph.CFGR.TIMPRE is
            when 0 =>
               --  TIMs 2 .. 7, 12 .. 14
               if PPRE1_Div <= 2 then
                  Result.TIMCLK1 := Result.PCLK1;
               else
                  Result.TIMCLK1 := Result.PCLK1 * 2;
               end if;
               --  TIMs TIMs 1, 8, 15 .. 17
               if PPRE2_Div <= 2 then
                  Result.TIMCLK2 := Result.PCLK2;
               else
                  Result.TIMCLK2 := Result.PCLK2 * 2;
               end if;
            when 1 =>
               --  TIMs 2 .. 7, 12 .. 14
               if PPRE1_Div <= 4 then
                  Result.TIMCLK1 := Result.PCLK1;
               else
                  Result.TIMCLK1 := Result.PCLK1 * 4;
               end if;
               --  TIMs 1, 8, 15 .. 17
               if PPRE2_Div <= 4 then
                  Result.TIMCLK2 := Result.PCLK2;
               else
                  Result.TIMCLK2 := Result.PCLK2 * 4;
               end if;
         end case;

         --  HRTIM clock
         --  If RCC_CFGR.HRTIMSEL = 0, HRTIM prescaler clock cource is the same
         --  as timer 2 (TIMCLK1), otherwise it is the CPU clock (HCLK2).
         case RCC_Periph.CFGR.HRTIMSEL is
            when 0 =>
               Result.TIMCLK3 := Result.TIMCLK1;
            when 1 =>
               Result.TIMCLK3 := Result.HCLK1;
         end case;
      end;

      return Result;
   end System_Clocks;

end System.STM32;
