--
--  Copyright (C) 2021, AdaCore
--

pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32H743x.svd


with System;

package Interfaces.STM32.RCC is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR_HSION_Field is Interfaces.STM32.Bit;
   subtype CR_HSIKERON_Field is Interfaces.STM32.Bit;
   subtype CR_HSIRDY_Field is Interfaces.STM32.Bit;
   subtype CR_HSIDIV_Field is Interfaces.STM32.UInt2;
   subtype CR_HSIDIVF_Field is Interfaces.STM32.Bit;
   subtype CR_CSION_Field is Interfaces.STM32.Bit;
   subtype CR_CSIRDY_Field is Interfaces.STM32.Bit;
   subtype CR_CSIKERON_Field is Interfaces.STM32.Bit;
   subtype CR_HSI48ON_Field is Interfaces.STM32.Bit;
   subtype CR_HSI48RDY_Field is Interfaces.STM32.Bit;
   subtype CR_D1CKRDY_Field is Interfaces.STM32.Bit;
   subtype CR_D2CKRDY_Field is Interfaces.STM32.Bit;
   subtype CR_HSEON_Field is Interfaces.STM32.Bit;
   subtype CR_HSERDY_Field is Interfaces.STM32.Bit;
   subtype CR_HSEBYP_Field is Interfaces.STM32.Bit;
   subtype CR_HSECSSON_Field is Interfaces.STM32.Bit;
   subtype CR_PLL1ON_Field is Interfaces.STM32.Bit;
   subtype CR_PLL1RDY_Field is Interfaces.STM32.Bit;
   subtype CR_PLL2ON_Field is Interfaces.STM32.Bit;
   subtype CR_PLL2RDY_Field is Interfaces.STM32.Bit;
   subtype CR_PLL3ON_Field is Interfaces.STM32.Bit;
   subtype CR_PLL3RDY_Field is Interfaces.STM32.Bit;

   --  clock control register
   type CR_Register is record
      --  Internal high-speed clock enable
      HSION          : CR_HSION_Field := 16#1#;
      --  High Speed Internal clock enable in Stop mode
      HSIKERON       : CR_HSIKERON_Field := 16#1#;
      --  HSI clock ready flag
      HSIRDY         : CR_HSIRDY_Field := 16#0#;
      --  HSI clock divider
      HSIDIV         : CR_HSIDIV_Field := 16#0#;
      --  HSI divider flag
      HSIDIVF        : CR_HSIDIVF_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : Interfaces.STM32.Bit := 16#0#;
      --  CSI clock enable
      CSION          : CR_CSION_Field := 16#1#;
      --  CSI clock ready flag
      CSIRDY         : CR_CSIRDY_Field := 16#0#;
      --  CSI clock enable in Stop mode
      CSIKERON       : CR_CSIKERON_Field := 16#0#;
      --  unspecified
      Reserved_10_11 : Interfaces.STM32.UInt2 := 16#0#;
      --  RC48 clock enable
      HSI48ON        : CR_HSI48ON_Field := 16#0#;
      --  RC48 clock ready flag
      HSI48RDY       : CR_HSI48RDY_Field := 16#0#;
      --  D1 domain clocks ready flag
      D1CKRDY        : CR_D1CKRDY_Field := 16#0#;
      --  D2 domain clocks ready flag
      D2CKRDY        : CR_D2CKRDY_Field := 16#0#;
      --  HSE clock enable
      HSEON          : CR_HSEON_Field := 16#0#;
      --  HSE clock ready flag
      HSERDY         : CR_HSERDY_Field := 16#0#;
      --  HSE clock bypass
      HSEBYP         : CR_HSEBYP_Field := 16#0#;
      --  HSE Clock Security System enable
      HSECSSON       : CR_HSECSSON_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : Interfaces.STM32.UInt4 := 16#0#;
      --  PLL1 enable
      PLL1ON         : CR_PLL1ON_Field := 16#0#;
      --  PLL1 clock ready flag
      PLL1RDY        : CR_PLL1RDY_Field := 16#0#;
      --  PLL2 enable
      PLL2ON         : CR_PLL2ON_Field := 16#0#;
      --  PLL2 clock ready flag
      PLL2RDY        : CR_PLL2RDY_Field := 16#0#;
      --  PLL3 enable
      PLL3ON         : CR_PLL3ON_Field := 16#0#;
      --  PLL3 clock ready flag
      PLL3RDY        : CR_PLL3RDY_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : Interfaces.STM32.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      HSION          at 0 range 0 .. 0;
      HSIKERON       at 0 range 1 .. 1;
      HSIRDY         at 0 range 2 .. 2;
      HSIDIV         at 0 range 3 .. 4;
      HSIDIVF        at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      CSION          at 0 range 7 .. 7;
      CSIRDY         at 0 range 8 .. 8;
      CSIKERON       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      HSI48ON        at 0 range 12 .. 12;
      HSI48RDY       at 0 range 13 .. 13;
      D1CKRDY        at 0 range 14 .. 14;
      D2CKRDY        at 0 range 15 .. 15;
      HSEON          at 0 range 16 .. 16;
      HSERDY         at 0 range 17 .. 17;
      HSEBYP         at 0 range 18 .. 18;
      HSECSSON       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      PLL1ON         at 0 range 24 .. 24;
      PLL1RDY        at 0 range 25 .. 25;
      PLL2ON         at 0 range 26 .. 26;
      PLL2RDY        at 0 range 27 .. 27;
      PLL3ON         at 0 range 28 .. 28;
      PLL3RDY        at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype ICSCR_HSICAL_Field is Interfaces.STM32.UInt12;
   subtype ICSCR_HSITRIM_Field is Interfaces.STM32.UInt6;
   subtype ICSCR_CSICAL_Field is Interfaces.STM32.Byte;
   subtype ICSCR_CSITRIM_Field is Interfaces.STM32.UInt5;

   --  RCC Internal Clock Source Calibration Register
   type ICSCR_Register is record
      --  Read-only. HSI clock calibration
      HSICAL         : ICSCR_HSICAL_Field := 16#0#;
      --  HSI clock trimming
      HSITRIM        : ICSCR_HSITRIM_Field := 16#0#;
      --  Read-only. CSI clock calibration
      CSICAL         : ICSCR_CSICAL_Field := 16#0#;
      --  CSI clock trimming
      CSITRIM        : ICSCR_CSITRIM_Field := 16#10#;
      --  unspecified
      Reserved_31_31 : Interfaces.STM32.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICSCR_Register use record
      HSICAL         at 0 range 0 .. 11;
      HSITRIM        at 0 range 12 .. 17;
      CSICAL         at 0 range 18 .. 25;
      CSITRIM        at 0 range 26 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype CRRCR_RC48CAL_Field is Interfaces.STM32.UInt10;

   --  RCC Clock Recovery RC Register
   type CRRCR_Register is record
      --  Read-only. Internal RC 48 MHz clock calibration
      RC48CAL        : CRRCR_RC48CAL_Field;
      --  unspecified
      Reserved_10_31 : Interfaces.STM32.UInt22;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRRCR_Register use record
      RC48CAL        at 0 range 0 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype CFGR_SW_Field is Interfaces.STM32.UInt3;
   subtype CFGR_SWS_Field is Interfaces.STM32.UInt3;
   subtype CFGR_STOPWUCK_Field is Interfaces.STM32.Bit;
   subtype CFGR_STOPKERWUCK_Field is Interfaces.STM32.Bit;
   subtype CFGR_RTCPRE_Field is Interfaces.STM32.UInt6;
   subtype CFGR_HRTIMSEL_Field is Interfaces.STM32.Bit;
   subtype CFGR_TIMPRE_Field is Interfaces.STM32.Bit;
   subtype CFGR_MCO1PRE_Field is Interfaces.STM32.UInt4;
   subtype CFGR_MCO1SEL_Field is Interfaces.STM32.UInt3;
   subtype CFGR_MCO2PRE_Field is Interfaces.STM32.UInt4;
   subtype CFGR_MCO2SEL_Field is Interfaces.STM32.UInt3;

   --  RCC Clock Configuration Register
   type CFGR_Register is record
      --  System clock switch
      SW             : CFGR_SW_Field := 16#0#;
      --  System clock switch status
      SWS            : CFGR_SWS_Field := 16#0#;
      --  System clock selection after a wake up from system Stop
      STOPWUCK       : CFGR_STOPWUCK_Field := 16#0#;
      --  Kernel clock selection after a wake up from system Stop
      STOPKERWUCK    : CFGR_STOPKERWUCK_Field := 16#0#;
      --  HSE division factor for RTC clock
      RTCPRE         : CFGR_RTCPRE_Field := 16#0#;
      --  High Resolution Timer clock prescaler selection
      HRTIMSEL       : CFGR_HRTIMSEL_Field := 16#0#;
      --  Timers clocks prescaler selection
      TIMPRE         : CFGR_TIMPRE_Field := 16#0#;
      --  unspecified
      Reserved_16_17 : Interfaces.STM32.UInt2 := 16#0#;
      --  MCO1 prescaler
      MCO1PRE        : CFGR_MCO1PRE_Field := 16#0#;
      --  Micro-controller clock output 1
      MCO1SEL        : CFGR_MCO1SEL_Field := 16#0#;
      --  MCO2 prescaler
      MCO2PRE        : CFGR_MCO2PRE_Field := 16#0#;
      --  Micro-controller clock output 2
      MCO2SEL        : CFGR_MCO2SEL_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR_Register use record
      SW             at 0 range 0 .. 2;
      SWS            at 0 range 3 .. 5;
      STOPWUCK       at 0 range 6 .. 6;
      STOPKERWUCK    at 0 range 7 .. 7;
      RTCPRE         at 0 range 8 .. 13;
      HRTIMSEL       at 0 range 14 .. 14;
      TIMPRE         at 0 range 15 .. 15;
      Reserved_16_17 at 0 range 16 .. 17;
      MCO1PRE        at 0 range 18 .. 21;
      MCO1SEL        at 0 range 22 .. 24;
      MCO2PRE        at 0 range 25 .. 28;
      MCO2SEL        at 0 range 29 .. 31;
   end record;

   subtype D1CFGR_HPRE_Field is Interfaces.STM32.UInt4;
   subtype D1CFGR_D1PPRE_Field is Interfaces.STM32.UInt3;
   subtype D1CFGR_D1CPRE_Field is Interfaces.STM32.UInt4;

   --  RCC Domain 1 Clock Configuration Register
   type D1CFGR_Register is record
      --  D1 domain AHB prescaler
      HPRE           : D1CFGR_HPRE_Field := 16#0#;
      --  D1 domain APB3 prescaler
      D1PPRE         : D1CFGR_D1PPRE_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.STM32.Bit := 16#0#;
      --  D1 domain Core prescaler
      D1CPRE         : D1CFGR_D1CPRE_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : Interfaces.STM32.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for D1CFGR_Register use record
      HPRE           at 0 range 0 .. 3;
      D1PPRE         at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      D1CPRE         at 0 range 8 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype D2CFGR_D2PPRE1_Field is Interfaces.STM32.UInt3;
   subtype D2CFGR_D2PPRE2_Field is Interfaces.STM32.UInt3;

   --  RCC Domain 2 Clock Configuration Register
   type D2CFGR_Register is record
      --  unspecified
      Reserved_0_3   : Interfaces.STM32.UInt4 := 16#0#;
      --  D2 domain APB1 prescaler
      D2PPRE1        : D2CFGR_D2PPRE1_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.STM32.Bit := 16#0#;
      --  D2 domain APB2 prescaler
      D2PPRE2        : D2CFGR_D2PPRE2_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : Interfaces.STM32.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for D2CFGR_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      D2PPRE1        at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      D2PPRE2        at 0 range 8 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype D3CFGR_D3PPRE_Field is Interfaces.STM32.UInt3;

   --  RCC Domain 3 Clock Configuration Register
   type D3CFGR_Register is record
      --  unspecified
      Reserved_0_3  : Interfaces.STM32.UInt4 := 16#0#;
      --  D3 domain APB4 prescaler
      D3PPRE        : D3CFGR_D3PPRE_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : Interfaces.STM32.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for D3CFGR_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      D3PPRE        at 0 range 4 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype PLLCKSELR_PLLSRC_Field is Interfaces.STM32.UInt2;
   subtype PLLCKSELR_DIVM1_Field is Interfaces.STM32.UInt6;
   subtype PLLCKSELR_DIVM2_Field is Interfaces.STM32.UInt6;
   subtype PLLCKSELR_DIVM3_Field is Interfaces.STM32.UInt6;

   --  RCC PLLs Clock Source Selection Register
   type PLLCKSELR_Register is record
      --  DIVMx and PLLs clock source selection
      PLLSRC         : PLLCKSELR_PLLSRC_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : Interfaces.STM32.UInt2 := 16#0#;
      --  Prescaler for PLL1
      DIVM1          : PLLCKSELR_DIVM1_Field := 16#20#;
      --  unspecified
      Reserved_10_11 : Interfaces.STM32.UInt2 := 16#0#;
      --  Prescaler for PLL2
      DIVM2          : PLLCKSELR_DIVM2_Field := 16#20#;
      --  unspecified
      Reserved_18_19 : Interfaces.STM32.UInt2 := 16#0#;
      --  Prescaler for PLL3
      DIVM3          : PLLCKSELR_DIVM3_Field := 16#20#;
      --  unspecified
      Reserved_26_31 : Interfaces.STM32.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLLCKSELR_Register use record
      PLLSRC         at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      DIVM1          at 0 range 4 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      DIVM2          at 0 range 12 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      DIVM3          at 0 range 20 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype PLLCFGR_PLL1FRACEN_Field is Interfaces.STM32.Bit;
   subtype PLLCFGR_PLL1VCOSEL_Field is Interfaces.STM32.Bit;
   subtype PLLCFGR_PLL1RGE_Field is Interfaces.STM32.UInt2;
   subtype PLLCFGR_PLL2FRACEN_Field is Interfaces.STM32.Bit;
   subtype PLLCFGR_PLL2VCOSEL_Field is Interfaces.STM32.Bit;
   subtype PLLCFGR_PLL2RGE_Field is Interfaces.STM32.UInt2;
   subtype PLLCFGR_PLL3FRACEN_Field is Interfaces.STM32.Bit;
   subtype PLLCFGR_PLL3VCOSEL_Field is Interfaces.STM32.Bit;
   subtype PLLCFGR_PLL3RGE_Field is Interfaces.STM32.UInt2;
   subtype PLLCFGR_DIVP1EN_Field is Interfaces.STM32.Bit;
   subtype PLLCFGR_DIVQ1EN_Field is Interfaces.STM32.Bit;
   subtype PLLCFGR_DIVR1EN_Field is Interfaces.STM32.Bit;
   subtype PLLCFGR_DIVP2EN_Field is Interfaces.STM32.Bit;
   subtype PLLCFGR_DIVQ2EN_Field is Interfaces.STM32.Bit;
   subtype PLLCFGR_DIVR2EN_Field is Interfaces.STM32.Bit;
   subtype PLLCFGR_DIVP3EN_Field is Interfaces.STM32.Bit;
   subtype PLLCFGR_DIVQ3EN_Field is Interfaces.STM32.Bit;
   subtype PLLCFGR_DIVR3EN_Field is Interfaces.STM32.Bit;

   --  RCC PLLs Configuration Register
   type PLLCFGR_Register is record
      --  PLL1 fractional latch enable
      PLL1FRACEN     : PLLCFGR_PLL1FRACEN_Field := 16#0#;
      --  PLL1 VCO selection
      PLL1VCOSEL     : PLLCFGR_PLL1VCOSEL_Field := 16#0#;
      --  PLL1 input frequency range
      PLL1RGE        : PLLCFGR_PLL1RGE_Field := 16#0#;
      --  PLL2 fractional latch enable
      PLL2FRACEN     : PLLCFGR_PLL2FRACEN_Field := 16#0#;
      --  PLL2 VCO selection
      PLL2VCOSEL     : PLLCFGR_PLL2VCOSEL_Field := 16#0#;
      --  PLL2 input frequency range
      PLL2RGE        : PLLCFGR_PLL2RGE_Field := 16#0#;
      --  PLL3 fractional latch enable
      PLL3FRACEN     : PLLCFGR_PLL3FRACEN_Field := 16#0#;
      --  PLL3 VCO selection
      PLL3VCOSEL     : PLLCFGR_PLL3VCOSEL_Field := 16#0#;
      --  PLL3 input frequency range
      PLL3RGE        : PLLCFGR_PLL3RGE_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : Interfaces.STM32.UInt4 := 16#0#;
      --  PLL1 DIVP divider output enable
      DIVP1EN        : PLLCFGR_DIVP1EN_Field := 16#1#;
      --  PLL1 DIVQ divider output enable
      DIVQ1EN        : PLLCFGR_DIVQ1EN_Field := 16#1#;
      --  PLL1 DIVR divider output enable
      DIVR1EN        : PLLCFGR_DIVR1EN_Field := 16#1#;
      --  PLL2 DIVP divider output enable
      DIVP2EN        : PLLCFGR_DIVP2EN_Field := 16#1#;
      --  PLL2 DIVQ divider output enable
      DIVQ2EN        : PLLCFGR_DIVQ2EN_Field := 16#1#;
      --  PLL2 DIVR divider output enable
      DIVR2EN        : PLLCFGR_DIVR2EN_Field := 16#1#;
      --  PLL3 DIVP divider output enable
      DIVP3EN        : PLLCFGR_DIVP3EN_Field := 16#1#;
      --  PLL3 DIVQ divider output enable
      DIVQ3EN        : PLLCFGR_DIVQ3EN_Field := 16#1#;
      --  PLL3 DIVR divider output enable
      DIVR3EN        : PLLCFGR_DIVR3EN_Field := 16#1#;
      --  unspecified
      Reserved_25_31 : Interfaces.STM32.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLLCFGR_Register use record
      PLL1FRACEN     at 0 range 0 .. 0;
      PLL1VCOSEL     at 0 range 1 .. 1;
      PLL1RGE        at 0 range 2 .. 3;
      PLL2FRACEN     at 0 range 4 .. 4;
      PLL2VCOSEL     at 0 range 5 .. 5;
      PLL2RGE        at 0 range 6 .. 7;
      PLL3FRACEN     at 0 range 8 .. 8;
      PLL3VCOSEL     at 0 range 9 .. 9;
      PLL3RGE        at 0 range 10 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      DIVP1EN        at 0 range 16 .. 16;
      DIVQ1EN        at 0 range 17 .. 17;
      DIVR1EN        at 0 range 18 .. 18;
      DIVP2EN        at 0 range 19 .. 19;
      DIVQ2EN        at 0 range 20 .. 20;
      DIVR2EN        at 0 range 21 .. 21;
      DIVP3EN        at 0 range 22 .. 22;
      DIVQ3EN        at 0 range 23 .. 23;
      DIVR3EN        at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype PLL1DIVR_DIVN1_Field is Interfaces.STM32.UInt9;
   subtype PLL1DIVR_DIVP1_Field is Interfaces.STM32.UInt7;
   subtype PLL1DIVR_DIVQ1_Field is Interfaces.STM32.UInt7;
   subtype PLL1DIVR_DIVR1_Field is Interfaces.STM32.UInt7;

   --  RCC PLL1 Dividers Configuration Register
   type PLL1DIVR_Register is record
      --  Multiplication factor for PLL1 VCO
      DIVN1          : PLL1DIVR_DIVN1_Field := 16#80#;
      --  PLL1 DIVP division factor
      DIVP1          : PLL1DIVR_DIVP1_Field := 16#1#;
      --  PLL1 DIVQ division factor
      DIVQ1          : PLL1DIVR_DIVQ1_Field := 16#1#;
      --  unspecified
      Reserved_23_23 : Interfaces.STM32.Bit := 16#0#;
      --  PLL1 DIVR division factor
      DIVR1          : PLL1DIVR_DIVR1_Field := 16#1#;
      --  unspecified
      Reserved_31_31 : Interfaces.STM32.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL1DIVR_Register use record
      DIVN1          at 0 range 0 .. 8;
      DIVP1          at 0 range 9 .. 15;
      DIVQ1          at 0 range 16 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      DIVR1          at 0 range 24 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype PLL1FRACR_FRACN1_Field is Interfaces.STM32.UInt13;

   --  RCC PLL1 Fractional Divider Register
   type PLL1FRACR_Register is record
      --  unspecified
      Reserved_0_2   : Interfaces.STM32.UInt3 := 16#0#;
      --  Fractional part of the multiplication factor for PLL1 VCO
      FRACN1         : PLL1FRACR_FRACN1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL1FRACR_Register use record
      Reserved_0_2   at 0 range 0 .. 2;
      FRACN1         at 0 range 3 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype PLL2DIVR_DIVN2_Field is Interfaces.STM32.UInt9;
   subtype PLL2DIVR_DIVP2_Field is Interfaces.STM32.UInt7;
   subtype PLL2DIVR_DIVQ2_Field is Interfaces.STM32.UInt7;
   subtype PLL2DIVR_DIVR2_Field is Interfaces.STM32.UInt7;

   --  RCC PLL2 Dividers Configuration Register
   type PLL2DIVR_Register is record
      --  Multiplication factor for PLL2 VCO
      DIVN2          : PLL2DIVR_DIVN2_Field := 16#80#;
      --  PLL2 DIVP division factor
      DIVP2          : PLL2DIVR_DIVP2_Field := 16#1#;
      --  PLL2 DIVQ division factor
      DIVQ2          : PLL2DIVR_DIVQ2_Field := 16#1#;
      --  unspecified
      Reserved_23_23 : Interfaces.STM32.Bit := 16#0#;
      --  PLL2 DIVR division factor
      DIVR2          : PLL2DIVR_DIVR2_Field := 16#1#;
      --  unspecified
      Reserved_31_31 : Interfaces.STM32.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL2DIVR_Register use record
      DIVN2          at 0 range 0 .. 8;
      DIVP2          at 0 range 9 .. 15;
      DIVQ2          at 0 range 16 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      DIVR2          at 0 range 24 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype PLL2FRACR_FRACN2_Field is Interfaces.STM32.UInt13;

   --  RCC PLL2 Fractional Divider Register
   type PLL2FRACR_Register is record
      --  unspecified
      Reserved_0_2   : Interfaces.STM32.UInt3 := 16#0#;
      --  Fractional part of the multiplication factor for PLL VCO
      FRACN2         : PLL2FRACR_FRACN2_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL2FRACR_Register use record
      Reserved_0_2   at 0 range 0 .. 2;
      FRACN2         at 0 range 3 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype PLL3DIVR_DIVN3_Field is Interfaces.STM32.UInt9;
   subtype PLL3DIVR_DIVP3_Field is Interfaces.STM32.UInt7;
   subtype PLL3DIVR_DIVQ3_Field is Interfaces.STM32.UInt7;
   subtype PLL3DIVR_DIVR3_Field is Interfaces.STM32.UInt7;

   --  RCC PLL3 Dividers Configuration Register
   type PLL3DIVR_Register is record
      --  Multiplication factor for PLL3 VCO
      DIVN3          : PLL3DIVR_DIVN3_Field := 16#80#;
      --  PLL3 DIVP division factor
      DIVP3          : PLL3DIVR_DIVP3_Field := 16#1#;
      --  PLL3 DIVQ division factor
      DIVQ3          : PLL3DIVR_DIVQ3_Field := 16#1#;
      --  unspecified
      Reserved_23_23 : Interfaces.STM32.Bit := 16#0#;
      --  PLL3 DIVR division factor
      DIVR3          : PLL3DIVR_DIVR3_Field := 16#1#;
      --  unspecified
      Reserved_31_31 : Interfaces.STM32.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL3DIVR_Register use record
      DIVN3          at 0 range 0 .. 8;
      DIVP3          at 0 range 9 .. 15;
      DIVQ3          at 0 range 16 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      DIVR3          at 0 range 24 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype PLL3FRACR_FRACN3_Field is Interfaces.STM32.UInt13;

   --  RCC PLL3 Fractional Divider Register
   type PLL3FRACR_Register is record
      --  unspecified
      Reserved_0_2   : Interfaces.STM32.UInt3 := 16#0#;
      --  Fractional part of the multiplication factor for PLL3 VCO
      FRACN3         : PLL3FRACR_FRACN3_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.STM32.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL3FRACR_Register use record
      Reserved_0_2   at 0 range 0 .. 2;
      FRACN3         at 0 range 3 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype D1CCIPR_FMCSEL_Field is Interfaces.STM32.UInt2;
   subtype D1CCIPR_QSPISEL_Field is Interfaces.STM32.UInt2;
   subtype D1CCIPR_SDMMCSEL_Field is Interfaces.STM32.Bit;
   subtype D1CCIPR_CKPERSEL_Field is Interfaces.STM32.UInt2;

   --  RCC Domain 1 Kernel Clock Configuration Register
   type D1CCIPR_Register is record
      --  FMC kernel clock source selection
      FMCSEL         : D1CCIPR_FMCSEL_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : Interfaces.STM32.UInt2 := 16#0#;
      --  QUADSPI kernel clock source selection
      QSPISEL        : D1CCIPR_QSPISEL_Field := 16#0#;
      --  unspecified
      Reserved_6_15  : Interfaces.STM32.UInt10 := 16#0#;
      --  SDMMC kernel clock source selection
      SDMMCSEL       : D1CCIPR_SDMMCSEL_Field := 16#0#;
      --  unspecified
      Reserved_17_27 : Interfaces.STM32.UInt11 := 16#0#;
      --  per_ck clock source selection
      CKPERSEL       : D1CCIPR_CKPERSEL_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : Interfaces.STM32.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for D1CCIPR_Register use record
      FMCSEL         at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      QSPISEL        at 0 range 4 .. 5;
      Reserved_6_15  at 0 range 6 .. 15;
      SDMMCSEL       at 0 range 16 .. 16;
      Reserved_17_27 at 0 range 17 .. 27;
      CKPERSEL       at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype D2CCIP1R_SAI1SEL_Field is Interfaces.STM32.UInt3;
   subtype D2CCIP1R_SAI23SEL_Field is Interfaces.STM32.UInt3;
   subtype D2CCIP1R_SPI123SEL_Field is Interfaces.STM32.UInt3;
   subtype D2CCIP1R_SPI45SEL_Field is Interfaces.STM32.UInt3;
   subtype D2CCIP1R_SPDIFSEL_Field is Interfaces.STM32.UInt2;
   subtype D2CCIP1R_DFSDM1SEL_Field is Interfaces.STM32.Bit;
   subtype D2CCIP1R_FDCANSEL_Field is Interfaces.STM32.UInt2;
   subtype D2CCIP1R_SWPSEL_Field is Interfaces.STM32.Bit;

   --  RCC Domain 2 Kernel Clock Configuration Register
   type D2CCIP1R_Register is record
      --  SAI1 and DFSDM1 kernel Aclk clock source selection
      SAI1SEL        : D2CCIP1R_SAI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_3_5   : Interfaces.STM32.UInt3 := 16#0#;
      --  SAI2 and SAI3 kernel clock source selection
      SAI23SEL       : D2CCIP1R_SAI23SEL_Field := 16#0#;
      --  unspecified
      Reserved_9_11  : Interfaces.STM32.UInt3 := 16#0#;
      --  SPI/I2S1,2 and 3 kernel clock source selection
      SPI123SEL      : D2CCIP1R_SPI123SEL_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit := 16#0#;
      --  SPI4 and 5 kernel clock source selection
      SPI45SEL       : D2CCIP1R_SPI45SEL_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : Interfaces.STM32.Bit := 16#0#;
      --  SPDIFRX kernel clock source selection
      SPDIFSEL       : D2CCIP1R_SPDIFSEL_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : Interfaces.STM32.UInt2 := 16#0#;
      --  DFSDM1 kernel Clk clock source selection
      DFSDM1SEL      : D2CCIP1R_DFSDM1SEL_Field := 16#0#;
      --  unspecified
      Reserved_25_27 : Interfaces.STM32.UInt3 := 16#0#;
      --  FDCAN kernel clock source selection
      FDCANSEL       : D2CCIP1R_FDCANSEL_Field := 16#0#;
      --  unspecified
      Reserved_30_30 : Interfaces.STM32.Bit := 16#0#;
      --  SWPMI kernel clock source selection
      SWPSEL         : D2CCIP1R_SWPSEL_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for D2CCIP1R_Register use record
      SAI1SEL        at 0 range 0 .. 2;
      Reserved_3_5   at 0 range 3 .. 5;
      SAI23SEL       at 0 range 6 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      SPI123SEL      at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      SPI45SEL       at 0 range 16 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      SPDIFSEL       at 0 range 20 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      DFSDM1SEL      at 0 range 24 .. 24;
      Reserved_25_27 at 0 range 25 .. 27;
      FDCANSEL       at 0 range 28 .. 29;
      Reserved_30_30 at 0 range 30 .. 30;
      SWPSEL         at 0 range 31 .. 31;
   end record;

   subtype D2CCIP2R_USART234578SEL_Field is Interfaces.STM32.UInt3;
   subtype D2CCIP2R_USART16SEL_Field is Interfaces.STM32.UInt3;
   subtype D2CCIP2R_RNGSEL_Field is Interfaces.STM32.UInt2;
   subtype D2CCIP2R_I2C123SEL_Field is Interfaces.STM32.UInt2;
   subtype D2CCIP2R_USBSEL_Field is Interfaces.STM32.UInt2;
   subtype D2CCIP2R_CECSEL_Field is Interfaces.STM32.UInt2;
   subtype D2CCIP2R_LPTIM1SEL_Field is Interfaces.STM32.UInt3;

   --  RCC Domain 2 Kernel Clock Configuration Register
   type D2CCIP2R_Register is record
      --  USART2/3, UART4,5, 7/8 (APB1) kernel clock source selection
      USART234578SEL : D2CCIP2R_USART234578SEL_Field := 16#0#;
      --  USART1 and 6 kernel clock source selection
      USART16SEL     : D2CCIP2R_USART16SEL_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2 := 16#0#;
      --  RNG kernel clock source selection
      RNGSEL         : D2CCIP2R_RNGSEL_Field := 16#0#;
      --  unspecified
      Reserved_10_11 : Interfaces.STM32.UInt2 := 16#0#;
      --  I2C1,2,3 kernel clock source selection
      I2C123SEL      : D2CCIP2R_I2C123SEL_Field := 16#0#;
      --  unspecified
      Reserved_14_19 : Interfaces.STM32.UInt6 := 16#0#;
      --  USBOTG 1 and 2 kernel clock source selection
      USBSEL         : D2CCIP2R_USBSEL_Field := 16#0#;
      --  HDMI-CEC kernel clock source selection
      CECSEL         : D2CCIP2R_CECSEL_Field := 16#0#;
      --  unspecified
      Reserved_24_27 : Interfaces.STM32.UInt4 := 16#0#;
      --  LPTIM1 kernel clock source selection
      LPTIM1SEL      : D2CCIP2R_LPTIM1SEL_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : Interfaces.STM32.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for D2CCIP2R_Register use record
      USART234578SEL at 0 range 0 .. 2;
      USART16SEL     at 0 range 3 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      RNGSEL         at 0 range 8 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      I2C123SEL      at 0 range 12 .. 13;
      Reserved_14_19 at 0 range 14 .. 19;
      USBSEL         at 0 range 20 .. 21;
      CECSEL         at 0 range 22 .. 23;
      Reserved_24_27 at 0 range 24 .. 27;
      LPTIM1SEL      at 0 range 28 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype D3CCIPR_LPUART1SEL_Field is Interfaces.STM32.UInt3;
   subtype D3CCIPR_I2C4SEL_Field is Interfaces.STM32.UInt2;
   subtype D3CCIPR_LPTIM2SEL_Field is Interfaces.STM32.UInt3;
   subtype D3CCIPR_LPTIM345SEL_Field is Interfaces.STM32.UInt3;
   subtype D3CCIPR_ADCSEL_Field is Interfaces.STM32.UInt2;
   subtype D3CCIPR_SAI4ASEL_Field is Interfaces.STM32.UInt3;
   subtype D3CCIPR_SAI4BSEL_Field is Interfaces.STM32.UInt3;
   subtype D3CCIPR_SPI6SEL_Field is Interfaces.STM32.UInt3;

   --  RCC Domain 3 Kernel Clock Configuration Register
   type D3CCIPR_Register is record
      --  LPUART1 kernel clock source selection
      LPUART1SEL     : D3CCIPR_LPUART1SEL_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : Interfaces.STM32.UInt5 := 16#0#;
      --  I2C4 kernel clock source selection
      I2C4SEL        : D3CCIPR_I2C4SEL_Field := 16#0#;
      --  LPTIM2 kernel clock source selection
      LPTIM2SEL      : D3CCIPR_LPTIM2SEL_Field := 16#0#;
      --  LPTIM3,4,5 kernel clock source selection
      LPTIM345SEL    : D3CCIPR_LPTIM345SEL_Field := 16#0#;
      --  SAR ADC kernel clock source selection
      ADCSEL         : D3CCIPR_ADCSEL_Field := 16#0#;
      --  unspecified
      Reserved_18_20 : Interfaces.STM32.UInt3 := 16#0#;
      --  Sub-Block A of SAI4 kernel clock source selection
      SAI4ASEL       : D3CCIPR_SAI4ASEL_Field := 16#0#;
      --  Sub-Block B of SAI4 kernel clock source selection
      SAI4BSEL       : D3CCIPR_SAI4BSEL_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : Interfaces.STM32.Bit := 16#0#;
      --  SPI6 kernel clock source selection
      SPI6SEL        : D3CCIPR_SPI6SEL_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : Interfaces.STM32.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for D3CCIPR_Register use record
      LPUART1SEL     at 0 range 0 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      I2C4SEL        at 0 range 8 .. 9;
      LPTIM2SEL      at 0 range 10 .. 12;
      LPTIM345SEL    at 0 range 13 .. 15;
      ADCSEL         at 0 range 16 .. 17;
      Reserved_18_20 at 0 range 18 .. 20;
      SAI4ASEL       at 0 range 21 .. 23;
      SAI4BSEL       at 0 range 24 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      SPI6SEL        at 0 range 28 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype CIER_LSIRDYIE_Field is Interfaces.STM32.Bit;
   subtype CIER_LSERDYIE_Field is Interfaces.STM32.Bit;
   subtype CIER_HSIRDYIE_Field is Interfaces.STM32.Bit;
   subtype CIER_HSERDYIE_Field is Interfaces.STM32.Bit;
   subtype CIER_CSIRDYIE_Field is Interfaces.STM32.Bit;
   subtype CIER_RC48RDYIE_Field is Interfaces.STM32.Bit;
   subtype CIER_PLL1RDYIE_Field is Interfaces.STM32.Bit;
   subtype CIER_PLL2RDYIE_Field is Interfaces.STM32.Bit;
   subtype CIER_PLL3RDYIE_Field is Interfaces.STM32.Bit;
   subtype CIER_LSECSSIE_Field is Interfaces.STM32.Bit;

   --  RCC Clock Source Interrupt Enable Register
   type CIER_Register is record
      --  LSI ready Interrupt Enable
      LSIRDYIE       : CIER_LSIRDYIE_Field := 16#0#;
      --  LSE ready Interrupt Enable
      LSERDYIE       : CIER_LSERDYIE_Field := 16#0#;
      --  HSI ready Interrupt Enable
      HSIRDYIE       : CIER_HSIRDYIE_Field := 16#0#;
      --  HSE ready Interrupt Enable
      HSERDYIE       : CIER_HSERDYIE_Field := 16#0#;
      --  CSI ready Interrupt Enable
      CSIRDYIE       : CIER_CSIRDYIE_Field := 16#0#;
      --  RC48 ready Interrupt Enable
      RC48RDYIE      : CIER_RC48RDYIE_Field := 16#0#;
      --  PLL1 ready Interrupt Enable
      PLL1RDYIE      : CIER_PLL1RDYIE_Field := 16#0#;
      --  PLL2 ready Interrupt Enable
      PLL2RDYIE      : CIER_PLL2RDYIE_Field := 16#0#;
      --  PLL3 ready Interrupt Enable
      PLL3RDYIE      : CIER_PLL3RDYIE_Field := 16#0#;
      --  LSE clock security system Interrupt Enable
      LSECSSIE       : CIER_LSECSSIE_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : Interfaces.STM32.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CIER_Register use record
      LSIRDYIE       at 0 range 0 .. 0;
      LSERDYIE       at 0 range 1 .. 1;
      HSIRDYIE       at 0 range 2 .. 2;
      HSERDYIE       at 0 range 3 .. 3;
      CSIRDYIE       at 0 range 4 .. 4;
      RC48RDYIE      at 0 range 5 .. 5;
      PLL1RDYIE      at 0 range 6 .. 6;
      PLL2RDYIE      at 0 range 7 .. 7;
      PLL3RDYIE      at 0 range 8 .. 8;
      LSECSSIE       at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype CIFR_LSIRDYF_Field is Interfaces.STM32.Bit;
   subtype CIFR_LSERDYF_Field is Interfaces.STM32.Bit;
   subtype CIFR_HSIRDYF_Field is Interfaces.STM32.Bit;
   subtype CIFR_HSERDYF_Field is Interfaces.STM32.Bit;
   subtype CIFR_CSIRDY_Field is Interfaces.STM32.Bit;
   subtype CIFR_RC48RDYF_Field is Interfaces.STM32.Bit;
   subtype CIFR_PLL1RDYF_Field is Interfaces.STM32.Bit;
   subtype CIFR_PLL2RDYF_Field is Interfaces.STM32.Bit;
   subtype CIFR_PLL3RDYF_Field is Interfaces.STM32.Bit;
   subtype CIFR_LSECSSF_Field is Interfaces.STM32.Bit;
   subtype CIFR_HSECSSF_Field is Interfaces.STM32.Bit;

   --  RCC Clock Source Interrupt Flag Register
   type CIFR_Register is record
      --  LSI ready Interrupt Flag
      LSIRDYF        : CIFR_LSIRDYF_Field := 16#0#;
      --  LSE ready Interrupt Flag
      LSERDYF        : CIFR_LSERDYF_Field := 16#0#;
      --  HSI ready Interrupt Flag
      HSIRDYF        : CIFR_HSIRDYF_Field := 16#0#;
      --  HSE ready Interrupt Flag
      HSERDYF        : CIFR_HSERDYF_Field := 16#0#;
      --  CSI ready Interrupt Flag
      CSIRDY         : CIFR_CSIRDY_Field := 16#0#;
      --  RC48 ready Interrupt Flag
      RC48RDYF       : CIFR_RC48RDYF_Field := 16#0#;
      --  PLL1 ready Interrupt Flag
      PLL1RDYF       : CIFR_PLL1RDYF_Field := 16#0#;
      --  PLL2 ready Interrupt Flag
      PLL2RDYF       : CIFR_PLL2RDYF_Field := 16#0#;
      --  PLL3 ready Interrupt Flag
      PLL3RDYF       : CIFR_PLL3RDYF_Field := 16#0#;
      --  LSE clock security system Interrupt Flag
      LSECSSF        : CIFR_LSECSSF_Field := 16#0#;
      --  HSE clock security system Interrupt Flag
      HSECSSF        : CIFR_HSECSSF_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : Interfaces.STM32.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CIFR_Register use record
      LSIRDYF        at 0 range 0 .. 0;
      LSERDYF        at 0 range 1 .. 1;
      HSIRDYF        at 0 range 2 .. 2;
      HSERDYF        at 0 range 3 .. 3;
      CSIRDY         at 0 range 4 .. 4;
      RC48RDYF       at 0 range 5 .. 5;
      PLL1RDYF       at 0 range 6 .. 6;
      PLL2RDYF       at 0 range 7 .. 7;
      PLL3RDYF       at 0 range 8 .. 8;
      LSECSSF        at 0 range 9 .. 9;
      HSECSSF        at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype CICR_LSIRDYC_Field is Interfaces.STM32.Bit;
   subtype CICR_LSERDYC_Field is Interfaces.STM32.Bit;
   subtype CICR_HSIRDYC_Field is Interfaces.STM32.Bit;
   subtype CICR_HSERDYC_Field is Interfaces.STM32.Bit;
   subtype CICR_HSE_ready_Interrupt_Clear_Field is Interfaces.STM32.Bit;
   subtype CICR_RC48RDYC_Field is Interfaces.STM32.Bit;
   subtype CICR_PLL1RDYC_Field is Interfaces.STM32.Bit;
   subtype CICR_PLL2RDYC_Field is Interfaces.STM32.Bit;
   subtype CICR_PLL3RDYC_Field is Interfaces.STM32.Bit;
   subtype CICR_LSECSSC_Field is Interfaces.STM32.Bit;
   subtype CICR_HSECSSC_Field is Interfaces.STM32.Bit;

   --  RCC Clock Source Interrupt Clear Register
   type CICR_Register is record
      --  LSI ready Interrupt Clear
      LSIRDYC                   : CICR_LSIRDYC_Field := 16#0#;
      --  LSE ready Interrupt Clear
      LSERDYC                   : CICR_LSERDYC_Field := 16#0#;
      --  HSI ready Interrupt Clear
      HSIRDYC                   : CICR_HSIRDYC_Field := 16#0#;
      --  HSE ready Interrupt Clear
      HSERDYC                   : CICR_HSERDYC_Field := 16#0#;
      --  CSI ready Interrupt Clear
      HSE_ready_Interrupt_Clear : CICR_HSE_ready_Interrupt_Clear_Field :=
                                   16#0#;
      --  RC48 ready Interrupt Clear
      RC48RDYC                  : CICR_RC48RDYC_Field := 16#0#;
      --  PLL1 ready Interrupt Clear
      PLL1RDYC                  : CICR_PLL1RDYC_Field := 16#0#;
      --  PLL2 ready Interrupt Clear
      PLL2RDYC                  : CICR_PLL2RDYC_Field := 16#0#;
      --  PLL3 ready Interrupt Clear
      PLL3RDYC                  : CICR_PLL3RDYC_Field := 16#0#;
      --  LSE clock security system Interrupt Clear
      LSECSSC                   : CICR_LSECSSC_Field := 16#0#;
      --  HSE clock security system Interrupt Clear
      HSECSSC                   : CICR_HSECSSC_Field := 16#0#;
      --  unspecified
      Reserved_11_31            : Interfaces.STM32.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CICR_Register use record
      LSIRDYC                   at 0 range 0 .. 0;
      LSERDYC                   at 0 range 1 .. 1;
      HSIRDYC                   at 0 range 2 .. 2;
      HSERDYC                   at 0 range 3 .. 3;
      HSE_ready_Interrupt_Clear at 0 range 4 .. 4;
      RC48RDYC                  at 0 range 5 .. 5;
      PLL1RDYC                  at 0 range 6 .. 6;
      PLL2RDYC                  at 0 range 7 .. 7;
      PLL3RDYC                  at 0 range 8 .. 8;
      LSECSSC                   at 0 range 9 .. 9;
      HSECSSC                   at 0 range 10 .. 10;
      Reserved_11_31            at 0 range 11 .. 31;
   end record;

   subtype BDCR_LSEON_Field is Interfaces.STM32.Bit;
   subtype BDCR_LSERDY_Field is Interfaces.STM32.Bit;
   subtype BDCR_LSEBYP_Field is Interfaces.STM32.Bit;
   subtype BDCR_LSEDRV_Field is Interfaces.STM32.UInt2;
   subtype BDCR_LSECSSON_Field is Interfaces.STM32.Bit;
   subtype BDCR_LSECSSD_Field is Interfaces.STM32.Bit;
   subtype BDCR_RTCSEL_Field is Interfaces.STM32.UInt2;
   subtype BDCR_RTCEN_Field is Interfaces.STM32.Bit;
   subtype BDCR_VSWRST_Field is Interfaces.STM32.Bit;

   --  RCC Backup Domain Control Register
   type BDCR_Register is record
      --  LSE oscillator enabled
      LSEON          : BDCR_LSEON_Field := 16#0#;
      --  LSE oscillator ready
      LSERDY         : BDCR_LSERDY_Field := 16#0#;
      --  LSE oscillator bypass
      LSEBYP         : BDCR_LSEBYP_Field := 16#0#;
      --  LSE oscillator driving capability
      LSEDRV         : BDCR_LSEDRV_Field := 16#0#;
      --  LSE clock security system enable
      LSECSSON       : BDCR_LSECSSON_Field := 16#0#;
      --  LSE clock security system failure detection
      LSECSSD        : BDCR_LSECSSD_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.STM32.Bit := 16#0#;
      --  RTC clock source selection
      RTCSEL         : BDCR_RTCSEL_Field := 16#0#;
      --  unspecified
      Reserved_10_14 : Interfaces.STM32.UInt5 := 16#0#;
      --  RTC clock enable
      RTCEN          : BDCR_RTCEN_Field := 16#0#;
      --  VSwitch domain software reset
      VSWRST         : BDCR_VSWRST_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.STM32.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BDCR_Register use record
      LSEON          at 0 range 0 .. 0;
      LSERDY         at 0 range 1 .. 1;
      LSEBYP         at 0 range 2 .. 2;
      LSEDRV         at 0 range 3 .. 4;
      LSECSSON       at 0 range 5 .. 5;
      LSECSSD        at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      RTCSEL         at 0 range 8 .. 9;
      Reserved_10_14 at 0 range 10 .. 14;
      RTCEN          at 0 range 15 .. 15;
      VSWRST         at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype CSR_LSION_Field is Interfaces.STM32.Bit;
   subtype CSR_LSIRDY_Field is Interfaces.STM32.Bit;

   --  RCC Clock Control and Status Register
   type CSR_Register is record
      --  LSI oscillator enable
      LSION         : CSR_LSION_Field := 16#0#;
      --  LSI oscillator ready
      LSIRDY        : CSR_LSIRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : Interfaces.STM32.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      LSION         at 0 range 0 .. 0;
      LSIRDY        at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype AHB3RSTR_MDMARST_Field is Interfaces.STM32.Bit;
   subtype AHB3RSTR_DMA2DRST_Field is Interfaces.STM32.Bit;
   subtype AHB3RSTR_JPGDECRST_Field is Interfaces.STM32.Bit;
   subtype AHB3RSTR_FMCRST_Field is Interfaces.STM32.Bit;
   subtype AHB3RSTR_QSPIRST_Field is Interfaces.STM32.Bit;
   subtype AHB3RSTR_SDMMC1RST_Field is Interfaces.STM32.Bit;
   subtype AHB3RSTR_CPURST_Field is Interfaces.STM32.Bit;

   --  RCC AHB3 Reset Register
   type AHB3RSTR_Register is record
      --  MDMA block reset
      MDMARST        : AHB3RSTR_MDMARST_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : Interfaces.STM32.UInt3 := 16#0#;
      --  DMA2D block reset
      DMA2DRST       : AHB3RSTR_DMA2DRST_Field := 16#0#;
      --  JPGDEC block reset
      JPGDECRST      : AHB3RSTR_JPGDECRST_Field := 16#0#;
      --  unspecified
      Reserved_6_11  : Interfaces.STM32.UInt6 := 16#0#;
      --  FMC block reset
      FMCRST         : AHB3RSTR_FMCRST_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  QUADSPI and QUADSPI delay block reset
      QSPIRST        : AHB3RSTR_QSPIRST_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit := 16#0#;
      --  SDMMC1 and SDMMC1 delay block reset
      SDMMC1RST      : AHB3RSTR_SDMMC1RST_Field := 16#0#;
      --  unspecified
      Reserved_17_30 : Interfaces.STM32.UInt14 := 16#0#;
      --  CPU reset
      CPURST         : AHB3RSTR_CPURST_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB3RSTR_Register use record
      MDMARST        at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      DMA2DRST       at 0 range 4 .. 4;
      JPGDECRST      at 0 range 5 .. 5;
      Reserved_6_11  at 0 range 6 .. 11;
      FMCRST         at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      QSPIRST        at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      SDMMC1RST      at 0 range 16 .. 16;
      Reserved_17_30 at 0 range 17 .. 30;
      CPURST         at 0 range 31 .. 31;
   end record;

   subtype AHB1RSTR_DMA1RST_Field is Interfaces.STM32.Bit;
   subtype AHB1RSTR_DMA2RST_Field is Interfaces.STM32.Bit;
   subtype AHB1RSTR_ADC12RST_Field is Interfaces.STM32.Bit;
   subtype AHB1RSTR_ETH1MACRST_Field is Interfaces.STM32.Bit;
   subtype AHB1RSTR_USB1OTGRST_Field is Interfaces.STM32.Bit;
   subtype AHB1RSTR_USB2OTGRST_Field is Interfaces.STM32.Bit;

   --  RCC AHB1 Peripheral Reset Register
   type AHB1RSTR_Register is record
      --  DMA1 block reset
      DMA1RST        : AHB1RSTR_DMA1RST_Field := 16#0#;
      --  DMA2 block reset
      DMA2RST        : AHB1RSTR_DMA2RST_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : Interfaces.STM32.UInt3 := 16#0#;
      --  ADC1&2 block reset
      ADC12RST       : AHB1RSTR_ADC12RST_Field := 16#0#;
      --  unspecified
      Reserved_6_14  : Interfaces.STM32.UInt9 := 16#0#;
      --  ETH1MAC block reset
      ETH1MACRST     : AHB1RSTR_ETH1MACRST_Field := 16#0#;
      --  unspecified
      Reserved_16_24 : Interfaces.STM32.UInt9 := 16#0#;
      --  USB1OTG block reset
      USB1OTGRST     : AHB1RSTR_USB1OTGRST_Field := 16#0#;
      --  unspecified
      Reserved_26_26 : Interfaces.STM32.Bit := 16#0#;
      --  USB2OTG block reset
      USB2OTGRST     : AHB1RSTR_USB2OTGRST_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.STM32.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB1RSTR_Register use record
      DMA1RST        at 0 range 0 .. 0;
      DMA2RST        at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      ADC12RST       at 0 range 5 .. 5;
      Reserved_6_14  at 0 range 6 .. 14;
      ETH1MACRST     at 0 range 15 .. 15;
      Reserved_16_24 at 0 range 16 .. 24;
      USB1OTGRST     at 0 range 25 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      USB2OTGRST     at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype AHB2RSTR_CAMITFRST_Field is Interfaces.STM32.Bit;
   subtype AHB2RSTR_CRYPTRST_Field is Interfaces.STM32.Bit;
   subtype AHB2RSTR_HASHRST_Field is Interfaces.STM32.Bit;
   subtype AHB2RSTR_RNGRST_Field is Interfaces.STM32.Bit;
   subtype AHB2RSTR_SDMMC2RST_Field is Interfaces.STM32.Bit;

   --  RCC AHB2 Peripheral Reset Register
   type AHB2RSTR_Register is record
      --  CAMITF block reset
      CAMITFRST      : AHB2RSTR_CAMITFRST_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : Interfaces.STM32.UInt3 := 16#0#;
      --  Cryptography block reset
      CRYPTRST       : AHB2RSTR_CRYPTRST_Field := 16#0#;
      --  Hash block reset
      HASHRST        : AHB2RSTR_HASHRST_Field := 16#0#;
      --  Random Number Generator block reset
      RNGRST         : AHB2RSTR_RNGRST_Field := 16#0#;
      --  unspecified
      Reserved_7_8   : Interfaces.STM32.UInt2 := 16#0#;
      --  SDMMC2 and SDMMC2 Delay block reset
      SDMMC2RST      : AHB2RSTR_SDMMC2RST_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : Interfaces.STM32.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB2RSTR_Register use record
      CAMITFRST      at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      CRYPTRST       at 0 range 4 .. 4;
      HASHRST        at 0 range 5 .. 5;
      RNGRST         at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      SDMMC2RST      at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype AHB4RSTR_GPIOARST_Field is Interfaces.STM32.Bit;
   subtype AHB4RSTR_GPIOBRST_Field is Interfaces.STM32.Bit;
   subtype AHB4RSTR_GPIOCRST_Field is Interfaces.STM32.Bit;
   subtype AHB4RSTR_GPIODRST_Field is Interfaces.STM32.Bit;
   subtype AHB4RSTR_GPIOERST_Field is Interfaces.STM32.Bit;
   subtype AHB4RSTR_GPIOFRST_Field is Interfaces.STM32.Bit;
   subtype AHB4RSTR_GPIOGRST_Field is Interfaces.STM32.Bit;
   subtype AHB4RSTR_GPIOHRST_Field is Interfaces.STM32.Bit;
   subtype AHB4RSTR_GPIOIRST_Field is Interfaces.STM32.Bit;
   subtype AHB4RSTR_GPIOJRST_Field is Interfaces.STM32.Bit;
   subtype AHB4RSTR_GPIOKRST_Field is Interfaces.STM32.Bit;
   subtype AHB4RSTR_CRCRST_Field is Interfaces.STM32.Bit;
   subtype AHB4RSTR_BDMARST_Field is Interfaces.STM32.Bit;
   subtype AHB4RSTR_ADC3RST_Field is Interfaces.STM32.Bit;
   subtype AHB4RSTR_HSEMRST_Field is Interfaces.STM32.Bit;

   --  RCC AHB4 Peripheral Reset Register
   type AHB4RSTR_Register is record
      --  GPIO block reset
      GPIOARST       : AHB4RSTR_GPIOARST_Field := 16#0#;
      --  GPIO block reset
      GPIOBRST       : AHB4RSTR_GPIOBRST_Field := 16#0#;
      --  GPIO block reset
      GPIOCRST       : AHB4RSTR_GPIOCRST_Field := 16#0#;
      --  GPIO block reset
      GPIODRST       : AHB4RSTR_GPIODRST_Field := 16#0#;
      --  GPIO block reset
      GPIOERST       : AHB4RSTR_GPIOERST_Field := 16#0#;
      --  GPIO block reset
      GPIOFRST       : AHB4RSTR_GPIOFRST_Field := 16#0#;
      --  GPIO block reset
      GPIOGRST       : AHB4RSTR_GPIOGRST_Field := 16#0#;
      --  GPIO block reset
      GPIOHRST       : AHB4RSTR_GPIOHRST_Field := 16#0#;
      --  GPIO block reset
      GPIOIRST       : AHB4RSTR_GPIOIRST_Field := 16#0#;
      --  GPIO block reset
      GPIOJRST       : AHB4RSTR_GPIOJRST_Field := 16#0#;
      --  GPIO block reset
      GPIOKRST       : AHB4RSTR_GPIOKRST_Field := 16#0#;
      --  unspecified
      Reserved_11_18 : Interfaces.STM32.Byte := 16#0#;
      --  CRC block reset
      CRCRST         : AHB4RSTR_CRCRST_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#0#;
      --  BDMA block reset
      BDMARST        : AHB4RSTR_BDMARST_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : Interfaces.STM32.UInt2 := 16#0#;
      --  ADC3 block reset
      ADC3RST        : AHB4RSTR_ADC3RST_Field := 16#0#;
      --  HSEM block reset
      HSEMRST        : AHB4RSTR_HSEMRST_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : Interfaces.STM32.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB4RSTR_Register use record
      GPIOARST       at 0 range 0 .. 0;
      GPIOBRST       at 0 range 1 .. 1;
      GPIOCRST       at 0 range 2 .. 2;
      GPIODRST       at 0 range 3 .. 3;
      GPIOERST       at 0 range 4 .. 4;
      GPIOFRST       at 0 range 5 .. 5;
      GPIOGRST       at 0 range 6 .. 6;
      GPIOHRST       at 0 range 7 .. 7;
      GPIOIRST       at 0 range 8 .. 8;
      GPIOJRST       at 0 range 9 .. 9;
      GPIOKRST       at 0 range 10 .. 10;
      Reserved_11_18 at 0 range 11 .. 18;
      CRCRST         at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      BDMARST        at 0 range 21 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      ADC3RST        at 0 range 24 .. 24;
      HSEMRST        at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype APB3RSTR_LTDCRST_Field is Interfaces.STM32.Bit;

   --  RCC APB3 Peripheral Reset Register
   type APB3RSTR_Register is record
      --  unspecified
      Reserved_0_2  : Interfaces.STM32.UInt3 := 16#0#;
      --  LTDC block reset
      LTDCRST       : APB3RSTR_LTDCRST_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.STM32.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB3RSTR_Register use record
      Reserved_0_2  at 0 range 0 .. 2;
      LTDCRST       at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype APB1LRSTR_TIM2RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_TIM3RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_TIM4RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_TIM5RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_TIM6RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_TIM7RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_TIM12RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_TIM13RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_TIM14RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_LPTIM1RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_SPI2RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_SPI3RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_SPDIFRXRST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_USART2RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_USART3RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_UART4RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_UART5RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_I2C1RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_I2C2RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_I2C3RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_CECRST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_DAC12RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_UART7RST_Field is Interfaces.STM32.Bit;
   subtype APB1LRSTR_UART8RST_Field is Interfaces.STM32.Bit;

   --  RCC APB1 Peripheral Reset Register
   type APB1LRSTR_Register is record
      --  TIM block reset
      TIM2RST        : APB1LRSTR_TIM2RST_Field := 16#0#;
      --  TIM block reset
      TIM3RST        : APB1LRSTR_TIM3RST_Field := 16#0#;
      --  TIM block reset
      TIM4RST        : APB1LRSTR_TIM4RST_Field := 16#0#;
      --  TIM block reset
      TIM5RST        : APB1LRSTR_TIM5RST_Field := 16#0#;
      --  TIM block reset
      TIM6RST        : APB1LRSTR_TIM6RST_Field := 16#0#;
      --  TIM block reset
      TIM7RST        : APB1LRSTR_TIM7RST_Field := 16#0#;
      --  TIM block reset
      TIM12RST       : APB1LRSTR_TIM12RST_Field := 16#0#;
      --  TIM block reset
      TIM13RST       : APB1LRSTR_TIM13RST_Field := 16#0#;
      --  TIM block reset
      TIM14RST       : APB1LRSTR_TIM14RST_Field := 16#0#;
      --  TIM block reset
      LPTIM1RST      : APB1LRSTR_LPTIM1RST_Field := 16#0#;
      --  unspecified
      Reserved_10_13 : Interfaces.STM32.UInt4 := 16#0#;
      --  SPI2 block reset
      SPI2RST        : APB1LRSTR_SPI2RST_Field := 16#0#;
      --  SPI3 block reset
      SPI3RST        : APB1LRSTR_SPI3RST_Field := 16#0#;
      --  SPDIFRX block reset
      SPDIFRXRST     : APB1LRSTR_SPDIFRXRST_Field := 16#0#;
      --  USART2 block reset
      USART2RST      : APB1LRSTR_USART2RST_Field := 16#0#;
      --  USART3 block reset
      USART3RST      : APB1LRSTR_USART3RST_Field := 16#0#;
      --  UART4 block reset
      UART4RST       : APB1LRSTR_UART4RST_Field := 16#0#;
      --  UART5 block reset
      UART5RST       : APB1LRSTR_UART5RST_Field := 16#0#;
      --  I2C1 block reset
      I2C1RST        : APB1LRSTR_I2C1RST_Field := 16#0#;
      --  I2C2 block reset
      I2C2RST        : APB1LRSTR_I2C2RST_Field := 16#0#;
      --  I2C3 block reset
      I2C3RST        : APB1LRSTR_I2C3RST_Field := 16#0#;
      --  unspecified
      Reserved_24_26 : Interfaces.STM32.UInt3 := 16#0#;
      --  HDMI-CEC block reset
      CECRST         : APB1LRSTR_CECRST_Field := 16#0#;
      --  unspecified
      Reserved_28_28 : Interfaces.STM32.Bit := 16#0#;
      --  DAC1 and 2 Blocks Reset
      DAC12RST       : APB1LRSTR_DAC12RST_Field := 16#0#;
      --  UART7 block reset
      UART7RST       : APB1LRSTR_UART7RST_Field := 16#0#;
      --  UART8 block reset
      UART8RST       : APB1LRSTR_UART8RST_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1LRSTR_Register use record
      TIM2RST        at 0 range 0 .. 0;
      TIM3RST        at 0 range 1 .. 1;
      TIM4RST        at 0 range 2 .. 2;
      TIM5RST        at 0 range 3 .. 3;
      TIM6RST        at 0 range 4 .. 4;
      TIM7RST        at 0 range 5 .. 5;
      TIM12RST       at 0 range 6 .. 6;
      TIM13RST       at 0 range 7 .. 7;
      TIM14RST       at 0 range 8 .. 8;
      LPTIM1RST      at 0 range 9 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      SPI2RST        at 0 range 14 .. 14;
      SPI3RST        at 0 range 15 .. 15;
      SPDIFRXRST     at 0 range 16 .. 16;
      USART2RST      at 0 range 17 .. 17;
      USART3RST      at 0 range 18 .. 18;
      UART4RST       at 0 range 19 .. 19;
      UART5RST       at 0 range 20 .. 20;
      I2C1RST        at 0 range 21 .. 21;
      I2C2RST        at 0 range 22 .. 22;
      I2C3RST        at 0 range 23 .. 23;
      Reserved_24_26 at 0 range 24 .. 26;
      CECRST         at 0 range 27 .. 27;
      Reserved_28_28 at 0 range 28 .. 28;
      DAC12RST       at 0 range 29 .. 29;
      UART7RST       at 0 range 30 .. 30;
      UART8RST       at 0 range 31 .. 31;
   end record;

   subtype APB1HRSTR_CRSRST_Field is Interfaces.STM32.Bit;
   subtype APB1HRSTR_SWPRST_Field is Interfaces.STM32.Bit;
   subtype APB1HRSTR_OPAMPRST_Field is Interfaces.STM32.Bit;
   subtype APB1HRSTR_MDIOSRST_Field is Interfaces.STM32.Bit;
   subtype APB1HRSTR_FDCANRST_Field is Interfaces.STM32.Bit;

   --  RCC APB1 Peripheral Reset Register
   type APB1HRSTR_Register is record
      --  unspecified
      Reserved_0_0  : Interfaces.STM32.Bit := 16#0#;
      --  Clock Recovery System reset
      CRSRST        : APB1HRSTR_CRSRST_Field := 16#0#;
      --  SWPMI block reset
      SWPRST        : APB1HRSTR_SWPRST_Field := 16#0#;
      --  unspecified
      Reserved_3_3  : Interfaces.STM32.Bit := 16#0#;
      --  OPAMP block reset
      OPAMPRST      : APB1HRSTR_OPAMPRST_Field := 16#0#;
      --  MDIOS block reset
      MDIOSRST      : APB1HRSTR_MDIOSRST_Field := 16#0#;
      --  unspecified
      Reserved_6_7  : Interfaces.STM32.UInt2 := 16#0#;
      --  FDCAN block reset
      FDCANRST      : APB1HRSTR_FDCANRST_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : Interfaces.STM32.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1HRSTR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      CRSRST        at 0 range 1 .. 1;
      SWPRST        at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      OPAMPRST      at 0 range 4 .. 4;
      MDIOSRST      at 0 range 5 .. 5;
      Reserved_6_7  at 0 range 6 .. 7;
      FDCANRST      at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype APB2RSTR_TIM1RST_Field is Interfaces.STM32.Bit;
   subtype APB2RSTR_TIM8RST_Field is Interfaces.STM32.Bit;
   subtype APB2RSTR_USART1RST_Field is Interfaces.STM32.Bit;
   subtype APB2RSTR_USART6RST_Field is Interfaces.STM32.Bit;
   subtype APB2RSTR_SPI1RST_Field is Interfaces.STM32.Bit;
   subtype APB2RSTR_SPI4RST_Field is Interfaces.STM32.Bit;
   subtype APB2RSTR_TIM15RST_Field is Interfaces.STM32.Bit;
   subtype APB2RSTR_TIM16RST_Field is Interfaces.STM32.Bit;
   subtype APB2RSTR_TIM17RST_Field is Interfaces.STM32.Bit;
   subtype APB2RSTR_SPI5RST_Field is Interfaces.STM32.Bit;
   subtype APB2RSTR_SAI1RST_Field is Interfaces.STM32.Bit;
   subtype APB2RSTR_SAI2RST_Field is Interfaces.STM32.Bit;
   subtype APB2RSTR_SAI3RST_Field is Interfaces.STM32.Bit;
   subtype APB2RSTR_DFSDM1RST_Field is Interfaces.STM32.Bit;
   subtype APB2RSTR_HRTIMRST_Field is Interfaces.STM32.Bit;

   --  RCC APB2 Peripheral Reset Register
   type APB2RSTR_Register is record
      --  TIM1 block reset
      TIM1RST        : APB2RSTR_TIM1RST_Field := 16#0#;
      --  TIM8 block reset
      TIM8RST        : APB2RSTR_TIM8RST_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : Interfaces.STM32.UInt2 := 16#0#;
      --  USART1 block reset
      USART1RST      : APB2RSTR_USART1RST_Field := 16#0#;
      --  USART6 block reset
      USART6RST      : APB2RSTR_USART6RST_Field := 16#0#;
      --  unspecified
      Reserved_6_11  : Interfaces.STM32.UInt6 := 16#0#;
      --  SPI1 block reset
      SPI1RST        : APB2RSTR_SPI1RST_Field := 16#0#;
      --  SPI4 block reset
      SPI4RST        : APB2RSTR_SPI4RST_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.STM32.UInt2 := 16#0#;
      --  TIM15 block reset
      TIM15RST       : APB2RSTR_TIM15RST_Field := 16#0#;
      --  TIM16 block reset
      TIM16RST       : APB2RSTR_TIM16RST_Field := 16#0#;
      --  TIM17 block reset
      TIM17RST       : APB2RSTR_TIM17RST_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : Interfaces.STM32.Bit := 16#0#;
      --  SPI5 block reset
      SPI5RST        : APB2RSTR_SPI5RST_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : Interfaces.STM32.Bit := 16#0#;
      --  SAI1 block reset
      SAI1RST        : APB2RSTR_SAI1RST_Field := 16#0#;
      --  SAI2 block reset
      SAI2RST        : APB2RSTR_SAI2RST_Field := 16#0#;
      --  SAI3 block reset
      SAI3RST        : APB2RSTR_SAI3RST_Field := 16#0#;
      --  unspecified
      Reserved_25_27 : Interfaces.STM32.UInt3 := 16#0#;
      --  DFSDM1 block reset
      DFSDM1RST      : APB2RSTR_DFSDM1RST_Field := 16#0#;
      --  HRTIM block reset
      HRTIMRST       : APB2RSTR_HRTIMRST_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : Interfaces.STM32.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB2RSTR_Register use record
      TIM1RST        at 0 range 0 .. 0;
      TIM8RST        at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      USART1RST      at 0 range 4 .. 4;
      USART6RST      at 0 range 5 .. 5;
      Reserved_6_11  at 0 range 6 .. 11;
      SPI1RST        at 0 range 12 .. 12;
      SPI4RST        at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      TIM15RST       at 0 range 16 .. 16;
      TIM16RST       at 0 range 17 .. 17;
      TIM17RST       at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      SPI5RST        at 0 range 20 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      SAI1RST        at 0 range 22 .. 22;
      SAI2RST        at 0 range 23 .. 23;
      SAI3RST        at 0 range 24 .. 24;
      Reserved_25_27 at 0 range 25 .. 27;
      DFSDM1RST      at 0 range 28 .. 28;
      HRTIMRST       at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype APB4RSTR_SYSCFGRST_Field is Interfaces.STM32.Bit;
   subtype APB4RSTR_LPUART1RST_Field is Interfaces.STM32.Bit;
   subtype APB4RSTR_SPI6RST_Field is Interfaces.STM32.Bit;
   subtype APB4RSTR_I2C4RST_Field is Interfaces.STM32.Bit;
   subtype APB4RSTR_LPTIM2RST_Field is Interfaces.STM32.Bit;
   subtype APB4RSTR_LPTIM3RST_Field is Interfaces.STM32.Bit;
   subtype APB4RSTR_LPTIM4RST_Field is Interfaces.STM32.Bit;
   subtype APB4RSTR_LPTIM5RST_Field is Interfaces.STM32.Bit;
   subtype APB4RSTR_COMP12RST_Field is Interfaces.STM32.Bit;
   subtype APB4RSTR_VREFRST_Field is Interfaces.STM32.Bit;
   subtype APB4RSTR_SAI4RST_Field is Interfaces.STM32.Bit;

   --  RCC APB4 Peripheral Reset Register
   type APB4RSTR_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.STM32.Bit := 16#0#;
      --  SYSCFG block reset
      SYSCFGRST      : APB4RSTR_SYSCFGRST_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : Interfaces.STM32.Bit := 16#0#;
      --  LPUART1 block reset
      LPUART1RST     : APB4RSTR_LPUART1RST_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : Interfaces.STM32.Bit := 16#0#;
      --  SPI6 block reset
      SPI6RST        : APB4RSTR_SPI6RST_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : Interfaces.STM32.Bit := 16#0#;
      --  I2C4 block reset
      I2C4RST        : APB4RSTR_I2C4RST_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : Interfaces.STM32.Bit := 16#0#;
      --  LPTIM2 block reset
      LPTIM2RST      : APB4RSTR_LPTIM2RST_Field := 16#0#;
      --  LPTIM3 block reset
      LPTIM3RST      : APB4RSTR_LPTIM3RST_Field := 16#0#;
      --  LPTIM4 block reset
      LPTIM4RST      : APB4RSTR_LPTIM4RST_Field := 16#0#;
      --  LPTIM5 block reset
      LPTIM5RST      : APB4RSTR_LPTIM5RST_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  COMP12 Blocks Reset
      COMP12RST      : APB4RSTR_COMP12RST_Field := 16#0#;
      --  VREF block reset
      VREFRST        : APB4RSTR_VREFRST_Field := 16#0#;
      --  unspecified
      Reserved_16_20 : Interfaces.STM32.UInt5 := 16#0#;
      --  SAI4 block reset
      SAI4RST        : APB4RSTR_SAI4RST_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.STM32.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB4RSTR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      SYSCFGRST      at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      LPUART1RST     at 0 range 3 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      SPI6RST        at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      I2C4RST        at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      LPTIM2RST      at 0 range 9 .. 9;
      LPTIM3RST      at 0 range 10 .. 10;
      LPTIM4RST      at 0 range 11 .. 11;
      LPTIM5RST      at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      COMP12RST      at 0 range 14 .. 14;
      VREFRST        at 0 range 15 .. 15;
      Reserved_16_20 at 0 range 16 .. 20;
      SAI4RST        at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype GCR_WW1RSC_Field is Interfaces.STM32.Bit;

   --  RCC Global Control Register
   type GCR_Register is record
      --  WWDG1 reset scope control
      WW1RSC        : GCR_WW1RSC_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : Interfaces.STM32.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GCR_Register use record
      WW1RSC        at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype D3AMR_BDMAAMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_LPUART1AMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_SPI6AMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_I2C4AMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_LPTIM2AMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_LPTIM3AMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_LPTIM4AMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_LPTIM5AMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_COMP12AMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_VREFAMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_RTCAMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_CRCAMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_SAI4AMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_ADC3AMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_BKPRAMAMEN_Field is Interfaces.STM32.Bit;
   subtype D3AMR_SRAM4AMEN_Field is Interfaces.STM32.Bit;

   --  RCC D3 Autonomous mode Register
   type D3AMR_Register is record
      --  BDMA and DMAMUX Autonomous mode enable
      BDMAAMEN       : D3AMR_BDMAAMEN_Field := 16#0#;
      --  unspecified
      Reserved_1_2   : Interfaces.STM32.UInt2 := 16#0#;
      --  LPUART1 Autonomous mode enable
      LPUART1AMEN    : D3AMR_LPUART1AMEN_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : Interfaces.STM32.Bit := 16#0#;
      --  SPI6 Autonomous mode enable
      SPI6AMEN       : D3AMR_SPI6AMEN_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : Interfaces.STM32.Bit := 16#0#;
      --  I2C4 Autonomous mode enable
      I2C4AMEN       : D3AMR_I2C4AMEN_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : Interfaces.STM32.Bit := 16#0#;
      --  LPTIM2 Autonomous mode enable
      LPTIM2AMEN     : D3AMR_LPTIM2AMEN_Field := 16#0#;
      --  LPTIM3 Autonomous mode enable
      LPTIM3AMEN     : D3AMR_LPTIM3AMEN_Field := 16#0#;
      --  LPTIM4 Autonomous mode enable
      LPTIM4AMEN     : D3AMR_LPTIM4AMEN_Field := 16#0#;
      --  LPTIM5 Autonomous mode enable
      LPTIM5AMEN     : D3AMR_LPTIM5AMEN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  COMP12 Autonomous mode enable
      COMP12AMEN     : D3AMR_COMP12AMEN_Field := 16#0#;
      --  VREF Autonomous mode enable
      VREFAMEN       : D3AMR_VREFAMEN_Field := 16#0#;
      --  RTC Autonomous mode enable
      RTCAMEN        : D3AMR_RTCAMEN_Field := 16#0#;
      --  unspecified
      Reserved_17_18 : Interfaces.STM32.UInt2 := 16#0#;
      --  CRC Autonomous mode enable
      CRCAMEN        : D3AMR_CRCAMEN_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#0#;
      --  SAI4 Autonomous mode enable
      SAI4AMEN       : D3AMR_SAI4AMEN_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : Interfaces.STM32.UInt2 := 16#0#;
      --  ADC3 Autonomous mode enable
      ADC3AMEN       : D3AMR_ADC3AMEN_Field := 16#0#;
      --  unspecified
      Reserved_25_27 : Interfaces.STM32.UInt3 := 16#0#;
      --  Backup RAM Autonomous mode enable
      BKPRAMAMEN     : D3AMR_BKPRAMAMEN_Field := 16#0#;
      --  SRAM4 Autonomous mode enable
      SRAM4AMEN      : D3AMR_SRAM4AMEN_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : Interfaces.STM32.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for D3AMR_Register use record
      BDMAAMEN       at 0 range 0 .. 0;
      Reserved_1_2   at 0 range 1 .. 2;
      LPUART1AMEN    at 0 range 3 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      SPI6AMEN       at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      I2C4AMEN       at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      LPTIM2AMEN     at 0 range 9 .. 9;
      LPTIM3AMEN     at 0 range 10 .. 10;
      LPTIM4AMEN     at 0 range 11 .. 11;
      LPTIM5AMEN     at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      COMP12AMEN     at 0 range 14 .. 14;
      VREFAMEN       at 0 range 15 .. 15;
      RTCAMEN        at 0 range 16 .. 16;
      Reserved_17_18 at 0 range 17 .. 18;
      CRCAMEN        at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      SAI4AMEN       at 0 range 21 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      ADC3AMEN       at 0 range 24 .. 24;
      Reserved_25_27 at 0 range 25 .. 27;
      BKPRAMAMEN     at 0 range 28 .. 28;
      SRAM4AMEN      at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype RSR_RMVF_Field is Interfaces.STM32.Bit;
   subtype RSR_CPURSTF_Field is Interfaces.STM32.Bit;
   subtype RSR_D1RSTF_Field is Interfaces.STM32.Bit;
   subtype RSR_D2RSTF_Field is Interfaces.STM32.Bit;
   subtype RSR_BORRSTF_Field is Interfaces.STM32.Bit;
   subtype RSR_PINRSTF_Field is Interfaces.STM32.Bit;
   subtype RSR_PORRSTF_Field is Interfaces.STM32.Bit;
   subtype RSR_SFTRSTF_Field is Interfaces.STM32.Bit;
   subtype RSR_IWDG1RSTF_Field is Interfaces.STM32.Bit;
   subtype RSR_WWDG1RSTF_Field is Interfaces.STM32.Bit;
   subtype RSR_LPWRRSTF_Field is Interfaces.STM32.Bit;

   --  RCC Reset Status Register
   type RSR_Register is record
      --  unspecified
      Reserved_0_15  : Interfaces.STM32.UInt16 := 16#0#;
      --  Remove reset flag
      RMVF           : RSR_RMVF_Field := 16#0#;
      --  CPU reset flag
      CPURSTF        : RSR_CPURSTF_Field := 16#0#;
      --  unspecified
      Reserved_18_18 : Interfaces.STM32.Bit := 16#0#;
      --  D1 domain power switch reset flag
      D1RSTF         : RSR_D1RSTF_Field := 16#0#;
      --  D2 domain power switch reset flag
      D2RSTF         : RSR_D2RSTF_Field := 16#0#;
      --  BOR reset flag
      BORRSTF        : RSR_BORRSTF_Field := 16#0#;
      --  Pin reset flag (NRST)
      PINRSTF        : RSR_PINRSTF_Field := 16#0#;
      --  POR/PDR reset flag
      PORRSTF        : RSR_PORRSTF_Field := 16#0#;
      --  System reset from CPU reset flag
      SFTRSTF        : RSR_SFTRSTF_Field := 16#0#;
      --  unspecified
      Reserved_25_25 : Interfaces.STM32.Bit := 16#0#;
      --  Independent Watchdog reset flag
      IWDG1RSTF      : RSR_IWDG1RSTF_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : Interfaces.STM32.Bit := 16#0#;
      --  Window Watchdog reset flag
      WWDG1RSTF      : RSR_WWDG1RSTF_Field := 16#0#;
      --  unspecified
      Reserved_29_29 : Interfaces.STM32.Bit := 16#0#;
      --  Reset due to illegal D1 DStandby or CPU CStop flag
      LPWRRSTF       : RSR_LPWRRSTF_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : Interfaces.STM32.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RSR_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      RMVF           at 0 range 16 .. 16;
      CPURSTF        at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      D1RSTF         at 0 range 19 .. 19;
      D2RSTF         at 0 range 20 .. 20;
      BORRSTF        at 0 range 21 .. 21;
      PINRSTF        at 0 range 22 .. 22;
      PORRSTF        at 0 range 23 .. 23;
      SFTRSTF        at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IWDG1RSTF      at 0 range 26 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      WWDG1RSTF      at 0 range 28 .. 28;
      Reserved_29_29 at 0 range 29 .. 29;
      LPWRRSTF       at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype AHB3ENR_MDMAEN_Field is Interfaces.STM32.Bit;
   subtype AHB3ENR_DMA2DEN_Field is Interfaces.STM32.Bit;
   subtype AHB3ENR_JPGDECEN_Field is Interfaces.STM32.Bit;
   subtype AHB3ENR_FMCEN_Field is Interfaces.STM32.Bit;
   subtype AHB3ENR_QSPIEN_Field is Interfaces.STM32.Bit;
   subtype AHB3ENR_SDMMC1EN_Field is Interfaces.STM32.Bit;

   --  RCC AHB3 Clock Register
   type AHB3ENR_Register is record
      --  MDMA Peripheral Clock Enable
      MDMAEN         : AHB3ENR_MDMAEN_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : Interfaces.STM32.UInt3 := 16#0#;
      --  DMA2D Peripheral Clock Enable
      DMA2DEN        : AHB3ENR_DMA2DEN_Field := 16#0#;
      --  JPGDEC Peripheral Clock Enable
      JPGDECEN       : AHB3ENR_JPGDECEN_Field := 16#0#;
      --  unspecified
      Reserved_6_11  : Interfaces.STM32.UInt6 := 16#0#;
      --  FMC Peripheral Clocks Enable
      FMCEN          : AHB3ENR_FMCEN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  QUADSPI and QUADSPI Delay Clock Enable
      QSPIEN         : AHB3ENR_QSPIEN_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit := 16#0#;
      --  SDMMC1 and SDMMC1 Delay Clock Enable
      SDMMC1EN       : AHB3ENR_SDMMC1EN_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.STM32.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB3ENR_Register use record
      MDMAEN         at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      DMA2DEN        at 0 range 4 .. 4;
      JPGDECEN       at 0 range 5 .. 5;
      Reserved_6_11  at 0 range 6 .. 11;
      FMCEN          at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      QSPIEN         at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      SDMMC1EN       at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype AHB1ENR_DMA1EN_Field is Interfaces.STM32.Bit;
   subtype AHB1ENR_DMA2EN_Field is Interfaces.STM32.Bit;
   subtype AHB1ENR_ADC12EN_Field is Interfaces.STM32.Bit;
   subtype AHB1ENR_ETH1MACEN_Field is Interfaces.STM32.Bit;
   subtype AHB1ENR_ETH1TXEN_Field is Interfaces.STM32.Bit;
   subtype AHB1ENR_ETH1RXEN_Field is Interfaces.STM32.Bit;
   subtype AHB1ENR_USB2OTGHSULPIEN_Field is Interfaces.STM32.Bit;
   subtype AHB1ENR_USB1OTGEN_Field is Interfaces.STM32.Bit;
   subtype AHB1ENR_USB1ULPIEN_Field is Interfaces.STM32.Bit;
   subtype AHB1ENR_USB2OTGEN_Field is Interfaces.STM32.Bit;
   subtype AHB1ENR_USB2ULPIEN_Field is Interfaces.STM32.Bit;

   --  RCC AHB1 Clock Register
   type AHB1ENR_Register is record
      --  DMA1 Clock Enable
      DMA1EN          : AHB1ENR_DMA1EN_Field := 16#0#;
      --  DMA2 Clock Enable
      DMA2EN          : AHB1ENR_DMA2EN_Field := 16#0#;
      --  unspecified
      Reserved_2_4    : Interfaces.STM32.UInt3 := 16#0#;
      --  ADC1/2 Peripheral Clocks Enable
      ADC12EN         : AHB1ENR_ADC12EN_Field := 16#0#;
      --  unspecified
      Reserved_6_14   : Interfaces.STM32.UInt9 := 16#0#;
      --  Ethernet MAC bus interface Clock Enable
      ETH1MACEN       : AHB1ENR_ETH1MACEN_Field := 16#0#;
      --  Ethernet Transmission Clock Enable
      ETH1TXEN        : AHB1ENR_ETH1TXEN_Field := 16#0#;
      --  Ethernet Reception Clock Enable
      ETH1RXEN        : AHB1ENR_ETH1RXEN_Field := 16#0#;
      --  Enable USB_PHY2 clocks
      USB2OTGHSULPIEN : AHB1ENR_USB2OTGHSULPIEN_Field := 16#0#;
      --  unspecified
      Reserved_19_24  : Interfaces.STM32.UInt6 := 16#0#;
      --  USB1OTG Peripheral Clocks Enable
      USB1OTGEN       : AHB1ENR_USB1OTGEN_Field := 16#0#;
      --  USB_PHY1 Clocks Enable
      USB1ULPIEN      : AHB1ENR_USB1ULPIEN_Field := 16#0#;
      --  USB2OTG Peripheral Clocks Enable
      USB2OTGEN       : AHB1ENR_USB2OTGEN_Field := 16#0#;
      --  USB_PHY2 Clocks Enable
      USB2ULPIEN      : AHB1ENR_USB2ULPIEN_Field := 16#0#;
      --  unspecified
      Reserved_29_31  : Interfaces.STM32.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB1ENR_Register use record
      DMA1EN          at 0 range 0 .. 0;
      DMA2EN          at 0 range 1 .. 1;
      Reserved_2_4    at 0 range 2 .. 4;
      ADC12EN         at 0 range 5 .. 5;
      Reserved_6_14   at 0 range 6 .. 14;
      ETH1MACEN       at 0 range 15 .. 15;
      ETH1TXEN        at 0 range 16 .. 16;
      ETH1RXEN        at 0 range 17 .. 17;
      USB2OTGHSULPIEN at 0 range 18 .. 18;
      Reserved_19_24  at 0 range 19 .. 24;
      USB1OTGEN       at 0 range 25 .. 25;
      USB1ULPIEN      at 0 range 26 .. 26;
      USB2OTGEN       at 0 range 27 .. 27;
      USB2ULPIEN      at 0 range 28 .. 28;
      Reserved_29_31  at 0 range 29 .. 31;
   end record;

   subtype AHB2ENR_CAMITFEN_Field is Interfaces.STM32.Bit;
   subtype AHB2ENR_CRYPTEN_Field is Interfaces.STM32.Bit;
   subtype AHB2ENR_HASHEN_Field is Interfaces.STM32.Bit;
   subtype AHB2ENR_RNGEN_Field is Interfaces.STM32.Bit;
   subtype AHB2ENR_SDMMC2EN_Field is Interfaces.STM32.Bit;
   subtype AHB2ENR_SRAM1EN_Field is Interfaces.STM32.Bit;
   subtype AHB2ENR_SRAM2EN_Field is Interfaces.STM32.Bit;
   subtype AHB2ENR_SRAM3EN_Field is Interfaces.STM32.Bit;

   --  RCC AHB2 Clock Register
   type AHB2ENR_Register is record
      --  CAMITF peripheral clock enable
      CAMITFEN       : AHB2ENR_CAMITFEN_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : Interfaces.STM32.UInt3 := 16#0#;
      --  CRYPT peripheral clock enable
      CRYPTEN        : AHB2ENR_CRYPTEN_Field := 16#0#;
      --  HASH peripheral clock enable
      HASHEN         : AHB2ENR_HASHEN_Field := 16#0#;
      --  RNG peripheral clocks enable
      RNGEN          : AHB2ENR_RNGEN_Field := 16#0#;
      --  unspecified
      Reserved_7_8   : Interfaces.STM32.UInt2 := 16#0#;
      --  SDMMC2 and SDMMC2 delay clock enable
      SDMMC2EN       : AHB2ENR_SDMMC2EN_Field := 16#0#;
      --  unspecified
      Reserved_10_28 : Interfaces.STM32.UInt19 := 16#0#;
      --  SRAM1 block enable
      SRAM1EN        : AHB2ENR_SRAM1EN_Field := 16#0#;
      --  SRAM2 block enable
      SRAM2EN        : AHB2ENR_SRAM2EN_Field := 16#0#;
      --  SRAM3 block enable
      SRAM3EN        : AHB2ENR_SRAM3EN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB2ENR_Register use record
      CAMITFEN       at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      CRYPTEN        at 0 range 4 .. 4;
      HASHEN         at 0 range 5 .. 5;
      RNGEN          at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      SDMMC2EN       at 0 range 9 .. 9;
      Reserved_10_28 at 0 range 10 .. 28;
      SRAM1EN        at 0 range 29 .. 29;
      SRAM2EN        at 0 range 30 .. 30;
      SRAM3EN        at 0 range 31 .. 31;
   end record;

   subtype AHB4ENR_GPIOAEN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_GPIOBEN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_GPIOCEN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_GPIODEN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_GPIOEEN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_GPIOFEN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_GPIOGEN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_GPIOHEN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_GPIOIEN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_GPIOJEN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_GPIOKEN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_CRCEN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_BDMAEN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_ADC3EN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_HSEMEN_Field is Interfaces.STM32.Bit;
   subtype AHB4ENR_BKPRAMEN_Field is Interfaces.STM32.Bit;

   --  RCC AHB4 Clock Register
   type AHB4ENR_Register is record
      --  0GPIO peripheral clock enable
      GPIOAEN        : AHB4ENR_GPIOAEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOBEN        : AHB4ENR_GPIOBEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOCEN        : AHB4ENR_GPIOCEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIODEN        : AHB4ENR_GPIODEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOEEN        : AHB4ENR_GPIOEEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOFEN        : AHB4ENR_GPIOFEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOGEN        : AHB4ENR_GPIOGEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOHEN        : AHB4ENR_GPIOHEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOIEN        : AHB4ENR_GPIOIEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOJEN        : AHB4ENR_GPIOJEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOKEN        : AHB4ENR_GPIOKEN_Field := 16#0#;
      --  unspecified
      Reserved_11_18 : Interfaces.STM32.Byte := 16#0#;
      --  CRC peripheral clock enable
      CRCEN          : AHB4ENR_CRCEN_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#0#;
      --  BDMA and DMAMUX2 Clock Enable
      BDMAEN         : AHB4ENR_BDMAEN_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : Interfaces.STM32.UInt2 := 16#0#;
      --  ADC3 Peripheral Clocks Enable
      ADC3EN         : AHB4ENR_ADC3EN_Field := 16#0#;
      --  HSEM peripheral clock enable
      HSEMEN         : AHB4ENR_HSEMEN_Field := 16#0#;
      --  unspecified
      Reserved_26_27 : Interfaces.STM32.UInt2 := 16#0#;
      --  Backup RAM Clock Enable
      BKPRAMEN       : AHB4ENR_BKPRAMEN_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.STM32.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB4ENR_Register use record
      GPIOAEN        at 0 range 0 .. 0;
      GPIOBEN        at 0 range 1 .. 1;
      GPIOCEN        at 0 range 2 .. 2;
      GPIODEN        at 0 range 3 .. 3;
      GPIOEEN        at 0 range 4 .. 4;
      GPIOFEN        at 0 range 5 .. 5;
      GPIOGEN        at 0 range 6 .. 6;
      GPIOHEN        at 0 range 7 .. 7;
      GPIOIEN        at 0 range 8 .. 8;
      GPIOJEN        at 0 range 9 .. 9;
      GPIOKEN        at 0 range 10 .. 10;
      Reserved_11_18 at 0 range 11 .. 18;
      CRCEN          at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      BDMAEN         at 0 range 21 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      ADC3EN         at 0 range 24 .. 24;
      HSEMEN         at 0 range 25 .. 25;
      Reserved_26_27 at 0 range 26 .. 27;
      BKPRAMEN       at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype APB3ENR_LTDCEN_Field is Interfaces.STM32.Bit;
   subtype APB3ENR_WWDG1EN_Field is Interfaces.STM32.Bit;

   --  RCC APB3 Clock Register
   type APB3ENR_Register is record
      --  unspecified
      Reserved_0_2  : Interfaces.STM32.UInt3 := 16#0#;
      --  LTDC peripheral clock enable
      LTDCEN        : APB3ENR_LTDCEN_Field := 16#0#;
      --  unspecified
      Reserved_4_5  : Interfaces.STM32.UInt2 := 16#0#;
      --  WWDG1 Clock Enable
      WWDG1EN       : APB3ENR_WWDG1EN_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : Interfaces.STM32.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB3ENR_Register use record
      Reserved_0_2  at 0 range 0 .. 2;
      LTDCEN        at 0 range 3 .. 3;
      Reserved_4_5  at 0 range 4 .. 5;
      WWDG1EN       at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype APB1LENR_TIM2EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_TIM3EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_TIM4EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_TIM5EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_TIM6EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_TIM7EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_TIM12EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_TIM13EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_TIM14EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_LPTIM1EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_SPI2EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_SPI3EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_SPDIFRXEN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_USART2EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_USART3EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_UART4EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_UART5EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_I2C1EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_I2C2EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_I2C3EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_CECEN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_DAC12EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_UART7EN_Field is Interfaces.STM32.Bit;
   subtype APB1LENR_UART8EN_Field is Interfaces.STM32.Bit;

   --  RCC APB1 Clock Register
   type APB1LENR_Register is record
      --  TIM peripheral clock enable
      TIM2EN         : APB1LENR_TIM2EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM3EN         : APB1LENR_TIM3EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM4EN         : APB1LENR_TIM4EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM5EN         : APB1LENR_TIM5EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM6EN         : APB1LENR_TIM6EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM7EN         : APB1LENR_TIM7EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM12EN        : APB1LENR_TIM12EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM13EN        : APB1LENR_TIM13EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM14EN        : APB1LENR_TIM14EN_Field := 16#0#;
      --  LPTIM1 Peripheral Clocks Enable
      LPTIM1EN       : APB1LENR_LPTIM1EN_Field := 16#0#;
      --  unspecified
      Reserved_10_13 : Interfaces.STM32.UInt4 := 16#0#;
      --  SPI2 Peripheral Clocks Enable
      SPI2EN         : APB1LENR_SPI2EN_Field := 16#0#;
      --  SPI3 Peripheral Clocks Enable
      SPI3EN         : APB1LENR_SPI3EN_Field := 16#0#;
      --  SPDIFRX Peripheral Clocks Enable
      SPDIFRXEN      : APB1LENR_SPDIFRXEN_Field := 16#0#;
      --  USART2 Peripheral Clocks Enable
      USART2EN       : APB1LENR_USART2EN_Field := 16#0#;
      --  USART3 Peripheral Clocks Enable
      USART3EN       : APB1LENR_USART3EN_Field := 16#0#;
      --  UART4 Peripheral Clocks Enable
      UART4EN        : APB1LENR_UART4EN_Field := 16#0#;
      --  UART5 Peripheral Clocks Enable
      UART5EN        : APB1LENR_UART5EN_Field := 16#0#;
      --  I2C1 Peripheral Clocks Enable
      I2C1EN         : APB1LENR_I2C1EN_Field := 16#0#;
      --  I2C2 Peripheral Clocks Enable
      I2C2EN         : APB1LENR_I2C2EN_Field := 16#0#;
      --  I2C3 Peripheral Clocks Enable
      I2C3EN         : APB1LENR_I2C3EN_Field := 16#0#;
      --  unspecified
      Reserved_24_26 : Interfaces.STM32.UInt3 := 16#0#;
      --  HDMI-CEC peripheral clock enable
      CECEN          : APB1LENR_CECEN_Field := 16#0#;
      --  unspecified
      Reserved_28_28 : Interfaces.STM32.Bit := 16#0#;
      --  DAC1&2 peripheral clock enable
      DAC12EN        : APB1LENR_DAC12EN_Field := 16#0#;
      --  UART7 Peripheral Clocks Enable
      UART7EN        : APB1LENR_UART7EN_Field := 16#0#;
      --  UART8 Peripheral Clocks Enable
      UART8EN        : APB1LENR_UART8EN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1LENR_Register use record
      TIM2EN         at 0 range 0 .. 0;
      TIM3EN         at 0 range 1 .. 1;
      TIM4EN         at 0 range 2 .. 2;
      TIM5EN         at 0 range 3 .. 3;
      TIM6EN         at 0 range 4 .. 4;
      TIM7EN         at 0 range 5 .. 5;
      TIM12EN        at 0 range 6 .. 6;
      TIM13EN        at 0 range 7 .. 7;
      TIM14EN        at 0 range 8 .. 8;
      LPTIM1EN       at 0 range 9 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      SPI2EN         at 0 range 14 .. 14;
      SPI3EN         at 0 range 15 .. 15;
      SPDIFRXEN      at 0 range 16 .. 16;
      USART2EN       at 0 range 17 .. 17;
      USART3EN       at 0 range 18 .. 18;
      UART4EN        at 0 range 19 .. 19;
      UART5EN        at 0 range 20 .. 20;
      I2C1EN         at 0 range 21 .. 21;
      I2C2EN         at 0 range 22 .. 22;
      I2C3EN         at 0 range 23 .. 23;
      Reserved_24_26 at 0 range 24 .. 26;
      CECEN          at 0 range 27 .. 27;
      Reserved_28_28 at 0 range 28 .. 28;
      DAC12EN        at 0 range 29 .. 29;
      UART7EN        at 0 range 30 .. 30;
      UART8EN        at 0 range 31 .. 31;
   end record;

   subtype APB1HENR_CRSEN_Field is Interfaces.STM32.Bit;
   subtype APB1HENR_SWPEN_Field is Interfaces.STM32.Bit;
   subtype APB1HENR_OPAMPEN_Field is Interfaces.STM32.Bit;
   subtype APB1HENR_MDIOSEN_Field is Interfaces.STM32.Bit;
   subtype APB1HENR_FDCANEN_Field is Interfaces.STM32.Bit;

   --  RCC APB1 Clock Register
   type APB1HENR_Register is record
      --  unspecified
      Reserved_0_0  : Interfaces.STM32.Bit := 16#0#;
      --  Clock Recovery System peripheral clock enable
      CRSEN         : APB1HENR_CRSEN_Field := 16#0#;
      --  SWPMI Peripheral Clocks Enable
      SWPEN         : APB1HENR_SWPEN_Field := 16#0#;
      --  unspecified
      Reserved_3_3  : Interfaces.STM32.Bit := 16#0#;
      --  OPAMP peripheral clock enable
      OPAMPEN       : APB1HENR_OPAMPEN_Field := 16#0#;
      --  MDIOS peripheral clock enable
      MDIOSEN       : APB1HENR_MDIOSEN_Field := 16#0#;
      --  unspecified
      Reserved_6_7  : Interfaces.STM32.UInt2 := 16#0#;
      --  FDCAN Peripheral Clocks Enable
      FDCANEN       : APB1HENR_FDCANEN_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : Interfaces.STM32.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1HENR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      CRSEN         at 0 range 1 .. 1;
      SWPEN         at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      OPAMPEN       at 0 range 4 .. 4;
      MDIOSEN       at 0 range 5 .. 5;
      Reserved_6_7  at 0 range 6 .. 7;
      FDCANEN       at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype APB2ENR_TIM1EN_Field is Interfaces.STM32.Bit;
   subtype APB2ENR_TIM8EN_Field is Interfaces.STM32.Bit;
   subtype APB2ENR_USART1EN_Field is Interfaces.STM32.Bit;
   subtype APB2ENR_USART6EN_Field is Interfaces.STM32.Bit;
   subtype APB2ENR_SPI1EN_Field is Interfaces.STM32.Bit;
   subtype APB2ENR_SPI4EN_Field is Interfaces.STM32.Bit;
   subtype APB2ENR_TIM15EN_Field is Interfaces.STM32.Bit;
   subtype APB2ENR_TIM16EN_Field is Interfaces.STM32.Bit;
   subtype APB2ENR_TIM17EN_Field is Interfaces.STM32.Bit;
   subtype APB2ENR_SPI5EN_Field is Interfaces.STM32.Bit;
   subtype APB2ENR_SAI1EN_Field is Interfaces.STM32.Bit;
   subtype APB2ENR_SAI2EN_Field is Interfaces.STM32.Bit;
   subtype APB2ENR_SAI3EN_Field is Interfaces.STM32.Bit;
   subtype APB2ENR_DFSDM1EN_Field is Interfaces.STM32.Bit;
   subtype APB2ENR_HRTIMEN_Field is Interfaces.STM32.Bit;

   --  RCC APB2 Clock Register
   type APB2ENR_Register is record
      --  TIM1 peripheral clock enable
      TIM1EN         : APB2ENR_TIM1EN_Field := 16#0#;
      --  TIM8 peripheral clock enable
      TIM8EN         : APB2ENR_TIM8EN_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : Interfaces.STM32.UInt2 := 16#0#;
      --  USART1 Peripheral Clocks Enable
      USART1EN       : APB2ENR_USART1EN_Field := 16#0#;
      --  USART6 Peripheral Clocks Enable
      USART6EN       : APB2ENR_USART6EN_Field := 16#0#;
      --  unspecified
      Reserved_6_11  : Interfaces.STM32.UInt6 := 16#0#;
      --  SPI1 Peripheral Clocks Enable
      SPI1EN         : APB2ENR_SPI1EN_Field := 16#0#;
      --  SPI4 Peripheral Clocks Enable
      SPI4EN         : APB2ENR_SPI4EN_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.STM32.UInt2 := 16#0#;
      --  TIM15 peripheral clock enable
      TIM15EN        : APB2ENR_TIM15EN_Field := 16#0#;
      --  TIM16 peripheral clock enable
      TIM16EN        : APB2ENR_TIM16EN_Field := 16#0#;
      --  TIM17 peripheral clock enable
      TIM17EN        : APB2ENR_TIM17EN_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : Interfaces.STM32.Bit := 16#0#;
      --  SPI5 Peripheral Clocks Enable
      SPI5EN         : APB2ENR_SPI5EN_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : Interfaces.STM32.Bit := 16#0#;
      --  SAI1 Peripheral Clocks Enable
      SAI1EN         : APB2ENR_SAI1EN_Field := 16#0#;
      --  SAI2 Peripheral Clocks Enable
      SAI2EN         : APB2ENR_SAI2EN_Field := 16#0#;
      --  SAI3 Peripheral Clocks Enable
      SAI3EN         : APB2ENR_SAI3EN_Field := 16#0#;
      --  unspecified
      Reserved_25_27 : Interfaces.STM32.UInt3 := 16#0#;
      --  DFSDM1 Peripheral Clocks Enable
      DFSDM1EN       : APB2ENR_DFSDM1EN_Field := 16#0#;
      --  HRTIM peripheral clock enable
      HRTIMEN        : APB2ENR_HRTIMEN_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : Interfaces.STM32.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB2ENR_Register use record
      TIM1EN         at 0 range 0 .. 0;
      TIM8EN         at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      USART1EN       at 0 range 4 .. 4;
      USART6EN       at 0 range 5 .. 5;
      Reserved_6_11  at 0 range 6 .. 11;
      SPI1EN         at 0 range 12 .. 12;
      SPI4EN         at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      TIM15EN        at 0 range 16 .. 16;
      TIM16EN        at 0 range 17 .. 17;
      TIM17EN        at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      SPI5EN         at 0 range 20 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      SAI1EN         at 0 range 22 .. 22;
      SAI2EN         at 0 range 23 .. 23;
      SAI3EN         at 0 range 24 .. 24;
      Reserved_25_27 at 0 range 25 .. 27;
      DFSDM1EN       at 0 range 28 .. 28;
      HRTIMEN        at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype APB4ENR_SYSCFGEN_Field is Interfaces.STM32.Bit;
   subtype APB4ENR_LPUART1EN_Field is Interfaces.STM32.Bit;
   subtype APB4ENR_SPI6EN_Field is Interfaces.STM32.Bit;
   subtype APB4ENR_I2C4EN_Field is Interfaces.STM32.Bit;
   subtype APB4ENR_LPTIM2EN_Field is Interfaces.STM32.Bit;
   subtype APB4ENR_LPTIM3EN_Field is Interfaces.STM32.Bit;
   subtype APB4ENR_LPTIM4EN_Field is Interfaces.STM32.Bit;
   subtype APB4ENR_LPTIM5EN_Field is Interfaces.STM32.Bit;
   subtype APB4ENR_COMP12EN_Field is Interfaces.STM32.Bit;
   subtype APB4ENR_VREFEN_Field is Interfaces.STM32.Bit;
   subtype APB4ENR_RTCAPBEN_Field is Interfaces.STM32.Bit;
   subtype APB4ENR_SAI4EN_Field is Interfaces.STM32.Bit;

   --  RCC APB4 Clock Register
   type APB4ENR_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.STM32.Bit := 16#0#;
      --  SYSCFG peripheral clock enable
      SYSCFGEN       : APB4ENR_SYSCFGEN_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : Interfaces.STM32.Bit := 16#0#;
      --  LPUART1 Peripheral Clocks Enable
      LPUART1EN      : APB4ENR_LPUART1EN_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : Interfaces.STM32.Bit := 16#0#;
      --  SPI6 Peripheral Clocks Enable
      SPI6EN         : APB4ENR_SPI6EN_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : Interfaces.STM32.Bit := 16#0#;
      --  I2C4 Peripheral Clocks Enable
      I2C4EN         : APB4ENR_I2C4EN_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : Interfaces.STM32.Bit := 16#0#;
      --  LPTIM2 Peripheral Clocks Enable
      LPTIM2EN       : APB4ENR_LPTIM2EN_Field := 16#0#;
      --  LPTIM3 Peripheral Clocks Enable
      LPTIM3EN       : APB4ENR_LPTIM3EN_Field := 16#0#;
      --  LPTIM4 Peripheral Clocks Enable
      LPTIM4EN       : APB4ENR_LPTIM4EN_Field := 16#0#;
      --  LPTIM5 Peripheral Clocks Enable
      LPTIM5EN       : APB4ENR_LPTIM5EN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  COMP1/2 peripheral clock enable
      COMP12EN       : APB4ENR_COMP12EN_Field := 16#0#;
      --  VREF peripheral clock enable
      VREFEN         : APB4ENR_VREFEN_Field := 16#0#;
      --  RTC APB Clock Enable
      RTCAPBEN       : APB4ENR_RTCAPBEN_Field := 16#0#;
      --  unspecified
      Reserved_17_20 : Interfaces.STM32.UInt4 := 16#0#;
      --  SAI4 Peripheral Clocks Enable
      SAI4EN         : APB4ENR_SAI4EN_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.STM32.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB4ENR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      SYSCFGEN       at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      LPUART1EN      at 0 range 3 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      SPI6EN         at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      I2C4EN         at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      LPTIM2EN       at 0 range 9 .. 9;
      LPTIM3EN       at 0 range 10 .. 10;
      LPTIM4EN       at 0 range 11 .. 11;
      LPTIM5EN       at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      COMP12EN       at 0 range 14 .. 14;
      VREFEN         at 0 range 15 .. 15;
      RTCAPBEN       at 0 range 16 .. 16;
      Reserved_17_20 at 0 range 17 .. 20;
      SAI4EN         at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype AHB3LPENR_MDMALPEN_Field is Interfaces.STM32.Bit;
   subtype AHB3LPENR_DMA2DLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB3LPENR_JPGDECLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB3LPENR_FLASHLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB3LPENR_FMCLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB3LPENR_QSPILPEN_Field is Interfaces.STM32.Bit;
   subtype AHB3LPENR_SDMMC1LPEN_Field is Interfaces.STM32.Bit;
   subtype AHB3LPENR_D1DTCM1LPEN_Field is Interfaces.STM32.Bit;
   subtype AHB3LPENR_DTCM2LPEN_Field is Interfaces.STM32.Bit;
   subtype AHB3LPENR_ITCMLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB3LPENR_AXISRAMLPEN_Field is Interfaces.STM32.Bit;

   --  RCC AHB3 Sleep Clock Register
   type AHB3LPENR_Register is record
      --  MDMA Clock Enable During CSleep Mode
      MDMALPEN       : AHB3LPENR_MDMALPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : Interfaces.STM32.UInt3 := 16#0#;
      --  DMA2D Clock Enable During CSleep Mode
      DMA2DLPEN      : AHB3LPENR_DMA2DLPEN_Field := 16#0#;
      --  JPGDEC Clock Enable During CSleep Mode
      JPGDECLPEN     : AHB3LPENR_JPGDECLPEN_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2 := 16#0#;
      --  FLITF Clock Enable During CSleep Mode
      FLASHLPEN      : AHB3LPENR_FLASHLPEN_Field := 16#0#;
      --  unspecified
      Reserved_9_11  : Interfaces.STM32.UInt3 := 16#0#;
      --  FMC Peripheral Clocks Enable During CSleep Mode
      FMCLPEN        : AHB3LPENR_FMCLPEN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  QUADSPI and QUADSPI Delay Clock Enable During CSleep Mode
      QSPILPEN       : AHB3LPENR_QSPILPEN_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit := 16#0#;
      --  SDMMC1 and SDMMC1 Delay Clock Enable During CSleep Mode
      SDMMC1LPEN     : AHB3LPENR_SDMMC1LPEN_Field := 16#0#;
      --  unspecified
      Reserved_17_27 : Interfaces.STM32.UInt11 := 16#0#;
      --  D1DTCM1 Block Clock Enable During CSleep mode
      D1DTCM1LPEN    : AHB3LPENR_D1DTCM1LPEN_Field := 16#0#;
      --  D1 DTCM2 Block Clock Enable During CSleep mode
      DTCM2LPEN      : AHB3LPENR_DTCM2LPEN_Field := 16#0#;
      --  D1ITCM Block Clock Enable During CSleep mode
      ITCMLPEN       : AHB3LPENR_ITCMLPEN_Field := 16#0#;
      --  AXISRAM Block Clock Enable During CSleep mode
      AXISRAMLPEN    : AHB3LPENR_AXISRAMLPEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB3LPENR_Register use record
      MDMALPEN       at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      DMA2DLPEN      at 0 range 4 .. 4;
      JPGDECLPEN     at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      FLASHLPEN      at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      FMCLPEN        at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      QSPILPEN       at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      SDMMC1LPEN     at 0 range 16 .. 16;
      Reserved_17_27 at 0 range 17 .. 27;
      D1DTCM1LPEN    at 0 range 28 .. 28;
      DTCM2LPEN      at 0 range 29 .. 29;
      ITCMLPEN       at 0 range 30 .. 30;
      AXISRAMLPEN    at 0 range 31 .. 31;
   end record;

   subtype AHB1LPENR_DMA1LPEN_Field is Interfaces.STM32.Bit;
   subtype AHB1LPENR_DMA2LPEN_Field is Interfaces.STM32.Bit;
   subtype AHB1LPENR_ADC12LPEN_Field is Interfaces.STM32.Bit;
   subtype AHB1LPENR_ETH1MACLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB1LPENR_ETH1TXLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB1LPENR_ETH1RXLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB1LPENR_USB1OTGHSLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB1LPENR_USB1OTGHSULPILPEN_Field is Interfaces.STM32.Bit;
   subtype AHB1LPENR_USB2OTGHSLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB1LPENR_USB2OTGHSULPILPEN_Field is Interfaces.STM32.Bit;

   --  RCC AHB1 Sleep Clock Register
   type AHB1LPENR_Register is record
      --  DMA1 Clock Enable During CSleep Mode
      DMA1LPEN          : AHB1LPENR_DMA1LPEN_Field := 16#0#;
      --  DMA2 Clock Enable During CSleep Mode
      DMA2LPEN          : AHB1LPENR_DMA2LPEN_Field := 16#0#;
      --  unspecified
      Reserved_2_4      : Interfaces.STM32.UInt3 := 16#0#;
      --  ADC1/2 Peripheral Clocks Enable During CSleep Mode
      ADC12LPEN         : AHB1LPENR_ADC12LPEN_Field := 16#0#;
      --  unspecified
      Reserved_6_14     : Interfaces.STM32.UInt9 := 16#0#;
      --  Ethernet MAC bus interface Clock Enable During CSleep Mode
      ETH1MACLPEN       : AHB1LPENR_ETH1MACLPEN_Field := 16#0#;
      --  Ethernet Transmission Clock Enable During CSleep Mode
      ETH1TXLPEN        : AHB1LPENR_ETH1TXLPEN_Field := 16#0#;
      --  Ethernet Reception Clock Enable During CSleep Mode
      ETH1RXLPEN        : AHB1LPENR_ETH1RXLPEN_Field := 16#0#;
      --  unspecified
      Reserved_18_24    : Interfaces.STM32.UInt7 := 16#0#;
      --  USB1OTG peripheral clock enable during CSleep mode
      USB1OTGHSLPEN     : AHB1LPENR_USB1OTGHSLPEN_Field := 16#0#;
      --  USB_PHY1 clock enable during CSleep mode
      USB1OTGHSULPILPEN : AHB1LPENR_USB1OTGHSULPILPEN_Field := 16#0#;
      --  USB2OTG peripheral clock enable during CSleep mode
      USB2OTGHSLPEN     : AHB1LPENR_USB2OTGHSLPEN_Field := 16#0#;
      --  USB_PHY2 clocks enable during CSleep mode
      USB2OTGHSULPILPEN : AHB1LPENR_USB2OTGHSULPILPEN_Field := 16#0#;
      --  unspecified
      Reserved_29_31    : Interfaces.STM32.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB1LPENR_Register use record
      DMA1LPEN          at 0 range 0 .. 0;
      DMA2LPEN          at 0 range 1 .. 1;
      Reserved_2_4      at 0 range 2 .. 4;
      ADC12LPEN         at 0 range 5 .. 5;
      Reserved_6_14     at 0 range 6 .. 14;
      ETH1MACLPEN       at 0 range 15 .. 15;
      ETH1TXLPEN        at 0 range 16 .. 16;
      ETH1RXLPEN        at 0 range 17 .. 17;
      Reserved_18_24    at 0 range 18 .. 24;
      USB1OTGHSLPEN     at 0 range 25 .. 25;
      USB1OTGHSULPILPEN at 0 range 26 .. 26;
      USB2OTGHSLPEN     at 0 range 27 .. 27;
      USB2OTGHSULPILPEN at 0 range 28 .. 28;
      Reserved_29_31    at 0 range 29 .. 31;
   end record;

   subtype AHB2LPENR_CAMITFLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB2LPENR_CRYPTLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB2LPENR_HASHLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB2LPENR_RNGLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB2LPENR_SDMMC2LPEN_Field is Interfaces.STM32.Bit;
   subtype AHB2LPENR_SRAM1LPEN_Field is Interfaces.STM32.Bit;
   subtype AHB2LPENR_SRAM2LPEN_Field is Interfaces.STM32.Bit;
   subtype AHB2LPENR_SRAM3LPEN_Field is Interfaces.STM32.Bit;

   --  RCC AHB2 Sleep Clock Register
   type AHB2LPENR_Register is record
      --  CAMITF peripheral clock enable during CSleep mode
      CAMITFLPEN     : AHB2LPENR_CAMITFLPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : Interfaces.STM32.UInt3 := 16#0#;
      --  CRYPT peripheral clock enable during CSleep mode
      CRYPTLPEN      : AHB2LPENR_CRYPTLPEN_Field := 16#0#;
      --  HASH peripheral clock enable during CSleep mode
      HASHLPEN       : AHB2LPENR_HASHLPEN_Field := 16#0#;
      --  RNG peripheral clock enable during CSleep mode
      RNGLPEN        : AHB2LPENR_RNGLPEN_Field := 16#0#;
      --  unspecified
      Reserved_7_8   : Interfaces.STM32.UInt2 := 16#0#;
      --  SDMMC2 and SDMMC2 Delay Clock Enable During CSleep Mode
      SDMMC2LPEN     : AHB2LPENR_SDMMC2LPEN_Field := 16#0#;
      --  unspecified
      Reserved_10_28 : Interfaces.STM32.UInt19 := 16#0#;
      --  SRAM1 Clock Enable During CSleep Mode
      SRAM1LPEN      : AHB2LPENR_SRAM1LPEN_Field := 16#0#;
      --  SRAM2 Clock Enable During CSleep Mode
      SRAM2LPEN      : AHB2LPENR_SRAM2LPEN_Field := 16#0#;
      --  SRAM3 Clock Enable During CSleep Mode
      SRAM3LPEN      : AHB2LPENR_SRAM3LPEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB2LPENR_Register use record
      CAMITFLPEN     at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      CRYPTLPEN      at 0 range 4 .. 4;
      HASHLPEN       at 0 range 5 .. 5;
      RNGLPEN        at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      SDMMC2LPEN     at 0 range 9 .. 9;
      Reserved_10_28 at 0 range 10 .. 28;
      SRAM1LPEN      at 0 range 29 .. 29;
      SRAM2LPEN      at 0 range 30 .. 30;
      SRAM3LPEN      at 0 range 31 .. 31;
   end record;

   subtype AHB4LPENR_GPIOALPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_GPIOBLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_GPIOCLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_GPIODLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_GPIOELPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_GPIOFLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_GPIOGLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_GPIOHLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_GPIOILPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_GPIOJLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_GPIOKLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_CRCLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_BDMALPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_ADC3LPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_BKPRAMLPEN_Field is Interfaces.STM32.Bit;
   subtype AHB4LPENR_SRAM4LPEN_Field is Interfaces.STM32.Bit;

   --  RCC AHB4 Sleep Clock Register
   type AHB4LPENR_Register is record
      --  GPIO peripheral clock enable during CSleep mode
      GPIOALPEN      : AHB4LPENR_GPIOALPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOBLPEN      : AHB4LPENR_GPIOBLPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOCLPEN      : AHB4LPENR_GPIOCLPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIODLPEN      : AHB4LPENR_GPIODLPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOELPEN      : AHB4LPENR_GPIOELPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOFLPEN      : AHB4LPENR_GPIOFLPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOGLPEN      : AHB4LPENR_GPIOGLPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOHLPEN      : AHB4LPENR_GPIOHLPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOILPEN      : AHB4LPENR_GPIOILPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOJLPEN      : AHB4LPENR_GPIOJLPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOKLPEN      : AHB4LPENR_GPIOKLPEN_Field := 16#0#;
      --  unspecified
      Reserved_11_18 : Interfaces.STM32.Byte := 16#0#;
      --  CRC peripheral clock enable during CSleep mode
      CRCLPEN        : AHB4LPENR_CRCLPEN_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#0#;
      --  BDMA Clock Enable During CSleep Mode
      BDMALPEN       : AHB4LPENR_BDMALPEN_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : Interfaces.STM32.UInt2 := 16#0#;
      --  ADC3 Peripheral Clocks Enable During CSleep Mode
      ADC3LPEN       : AHB4LPENR_ADC3LPEN_Field := 16#0#;
      --  unspecified
      Reserved_25_27 : Interfaces.STM32.UInt3 := 16#0#;
      --  Backup RAM Clock Enable During CSleep Mode
      BKPRAMLPEN     : AHB4LPENR_BKPRAMLPEN_Field := 16#0#;
      --  SRAM4 Clock Enable During CSleep Mode
      SRAM4LPEN      : AHB4LPENR_SRAM4LPEN_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : Interfaces.STM32.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB4LPENR_Register use record
      GPIOALPEN      at 0 range 0 .. 0;
      GPIOBLPEN      at 0 range 1 .. 1;
      GPIOCLPEN      at 0 range 2 .. 2;
      GPIODLPEN      at 0 range 3 .. 3;
      GPIOELPEN      at 0 range 4 .. 4;
      GPIOFLPEN      at 0 range 5 .. 5;
      GPIOGLPEN      at 0 range 6 .. 6;
      GPIOHLPEN      at 0 range 7 .. 7;
      GPIOILPEN      at 0 range 8 .. 8;
      GPIOJLPEN      at 0 range 9 .. 9;
      GPIOKLPEN      at 0 range 10 .. 10;
      Reserved_11_18 at 0 range 11 .. 18;
      CRCLPEN        at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      BDMALPEN       at 0 range 21 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      ADC3LPEN       at 0 range 24 .. 24;
      Reserved_25_27 at 0 range 25 .. 27;
      BKPRAMLPEN     at 0 range 28 .. 28;
      SRAM4LPEN      at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype APB3LPENR_LTDCLPEN_Field is Interfaces.STM32.Bit;
   subtype APB3LPENR_WWDG1LPEN_Field is Interfaces.STM32.Bit;

   --  RCC APB3 Sleep Clock Register
   type APB3LPENR_Register is record
      --  unspecified
      Reserved_0_2  : Interfaces.STM32.UInt3 := 16#0#;
      --  LTDC peripheral clock enable during CSleep mode
      LTDCLPEN      : APB3LPENR_LTDCLPEN_Field := 16#0#;
      --  unspecified
      Reserved_4_5  : Interfaces.STM32.UInt2 := 16#0#;
      --  WWDG1 Clock Enable During CSleep Mode
      WWDG1LPEN     : APB3LPENR_WWDG1LPEN_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : Interfaces.STM32.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB3LPENR_Register use record
      Reserved_0_2  at 0 range 0 .. 2;
      LTDCLPEN      at 0 range 3 .. 3;
      Reserved_4_5  at 0 range 4 .. 5;
      WWDG1LPEN     at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype APB1LLPENR_TIM2LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_TIM3LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_TIM4LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_TIM5LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_TIM6LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_TIM7LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_TIM12LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_TIM13LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_TIM14LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_LPTIM1LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_SPI2LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_SPI3LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_SPDIFRXLPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_USART2LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_USART3LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_UART4LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_UART5LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_I2C1LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_I2C2LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_I2C3LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_HDMICECLPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_DAC12LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_UART7LPEN_Field is Interfaces.STM32.Bit;
   subtype APB1LLPENR_UART8LPEN_Field is Interfaces.STM32.Bit;

   --  RCC APB1 Low Sleep Clock Register
   type APB1LLPENR_Register is record
      --  TIM2 peripheral clock enable during CSleep mode
      TIM2LPEN       : APB1LLPENR_TIM2LPEN_Field := 16#0#;
      --  TIM3 peripheral clock enable during CSleep mode
      TIM3LPEN       : APB1LLPENR_TIM3LPEN_Field := 16#0#;
      --  TIM4 peripheral clock enable during CSleep mode
      TIM4LPEN       : APB1LLPENR_TIM4LPEN_Field := 16#0#;
      --  TIM5 peripheral clock enable during CSleep mode
      TIM5LPEN       : APB1LLPENR_TIM5LPEN_Field := 16#0#;
      --  TIM6 peripheral clock enable during CSleep mode
      TIM6LPEN       : APB1LLPENR_TIM6LPEN_Field := 16#0#;
      --  TIM7 peripheral clock enable during CSleep mode
      TIM7LPEN       : APB1LLPENR_TIM7LPEN_Field := 16#0#;
      --  TIM12 peripheral clock enable during CSleep mode
      TIM12LPEN      : APB1LLPENR_TIM12LPEN_Field := 16#0#;
      --  TIM13 peripheral clock enable during CSleep mode
      TIM13LPEN      : APB1LLPENR_TIM13LPEN_Field := 16#0#;
      --  TIM14 peripheral clock enable during CSleep mode
      TIM14LPEN      : APB1LLPENR_TIM14LPEN_Field := 16#0#;
      --  LPTIM1 Peripheral Clocks Enable During CSleep Mode
      LPTIM1LPEN     : APB1LLPENR_LPTIM1LPEN_Field := 16#0#;
      --  unspecified
      Reserved_10_13 : Interfaces.STM32.UInt4 := 16#0#;
      --  SPI2 Peripheral Clocks Enable During CSleep Mode
      SPI2LPEN       : APB1LLPENR_SPI2LPEN_Field := 16#0#;
      --  SPI3 Peripheral Clocks Enable During CSleep Mode
      SPI3LPEN       : APB1LLPENR_SPI3LPEN_Field := 16#0#;
      --  SPDIFRX Peripheral Clocks Enable During CSleep Mode
      SPDIFRXLPEN    : APB1LLPENR_SPDIFRXLPEN_Field := 16#0#;
      --  USART2 Peripheral Clocks Enable During CSleep Mode
      USART2LPEN     : APB1LLPENR_USART2LPEN_Field := 16#0#;
      --  USART3 Peripheral Clocks Enable During CSleep Mode
      USART3LPEN     : APB1LLPENR_USART3LPEN_Field := 16#0#;
      --  UART4 Peripheral Clocks Enable During CSleep Mode
      UART4LPEN      : APB1LLPENR_UART4LPEN_Field := 16#0#;
      --  UART5 Peripheral Clocks Enable During CSleep Mode
      UART5LPEN      : APB1LLPENR_UART5LPEN_Field := 16#0#;
      --  I2C1 Peripheral Clocks Enable During CSleep Mode
      I2C1LPEN       : APB1LLPENR_I2C1LPEN_Field := 16#0#;
      --  I2C2 Peripheral Clocks Enable During CSleep Mode
      I2C2LPEN       : APB1LLPENR_I2C2LPEN_Field := 16#0#;
      --  I2C3 Peripheral Clocks Enable During CSleep Mode
      I2C3LPEN       : APB1LLPENR_I2C3LPEN_Field := 16#0#;
      --  unspecified
      Reserved_24_26 : Interfaces.STM32.UInt3 := 16#0#;
      --  HDMI-CEC Peripheral Clocks Enable During CSleep Mode
      HDMICECLPEN    : APB1LLPENR_HDMICECLPEN_Field := 16#0#;
      --  unspecified
      Reserved_28_28 : Interfaces.STM32.Bit := 16#0#;
      --  DAC1/2 peripheral clock enable during CSleep mode
      DAC12LPEN      : APB1LLPENR_DAC12LPEN_Field := 16#0#;
      --  UART7 Peripheral Clocks Enable During CSleep Mode
      UART7LPEN      : APB1LLPENR_UART7LPEN_Field := 16#0#;
      --  UART8 Peripheral Clocks Enable During CSleep Mode
      UART8LPEN      : APB1LLPENR_UART8LPEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1LLPENR_Register use record
      TIM2LPEN       at 0 range 0 .. 0;
      TIM3LPEN       at 0 range 1 .. 1;
      TIM4LPEN       at 0 range 2 .. 2;
      TIM5LPEN       at 0 range 3 .. 3;
      TIM6LPEN       at 0 range 4 .. 4;
      TIM7LPEN       at 0 range 5 .. 5;
      TIM12LPEN      at 0 range 6 .. 6;
      TIM13LPEN      at 0 range 7 .. 7;
      TIM14LPEN      at 0 range 8 .. 8;
      LPTIM1LPEN     at 0 range 9 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      SPI2LPEN       at 0 range 14 .. 14;
      SPI3LPEN       at 0 range 15 .. 15;
      SPDIFRXLPEN    at 0 range 16 .. 16;
      USART2LPEN     at 0 range 17 .. 17;
      USART3LPEN     at 0 range 18 .. 18;
      UART4LPEN      at 0 range 19 .. 19;
      UART5LPEN      at 0 range 20 .. 20;
      I2C1LPEN       at 0 range 21 .. 21;
      I2C2LPEN       at 0 range 22 .. 22;
      I2C3LPEN       at 0 range 23 .. 23;
      Reserved_24_26 at 0 range 24 .. 26;
      HDMICECLPEN    at 0 range 27 .. 27;
      Reserved_28_28 at 0 range 28 .. 28;
      DAC12LPEN      at 0 range 29 .. 29;
      UART7LPEN      at 0 range 30 .. 30;
      UART8LPEN      at 0 range 31 .. 31;
   end record;

   subtype APB1HLPENR_CRSLPEN_Field is Interfaces.STM32.Bit;
   subtype APB1HLPENR_SWPLPEN_Field is Interfaces.STM32.Bit;
   subtype APB1HLPENR_OPAMPLPEN_Field is Interfaces.STM32.Bit;
   subtype APB1HLPENR_MDIOSLPEN_Field is Interfaces.STM32.Bit;
   subtype APB1HLPENR_FDCANLPEN_Field is Interfaces.STM32.Bit;

   --  RCC APB1 High Sleep Clock Register
   type APB1HLPENR_Register is record
      --  unspecified
      Reserved_0_0  : Interfaces.STM32.Bit := 16#0#;
      --  Clock Recovery System peripheral clock enable during CSleep mode
      CRSLPEN       : APB1HLPENR_CRSLPEN_Field := 16#0#;
      --  SWPMI Peripheral Clocks Enable During CSleep Mode
      SWPLPEN       : APB1HLPENR_SWPLPEN_Field := 16#0#;
      --  unspecified
      Reserved_3_3  : Interfaces.STM32.Bit := 16#0#;
      --  OPAMP peripheral clock enable during CSleep mode
      OPAMPLPEN     : APB1HLPENR_OPAMPLPEN_Field := 16#0#;
      --  MDIOS peripheral clock enable during CSleep mode
      MDIOSLPEN     : APB1HLPENR_MDIOSLPEN_Field := 16#0#;
      --  unspecified
      Reserved_6_7  : Interfaces.STM32.UInt2 := 16#0#;
      --  FDCAN Peripheral Clocks Enable During CSleep Mode
      FDCANLPEN     : APB1HLPENR_FDCANLPEN_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : Interfaces.STM32.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1HLPENR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      CRSLPEN       at 0 range 1 .. 1;
      SWPLPEN       at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      OPAMPLPEN     at 0 range 4 .. 4;
      MDIOSLPEN     at 0 range 5 .. 5;
      Reserved_6_7  at 0 range 6 .. 7;
      FDCANLPEN     at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype APB2LPENR_TIM1LPEN_Field is Interfaces.STM32.Bit;
   subtype APB2LPENR_TIM8LPEN_Field is Interfaces.STM32.Bit;
   subtype APB2LPENR_USART1LPEN_Field is Interfaces.STM32.Bit;
   subtype APB2LPENR_USART6LPEN_Field is Interfaces.STM32.Bit;
   subtype APB2LPENR_SPI1LPEN_Field is Interfaces.STM32.Bit;
   subtype APB2LPENR_SPI4LPEN_Field is Interfaces.STM32.Bit;
   subtype APB2LPENR_TIM15LPEN_Field is Interfaces.STM32.Bit;
   subtype APB2LPENR_TIM16LPEN_Field is Interfaces.STM32.Bit;
   subtype APB2LPENR_TIM17LPEN_Field is Interfaces.STM32.Bit;
   subtype APB2LPENR_SPI5LPEN_Field is Interfaces.STM32.Bit;
   subtype APB2LPENR_SAI1LPEN_Field is Interfaces.STM32.Bit;
   subtype APB2LPENR_SAI2LPEN_Field is Interfaces.STM32.Bit;
   subtype APB2LPENR_SAI3LPEN_Field is Interfaces.STM32.Bit;
   subtype APB2LPENR_DFSDM1LPEN_Field is Interfaces.STM32.Bit;
   subtype APB2LPENR_HRTIMLPEN_Field is Interfaces.STM32.Bit;

   --  RCC APB2 Sleep Clock Register
   type APB2LPENR_Register is record
      --  TIM1 peripheral clock enable during CSleep mode
      TIM1LPEN       : APB2LPENR_TIM1LPEN_Field := 16#0#;
      --  TIM8 peripheral clock enable during CSleep mode
      TIM8LPEN       : APB2LPENR_TIM8LPEN_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : Interfaces.STM32.UInt2 := 16#0#;
      --  USART1 Peripheral Clocks Enable During CSleep Mode
      USART1LPEN     : APB2LPENR_USART1LPEN_Field := 16#0#;
      --  USART6 Peripheral Clocks Enable During CSleep Mode
      USART6LPEN     : APB2LPENR_USART6LPEN_Field := 16#0#;
      --  unspecified
      Reserved_6_11  : Interfaces.STM32.UInt6 := 16#0#;
      --  SPI1 Peripheral Clocks Enable During CSleep Mode
      SPI1LPEN       : APB2LPENR_SPI1LPEN_Field := 16#0#;
      --  SPI4 Peripheral Clocks Enable During CSleep Mode
      SPI4LPEN       : APB2LPENR_SPI4LPEN_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.STM32.UInt2 := 16#0#;
      --  TIM15 peripheral clock enable during CSleep mode
      TIM15LPEN      : APB2LPENR_TIM15LPEN_Field := 16#0#;
      --  TIM16 peripheral clock enable during CSleep mode
      TIM16LPEN      : APB2LPENR_TIM16LPEN_Field := 16#0#;
      --  TIM17 peripheral clock enable during CSleep mode
      TIM17LPEN      : APB2LPENR_TIM17LPEN_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : Interfaces.STM32.Bit := 16#0#;
      --  SPI5 Peripheral Clocks Enable During CSleep Mode
      SPI5LPEN       : APB2LPENR_SPI5LPEN_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : Interfaces.STM32.Bit := 16#0#;
      --  SAI1 Peripheral Clocks Enable During CSleep Mode
      SAI1LPEN       : APB2LPENR_SAI1LPEN_Field := 16#0#;
      --  SAI2 Peripheral Clocks Enable During CSleep Mode
      SAI2LPEN       : APB2LPENR_SAI2LPEN_Field := 16#0#;
      --  SAI3 Peripheral Clocks Enable During CSleep Mode
      SAI3LPEN       : APB2LPENR_SAI3LPEN_Field := 16#0#;
      --  unspecified
      Reserved_25_27 : Interfaces.STM32.UInt3 := 16#0#;
      --  DFSDM1 Peripheral Clocks Enable During CSleep Mode
      DFSDM1LPEN     : APB2LPENR_DFSDM1LPEN_Field := 16#0#;
      --  HRTIM peripheral clock enable during CSleep mode
      HRTIMLPEN      : APB2LPENR_HRTIMLPEN_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : Interfaces.STM32.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB2LPENR_Register use record
      TIM1LPEN       at 0 range 0 .. 0;
      TIM8LPEN       at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      USART1LPEN     at 0 range 4 .. 4;
      USART6LPEN     at 0 range 5 .. 5;
      Reserved_6_11  at 0 range 6 .. 11;
      SPI1LPEN       at 0 range 12 .. 12;
      SPI4LPEN       at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      TIM15LPEN      at 0 range 16 .. 16;
      TIM16LPEN      at 0 range 17 .. 17;
      TIM17LPEN      at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      SPI5LPEN       at 0 range 20 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      SAI1LPEN       at 0 range 22 .. 22;
      SAI2LPEN       at 0 range 23 .. 23;
      SAI3LPEN       at 0 range 24 .. 24;
      Reserved_25_27 at 0 range 25 .. 27;
      DFSDM1LPEN     at 0 range 28 .. 28;
      HRTIMLPEN      at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype APB4LPENR_SYSCFGLPEN_Field is Interfaces.STM32.Bit;
   subtype APB4LPENR_LPUART1LPEN_Field is Interfaces.STM32.Bit;
   subtype APB4LPENR_SPI6LPEN_Field is Interfaces.STM32.Bit;
   subtype APB4LPENR_I2C4LPEN_Field is Interfaces.STM32.Bit;
   subtype APB4LPENR_LPTIM2LPEN_Field is Interfaces.STM32.Bit;
   subtype APB4LPENR_LPTIM3LPEN_Field is Interfaces.STM32.Bit;
   subtype APB4LPENR_LPTIM4LPEN_Field is Interfaces.STM32.Bit;
   subtype APB4LPENR_LPTIM5LPEN_Field is Interfaces.STM32.Bit;
   subtype APB4LPENR_COMP12LPEN_Field is Interfaces.STM32.Bit;
   subtype APB4LPENR_VREFLPEN_Field is Interfaces.STM32.Bit;
   subtype APB4LPENR_RTCAPBLPEN_Field is Interfaces.STM32.Bit;
   subtype APB4LPENR_SAI4LPEN_Field is Interfaces.STM32.Bit;

   --  RCC APB4 Sleep Clock Register
   type APB4LPENR_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.STM32.Bit := 16#0#;
      --  SYSCFG peripheral clock enable during CSleep mode
      SYSCFGLPEN     : APB4LPENR_SYSCFGLPEN_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : Interfaces.STM32.Bit := 16#0#;
      --  LPUART1 Peripheral Clocks Enable During CSleep Mode
      LPUART1LPEN    : APB4LPENR_LPUART1LPEN_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : Interfaces.STM32.Bit := 16#0#;
      --  SPI6 Peripheral Clocks Enable During CSleep Mode
      SPI6LPEN       : APB4LPENR_SPI6LPEN_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : Interfaces.STM32.Bit := 16#0#;
      --  I2C4 Peripheral Clocks Enable During CSleep Mode
      I2C4LPEN       : APB4LPENR_I2C4LPEN_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : Interfaces.STM32.Bit := 16#0#;
      --  LPTIM2 Peripheral Clocks Enable During CSleep Mode
      LPTIM2LPEN     : APB4LPENR_LPTIM2LPEN_Field := 16#0#;
      --  LPTIM3 Peripheral Clocks Enable During CSleep Mode
      LPTIM3LPEN     : APB4LPENR_LPTIM3LPEN_Field := 16#0#;
      --  LPTIM4 Peripheral Clocks Enable During CSleep Mode
      LPTIM4LPEN     : APB4LPENR_LPTIM4LPEN_Field := 16#0#;
      --  LPTIM5 Peripheral Clocks Enable During CSleep Mode
      LPTIM5LPEN     : APB4LPENR_LPTIM5LPEN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  COMP1/2 peripheral clock enable during CSleep mode
      COMP12LPEN     : APB4LPENR_COMP12LPEN_Field := 16#0#;
      --  VREF peripheral clock enable during CSleep mode
      VREFLPEN       : APB4LPENR_VREFLPEN_Field := 16#0#;
      --  RTC APB Clock Enable During CSleep Mode
      RTCAPBLPEN     : APB4LPENR_RTCAPBLPEN_Field := 16#0#;
      --  unspecified
      Reserved_17_20 : Interfaces.STM32.UInt4 := 16#0#;
      --  SAI4 Peripheral Clocks Enable During CSleep Mode
      SAI4LPEN       : APB4LPENR_SAI4LPEN_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.STM32.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB4LPENR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      SYSCFGLPEN     at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      LPUART1LPEN    at 0 range 3 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      SPI6LPEN       at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      I2C4LPEN       at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      LPTIM2LPEN     at 0 range 9 .. 9;
      LPTIM3LPEN     at 0 range 10 .. 10;
      LPTIM4LPEN     at 0 range 11 .. 11;
      LPTIM5LPEN     at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      COMP12LPEN     at 0 range 14 .. 14;
      VREFLPEN       at 0 range 15 .. 15;
      RTCAPBLPEN     at 0 range 16 .. 16;
      Reserved_17_20 at 0 range 17 .. 20;
      SAI4LPEN       at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype C1_RSR_RMVF_Field is Interfaces.STM32.Bit;
   subtype C1_RSR_CPURSTF_Field is Interfaces.STM32.Bit;
   subtype C1_RSR_D1RSTF_Field is Interfaces.STM32.Bit;
   subtype C1_RSR_D2RSTF_Field is Interfaces.STM32.Bit;
   subtype C1_RSR_BORRSTF_Field is Interfaces.STM32.Bit;
   subtype C1_RSR_PINRSTF_Field is Interfaces.STM32.Bit;
   subtype C1_RSR_PORRSTF_Field is Interfaces.STM32.Bit;
   subtype C1_RSR_SFTRSTF_Field is Interfaces.STM32.Bit;
   subtype C1_RSR_IWDG1RSTF_Field is Interfaces.STM32.Bit;
   subtype C1_RSR_WWDG1RSTF_Field is Interfaces.STM32.Bit;
   subtype C1_RSR_LPWRRSTF_Field is Interfaces.STM32.Bit;

   --  RCC Reset Status Register
   type C1_RSR_Register is record
      --  unspecified
      Reserved_0_15  : Interfaces.STM32.UInt16 := 16#0#;
      --  Remove reset flag
      RMVF           : C1_RSR_RMVF_Field := 16#0#;
      --  CPU reset flag
      CPURSTF        : C1_RSR_CPURSTF_Field := 16#0#;
      --  unspecified
      Reserved_18_18 : Interfaces.STM32.Bit := 16#0#;
      --  D1 domain power switch reset flag
      D1RSTF         : C1_RSR_D1RSTF_Field := 16#0#;
      --  D2 domain power switch reset flag
      D2RSTF         : C1_RSR_D2RSTF_Field := 16#0#;
      --  BOR reset flag
      BORRSTF        : C1_RSR_BORRSTF_Field := 16#0#;
      --  Pin reset flag (NRST)
      PINRSTF        : C1_RSR_PINRSTF_Field := 16#0#;
      --  POR/PDR reset flag
      PORRSTF        : C1_RSR_PORRSTF_Field := 16#0#;
      --  System reset from CPU reset flag
      SFTRSTF        : C1_RSR_SFTRSTF_Field := 16#0#;
      --  unspecified
      Reserved_25_25 : Interfaces.STM32.Bit := 16#0#;
      --  Independent Watchdog reset flag
      IWDG1RSTF      : C1_RSR_IWDG1RSTF_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : Interfaces.STM32.Bit := 16#0#;
      --  Window Watchdog reset flag
      WWDG1RSTF      : C1_RSR_WWDG1RSTF_Field := 16#0#;
      --  unspecified
      Reserved_29_29 : Interfaces.STM32.Bit := 16#0#;
      --  Reset due to illegal D1 DStandby or CPU CStop flag
      LPWRRSTF       : C1_RSR_LPWRRSTF_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : Interfaces.STM32.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_RSR_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      RMVF           at 0 range 16 .. 16;
      CPURSTF        at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      D1RSTF         at 0 range 19 .. 19;
      D2RSTF         at 0 range 20 .. 20;
      BORRSTF        at 0 range 21 .. 21;
      PINRSTF        at 0 range 22 .. 22;
      PORRSTF        at 0 range 23 .. 23;
      SFTRSTF        at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      IWDG1RSTF      at 0 range 26 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      WWDG1RSTF      at 0 range 28 .. 28;
      Reserved_29_29 at 0 range 29 .. 29;
      LPWRRSTF       at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype C1_AHB3ENR_MDMAEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3ENR_DMA2DEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3ENR_JPGDECEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3ENR_FMCEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3ENR_QSPIEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3ENR_SDMMC1EN_Field is Interfaces.STM32.Bit;

   --  RCC AHB3 Clock Register
   type C1_AHB3ENR_Register is record
      --  MDMA Peripheral Clock Enable
      MDMAEN         : C1_AHB3ENR_MDMAEN_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : Interfaces.STM32.UInt3 := 16#0#;
      --  DMA2D Peripheral Clock Enable
      DMA2DEN        : C1_AHB3ENR_DMA2DEN_Field := 16#0#;
      --  JPGDEC Peripheral Clock Enable
      JPGDECEN       : C1_AHB3ENR_JPGDECEN_Field := 16#0#;
      --  unspecified
      Reserved_6_11  : Interfaces.STM32.UInt6 := 16#0#;
      --  FMC Peripheral Clocks Enable
      FMCEN          : C1_AHB3ENR_FMCEN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  QUADSPI and QUADSPI Delay Clock Enable
      QSPIEN         : C1_AHB3ENR_QSPIEN_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit := 16#0#;
      --  SDMMC1 and SDMMC1 Delay Clock Enable
      SDMMC1EN       : C1_AHB3ENR_SDMMC1EN_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.STM32.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_AHB3ENR_Register use record
      MDMAEN         at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      DMA2DEN        at 0 range 4 .. 4;
      JPGDECEN       at 0 range 5 .. 5;
      Reserved_6_11  at 0 range 6 .. 11;
      FMCEN          at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      QSPIEN         at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      SDMMC1EN       at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype C1_AHB1ENR_DMA1EN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1ENR_DMA2EN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1ENR_ADC12EN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1ENR_ETH1MACEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1ENR_ETH1TXEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1ENR_ETH1RXEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1ENR_USB1OTGEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1ENR_USB1ULPIEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1ENR_USB2OTGEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1ENR_USB2ULPIEN_Field is Interfaces.STM32.Bit;

   --  RCC AHB1 Clock Register
   type C1_AHB1ENR_Register is record
      --  DMA1 Clock Enable
      DMA1EN         : C1_AHB1ENR_DMA1EN_Field := 16#0#;
      --  DMA2 Clock Enable
      DMA2EN         : C1_AHB1ENR_DMA2EN_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : Interfaces.STM32.UInt3 := 16#0#;
      --  ADC1/2 Peripheral Clocks Enable
      ADC12EN        : C1_AHB1ENR_ADC12EN_Field := 16#0#;
      --  unspecified
      Reserved_6_14  : Interfaces.STM32.UInt9 := 16#0#;
      --  Ethernet MAC bus interface Clock Enable
      ETH1MACEN      : C1_AHB1ENR_ETH1MACEN_Field := 16#0#;
      --  Ethernet Transmission Clock Enable
      ETH1TXEN       : C1_AHB1ENR_ETH1TXEN_Field := 16#0#;
      --  Ethernet Reception Clock Enable
      ETH1RXEN       : C1_AHB1ENR_ETH1RXEN_Field := 16#0#;
      --  unspecified
      Reserved_18_24 : Interfaces.STM32.UInt7 := 16#0#;
      --  USB1OTG Peripheral Clocks Enable
      USB1OTGEN      : C1_AHB1ENR_USB1OTGEN_Field := 16#0#;
      --  USB_PHY1 Clocks Enable
      USB1ULPIEN     : C1_AHB1ENR_USB1ULPIEN_Field := 16#0#;
      --  USB2OTG Peripheral Clocks Enable
      USB2OTGEN      : C1_AHB1ENR_USB2OTGEN_Field := 16#0#;
      --  USB_PHY2 Clocks Enable
      USB2ULPIEN     : C1_AHB1ENR_USB2ULPIEN_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.STM32.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_AHB1ENR_Register use record
      DMA1EN         at 0 range 0 .. 0;
      DMA2EN         at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      ADC12EN        at 0 range 5 .. 5;
      Reserved_6_14  at 0 range 6 .. 14;
      ETH1MACEN      at 0 range 15 .. 15;
      ETH1TXEN       at 0 range 16 .. 16;
      ETH1RXEN       at 0 range 17 .. 17;
      Reserved_18_24 at 0 range 18 .. 24;
      USB1OTGEN      at 0 range 25 .. 25;
      USB1ULPIEN     at 0 range 26 .. 26;
      USB2OTGEN      at 0 range 27 .. 27;
      USB2ULPIEN     at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C1_AHB2ENR_CAMITFEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB2ENR_CRYPTEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB2ENR_HASHEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB2ENR_RNGEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB2ENR_SDMMC2EN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB2ENR_SRAM1EN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB2ENR_SRAM2EN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB2ENR_SRAM3EN_Field is Interfaces.STM32.Bit;

   --  RCC AHB2 Clock Register
   type C1_AHB2ENR_Register is record
      --  CAMITF peripheral clock enable
      CAMITFEN       : C1_AHB2ENR_CAMITFEN_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : Interfaces.STM32.UInt3 := 16#0#;
      --  CRYPT peripheral clock enable
      CRYPTEN        : C1_AHB2ENR_CRYPTEN_Field := 16#0#;
      --  HASH peripheral clock enable
      HASHEN         : C1_AHB2ENR_HASHEN_Field := 16#0#;
      --  RNG peripheral clocks enable
      RNGEN          : C1_AHB2ENR_RNGEN_Field := 16#0#;
      --  unspecified
      Reserved_7_8   : Interfaces.STM32.UInt2 := 16#0#;
      --  SDMMC2 and SDMMC2 delay clock enable
      SDMMC2EN       : C1_AHB2ENR_SDMMC2EN_Field := 16#0#;
      --  unspecified
      Reserved_10_28 : Interfaces.STM32.UInt19 := 16#0#;
      --  SRAM1 block enable
      SRAM1EN        : C1_AHB2ENR_SRAM1EN_Field := 16#0#;
      --  SRAM2 block enable
      SRAM2EN        : C1_AHB2ENR_SRAM2EN_Field := 16#0#;
      --  SRAM3 block enable
      SRAM3EN        : C1_AHB2ENR_SRAM3EN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_AHB2ENR_Register use record
      CAMITFEN       at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      CRYPTEN        at 0 range 4 .. 4;
      HASHEN         at 0 range 5 .. 5;
      RNGEN          at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      SDMMC2EN       at 0 range 9 .. 9;
      Reserved_10_28 at 0 range 10 .. 28;
      SRAM1EN        at 0 range 29 .. 29;
      SRAM2EN        at 0 range 30 .. 30;
      SRAM3EN        at 0 range 31 .. 31;
   end record;

   subtype C1_AHB4ENR_GPIOAEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_GPIOBEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_GPIOCEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_GPIODEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_GPIOEEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_GPIOFEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_GPIOGEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_GPIOHEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_GPIOIEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_GPIOJEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_GPIOKEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_CRCEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_BDMAEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_ADC3EN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_HSEMEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4ENR_BKPRAMEN_Field is Interfaces.STM32.Bit;

   --  RCC AHB4 Clock Register
   type C1_AHB4ENR_Register is record
      --  0GPIO peripheral clock enable
      GPIOAEN        : C1_AHB4ENR_GPIOAEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOBEN        : C1_AHB4ENR_GPIOBEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOCEN        : C1_AHB4ENR_GPIOCEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIODEN        : C1_AHB4ENR_GPIODEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOEEN        : C1_AHB4ENR_GPIOEEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOFEN        : C1_AHB4ENR_GPIOFEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOGEN        : C1_AHB4ENR_GPIOGEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOHEN        : C1_AHB4ENR_GPIOHEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOIEN        : C1_AHB4ENR_GPIOIEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOJEN        : C1_AHB4ENR_GPIOJEN_Field := 16#0#;
      --  0GPIO peripheral clock enable
      GPIOKEN        : C1_AHB4ENR_GPIOKEN_Field := 16#0#;
      --  unspecified
      Reserved_11_18 : Interfaces.STM32.Byte := 16#0#;
      --  CRC peripheral clock enable
      CRCEN          : C1_AHB4ENR_CRCEN_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#0#;
      --  BDMA and DMAMUX2 Clock Enable
      BDMAEN         : C1_AHB4ENR_BDMAEN_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : Interfaces.STM32.UInt2 := 16#0#;
      --  ADC3 Peripheral Clocks Enable
      ADC3EN         : C1_AHB4ENR_ADC3EN_Field := 16#0#;
      --  HSEM peripheral clock enable
      HSEMEN         : C1_AHB4ENR_HSEMEN_Field := 16#0#;
      --  unspecified
      Reserved_26_27 : Interfaces.STM32.UInt2 := 16#0#;
      --  Backup RAM Clock Enable
      BKPRAMEN       : C1_AHB4ENR_BKPRAMEN_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.STM32.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_AHB4ENR_Register use record
      GPIOAEN        at 0 range 0 .. 0;
      GPIOBEN        at 0 range 1 .. 1;
      GPIOCEN        at 0 range 2 .. 2;
      GPIODEN        at 0 range 3 .. 3;
      GPIOEEN        at 0 range 4 .. 4;
      GPIOFEN        at 0 range 5 .. 5;
      GPIOGEN        at 0 range 6 .. 6;
      GPIOHEN        at 0 range 7 .. 7;
      GPIOIEN        at 0 range 8 .. 8;
      GPIOJEN        at 0 range 9 .. 9;
      GPIOKEN        at 0 range 10 .. 10;
      Reserved_11_18 at 0 range 11 .. 18;
      CRCEN          at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      BDMAEN         at 0 range 21 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      ADC3EN         at 0 range 24 .. 24;
      HSEMEN         at 0 range 25 .. 25;
      Reserved_26_27 at 0 range 26 .. 27;
      BKPRAMEN       at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C1_APB3ENR_LTDCEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB3ENR_WWDG1EN_Field is Interfaces.STM32.Bit;

   --  RCC APB3 Clock Register
   type C1_APB3ENR_Register is record
      --  unspecified
      Reserved_0_2  : Interfaces.STM32.UInt3 := 16#0#;
      --  LTDC peripheral clock enable
      LTDCEN        : C1_APB3ENR_LTDCEN_Field := 16#0#;
      --  unspecified
      Reserved_4_5  : Interfaces.STM32.UInt2 := 16#0#;
      --  WWDG1 Clock Enable
      WWDG1EN       : C1_APB3ENR_WWDG1EN_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : Interfaces.STM32.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_APB3ENR_Register use record
      Reserved_0_2  at 0 range 0 .. 2;
      LTDCEN        at 0 range 3 .. 3;
      Reserved_4_5  at 0 range 4 .. 5;
      WWDG1EN       at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype C1_APB1LENR_TIM2EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_TIM3EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_TIM4EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_TIM5EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_TIM6EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_TIM7EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_TIM12EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_TIM13EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_TIM14EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_LPTIM1EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_SPI2EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_SPI3EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_SPDIFRXEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_USART2EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_USART3EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_UART4EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_UART5EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_I2C1EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_I2C2EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_I2C3EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_HDMICECEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_DAC12EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_UART7EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LENR_UART8EN_Field is Interfaces.STM32.Bit;

   --  RCC APB1 Clock Register
   type C1_APB1LENR_Register is record
      --  TIM peripheral clock enable
      TIM2EN         : C1_APB1LENR_TIM2EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM3EN         : C1_APB1LENR_TIM3EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM4EN         : C1_APB1LENR_TIM4EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM5EN         : C1_APB1LENR_TIM5EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM6EN         : C1_APB1LENR_TIM6EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM7EN         : C1_APB1LENR_TIM7EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM12EN        : C1_APB1LENR_TIM12EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM13EN        : C1_APB1LENR_TIM13EN_Field := 16#0#;
      --  TIM peripheral clock enable
      TIM14EN        : C1_APB1LENR_TIM14EN_Field := 16#0#;
      --  LPTIM1 Peripheral Clocks Enable
      LPTIM1EN       : C1_APB1LENR_LPTIM1EN_Field := 16#0#;
      --  unspecified
      Reserved_10_13 : Interfaces.STM32.UInt4 := 16#0#;
      --  SPI2 Peripheral Clocks Enable
      SPI2EN         : C1_APB1LENR_SPI2EN_Field := 16#0#;
      --  SPI3 Peripheral Clocks Enable
      SPI3EN         : C1_APB1LENR_SPI3EN_Field := 16#0#;
      --  SPDIFRX Peripheral Clocks Enable
      SPDIFRXEN      : C1_APB1LENR_SPDIFRXEN_Field := 16#0#;
      --  USART2 Peripheral Clocks Enable
      USART2EN       : C1_APB1LENR_USART2EN_Field := 16#0#;
      --  USART3 Peripheral Clocks Enable
      USART3EN       : C1_APB1LENR_USART3EN_Field := 16#0#;
      --  UART4 Peripheral Clocks Enable
      UART4EN        : C1_APB1LENR_UART4EN_Field := 16#0#;
      --  UART5 Peripheral Clocks Enable
      UART5EN        : C1_APB1LENR_UART5EN_Field := 16#0#;
      --  I2C1 Peripheral Clocks Enable
      I2C1EN         : C1_APB1LENR_I2C1EN_Field := 16#0#;
      --  I2C2 Peripheral Clocks Enable
      I2C2EN         : C1_APB1LENR_I2C2EN_Field := 16#0#;
      --  I2C3 Peripheral Clocks Enable
      I2C3EN         : C1_APB1LENR_I2C3EN_Field := 16#0#;
      --  unspecified
      Reserved_24_26 : Interfaces.STM32.UInt3 := 16#0#;
      --  HDMI-CEC peripheral clock enable
      HDMICECEN      : C1_APB1LENR_HDMICECEN_Field := 16#0#;
      --  unspecified
      Reserved_28_28 : Interfaces.STM32.Bit := 16#0#;
      --  DAC1&2 peripheral clock enable
      DAC12EN        : C1_APB1LENR_DAC12EN_Field := 16#0#;
      --  UART7 Peripheral Clocks Enable
      UART7EN        : C1_APB1LENR_UART7EN_Field := 16#0#;
      --  UART8 Peripheral Clocks Enable
      UART8EN        : C1_APB1LENR_UART8EN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_APB1LENR_Register use record
      TIM2EN         at 0 range 0 .. 0;
      TIM3EN         at 0 range 1 .. 1;
      TIM4EN         at 0 range 2 .. 2;
      TIM5EN         at 0 range 3 .. 3;
      TIM6EN         at 0 range 4 .. 4;
      TIM7EN         at 0 range 5 .. 5;
      TIM12EN        at 0 range 6 .. 6;
      TIM13EN        at 0 range 7 .. 7;
      TIM14EN        at 0 range 8 .. 8;
      LPTIM1EN       at 0 range 9 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      SPI2EN         at 0 range 14 .. 14;
      SPI3EN         at 0 range 15 .. 15;
      SPDIFRXEN      at 0 range 16 .. 16;
      USART2EN       at 0 range 17 .. 17;
      USART3EN       at 0 range 18 .. 18;
      UART4EN        at 0 range 19 .. 19;
      UART5EN        at 0 range 20 .. 20;
      I2C1EN         at 0 range 21 .. 21;
      I2C2EN         at 0 range 22 .. 22;
      I2C3EN         at 0 range 23 .. 23;
      Reserved_24_26 at 0 range 24 .. 26;
      HDMICECEN      at 0 range 27 .. 27;
      Reserved_28_28 at 0 range 28 .. 28;
      DAC12EN        at 0 range 29 .. 29;
      UART7EN        at 0 range 30 .. 30;
      UART8EN        at 0 range 31 .. 31;
   end record;

   subtype C1_APB1HENR_CRSEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1HENR_SWPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1HENR_OPAMPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1HENR_MDIOSEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1HENR_FDCANEN_Field is Interfaces.STM32.Bit;

   --  RCC APB1 Clock Register
   type C1_APB1HENR_Register is record
      --  unspecified
      Reserved_0_0  : Interfaces.STM32.Bit := 16#0#;
      --  Clock Recovery System peripheral clock enable
      CRSEN         : C1_APB1HENR_CRSEN_Field := 16#0#;
      --  SWPMI Peripheral Clocks Enable
      SWPEN         : C1_APB1HENR_SWPEN_Field := 16#0#;
      --  unspecified
      Reserved_3_3  : Interfaces.STM32.Bit := 16#0#;
      --  OPAMP peripheral clock enable
      OPAMPEN       : C1_APB1HENR_OPAMPEN_Field := 16#0#;
      --  MDIOS peripheral clock enable
      MDIOSEN       : C1_APB1HENR_MDIOSEN_Field := 16#0#;
      --  unspecified
      Reserved_6_7  : Interfaces.STM32.UInt2 := 16#0#;
      --  FDCAN Peripheral Clocks Enable
      FDCANEN       : C1_APB1HENR_FDCANEN_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : Interfaces.STM32.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_APB1HENR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      CRSEN         at 0 range 1 .. 1;
      SWPEN         at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      OPAMPEN       at 0 range 4 .. 4;
      MDIOSEN       at 0 range 5 .. 5;
      Reserved_6_7  at 0 range 6 .. 7;
      FDCANEN       at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype C1_APB2ENR_TIM1EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2ENR_TIM8EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2ENR_USART1EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2ENR_USART6EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2ENR_SPI1EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2ENR_SPI4EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2ENR_TIM15EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2ENR_TIM16EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2ENR_TIM17EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2ENR_SPI5EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2ENR_SAI1EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2ENR_SAI2EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2ENR_SAI3EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2ENR_DFSDM1EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2ENR_HRTIMEN_Field is Interfaces.STM32.Bit;

   --  RCC APB2 Clock Register
   type C1_APB2ENR_Register is record
      --  TIM1 peripheral clock enable
      TIM1EN         : C1_APB2ENR_TIM1EN_Field := 16#0#;
      --  TIM8 peripheral clock enable
      TIM8EN         : C1_APB2ENR_TIM8EN_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : Interfaces.STM32.UInt2 := 16#0#;
      --  USART1 Peripheral Clocks Enable
      USART1EN       : C1_APB2ENR_USART1EN_Field := 16#0#;
      --  USART6 Peripheral Clocks Enable
      USART6EN       : C1_APB2ENR_USART6EN_Field := 16#0#;
      --  unspecified
      Reserved_6_11  : Interfaces.STM32.UInt6 := 16#0#;
      --  SPI1 Peripheral Clocks Enable
      SPI1EN         : C1_APB2ENR_SPI1EN_Field := 16#0#;
      --  SPI4 Peripheral Clocks Enable
      SPI4EN         : C1_APB2ENR_SPI4EN_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.STM32.UInt2 := 16#0#;
      --  TIM15 peripheral clock enable
      TIM15EN        : C1_APB2ENR_TIM15EN_Field := 16#0#;
      --  TIM16 peripheral clock enable
      TIM16EN        : C1_APB2ENR_TIM16EN_Field := 16#0#;
      --  TIM17 peripheral clock enable
      TIM17EN        : C1_APB2ENR_TIM17EN_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : Interfaces.STM32.Bit := 16#0#;
      --  SPI5 Peripheral Clocks Enable
      SPI5EN         : C1_APB2ENR_SPI5EN_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : Interfaces.STM32.Bit := 16#0#;
      --  SAI1 Peripheral Clocks Enable
      SAI1EN         : C1_APB2ENR_SAI1EN_Field := 16#0#;
      --  SAI2 Peripheral Clocks Enable
      SAI2EN         : C1_APB2ENR_SAI2EN_Field := 16#0#;
      --  SAI3 Peripheral Clocks Enable
      SAI3EN         : C1_APB2ENR_SAI3EN_Field := 16#0#;
      --  unspecified
      Reserved_25_27 : Interfaces.STM32.UInt3 := 16#0#;
      --  DFSDM1 Peripheral Clocks Enable
      DFSDM1EN       : C1_APB2ENR_DFSDM1EN_Field := 16#0#;
      --  HRTIM peripheral clock enable
      HRTIMEN        : C1_APB2ENR_HRTIMEN_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : Interfaces.STM32.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_APB2ENR_Register use record
      TIM1EN         at 0 range 0 .. 0;
      TIM8EN         at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      USART1EN       at 0 range 4 .. 4;
      USART6EN       at 0 range 5 .. 5;
      Reserved_6_11  at 0 range 6 .. 11;
      SPI1EN         at 0 range 12 .. 12;
      SPI4EN         at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      TIM15EN        at 0 range 16 .. 16;
      TIM16EN        at 0 range 17 .. 17;
      TIM17EN        at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      SPI5EN         at 0 range 20 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      SAI1EN         at 0 range 22 .. 22;
      SAI2EN         at 0 range 23 .. 23;
      SAI3EN         at 0 range 24 .. 24;
      Reserved_25_27 at 0 range 25 .. 27;
      DFSDM1EN       at 0 range 28 .. 28;
      HRTIMEN        at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype C1_APB4ENR_SYSCFGEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4ENR_LPUART1EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4ENR_SPI6EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4ENR_I2C4EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4ENR_LPTIM2EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4ENR_LPTIM3EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4ENR_LPTIM4EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4ENR_LPTIM5EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4ENR_COMP12EN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4ENR_VREFEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4ENR_RTCAPBEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4ENR_SAI4EN_Field is Interfaces.STM32.Bit;

   --  RCC APB4 Clock Register
   type C1_APB4ENR_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.STM32.Bit := 16#0#;
      --  SYSCFG peripheral clock enable
      SYSCFGEN       : C1_APB4ENR_SYSCFGEN_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : Interfaces.STM32.Bit := 16#0#;
      --  LPUART1 Peripheral Clocks Enable
      LPUART1EN      : C1_APB4ENR_LPUART1EN_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : Interfaces.STM32.Bit := 16#0#;
      --  SPI6 Peripheral Clocks Enable
      SPI6EN         : C1_APB4ENR_SPI6EN_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : Interfaces.STM32.Bit := 16#0#;
      --  I2C4 Peripheral Clocks Enable
      I2C4EN         : C1_APB4ENR_I2C4EN_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : Interfaces.STM32.Bit := 16#0#;
      --  LPTIM2 Peripheral Clocks Enable
      LPTIM2EN       : C1_APB4ENR_LPTIM2EN_Field := 16#0#;
      --  LPTIM3 Peripheral Clocks Enable
      LPTIM3EN       : C1_APB4ENR_LPTIM3EN_Field := 16#0#;
      --  LPTIM4 Peripheral Clocks Enable
      LPTIM4EN       : C1_APB4ENR_LPTIM4EN_Field := 16#0#;
      --  LPTIM5 Peripheral Clocks Enable
      LPTIM5EN       : C1_APB4ENR_LPTIM5EN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  COMP1/2 peripheral clock enable
      COMP12EN       : C1_APB4ENR_COMP12EN_Field := 16#0#;
      --  VREF peripheral clock enable
      VREFEN         : C1_APB4ENR_VREFEN_Field := 16#0#;
      --  RTC APB Clock Enable
      RTCAPBEN       : C1_APB4ENR_RTCAPBEN_Field := 16#0#;
      --  unspecified
      Reserved_17_20 : Interfaces.STM32.UInt4 := 16#0#;
      --  SAI4 Peripheral Clocks Enable
      SAI4EN         : C1_APB4ENR_SAI4EN_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.STM32.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_APB4ENR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      SYSCFGEN       at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      LPUART1EN      at 0 range 3 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      SPI6EN         at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      I2C4EN         at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      LPTIM2EN       at 0 range 9 .. 9;
      LPTIM3EN       at 0 range 10 .. 10;
      LPTIM4EN       at 0 range 11 .. 11;
      LPTIM5EN       at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      COMP12EN       at 0 range 14 .. 14;
      VREFEN         at 0 range 15 .. 15;
      RTCAPBEN       at 0 range 16 .. 16;
      Reserved_17_20 at 0 range 17 .. 20;
      SAI4EN         at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype C1_AHB3LPENR_MDMALPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3LPENR_DMA2DLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3LPENR_JPGDECLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3LPENR_FLITFLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3LPENR_FMCLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3LPENR_QSPILPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3LPENR_SDMMC1LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3LPENR_D1DTCM1LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3LPENR_DTCM2LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3LPENR_ITCMLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB3LPENR_AXISRAMLPEN_Field is Interfaces.STM32.Bit;

   --  RCC AHB3 Sleep Clock Register
   type C1_AHB3LPENR_Register is record
      --  MDMA Clock Enable During CSleep Mode
      MDMALPEN       : C1_AHB3LPENR_MDMALPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : Interfaces.STM32.UInt3 := 16#0#;
      --  DMA2D Clock Enable During CSleep Mode
      DMA2DLPEN      : C1_AHB3LPENR_DMA2DLPEN_Field := 16#0#;
      --  JPGDEC Clock Enable During CSleep Mode
      JPGDECLPEN     : C1_AHB3LPENR_JPGDECLPEN_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.STM32.UInt2 := 16#0#;
      --  FLITF Clock Enable During CSleep Mode
      FLITFLPEN      : C1_AHB3LPENR_FLITFLPEN_Field := 16#0#;
      --  unspecified
      Reserved_9_11  : Interfaces.STM32.UInt3 := 16#0#;
      --  FMC Peripheral Clocks Enable During CSleep Mode
      FMCLPEN        : C1_AHB3LPENR_FMCLPEN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  QUADSPI and QUADSPI Delay Clock Enable During CSleep Mode
      QSPILPEN       : C1_AHB3LPENR_QSPILPEN_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.STM32.Bit := 16#0#;
      --  SDMMC1 and SDMMC1 Delay Clock Enable During CSleep Mode
      SDMMC1LPEN     : C1_AHB3LPENR_SDMMC1LPEN_Field := 16#0#;
      --  unspecified
      Reserved_17_27 : Interfaces.STM32.UInt11 := 16#0#;
      --  D1DTCM1 Block Clock Enable During CSleep mode
      D1DTCM1LPEN    : C1_AHB3LPENR_D1DTCM1LPEN_Field := 16#0#;
      --  D1 DTCM2 Block Clock Enable During CSleep mode
      DTCM2LPEN      : C1_AHB3LPENR_DTCM2LPEN_Field := 16#0#;
      --  D1ITCM Block Clock Enable During CSleep mode
      ITCMLPEN       : C1_AHB3LPENR_ITCMLPEN_Field := 16#0#;
      --  AXISRAM Block Clock Enable During CSleep mode
      AXISRAMLPEN    : C1_AHB3LPENR_AXISRAMLPEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_AHB3LPENR_Register use record
      MDMALPEN       at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      DMA2DLPEN      at 0 range 4 .. 4;
      JPGDECLPEN     at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      FLITFLPEN      at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      FMCLPEN        at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      QSPILPEN       at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      SDMMC1LPEN     at 0 range 16 .. 16;
      Reserved_17_27 at 0 range 17 .. 27;
      D1DTCM1LPEN    at 0 range 28 .. 28;
      DTCM2LPEN      at 0 range 29 .. 29;
      ITCMLPEN       at 0 range 30 .. 30;
      AXISRAMLPEN    at 0 range 31 .. 31;
   end record;

   subtype C1_AHB1LPENR_DMA1LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1LPENR_DMA2LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1LPENR_ADC12LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1LPENR_ETH1MACLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1LPENR_ETH1TXLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1LPENR_ETH1RXLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1LPENR_USB1OTGLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1LPENR_USB1ULPILPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1LPENR_USB2OTGLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB1LPENR_USB2ULPILPEN_Field is Interfaces.STM32.Bit;

   --  RCC AHB1 Sleep Clock Register
   type C1_AHB1LPENR_Register is record
      --  DMA1 Clock Enable During CSleep Mode
      DMA1LPEN       : C1_AHB1LPENR_DMA1LPEN_Field := 16#0#;
      --  DMA2 Clock Enable During CSleep Mode
      DMA2LPEN       : C1_AHB1LPENR_DMA2LPEN_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : Interfaces.STM32.UInt3 := 16#0#;
      --  ADC1/2 Peripheral Clocks Enable During CSleep Mode
      ADC12LPEN      : C1_AHB1LPENR_ADC12LPEN_Field := 16#0#;
      --  unspecified
      Reserved_6_14  : Interfaces.STM32.UInt9 := 16#0#;
      --  Ethernet MAC bus interface Clock Enable During CSleep Mode
      ETH1MACLPEN    : C1_AHB1LPENR_ETH1MACLPEN_Field := 16#0#;
      --  Ethernet Transmission Clock Enable During CSleep Mode
      ETH1TXLPEN     : C1_AHB1LPENR_ETH1TXLPEN_Field := 16#0#;
      --  Ethernet Reception Clock Enable During CSleep Mode
      ETH1RXLPEN     : C1_AHB1LPENR_ETH1RXLPEN_Field := 16#0#;
      --  unspecified
      Reserved_18_24 : Interfaces.STM32.UInt7 := 16#0#;
      --  USB1OTG peripheral clock enable during CSleep mode
      USB1OTGLPEN    : C1_AHB1LPENR_USB1OTGLPEN_Field := 16#0#;
      --  USB_PHY1 clock enable during CSleep mode
      USB1ULPILPEN   : C1_AHB1LPENR_USB1ULPILPEN_Field := 16#0#;
      --  USB2OTG peripheral clock enable during CSleep mode
      USB2OTGLPEN    : C1_AHB1LPENR_USB2OTGLPEN_Field := 16#0#;
      --  USB_PHY2 clocks enable during CSleep mode
      USB2ULPILPEN   : C1_AHB1LPENR_USB2ULPILPEN_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.STM32.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_AHB1LPENR_Register use record
      DMA1LPEN       at 0 range 0 .. 0;
      DMA2LPEN       at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      ADC12LPEN      at 0 range 5 .. 5;
      Reserved_6_14  at 0 range 6 .. 14;
      ETH1MACLPEN    at 0 range 15 .. 15;
      ETH1TXLPEN     at 0 range 16 .. 16;
      ETH1RXLPEN     at 0 range 17 .. 17;
      Reserved_18_24 at 0 range 18 .. 24;
      USB1OTGLPEN    at 0 range 25 .. 25;
      USB1ULPILPEN   at 0 range 26 .. 26;
      USB2OTGLPEN    at 0 range 27 .. 27;
      USB2ULPILPEN   at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C1_AHB2LPENR_CAMITFLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB2LPENR_CRYPTLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB2LPENR_HASHLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB2LPENR_RNGLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB2LPENR_SDMMC2LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB2LPENR_SRAM1LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB2LPENR_SRAM2LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB2LPENR_SRAM3LPEN_Field is Interfaces.STM32.Bit;

   --  RCC AHB2 Sleep Clock Register
   type C1_AHB2LPENR_Register is record
      --  CAMITF peripheral clock enable during CSleep mode
      CAMITFLPEN     : C1_AHB2LPENR_CAMITFLPEN_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : Interfaces.STM32.UInt3 := 16#0#;
      --  CRYPT peripheral clock enable during CSleep mode
      CRYPTLPEN      : C1_AHB2LPENR_CRYPTLPEN_Field := 16#0#;
      --  HASH peripheral clock enable during CSleep mode
      HASHLPEN       : C1_AHB2LPENR_HASHLPEN_Field := 16#0#;
      --  RNG peripheral clock enable during CSleep mode
      RNGLPEN        : C1_AHB2LPENR_RNGLPEN_Field := 16#0#;
      --  unspecified
      Reserved_7_8   : Interfaces.STM32.UInt2 := 16#0#;
      --  SDMMC2 and SDMMC2 Delay Clock Enable During CSleep Mode
      SDMMC2LPEN     : C1_AHB2LPENR_SDMMC2LPEN_Field := 16#0#;
      --  unspecified
      Reserved_10_28 : Interfaces.STM32.UInt19 := 16#0#;
      --  SRAM1 Clock Enable During CSleep Mode
      SRAM1LPEN      : C1_AHB2LPENR_SRAM1LPEN_Field := 16#0#;
      --  SRAM2 Clock Enable During CSleep Mode
      SRAM2LPEN      : C1_AHB2LPENR_SRAM2LPEN_Field := 16#0#;
      --  SRAM3 Clock Enable During CSleep Mode
      SRAM3LPEN      : C1_AHB2LPENR_SRAM3LPEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_AHB2LPENR_Register use record
      CAMITFLPEN     at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      CRYPTLPEN      at 0 range 4 .. 4;
      HASHLPEN       at 0 range 5 .. 5;
      RNGLPEN        at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      SDMMC2LPEN     at 0 range 9 .. 9;
      Reserved_10_28 at 0 range 10 .. 28;
      SRAM1LPEN      at 0 range 29 .. 29;
      SRAM2LPEN      at 0 range 30 .. 30;
      SRAM3LPEN      at 0 range 31 .. 31;
   end record;

   subtype C1_AHB4LPENR_GPIOALPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_GPIOBLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_GPIOCLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_GPIODLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_GPIOELPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_GPIOFLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_GPIOGLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_GPIOHLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_GPIOILPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_GPIOJLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_GPIOKLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_CRCLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_BDMALPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_ADC3LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_BKPRAMLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_AHB4LPENR_SRAM4LPEN_Field is Interfaces.STM32.Bit;

   --  RCC AHB4 Sleep Clock Register
   type C1_AHB4LPENR_Register is record
      --  GPIO peripheral clock enable during CSleep mode
      GPIOALPEN      : C1_AHB4LPENR_GPIOALPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOBLPEN      : C1_AHB4LPENR_GPIOBLPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOCLPEN      : C1_AHB4LPENR_GPIOCLPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIODLPEN      : C1_AHB4LPENR_GPIODLPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOELPEN      : C1_AHB4LPENR_GPIOELPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOFLPEN      : C1_AHB4LPENR_GPIOFLPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOGLPEN      : C1_AHB4LPENR_GPIOGLPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOHLPEN      : C1_AHB4LPENR_GPIOHLPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOILPEN      : C1_AHB4LPENR_GPIOILPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOJLPEN      : C1_AHB4LPENR_GPIOJLPEN_Field := 16#0#;
      --  GPIO peripheral clock enable during CSleep mode
      GPIOKLPEN      : C1_AHB4LPENR_GPIOKLPEN_Field := 16#0#;
      --  unspecified
      Reserved_11_18 : Interfaces.STM32.Byte := 16#0#;
      --  CRC peripheral clock enable during CSleep mode
      CRCLPEN        : C1_AHB4LPENR_CRCLPEN_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#0#;
      --  BDMA Clock Enable During CSleep Mode
      BDMALPEN       : C1_AHB4LPENR_BDMALPEN_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : Interfaces.STM32.UInt2 := 16#0#;
      --  ADC3 Peripheral Clocks Enable During CSleep Mode
      ADC3LPEN       : C1_AHB4LPENR_ADC3LPEN_Field := 16#0#;
      --  unspecified
      Reserved_25_27 : Interfaces.STM32.UInt3 := 16#0#;
      --  Backup RAM Clock Enable During CSleep Mode
      BKPRAMLPEN     : C1_AHB4LPENR_BKPRAMLPEN_Field := 16#0#;
      --  SRAM4 Clock Enable During CSleep Mode
      SRAM4LPEN      : C1_AHB4LPENR_SRAM4LPEN_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : Interfaces.STM32.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_AHB4LPENR_Register use record
      GPIOALPEN      at 0 range 0 .. 0;
      GPIOBLPEN      at 0 range 1 .. 1;
      GPIOCLPEN      at 0 range 2 .. 2;
      GPIODLPEN      at 0 range 3 .. 3;
      GPIOELPEN      at 0 range 4 .. 4;
      GPIOFLPEN      at 0 range 5 .. 5;
      GPIOGLPEN      at 0 range 6 .. 6;
      GPIOHLPEN      at 0 range 7 .. 7;
      GPIOILPEN      at 0 range 8 .. 8;
      GPIOJLPEN      at 0 range 9 .. 9;
      GPIOKLPEN      at 0 range 10 .. 10;
      Reserved_11_18 at 0 range 11 .. 18;
      CRCLPEN        at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      BDMALPEN       at 0 range 21 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      ADC3LPEN       at 0 range 24 .. 24;
      Reserved_25_27 at 0 range 25 .. 27;
      BKPRAMLPEN     at 0 range 28 .. 28;
      SRAM4LPEN      at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype C1_APB3LPENR_LTDCLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB3LPENR_WWDG1LPEN_Field is Interfaces.STM32.Bit;

   --  RCC APB3 Sleep Clock Register
   type C1_APB3LPENR_Register is record
      --  unspecified
      Reserved_0_2  : Interfaces.STM32.UInt3 := 16#0#;
      --  LTDC peripheral clock enable during CSleep mode
      LTDCLPEN      : C1_APB3LPENR_LTDCLPEN_Field := 16#0#;
      --  unspecified
      Reserved_4_5  : Interfaces.STM32.UInt2 := 16#0#;
      --  WWDG1 Clock Enable During CSleep Mode
      WWDG1LPEN     : C1_APB3LPENR_WWDG1LPEN_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : Interfaces.STM32.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_APB3LPENR_Register use record
      Reserved_0_2  at 0 range 0 .. 2;
      LTDCLPEN      at 0 range 3 .. 3;
      Reserved_4_5  at 0 range 4 .. 5;
      WWDG1LPEN     at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype C1_APB1LLPENR_TIM2LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_TIM3LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_TIM4LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_TIM5LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_TIM6LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_TIM7LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_TIM12LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_TIM13LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_TIM14LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_LPTIM1LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_SPI2LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_SPI3LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_SPDIFRXLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_USART2LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_USART3LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_UART4LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_UART5LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_I2C1LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_I2C2LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_I2C3LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_HDMICECLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_DAC12LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_UART7LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1LLPENR_UART8LPEN_Field is Interfaces.STM32.Bit;

   --  RCC APB1 Low Sleep Clock Register
   type C1_APB1LLPENR_Register is record
      --  TIM2 peripheral clock enable during CSleep mode
      TIM2LPEN       : C1_APB1LLPENR_TIM2LPEN_Field := 16#0#;
      --  TIM3 peripheral clock enable during CSleep mode
      TIM3LPEN       : C1_APB1LLPENR_TIM3LPEN_Field := 16#0#;
      --  TIM4 peripheral clock enable during CSleep mode
      TIM4LPEN       : C1_APB1LLPENR_TIM4LPEN_Field := 16#0#;
      --  TIM5 peripheral clock enable during CSleep mode
      TIM5LPEN       : C1_APB1LLPENR_TIM5LPEN_Field := 16#0#;
      --  TIM6 peripheral clock enable during CSleep mode
      TIM6LPEN       : C1_APB1LLPENR_TIM6LPEN_Field := 16#0#;
      --  TIM7 peripheral clock enable during CSleep mode
      TIM7LPEN       : C1_APB1LLPENR_TIM7LPEN_Field := 16#0#;
      --  TIM12 peripheral clock enable during CSleep mode
      TIM12LPEN      : C1_APB1LLPENR_TIM12LPEN_Field := 16#0#;
      --  TIM13 peripheral clock enable during CSleep mode
      TIM13LPEN      : C1_APB1LLPENR_TIM13LPEN_Field := 16#0#;
      --  TIM14 peripheral clock enable during CSleep mode
      TIM14LPEN      : C1_APB1LLPENR_TIM14LPEN_Field := 16#0#;
      --  LPTIM1 Peripheral Clocks Enable During CSleep Mode
      LPTIM1LPEN     : C1_APB1LLPENR_LPTIM1LPEN_Field := 16#0#;
      --  unspecified
      Reserved_10_13 : Interfaces.STM32.UInt4 := 16#0#;
      --  SPI2 Peripheral Clocks Enable During CSleep Mode
      SPI2LPEN       : C1_APB1LLPENR_SPI2LPEN_Field := 16#0#;
      --  SPI3 Peripheral Clocks Enable During CSleep Mode
      SPI3LPEN       : C1_APB1LLPENR_SPI3LPEN_Field := 16#0#;
      --  SPDIFRX Peripheral Clocks Enable During CSleep Mode
      SPDIFRXLPEN    : C1_APB1LLPENR_SPDIFRXLPEN_Field := 16#0#;
      --  USART2 Peripheral Clocks Enable During CSleep Mode
      USART2LPEN     : C1_APB1LLPENR_USART2LPEN_Field := 16#0#;
      --  USART3 Peripheral Clocks Enable During CSleep Mode
      USART3LPEN     : C1_APB1LLPENR_USART3LPEN_Field := 16#0#;
      --  UART4 Peripheral Clocks Enable During CSleep Mode
      UART4LPEN      : C1_APB1LLPENR_UART4LPEN_Field := 16#0#;
      --  UART5 Peripheral Clocks Enable During CSleep Mode
      UART5LPEN      : C1_APB1LLPENR_UART5LPEN_Field := 16#0#;
      --  I2C1 Peripheral Clocks Enable During CSleep Mode
      I2C1LPEN       : C1_APB1LLPENR_I2C1LPEN_Field := 16#0#;
      --  I2C2 Peripheral Clocks Enable During CSleep Mode
      I2C2LPEN       : C1_APB1LLPENR_I2C2LPEN_Field := 16#0#;
      --  I2C3 Peripheral Clocks Enable During CSleep Mode
      I2C3LPEN       : C1_APB1LLPENR_I2C3LPEN_Field := 16#0#;
      --  unspecified
      Reserved_24_26 : Interfaces.STM32.UInt3 := 16#0#;
      --  HDMI-CEC Peripheral Clocks Enable During CSleep Mode
      HDMICECLPEN    : C1_APB1LLPENR_HDMICECLPEN_Field := 16#0#;
      --  unspecified
      Reserved_28_28 : Interfaces.STM32.Bit := 16#0#;
      --  DAC1/2 peripheral clock enable during CSleep mode
      DAC12LPEN      : C1_APB1LLPENR_DAC12LPEN_Field := 16#0#;
      --  UART7 Peripheral Clocks Enable During CSleep Mode
      UART7LPEN      : C1_APB1LLPENR_UART7LPEN_Field := 16#0#;
      --  UART8 Peripheral Clocks Enable During CSleep Mode
      UART8LPEN      : C1_APB1LLPENR_UART8LPEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_APB1LLPENR_Register use record
      TIM2LPEN       at 0 range 0 .. 0;
      TIM3LPEN       at 0 range 1 .. 1;
      TIM4LPEN       at 0 range 2 .. 2;
      TIM5LPEN       at 0 range 3 .. 3;
      TIM6LPEN       at 0 range 4 .. 4;
      TIM7LPEN       at 0 range 5 .. 5;
      TIM12LPEN      at 0 range 6 .. 6;
      TIM13LPEN      at 0 range 7 .. 7;
      TIM14LPEN      at 0 range 8 .. 8;
      LPTIM1LPEN     at 0 range 9 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      SPI2LPEN       at 0 range 14 .. 14;
      SPI3LPEN       at 0 range 15 .. 15;
      SPDIFRXLPEN    at 0 range 16 .. 16;
      USART2LPEN     at 0 range 17 .. 17;
      USART3LPEN     at 0 range 18 .. 18;
      UART4LPEN      at 0 range 19 .. 19;
      UART5LPEN      at 0 range 20 .. 20;
      I2C1LPEN       at 0 range 21 .. 21;
      I2C2LPEN       at 0 range 22 .. 22;
      I2C3LPEN       at 0 range 23 .. 23;
      Reserved_24_26 at 0 range 24 .. 26;
      HDMICECLPEN    at 0 range 27 .. 27;
      Reserved_28_28 at 0 range 28 .. 28;
      DAC12LPEN      at 0 range 29 .. 29;
      UART7LPEN      at 0 range 30 .. 30;
      UART8LPEN      at 0 range 31 .. 31;
   end record;

   subtype C1_APB1HLPENR_CRSLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1HLPENR_SWPLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1HLPENR_OPAMPLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1HLPENR_MDIOSLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB1HLPENR_FDCANLPEN_Field is Interfaces.STM32.Bit;

   --  RCC APB1 High Sleep Clock Register
   type C1_APB1HLPENR_Register is record
      --  unspecified
      Reserved_0_0  : Interfaces.STM32.Bit := 16#0#;
      --  Clock Recovery System peripheral clock enable during CSleep mode
      CRSLPEN       : C1_APB1HLPENR_CRSLPEN_Field := 16#0#;
      --  SWPMI Peripheral Clocks Enable During CSleep Mode
      SWPLPEN       : C1_APB1HLPENR_SWPLPEN_Field := 16#0#;
      --  unspecified
      Reserved_3_3  : Interfaces.STM32.Bit := 16#0#;
      --  OPAMP peripheral clock enable during CSleep mode
      OPAMPLPEN     : C1_APB1HLPENR_OPAMPLPEN_Field := 16#0#;
      --  MDIOS peripheral clock enable during CSleep mode
      MDIOSLPEN     : C1_APB1HLPENR_MDIOSLPEN_Field := 16#0#;
      --  unspecified
      Reserved_6_7  : Interfaces.STM32.UInt2 := 16#0#;
      --  FDCAN Peripheral Clocks Enable During CSleep Mode
      FDCANLPEN     : C1_APB1HLPENR_FDCANLPEN_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : Interfaces.STM32.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_APB1HLPENR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      CRSLPEN       at 0 range 1 .. 1;
      SWPLPEN       at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      OPAMPLPEN     at 0 range 4 .. 4;
      MDIOSLPEN     at 0 range 5 .. 5;
      Reserved_6_7  at 0 range 6 .. 7;
      FDCANLPEN     at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype C1_APB2LPENR_TIM1LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2LPENR_TIM8LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2LPENR_USART1LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2LPENR_USART6LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2LPENR_SPI1LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2LPENR_SPI4LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2LPENR_TIM15LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2LPENR_TIM16LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2LPENR_TIM17LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2LPENR_SPI5LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2LPENR_SAI1LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2LPENR_SAI2LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2LPENR_SAI3LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2LPENR_DFSDM1LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB2LPENR_HRTIMLPEN_Field is Interfaces.STM32.Bit;

   --  RCC APB2 Sleep Clock Register
   type C1_APB2LPENR_Register is record
      --  TIM1 peripheral clock enable during CSleep mode
      TIM1LPEN       : C1_APB2LPENR_TIM1LPEN_Field := 16#0#;
      --  TIM8 peripheral clock enable during CSleep mode
      TIM8LPEN       : C1_APB2LPENR_TIM8LPEN_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : Interfaces.STM32.UInt2 := 16#0#;
      --  USART1 Peripheral Clocks Enable During CSleep Mode
      USART1LPEN     : C1_APB2LPENR_USART1LPEN_Field := 16#0#;
      --  USART6 Peripheral Clocks Enable During CSleep Mode
      USART6LPEN     : C1_APB2LPENR_USART6LPEN_Field := 16#0#;
      --  unspecified
      Reserved_6_11  : Interfaces.STM32.UInt6 := 16#0#;
      --  SPI1 Peripheral Clocks Enable During CSleep Mode
      SPI1LPEN       : C1_APB2LPENR_SPI1LPEN_Field := 16#0#;
      --  SPI4 Peripheral Clocks Enable During CSleep Mode
      SPI4LPEN       : C1_APB2LPENR_SPI4LPEN_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.STM32.UInt2 := 16#0#;
      --  TIM15 peripheral clock enable during CSleep mode
      TIM15LPEN      : C1_APB2LPENR_TIM15LPEN_Field := 16#0#;
      --  TIM16 peripheral clock enable during CSleep mode
      TIM16LPEN      : C1_APB2LPENR_TIM16LPEN_Field := 16#0#;
      --  TIM17 peripheral clock enable during CSleep mode
      TIM17LPEN      : C1_APB2LPENR_TIM17LPEN_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : Interfaces.STM32.Bit := 16#0#;
      --  SPI5 Peripheral Clocks Enable During CSleep Mode
      SPI5LPEN       : C1_APB2LPENR_SPI5LPEN_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : Interfaces.STM32.Bit := 16#0#;
      --  SAI1 Peripheral Clocks Enable During CSleep Mode
      SAI1LPEN       : C1_APB2LPENR_SAI1LPEN_Field := 16#0#;
      --  SAI2 Peripheral Clocks Enable During CSleep Mode
      SAI2LPEN       : C1_APB2LPENR_SAI2LPEN_Field := 16#0#;
      --  SAI3 Peripheral Clocks Enable During CSleep Mode
      SAI3LPEN       : C1_APB2LPENR_SAI3LPEN_Field := 16#0#;
      --  unspecified
      Reserved_25_27 : Interfaces.STM32.UInt3 := 16#0#;
      --  DFSDM1 Peripheral Clocks Enable During CSleep Mode
      DFSDM1LPEN     : C1_APB2LPENR_DFSDM1LPEN_Field := 16#0#;
      --  HRTIM peripheral clock enable during CSleep mode
      HRTIMLPEN      : C1_APB2LPENR_HRTIMLPEN_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : Interfaces.STM32.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_APB2LPENR_Register use record
      TIM1LPEN       at 0 range 0 .. 0;
      TIM8LPEN       at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      USART1LPEN     at 0 range 4 .. 4;
      USART6LPEN     at 0 range 5 .. 5;
      Reserved_6_11  at 0 range 6 .. 11;
      SPI1LPEN       at 0 range 12 .. 12;
      SPI4LPEN       at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      TIM15LPEN      at 0 range 16 .. 16;
      TIM16LPEN      at 0 range 17 .. 17;
      TIM17LPEN      at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      SPI5LPEN       at 0 range 20 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      SAI1LPEN       at 0 range 22 .. 22;
      SAI2LPEN       at 0 range 23 .. 23;
      SAI3LPEN       at 0 range 24 .. 24;
      Reserved_25_27 at 0 range 25 .. 27;
      DFSDM1LPEN     at 0 range 28 .. 28;
      HRTIMLPEN      at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype C1_APB4LPENR_SYSCFGLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4LPENR_LPUART1LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4LPENR_SPI6LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4LPENR_I2C4LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4LPENR_LPTIM2LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4LPENR_LPTIM3LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4LPENR_LPTIM4LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4LPENR_LPTIM5LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4LPENR_COMP12LPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4LPENR_VREFLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4LPENR_RTCAPBLPEN_Field is Interfaces.STM32.Bit;
   subtype C1_APB4LPENR_SAI4LPEN_Field is Interfaces.STM32.Bit;

   --  RCC APB4 Sleep Clock Register
   type C1_APB4LPENR_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.STM32.Bit := 16#0#;
      --  SYSCFG peripheral clock enable during CSleep mode
      SYSCFGLPEN     : C1_APB4LPENR_SYSCFGLPEN_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : Interfaces.STM32.Bit := 16#0#;
      --  LPUART1 Peripheral Clocks Enable During CSleep Mode
      LPUART1LPEN    : C1_APB4LPENR_LPUART1LPEN_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : Interfaces.STM32.Bit := 16#0#;
      --  SPI6 Peripheral Clocks Enable During CSleep Mode
      SPI6LPEN       : C1_APB4LPENR_SPI6LPEN_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : Interfaces.STM32.Bit := 16#0#;
      --  I2C4 Peripheral Clocks Enable During CSleep Mode
      I2C4LPEN       : C1_APB4LPENR_I2C4LPEN_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : Interfaces.STM32.Bit := 16#0#;
      --  LPTIM2 Peripheral Clocks Enable During CSleep Mode
      LPTIM2LPEN     : C1_APB4LPENR_LPTIM2LPEN_Field := 16#0#;
      --  LPTIM3 Peripheral Clocks Enable During CSleep Mode
      LPTIM3LPEN     : C1_APB4LPENR_LPTIM3LPEN_Field := 16#0#;
      --  LPTIM4 Peripheral Clocks Enable During CSleep Mode
      LPTIM4LPEN     : C1_APB4LPENR_LPTIM4LPEN_Field := 16#0#;
      --  LPTIM5 Peripheral Clocks Enable During CSleep Mode
      LPTIM5LPEN     : C1_APB4LPENR_LPTIM5LPEN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.STM32.Bit := 16#0#;
      --  COMP1/2 peripheral clock enable during CSleep mode
      COMP12LPEN     : C1_APB4LPENR_COMP12LPEN_Field := 16#0#;
      --  VREF peripheral clock enable during CSleep mode
      VREFLPEN       : C1_APB4LPENR_VREFLPEN_Field := 16#0#;
      --  RTC APB Clock Enable During CSleep Mode
      RTCAPBLPEN     : C1_APB4LPENR_RTCAPBLPEN_Field := 16#0#;
      --  unspecified
      Reserved_17_20 : Interfaces.STM32.UInt4 := 16#0#;
      --  SAI4 Peripheral Clocks Enable During CSleep Mode
      SAI4LPEN       : C1_APB4LPENR_SAI4LPEN_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.STM32.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1_APB4LPENR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      SYSCFGLPEN     at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      LPUART1LPEN    at 0 range 3 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      SPI6LPEN       at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      I2C4LPEN       at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      LPTIM2LPEN     at 0 range 9 .. 9;
      LPTIM3LPEN     at 0 range 10 .. 10;
      LPTIM4LPEN     at 0 range 11 .. 11;
      LPTIM5LPEN     at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      COMP12LPEN     at 0 range 14 .. 14;
      VREFLPEN       at 0 range 15 .. 15;
      RTCAPBLPEN     at 0 range 16 .. 16;
      Reserved_17_20 at 0 range 17 .. 20;
      SAI4LPEN       at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Reset and clock control
   type RCC_Peripheral is record
      --  clock control register
      CR            : aliased CR_Register;
      --  RCC Internal Clock Source Calibration Register
      ICSCR         : aliased ICSCR_Register;
      --  RCC Clock Recovery RC Register
      CRRCR         : aliased CRRCR_Register;
      --  RCC Clock Configuration Register
      CFGR          : aliased CFGR_Register;
      --  RCC Domain 1 Clock Configuration Register
      D1CFGR        : aliased D1CFGR_Register;
      --  RCC Domain 2 Clock Configuration Register
      D2CFGR        : aliased D2CFGR_Register;
      --  RCC Domain 3 Clock Configuration Register
      D3CFGR        : aliased D3CFGR_Register;
      --  RCC PLLs Clock Source Selection Register
      PLLCKSELR     : aliased PLLCKSELR_Register;
      --  RCC PLLs Configuration Register
      PLLCFGR       : aliased PLLCFGR_Register;
      --  RCC PLL1 Dividers Configuration Register
      PLL1DIVR      : aliased PLL1DIVR_Register;
      --  RCC PLL1 Fractional Divider Register
      PLL1FRACR     : aliased PLL1FRACR_Register;
      --  RCC PLL2 Dividers Configuration Register
      PLL2DIVR      : aliased PLL2DIVR_Register;
      --  RCC PLL2 Fractional Divider Register
      PLL2FRACR     : aliased PLL2FRACR_Register;
      --  RCC PLL3 Dividers Configuration Register
      PLL3DIVR      : aliased PLL3DIVR_Register;
      --  RCC PLL3 Fractional Divider Register
      PLL3FRACR     : aliased PLL3FRACR_Register;
      --  RCC Domain 1 Kernel Clock Configuration Register
      D1CCIPR       : aliased D1CCIPR_Register;
      --  RCC Domain 2 Kernel Clock Configuration Register
      D2CCIP1R      : aliased D2CCIP1R_Register;
      --  RCC Domain 2 Kernel Clock Configuration Register
      D2CCIP2R      : aliased D2CCIP2R_Register;
      --  RCC Domain 3 Kernel Clock Configuration Register
      D3CCIPR       : aliased D3CCIPR_Register;
      --  RCC Clock Source Interrupt Enable Register
      CIER          : aliased CIER_Register;
      --  RCC Clock Source Interrupt Flag Register
      CIFR          : aliased CIFR_Register;
      --  RCC Clock Source Interrupt Clear Register
      CICR          : aliased CICR_Register;
      --  RCC Backup Domain Control Register
      BDCR          : aliased BDCR_Register;
      --  RCC Clock Control and Status Register
      CSR           : aliased CSR_Register;
      --  RCC AHB3 Reset Register
      AHB3RSTR      : aliased AHB3RSTR_Register;
      --  RCC AHB1 Peripheral Reset Register
      AHB1RSTR      : aliased AHB1RSTR_Register;
      --  RCC AHB2 Peripheral Reset Register
      AHB2RSTR      : aliased AHB2RSTR_Register;
      --  RCC AHB4 Peripheral Reset Register
      AHB4RSTR      : aliased AHB4RSTR_Register;
      --  RCC APB3 Peripheral Reset Register
      APB3RSTR      : aliased APB3RSTR_Register;
      --  RCC APB1 Peripheral Reset Register
      APB1LRSTR     : aliased APB1LRSTR_Register;
      --  RCC APB1 Peripheral Reset Register
      APB1HRSTR     : aliased APB1HRSTR_Register;
      --  RCC APB2 Peripheral Reset Register
      APB2RSTR      : aliased APB2RSTR_Register;
      --  RCC APB4 Peripheral Reset Register
      APB4RSTR      : aliased APB4RSTR_Register;
      --  RCC Global Control Register
      GCR           : aliased GCR_Register;
      --  RCC D3 Autonomous mode Register
      D3AMR         : aliased D3AMR_Register;
      --  RCC Reset Status Register
      RSR           : aliased RSR_Register;
      --  RCC AHB3 Clock Register
      AHB3ENR       : aliased AHB3ENR_Register;
      --  RCC AHB1 Clock Register
      AHB1ENR       : aliased AHB1ENR_Register;
      --  RCC AHB2 Clock Register
      AHB2ENR       : aliased AHB2ENR_Register;
      --  RCC AHB4 Clock Register
      AHB4ENR       : aliased AHB4ENR_Register;
      --  RCC APB3 Clock Register
      APB3ENR       : aliased APB3ENR_Register;
      --  RCC APB1 Clock Register
      APB1LENR      : aliased APB1LENR_Register;
      --  RCC APB1 Clock Register
      APB1HENR      : aliased APB1HENR_Register;
      --  RCC APB2 Clock Register
      APB2ENR       : aliased APB2ENR_Register;
      --  RCC APB4 Clock Register
      APB4ENR       : aliased APB4ENR_Register;
      --  RCC AHB3 Sleep Clock Register
      AHB3LPENR     : aliased AHB3LPENR_Register;
      --  RCC AHB1 Sleep Clock Register
      AHB1LPENR     : aliased AHB1LPENR_Register;
      --  RCC AHB2 Sleep Clock Register
      AHB2LPENR     : aliased AHB2LPENR_Register;
      --  RCC AHB4 Sleep Clock Register
      AHB4LPENR     : aliased AHB4LPENR_Register;
      --  RCC APB3 Sleep Clock Register
      APB3LPENR     : aliased APB3LPENR_Register;
      --  RCC APB1 Low Sleep Clock Register
      APB1LLPENR    : aliased APB1LLPENR_Register;
      --  RCC APB1 High Sleep Clock Register
      APB1HLPENR    : aliased APB1HLPENR_Register;
      --  RCC APB2 Sleep Clock Register
      APB2LPENR     : aliased APB2LPENR_Register;
      --  RCC APB4 Sleep Clock Register
      APB4LPENR     : aliased APB4LPENR_Register;
      --  RCC Reset Status Register
      C1_RSR        : aliased C1_RSR_Register;
      --  RCC AHB3 Clock Register
      C1_AHB3ENR    : aliased C1_AHB3ENR_Register;
      --  RCC AHB1 Clock Register
      C1_AHB1ENR    : aliased C1_AHB1ENR_Register;
      --  RCC AHB2 Clock Register
      C1_AHB2ENR    : aliased C1_AHB2ENR_Register;
      --  RCC AHB4 Clock Register
      C1_AHB4ENR    : aliased C1_AHB4ENR_Register;
      --  RCC APB3 Clock Register
      C1_APB3ENR    : aliased C1_APB3ENR_Register;
      --  RCC APB1 Clock Register
      C1_APB1LENR   : aliased C1_APB1LENR_Register;
      --  RCC APB1 Clock Register
      C1_APB1HENR   : aliased C1_APB1HENR_Register;
      --  RCC APB2 Clock Register
      C1_APB2ENR    : aliased C1_APB2ENR_Register;
      --  RCC APB4 Clock Register
      C1_APB4ENR    : aliased C1_APB4ENR_Register;
      --  RCC AHB3 Sleep Clock Register
      C1_AHB3LPENR  : aliased C1_AHB3LPENR_Register;
      --  RCC AHB1 Sleep Clock Register
      C1_AHB1LPENR  : aliased C1_AHB1LPENR_Register;
      --  RCC AHB2 Sleep Clock Register
      C1_AHB2LPENR  : aliased C1_AHB2LPENR_Register;
      --  RCC AHB4 Sleep Clock Register
      C1_AHB4LPENR  : aliased C1_AHB4LPENR_Register;
      --  RCC APB3 Sleep Clock Register
      C1_APB3LPENR  : aliased C1_APB3LPENR_Register;
      --  RCC APB1 Low Sleep Clock Register
      C1_APB1LLPENR : aliased C1_APB1LLPENR_Register;
      --  RCC APB1 High Sleep Clock Register
      C1_APB1HLPENR : aliased C1_APB1HLPENR_Register;
      --  RCC APB2 Sleep Clock Register
      C1_APB2LPENR  : aliased C1_APB2LPENR_Register;
      --  RCC APB4 Sleep Clock Register
      C1_APB4LPENR  : aliased C1_APB4LPENR_Register;
   end record
     with Volatile;

   for RCC_Peripheral use record
      CR            at 16#0# range 0 .. 31;
      ICSCR         at 16#4# range 0 .. 31;
      CRRCR         at 16#8# range 0 .. 31;
      CFGR          at 16#10# range 0 .. 31;
      D1CFGR        at 16#18# range 0 .. 31;
      D2CFGR        at 16#1C# range 0 .. 31;
      D3CFGR        at 16#20# range 0 .. 31;
      PLLCKSELR     at 16#28# range 0 .. 31;
      PLLCFGR       at 16#2C# range 0 .. 31;
      PLL1DIVR      at 16#30# range 0 .. 31;
      PLL1FRACR     at 16#34# range 0 .. 31;
      PLL2DIVR      at 16#38# range 0 .. 31;
      PLL2FRACR     at 16#3C# range 0 .. 31;
      PLL3DIVR      at 16#40# range 0 .. 31;
      PLL3FRACR     at 16#44# range 0 .. 31;
      D1CCIPR       at 16#4C# range 0 .. 31;
      D2CCIP1R      at 16#50# range 0 .. 31;
      D2CCIP2R      at 16#54# range 0 .. 31;
      D3CCIPR       at 16#58# range 0 .. 31;
      CIER          at 16#60# range 0 .. 31;
      CIFR          at 16#64# range 0 .. 31;
      CICR          at 16#68# range 0 .. 31;
      BDCR          at 16#70# range 0 .. 31;
      CSR           at 16#74# range 0 .. 31;
      AHB3RSTR      at 16#7C# range 0 .. 31;
      AHB1RSTR      at 16#80# range 0 .. 31;
      AHB2RSTR      at 16#84# range 0 .. 31;
      AHB4RSTR      at 16#88# range 0 .. 31;
      APB3RSTR      at 16#8C# range 0 .. 31;
      APB1LRSTR     at 16#90# range 0 .. 31;
      APB1HRSTR     at 16#94# range 0 .. 31;
      APB2RSTR      at 16#98# range 0 .. 31;
      APB4RSTR      at 16#9C# range 0 .. 31;
      GCR           at 16#A0# range 0 .. 31;
      D3AMR         at 16#A8# range 0 .. 31;
      RSR           at 16#D0# range 0 .. 31;
      AHB3ENR       at 16#D4# range 0 .. 31;
      AHB1ENR       at 16#D8# range 0 .. 31;
      AHB2ENR       at 16#DC# range 0 .. 31;
      AHB4ENR       at 16#E0# range 0 .. 31;
      APB3ENR       at 16#E4# range 0 .. 31;
      APB1LENR      at 16#E8# range 0 .. 31;
      APB1HENR      at 16#EC# range 0 .. 31;
      APB2ENR       at 16#F0# range 0 .. 31;
      APB4ENR       at 16#F4# range 0 .. 31;
      AHB3LPENR     at 16#FC# range 0 .. 31;
      AHB1LPENR     at 16#100# range 0 .. 31;
      AHB2LPENR     at 16#104# range 0 .. 31;
      AHB4LPENR     at 16#108# range 0 .. 31;
      APB3LPENR     at 16#10C# range 0 .. 31;
      APB1LLPENR    at 16#110# range 0 .. 31;
      APB1HLPENR    at 16#114# range 0 .. 31;
      APB2LPENR     at 16#118# range 0 .. 31;
      APB4LPENR     at 16#11C# range 0 .. 31;
      C1_RSR        at 16#130# range 0 .. 31;
      C1_AHB3ENR    at 16#134# range 0 .. 31;
      C1_AHB1ENR    at 16#138# range 0 .. 31;
      C1_AHB2ENR    at 16#13C# range 0 .. 31;
      C1_AHB4ENR    at 16#140# range 0 .. 31;
      C1_APB3ENR    at 16#144# range 0 .. 31;
      C1_APB1LENR   at 16#148# range 0 .. 31;
      C1_APB1HENR   at 16#14C# range 0 .. 31;
      C1_APB2ENR    at 16#150# range 0 .. 31;
      C1_APB4ENR    at 16#154# range 0 .. 31;
      C1_AHB3LPENR  at 16#15C# range 0 .. 31;
      C1_AHB1LPENR  at 16#160# range 0 .. 31;
      C1_AHB2LPENR  at 16#164# range 0 .. 31;
      C1_AHB4LPENR  at 16#168# range 0 .. 31;
      C1_APB3LPENR  at 16#16C# range 0 .. 31;
      C1_APB1LLPENR at 16#170# range 0 .. 31;
      C1_APB1HLPENR at 16#174# range 0 .. 31;
      C1_APB2LPENR  at 16#178# range 0 .. 31;
      C1_APB4LPENR  at 16#17C# range 0 .. 31;
   end record;

   --  Reset and clock control
   RCC_Periph : aliased RCC_Peripheral
     with Import, Address => RCC_Base;

end Interfaces.STM32.RCC;
