--
--  Copyright (C) 2021, AdaCore
--

pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32H743x.svd

--  This is a version for the STM32H743x MCU
package Ada.Interrupts.Names is

   --  All identifiers in this unit are implementation defined

   pragma Implementation_Defined;

   ----------------
   -- Interrupts --
   ----------------

   --  System tick
   Sys_Tick_Interrupt                : constant Interrupt_ID := -1;

   --  Window Watchdog interrupt
   WWDG1_Interrupt                   : constant Interrupt_ID := 0;

   --  PVD through EXTI line
   PVD_PVM_Interrupt                 : constant Interrupt_ID := 1;

   --  RTC tamper, timestamp
   RTC_TAMP_STAMP_CSS_LSE_Interrupt  : constant Interrupt_ID := 2;

   --  RTC Wakeup interrupt
   RTC_WKUP_Interrupt                : constant Interrupt_ID := 3;

   --  Flash memory
   FLASH_Interrupt                   : constant Interrupt_ID := 4;

   --  RCC global interrupt
   RCC_Interrupt                     : constant Interrupt_ID := 5;

   --  EXTI Line 0 interrupt
   EXTI0_Interrupt                   : constant Interrupt_ID := 6;

   --  EXTI Line 1 interrupt
   EXTI1_Interrupt                   : constant Interrupt_ID := 7;

   --  EXTI Line 2 interrupt
   EXTI2_Interrupt                   : constant Interrupt_ID := 8;

   --  EXTI Line 3interrupt
   EXTI3_Interrupt                   : constant Interrupt_ID := 9;

   --  EXTI Line 4interrupt
   EXTI4_Interrupt                   : constant Interrupt_ID := 10;

   --  DMA1 Stream0
   DMA_STR0_Interrupt                : constant Interrupt_ID := 11;

   --  DMA1 Stream1
   DMA_STR1_Interrupt                : constant Interrupt_ID := 12;

   --  DMA1 Stream2
   DMA_STR2_Interrupt                : constant Interrupt_ID := 13;

   --  DMA1 Stream3
   DMA_STR3_Interrupt                : constant Interrupt_ID := 14;

   --  DMA1 Stream4
   DMA_STR4_Interrupt                : constant Interrupt_ID := 15;

   --  DMA1 Stream5
   DMA_STR5_Interrupt                : constant Interrupt_ID := 16;

   --  DMA1 Stream6
   DMA_STR6_Interrupt                : constant Interrupt_ID := 17;

   --  ADC1 and ADC2
   ADC1_2_Interrupt                  : constant Interrupt_ID := 18;

   --  FDCAN1 Interrupt 0
   FDCAN1_IT0_Interrupt              : constant Interrupt_ID := 19;

   --  FDCAN2 Interrupt 0
   FDCAN2_IT0_Interrupt              : constant Interrupt_ID := 20;

   --  FDCAN1 Interrupt 1
   FDCAN1_IT1_Interrupt              : constant Interrupt_ID := 21;

   --  FDCAN2 Interrupt 1
   FDCAN2_IT1_Interrupt              : constant Interrupt_ID := 22;

   --  EXTI Line[9:5] interrupts
   EXTI9_5_Interrupt                 : constant Interrupt_ID := 23;

   --  TIM1 break interrupt
   TIM1_BRK_Interrupt                : constant Interrupt_ID := 24;

   --  TIM1 update interrupt
   TIM1_UP_Interrupt                 : constant Interrupt_ID := 25;

   --  TIM1 trigger and commutation
   TIM1_TRG_COM_Interrupt            : constant Interrupt_ID := 26;

   --  TIM1 capture / compare
   TIM_CC_Interrupt                  : constant Interrupt_ID := 27;

   --  TIM2 global interrupt
   TIM2_Interrupt                    : constant Interrupt_ID := 28;

   --  TIM3 global interrupt
   TIM3_Interrupt                    : constant Interrupt_ID := 29;

   --  TIM4 global interrupt
   TIM4_Interrupt                    : constant Interrupt_ID := 30;

   --  I2C1 event interrupt
   I2C1_EV_Interrupt                 : constant Interrupt_ID := 31;

   --  I2C1 error interrupt
   I2C1_ER_Interrupt                 : constant Interrupt_ID := 32;

   --  I2C2 event interrupt
   I2C2_EV_Interrupt                 : constant Interrupt_ID := 33;

   --  I2C2 error interrupt
   I2C2_ER_Interrupt                 : constant Interrupt_ID := 34;

   --  SPI1 global interrupt
   SPI1_Interrupt                    : constant Interrupt_ID := 35;

   --  SPI2 global interrupt
   SPI2_Interrupt                    : constant Interrupt_ID := 36;

   --  USART1 global interrupt
   USART1_Interrupt                  : constant Interrupt_ID := 37;

   --  USART2 global interrupt
   USART2_Interrupt                  : constant Interrupt_ID := 38;

   --  USART3 global interrupt
   USART3_Interrupt                  : constant Interrupt_ID := 39;

   --  EXTI Line[15:10] interrupts
   EXTI15_10_Interrupt               : constant Interrupt_ID := 40;

   --  RTC alarms (A and B)
   RTC_ALARM_Interrupt               : constant Interrupt_ID := 41;

   --  TIM8 and 12 break global
   TIM8_BRK_TIM12_Interrupt          : constant Interrupt_ID := 43;

   --  TIM8 and 13 update global
   TIM8_UP_TIM13_Interrupt           : constant Interrupt_ID := 44;

   --  TIM8 and 14 trigger /commutation and global
   TIM8_TRG_COM_TIM14_Interrupt      : constant Interrupt_ID := 45;

   --  TIM8 capture / compare
   TIM8_CC_Interrupt                 : constant Interrupt_ID := 46;

   --  DMA1 Stream7
   DMA1_STR7_Interrupt               : constant Interrupt_ID := 47;

   --  FMC global interrupt
   FMC_Interrupt                     : constant Interrupt_ID := 48;

   --  SDMMC global interrupt
   SDMMC1_Interrupt                  : constant Interrupt_ID := 49;

   --  TIM5 global interrupt
   TIM5_Interrupt                    : constant Interrupt_ID := 50;

   --  SPI3 global interrupt
   SPI3_Interrupt                    : constant Interrupt_ID := 51;

   --  UART4 global interrupt
   UART4_Interrupt                   : constant Interrupt_ID := 52;

   --  UART5 global interrupt
   UART5_Interrupt                   : constant Interrupt_ID := 53;

   --  TIM6 global interrupt
   TIM6_DAC_Interrupt                : constant Interrupt_ID := 54;

   --  TIM7 global interrupt
   TIM7_Interrupt                    : constant Interrupt_ID := 55;

   --  DMA2 Stream0 interrupt
   DMA2_STR0_Interrupt               : constant Interrupt_ID := 56;

   --  DMA2 Stream1 interrupt
   DMA2_STR1_Interrupt               : constant Interrupt_ID := 57;

   --  DMA2 Stream2 interrupt
   DMA2_STR2_Interrupt               : constant Interrupt_ID := 58;

   --  DMA2 Stream3 interrupt
   DMA2_STR3_Interrupt               : constant Interrupt_ID := 59;

   --  DMA2 Stream4 interrupt
   DMA2_STR4_Interrupt               : constant Interrupt_ID := 60;

   --  Ethernet global interrupt
   ETH_Interrupt                     : constant Interrupt_ID := 61;

   --  Ethernet wakeup through EXTI
   ETH_WKUP_Interrupt                : constant Interrupt_ID := 62;

   --  CAN2TX interrupts
   FDCAN_CAL_Interrupt               : constant Interrupt_ID := 63;

   --  DMA2 Stream5 interrupt
   DMA2_STR5_Interrupt               : constant Interrupt_ID := 68;

   --  DMA2 Stream6 interrupt
   DMA2_STR6_Interrupt               : constant Interrupt_ID := 69;

   --  DMA2 Stream7 interrupt
   DMA2_STR7_Interrupt               : constant Interrupt_ID := 70;

   --  USART6 global interrupt
   USART6_Interrupt                  : constant Interrupt_ID := 71;

   --  I2C3 event interrupt
   I2C3_EV_Interrupt                 : constant Interrupt_ID := 72;

   --  I2C3 error interrupt
   I2C3_ER_Interrupt                 : constant Interrupt_ID := 73;

   --  OTG_HS out global interrupt
   OTG_HS_EP1_OUT_Interrupt          : constant Interrupt_ID := 74;

   --  OTG_HS in global interrupt
   OTG_HS_EP1_IN_Interrupt           : constant Interrupt_ID := 75;

   --  OTG_HS wakeup interrupt
   OTG_HS_WKUP_Interrupt             : constant Interrupt_ID := 76;

   --  OTG_HS global interrupt
   OTG_HS_Interrupt                  : constant Interrupt_ID := 77;

   --  DCMI global interrupt
   DCMI_Interrupt                    : constant Interrupt_ID := 78;

   --  RNG interrupt
   RNG_Interrupt                     : constant Interrupt_ID := 80;

   --  FPU global interrupt
   FPU_Interrupt                     : constant Interrupt_ID := 81;

   --  UART7 global interrupt
   UART7_Interrupt                   : constant Interrupt_ID := 82;

   --  UART8 global interrupt
   UART8_Interrupt                   : constant Interrupt_ID := 83;

   --  SPI4 global interrupt
   SPI4_Interrupt                    : constant Interrupt_ID := 84;

   --  SPI5 global interrupt
   SPI5_Interrupt                    : constant Interrupt_ID := 85;

   --  SPI6 global interrupt
   SPI6_Interrupt                    : constant Interrupt_ID := 86;

   --  SAI1 global interrupt
   SAI1_Interrupt                    : constant Interrupt_ID := 87;

   --  LCD-TFT global interrupt
   LTDC_Interrupt                    : constant Interrupt_ID := 88;

   --  LCD-TFT error interrupt
   LTDC_ER_Interrupt                 : constant Interrupt_ID := 89;

   --  DMA2D global interrupt
   DMA2D_Interrupt                   : constant Interrupt_ID := 90;

   --  SAI2 global interrupt
   SAI2_Interrupt                    : constant Interrupt_ID := 91;

   --  QuadSPI global interrupt
   QUADSPI_Interrupt                 : constant Interrupt_ID := 92;

   --  LPTIM1 global interrupt
   LPTIM1_Interrupt                  : constant Interrupt_ID := 93;

   --  HDMI-CEC global interrupt
   CEC_Interrupt                     : constant Interrupt_ID := 94;

   --  I2C4 event interrupt
   I2C4_EV_Interrupt                 : constant Interrupt_ID := 95;

   --  I2C4 error interrupt
   I2C4_ER_Interrupt                 : constant Interrupt_ID := 96;

   --  SPDIFRX global interrupt
   SPDIF_Interrupt                   : constant Interrupt_ID := 97;

   --  OTG_FS out global interrupt
   OTG_FS_EP1_OUT_Interrupt          : constant Interrupt_ID := 98;

   --  OTG_FS in global interrupt
   OTG_FS_EP1_IN_Interrupt           : constant Interrupt_ID := 99;

   --  OTG_FS wakeup
   OTG_FS_WKUP_Interrupt             : constant Interrupt_ID := 100;

   --  OTG_FS global interrupt
   OTG_FS_Interrupt                  : constant Interrupt_ID := 101;

   --  DMAMUX1 overrun interrupt
   DMAMUX1_OV_Interrupt              : constant Interrupt_ID := 102;

   --  HRTIM1 master timer interrupt
   HRTIM1_MST_Interrupt              : constant Interrupt_ID := 103;

   --  HRTIM1 timer A interrupt
   HRTIM1_TIMA_Interrupt             : constant Interrupt_ID := 104;

   --  HRTIM1 timer B interrupt
   HRTIM_TIMB_Interrupt              : constant Interrupt_ID := 105;

   --  HRTIM1 timer C interrupt
   HRTIM1_TIMC_Interrupt             : constant Interrupt_ID := 106;

   --  HRTIM1 timer D interrupt
   HRTIM1_TIMD_Interrupt             : constant Interrupt_ID := 107;

   --  HRTIM1 timer E interrupt
   HRTIM_TIME_Interrupt              : constant Interrupt_ID := 108;

   --  HRTIM1 fault interrupt
   HRTIM1_FLT_Interrupt              : constant Interrupt_ID := 109;

   --  DFSDM1 filter 0 interrupt
   DFSDM1_FLT0_Interrupt             : constant Interrupt_ID := 110;

   --  DFSDM1 filter 1 interrupt
   DFSDM1_FLT1_Interrupt             : constant Interrupt_ID := 111;

   --  DFSDM1 filter 2 interrupt
   DFSDM1_FLT2_Interrupt             : constant Interrupt_ID := 112;

   --  DFSDM1 filter 3 interrupt
   DFSDM1_FLT3_Interrupt             : constant Interrupt_ID := 113;

   --  SAI3 global interrupt
   SAI3_Interrupt                    : constant Interrupt_ID := 114;

   --  SWPMI global interrupt
   SWPMI1_Interrupt                  : constant Interrupt_ID := 115;

   --  TIM15 global interrupt
   TIM15_Interrupt                   : constant Interrupt_ID := 116;

   --  TIM16 global interrupt
   TIM16_Interrupt                   : constant Interrupt_ID := 117;

   --  TIM17 global interrupt
   TIM17_Interrupt                   : constant Interrupt_ID := 118;

   --  MDIOS wakeup
   MDIOS_WKUP_Interrupt              : constant Interrupt_ID := 119;

   --  MDIOS global interrupt
   MDIOS_Interrupt                   : constant Interrupt_ID := 120;

   --  JPEG global interrupt
   JPEG_Interrupt                    : constant Interrupt_ID := 121;

   --  MDMA
   MDMA_Interrupt                    : constant Interrupt_ID := 122;

   --  SDMMC global interrupt
   SDMMC_Interrupt                   : constant Interrupt_ID := 124;

   --  HSEM global interrupt 1
   HSEM0_Interrupt                   : constant Interrupt_ID := 125;

   --  ADC3 global interrupt
   ADC3_Interrupt                    : constant Interrupt_ID := 127;

   --  DMAMUX2 overrun interrupt
   DMAMUX2_OVR_Interrupt             : constant Interrupt_ID := 128;

   --  BDMA channel 1 interrupt
   BDMA_CH1_Interrupt                : constant Interrupt_ID := 129;

   --  BDMA channel 2 interrupt
   BDMA_CH2_Interrupt                : constant Interrupt_ID := 130;

   --  BDMA channel 3 interrupt
   BDMA_CH3_Interrupt                : constant Interrupt_ID := 131;

   --  BDMA channel 4 interrupt
   BDMA_CH4_Interrupt                : constant Interrupt_ID := 132;

   --  BDMA channel 5 interrupt
   BDMA_CH5_Interrupt                : constant Interrupt_ID := 133;

   --  BDMA channel 6 interrupt
   BDMA_CH6_Interrupt                : constant Interrupt_ID := 134;

   --  BDMA channel 7 interrupt
   BDMA_CH7_Interrupt                : constant Interrupt_ID := 135;

   --  BDMA channel 8 interrupt
   BDMA_CH8_Interrupt                : constant Interrupt_ID := 136;

   --  COMP1 and COMP2
   COMP_Interrupt                    : constant Interrupt_ID := 137;

   --  LPTIM2 timer interrupt
   LPTIM2_Interrupt                  : constant Interrupt_ID := 138;

   --  LPTIM2 timer interrupt
   LPTIM3_Interrupt                  : constant Interrupt_ID := 139;

   --  LPTIM2 timer interrupt
   LPTIM4_Interrupt                  : constant Interrupt_ID := 140;

   --  LPTIM2 timer interrupt
   LPTIM5_Interrupt                  : constant Interrupt_ID := 141;

   --  LPUART global interrupt
   LPUART_Interrupt                  : constant Interrupt_ID := 142;

   --  Window Watchdog interrupt
   WWDG1_RST_Interrupt               : constant Interrupt_ID := 143;

   --  Clock Recovery System globa
   CRS_Interrupt                     : constant Interrupt_ID := 144;

   --  SAI4 global interrupt
   SAI4_Interrupt                    : constant Interrupt_ID := 146;

   --  WKUP1 to WKUP6 pins
   WKUP_Interrupt                    : constant Interrupt_ID := 149;

end Ada.Interrupts.Names;
