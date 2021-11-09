------------------------------------------------------------------------------
--                                                                          --
--                     Copyright (C) 2015-2018, AdaCore                     --
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
--   @file    stm32h743x.h                                                 --
--   @author  Julio C. Gobbi                                                --
--   @version V1.0.0                                                        --
--   @date    24-October-2021                                                 --
--   @brief   CMSIS STM32F334xx Device Peripheral Access Layer Header File. --
--                                                                          --
--   COPYRIGHT(c) 2014 STMicroelectronics                                   --
------------------------------------------------------------------------------

--  This file provides declarations for devices on the STM32H743x MCUs
--  manufactured by ST Microelectronics.

--  with System;         use System; --  Enable for COMP and OPAMP

with STM32_SVD;      use STM32_SVD;
with STM32_SVD.COMP; --  Enable for COMP
with STM32_SVD.OPAMP; --  Enable for OPAMP
with STM32_SVD.SAI; --  Enable for SAI

with STM32.GPIO;     use STM32.GPIO;
with STM32.ADC;      use STM32.ADC;
with STM32.DAC;      use STM32.DAC;
with STM32.CRC;      use STM32.CRC;
with STM32.RNG;      use STM32.RNG;
with STM32.DMA;      use STM32.DMA;
with STM32.USARTs;   use STM32.USARTs;
with STM32.SPI;      use STM32.SPI;
with STM32.SPI.DMA;  use STM32.SPI.DMA;
with STM32.I2C;      use STM32.I2C;
with STM32.I2S;      use STM32.I2S;
with STM32.RTC;      use STM32.RTC;
with STM32.Timers;   use STM32.Timers;
with STM32.LPTimers; use STM32.LPTimers;
with STM32.HRTimers; use STM32.HRTimers;
with STM32.OPAMP;    use STM32.OPAMP;
with STM32.COMP;     use STM32.COMP;

package STM32.Device is
   pragma Elaborate_Body;

   HSE_VALUE : constant := 8_000_000;
   --  High-Speed external oscillator in Hz

   LSE_VALUE : constant := 32_768;
   --  Low-Speed external oscillator in Hz

   HSI_VALUE : constant := 64_000_000;
   --  High-Speed internal oscillator in Hz

   --  HSI48_VALUE : constant := 48_000_000;
   --  High Speed Internal 48 MHz clock.

   --  LSI_VALUE : constant := 32_000;
   --  Low-Speed internal oscillator in Hz

   CSI_VALUE : constant := 4_000_000;
   --  Low-Power internal oscillator in Hz

   I2SCLK : constant := 12_288_000;
   --  I2S_CKIN external frequency

   Unknown_Device : exception;
   --  Raised by the routines below for a device passed as an actual parameter
   --  when that device is not present on the given hardware instance.

   ----------
   -- GPIO --
   ----------

   procedure Enable_Clock (This : aliased GPIO_Port);
   procedure Enable_Clock (Point : GPIO_Point);
   procedure Enable_Clock (Points : GPIO_Points);

   procedure Reset (This : aliased GPIO_Port)
     with Inline;
   procedure Reset (Point : GPIO_Point)
     with Inline;
   procedure Reset (Points : GPIO_Points)
     with Inline;

   function GPIO_Port_Representation (Port : GPIO_Port) return UInt4
     with Inline;

   GPIO_A : aliased GPIO_Port with Import, Volatile, Address => GPIOA_Base;
   GPIO_B : aliased GPIO_Port with Import, Volatile, Address => GPIOB_Base;
   GPIO_C : aliased GPIO_Port with Import, Volatile, Address => GPIOC_Base;
   GPIO_D : aliased GPIO_Port with Import, Volatile, Address => GPIOD_Base;
   GPIO_E : aliased GPIO_Port with Import, Volatile, Address => GPIOE_Base;
   GPIO_F : aliased GPIO_Port with Import, Volatile, Address => GPIOF_Base;
   GPIO_G : aliased GPIO_Port with Import, Volatile, Address => GPIOG_Base;
   GPIO_H : aliased GPIO_Port with Import, Volatile, Address => GPIOH_Base;
   GPIO_I : aliased GPIO_Port with Import, Volatile, Address => GPIOI_Base;
   GPIO_J : aliased GPIO_Port with Import, Volatile, Address => GPIOJ_Base;
   GPIO_K : aliased GPIO_Port with Import, Volatile, Address => GPIOK_Base;

   PA0  : aliased GPIO_Point := (GPIO_A'Access, Pin_0);
   PA1  : aliased GPIO_Point := (GPIO_A'Access, Pin_1);
   PA2  : aliased GPIO_Point := (GPIO_A'Access, Pin_2);
   PA3  : aliased GPIO_Point := (GPIO_A'Access, Pin_3);
   PA4  : aliased GPIO_Point := (GPIO_A'Access, Pin_4);
   PA5  : aliased GPIO_Point := (GPIO_A'Access, Pin_5);
   PA6  : aliased GPIO_Point := (GPIO_A'Access, Pin_6);
   PA7  : aliased GPIO_Point := (GPIO_A'Access, Pin_7);
   PA8  : aliased GPIO_Point := (GPIO_A'Access, Pin_8);
   PA9  : aliased GPIO_Point := (GPIO_A'Access, Pin_9);
   PA10 : aliased GPIO_Point := (GPIO_A'Access, Pin_10);
   PA11 : aliased GPIO_Point := (GPIO_A'Access, Pin_11);
   PA12 : aliased GPIO_Point := (GPIO_A'Access, Pin_12);
   PA13 : aliased GPIO_Point := (GPIO_A'Access, Pin_13);
   PA14 : aliased GPIO_Point := (GPIO_A'Access, Pin_14);
   PA15 : aliased GPIO_Point := (GPIO_A'Access, Pin_15);
   PB0  : aliased GPIO_Point := (GPIO_B'Access, Pin_0);
   PB1  : aliased GPIO_Point := (GPIO_B'Access, Pin_1);
   PB2  : aliased GPIO_Point := (GPIO_B'Access, Pin_2);
   PB3  : aliased GPIO_Point := (GPIO_B'Access, Pin_3);
   PB4  : aliased GPIO_Point := (GPIO_B'Access, Pin_4);
   PB5  : aliased GPIO_Point := (GPIO_B'Access, Pin_5);
   PB6  : aliased GPIO_Point := (GPIO_B'Access, Pin_6);
   PB7  : aliased GPIO_Point := (GPIO_B'Access, Pin_7);
   PB8  : aliased GPIO_Point := (GPIO_B'Access, Pin_8);
   PB9  : aliased GPIO_Point := (GPIO_B'Access, Pin_9);
   PB10 : aliased GPIO_Point := (GPIO_B'Access, Pin_10);
   PB11 : aliased GPIO_Point := (GPIO_B'Access, Pin_11);
   PB12 : aliased GPIO_Point := (GPIO_B'Access, Pin_12);
   PB13 : aliased GPIO_Point := (GPIO_B'Access, Pin_13);
   PB14 : aliased GPIO_Point := (GPIO_B'Access, Pin_14);
   PB15 : aliased GPIO_Point := (GPIO_B'Access, Pin_15);
   PC0  : aliased GPIO_Point := (GPIO_C'Access, Pin_0);
   PC1  : aliased GPIO_Point := (GPIO_C'Access, Pin_1);
   PC2  : aliased GPIO_Point := (GPIO_C'Access, Pin_2);
   PC3  : aliased GPIO_Point := (GPIO_C'Access, Pin_3);
   PC4  : aliased GPIO_Point := (GPIO_C'Access, Pin_4);
   PC5  : aliased GPIO_Point := (GPIO_C'Access, Pin_5);
   PC6  : aliased GPIO_Point := (GPIO_C'Access, Pin_6);
   PC7  : aliased GPIO_Point := (GPIO_C'Access, Pin_7);
   PC8  : aliased GPIO_Point := (GPIO_C'Access, Pin_8);
   PC9  : aliased GPIO_Point := (GPIO_C'Access, Pin_9);
   PC10 : aliased GPIO_Point := (GPIO_C'Access, Pin_10);
   PC11 : aliased GPIO_Point := (GPIO_C'Access, Pin_11);
   PC12 : aliased GPIO_Point := (GPIO_C'Access, Pin_12);
   PC13 : aliased GPIO_Point := (GPIO_C'Access, Pin_13);
   PC14 : aliased GPIO_Point := (GPIO_C'Access, Pin_14);
   PC15 : aliased GPIO_Point := (GPIO_C'Access, Pin_15);
   PD0  : aliased GPIO_Point := (GPIO_D'Access, Pin_0);
   PD1  : aliased GPIO_Point := (GPIO_D'Access, Pin_1);
   PD2  : aliased GPIO_Point := (GPIO_D'Access, Pin_2);
   PD3  : aliased GPIO_Point := (GPIO_D'Access, Pin_3);
   PD4  : aliased GPIO_Point := (GPIO_D'Access, Pin_4);
   PD5  : aliased GPIO_Point := (GPIO_D'Access, Pin_5);
   PD6  : aliased GPIO_Point := (GPIO_D'Access, Pin_6);
   PD7  : aliased GPIO_Point := (GPIO_D'Access, Pin_7);
   PD8  : aliased GPIO_Point := (GPIO_D'Access, Pin_8);
   PD9  : aliased GPIO_Point := (GPIO_D'Access, Pin_9);
   PD10 : aliased GPIO_Point := (GPIO_D'Access, Pin_10);
   PD11 : aliased GPIO_Point := (GPIO_D'Access, Pin_11);
   PD12 : aliased GPIO_Point := (GPIO_D'Access, Pin_12);
   PD13 : aliased GPIO_Point := (GPIO_D'Access, Pin_13);
   PD14 : aliased GPIO_Point := (GPIO_D'Access, Pin_14);
   PD15 : aliased GPIO_Point := (GPIO_D'Access, Pin_15);
   PE0  : aliased GPIO_Point := (GPIO_E'Access, Pin_0);
   PE1  : aliased GPIO_Point := (GPIO_E'Access, Pin_1);
   PE2  : aliased GPIO_Point := (GPIO_E'Access, Pin_2);
   PE3  : aliased GPIO_Point := (GPIO_E'Access, Pin_3);
   PE4  : aliased GPIO_Point := (GPIO_E'Access, Pin_4);
   PE5  : aliased GPIO_Point := (GPIO_E'Access, Pin_5);
   PE6  : aliased GPIO_Point := (GPIO_E'Access, Pin_6);
   PE7  : aliased GPIO_Point := (GPIO_E'Access, Pin_7);
   PE8  : aliased GPIO_Point := (GPIO_E'Access, Pin_8);
   PE9  : aliased GPIO_Point := (GPIO_E'Access, Pin_9);
   PE10 : aliased GPIO_Point := (GPIO_E'Access, Pin_10);
   PE11 : aliased GPIO_Point := (GPIO_E'Access, Pin_11);
   PE12 : aliased GPIO_Point := (GPIO_E'Access, Pin_12);
   PE13 : aliased GPIO_Point := (GPIO_E'Access, Pin_13);
   PE14 : aliased GPIO_Point := (GPIO_E'Access, Pin_14);
   PE15 : aliased GPIO_Point := (GPIO_E'Access, Pin_15);
   PF0  : aliased GPIO_Point := (GPIO_F'Access, Pin_0);
   PF1  : aliased GPIO_Point := (GPIO_F'Access, Pin_1);
   PF2  : aliased GPIO_Point := (GPIO_F'Access, Pin_2);
   PF3  : aliased GPIO_Point := (GPIO_F'Access, Pin_3);
   PF4  : aliased GPIO_Point := (GPIO_F'Access, Pin_4);
   PF5  : aliased GPIO_Point := (GPIO_F'Access, Pin_5);
   PF6  : aliased GPIO_Point := (GPIO_F'Access, Pin_6);
   PF7  : aliased GPIO_Point := (GPIO_F'Access, Pin_7);
   PF8  : aliased GPIO_Point := (GPIO_F'Access, Pin_8);
   PF9  : aliased GPIO_Point := (GPIO_F'Access, Pin_9);
   PF10 : aliased GPIO_Point := (GPIO_F'Access, Pin_10);
   PF11 : aliased GPIO_Point := (GPIO_F'Access, Pin_11);
   PF12 : aliased GPIO_Point := (GPIO_F'Access, Pin_12);
   PF13 : aliased GPIO_Point := (GPIO_F'Access, Pin_13);
   PF14 : aliased GPIO_Point := (GPIO_F'Access, Pin_14);
   PF15 : aliased GPIO_Point := (GPIO_F'Access, Pin_15);
   PG0  : aliased GPIO_Point := (GPIO_G'Access, Pin_0);
   PG1  : aliased GPIO_Point := (GPIO_G'Access, Pin_1);
   PG2  : aliased GPIO_Point := (GPIO_G'Access, Pin_2);
   PG3  : aliased GPIO_Point := (GPIO_G'Access, Pin_3);
   PG4  : aliased GPIO_Point := (GPIO_G'Access, Pin_4);
   PG5  : aliased GPIO_Point := (GPIO_G'Access, Pin_5);
   PG6  : aliased GPIO_Point := (GPIO_G'Access, Pin_6);
   PG7  : aliased GPIO_Point := (GPIO_G'Access, Pin_7);
   PG8  : aliased GPIO_Point := (GPIO_G'Access, Pin_8);
   PG9  : aliased GPIO_Point := (GPIO_G'Access, Pin_9);
   PG10 : aliased GPIO_Point := (GPIO_G'Access, Pin_10);
   PG11 : aliased GPIO_Point := (GPIO_G'Access, Pin_11);
   PG12 : aliased GPIO_Point := (GPIO_G'Access, Pin_12);
   PG13 : aliased GPIO_Point := (GPIO_G'Access, Pin_13);
   PG14 : aliased GPIO_Point := (GPIO_G'Access, Pin_14);
   PG15 : aliased GPIO_Point := (GPIO_G'Access, Pin_15);
   PH0  : aliased GPIO_Point := (GPIO_H'Access, Pin_0);
   PH1  : aliased GPIO_Point := (GPIO_H'Access, Pin_1);
   PH2  : aliased GPIO_Point := (GPIO_H'Access, Pin_2);
   PH3  : aliased GPIO_Point := (GPIO_H'Access, Pin_3);
   PH4  : aliased GPIO_Point := (GPIO_H'Access, Pin_4);
   PH5  : aliased GPIO_Point := (GPIO_H'Access, Pin_5);
   PH6  : aliased GPIO_Point := (GPIO_H'Access, Pin_6);
   PH7  : aliased GPIO_Point := (GPIO_H'Access, Pin_7);
   PH8  : aliased GPIO_Point := (GPIO_H'Access, Pin_8);
   PH9  : aliased GPIO_Point := (GPIO_H'Access, Pin_9);
   PH10 : aliased GPIO_Point := (GPIO_H'Access, Pin_10);
   PH11 : aliased GPIO_Point := (GPIO_H'Access, Pin_11);
   PH12 : aliased GPIO_Point := (GPIO_H'Access, Pin_12);
   PH13 : aliased GPIO_Point := (GPIO_H'Access, Pin_13);
   PH14 : aliased GPIO_Point := (GPIO_H'Access, Pin_14);
   PH15 : aliased GPIO_Point := (GPIO_H'Access, Pin_15);
   PI0  : aliased GPIO_Point := (GPIO_I'Access, Pin_0);
   PI1  : aliased GPIO_Point := (GPIO_I'Access, Pin_1);
   PI2  : aliased GPIO_Point := (GPIO_I'Access, Pin_2);
   PI3  : aliased GPIO_Point := (GPIO_I'Access, Pin_3);
   PI4  : aliased GPIO_Point := (GPIO_I'Access, Pin_4);
   PI5  : aliased GPIO_Point := (GPIO_I'Access, Pin_5);
   PI6  : aliased GPIO_Point := (GPIO_I'Access, Pin_6);
   PI7  : aliased GPIO_Point := (GPIO_I'Access, Pin_7);
   PI8  : aliased GPIO_Point := (GPIO_I'Access, Pin_8);
   PI9  : aliased GPIO_Point := (GPIO_I'Access, Pin_9);
   PI10 : aliased GPIO_Point := (GPIO_I'Access, Pin_10);
   PI11 : aliased GPIO_Point := (GPIO_I'Access, Pin_11);
   PI12 : aliased GPIO_Point := (GPIO_I'Access, Pin_12);
   PI13 : aliased GPIO_Point := (GPIO_I'Access, Pin_13);
   PI14 : aliased GPIO_Point := (GPIO_I'Access, Pin_14);
   PI15 : aliased GPIO_Point := (GPIO_I'Access, Pin_15);
   PJ0  : aliased GPIO_Point := (GPIO_J'Access, Pin_0);
   PJ1  : aliased GPIO_Point := (GPIO_J'Access, Pin_1);
   PJ2  : aliased GPIO_Point := (GPIO_J'Access, Pin_2);
   PJ3  : aliased GPIO_Point := (GPIO_J'Access, Pin_3);
   PJ4  : aliased GPIO_Point := (GPIO_J'Access, Pin_4);
   PJ5  : aliased GPIO_Point := (GPIO_J'Access, Pin_5);
   PJ6  : aliased GPIO_Point := (GPIO_J'Access, Pin_6);
   PJ7  : aliased GPIO_Point := (GPIO_J'Access, Pin_7);
   PJ8  : aliased GPIO_Point := (GPIO_J'Access, Pin_8);
   PJ9  : aliased GPIO_Point := (GPIO_J'Access, Pin_9);
   PJ10 : aliased GPIO_Point := (GPIO_J'Access, Pin_10);
   PJ11 : aliased GPIO_Point := (GPIO_J'Access, Pin_11);
   PJ12 : aliased GPIO_Point := (GPIO_J'Access, Pin_12);
   PJ13 : aliased GPIO_Point := (GPIO_J'Access, Pin_13);
   PJ14 : aliased GPIO_Point := (GPIO_J'Access, Pin_14);
   PJ15 : aliased GPIO_Point := (GPIO_J'Access, Pin_15);
   PK0  : aliased GPIO_Point := (GPIO_K'Access, Pin_0);
   PK1  : aliased GPIO_Point := (GPIO_K'Access, Pin_1);
   PK2  : aliased GPIO_Point := (GPIO_K'Access, Pin_2);
   PK3  : aliased GPIO_Point := (GPIO_K'Access, Pin_3);
   PK4  : aliased GPIO_Point := (GPIO_K'Access, Pin_4);
   PK5  : aliased GPIO_Point := (GPIO_K'Access, Pin_5);
   PK6  : aliased GPIO_Point := (GPIO_K'Access, Pin_6);
   PK7  : aliased GPIO_Point := (GPIO_K'Access, Pin_7);

   GPIO_AF_RTC_OUT     : constant GPIO_Alternate_Function;
   GPIO_AF_MCO_0       : constant GPIO_Alternate_Function;
   GPIO_AF_PWR_0       : constant GPIO_Alternate_Function;
   GPIO_AF_SWJ_0       : constant GPIO_Alternate_Function;
   GPIO_AF_TRACE_0     : constant GPIO_Alternate_Function;
   GPIO_AF_CSLEEP_0    : constant GPIO_Alternate_Function;
   GPIO_AF_TRG_0       : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_1      : constant GPIO_Alternate_Function;
   GPIO_AF_TIM2_1      : constant GPIO_Alternate_Function;
   GPIO_AF_TIM16_1     : constant GPIO_Alternate_Function;
   GPIO_AF_TIM17_1     : constant GPIO_Alternate_Function;
   GPIO_AF_LPTIM1_1    : constant GPIO_Alternate_Function;
   GPIO_AF_HRTIM1_1    : constant GPIO_Alternate_Function;
   GPIO_AF_SAI1_2      : constant GPIO_Alternate_Function;
   GPIO_AF_TIM3_2      : constant GPIO_Alternate_Function;
   GPIO_AF_TIM4_2      : constant GPIO_Alternate_Function;
   GPIO_AF_TIM5_2      : constant GPIO_Alternate_Function;
   GPIO_AF_TIM12_2     : constant GPIO_Alternate_Function;
   GPIO_AF_HRTIM1_2    : constant GPIO_Alternate_Function;
   GPIO_AF_LPUART_3    : constant GPIO_Alternate_Function;
   GPIO_AF_TIM8_3      : constant GPIO_Alternate_Function;
   GPIO_AF_LPTIM2_3    : constant GPIO_Alternate_Function;
   GPIO_AF_LPTIM3_3    : constant GPIO_Alternate_Function;
   GPIO_AF_LPTIM4_3    : constant GPIO_Alternate_Function;
   GPIO_AF_LPTIM5_3    : constant GPIO_Alternate_Function;
   GPIO_AF_HRTIM1_3    : constant GPIO_Alternate_Function;
   GPIO_AF_DFSDM1_3    : constant GPIO_Alternate_Function;
   GPIO_AF_I2C1_4      : constant GPIO_Alternate_Function;
   GPIO_AF_I2C2_4      : constant GPIO_Alternate_Function;
   GPIO_AF_I2C3_4      : constant GPIO_Alternate_Function;
   GPIO_AF_I2C4_4      : constant GPIO_Alternate_Function;
   GPIO_AF_USART1_4    : constant GPIO_Alternate_Function;
   GPIO_AF_TIM15_4     : constant GPIO_Alternate_Function;
   GPIO_AF_LPTIM2_4    : constant GPIO_Alternate_Function;
   GPIO_AF_DFSDM1_4    : constant GPIO_Alternate_Function;
   GPIO_AF_CEC_4       : constant GPIO_Alternate_Function;
   GPIO_AF_SPI1_5      : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_5      : constant GPIO_Alternate_Function;
   GPIO_AF_SPI3_5      : constant GPIO_Alternate_Function;
   GPIO_AF_SPI4_5      : constant GPIO_Alternate_Function;
   GPIO_AF_SPI5_5      : constant GPIO_Alternate_Function;
   GPIO_AF_SPI6_5      : constant GPIO_Alternate_Function;
   GPIO_AF_CEC_5       : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_6      : constant GPIO_Alternate_Function;
   GPIO_AF_SPI3_6      : constant GPIO_Alternate_Function;
   GPIO_AF_SAI1_6      : constant GPIO_Alternate_Function;
   GPIO_AF_SAI3_6      : constant GPIO_Alternate_Function;
   GPIO_AF_I2C4_6      : constant GPIO_Alternate_Function;
   GPIO_AF_UART4_6     : constant GPIO_Alternate_Function;
   GPIO_AF_DFSDM1_6    : constant GPIO_Alternate_Function;
   GPIO_AF_SPI2_7      : constant GPIO_Alternate_Function;
   GPIO_AF_SPI3_7      : constant GPIO_Alternate_Function;
   GPIO_AF_SPI6_7      : constant GPIO_Alternate_Function;
   GPIO_AF_USART1_7    : constant GPIO_Alternate_Function;
   GPIO_AF_USART2_7    : constant GPIO_Alternate_Function;
   GPIO_AF_USART3_7    : constant GPIO_Alternate_Function;
   GPIO_AF_USART6_7    : constant GPIO_Alternate_Function;
   GPIO_AF_UART7_7     : constant GPIO_Alternate_Function;
   GPIO_AF_SDMMC1_7    : constant GPIO_Alternate_Function;
   GPIO_AF_SPI6_8      : constant GPIO_Alternate_Function;
   GPIO_AF_SAI2_8      : constant GPIO_Alternate_Function;
   GPIO_AF_SAI4_8      : constant GPIO_Alternate_Function;
   GPIO_AF_UART4_8     : constant GPIO_Alternate_Function;
   GPIO_AF_UART5_8     : constant GPIO_Alternate_Function;
   GPIO_AF_UART8_8     : constant GPIO_Alternate_Function;
   GPIO_AF_LPUART1_8   : constant GPIO_Alternate_Function;
   GPIO_AF_SPDIFRX1_8  : constant GPIO_Alternate_Function;
   GPIO_AF_SAI4_9      : constant GPIO_Alternate_Function;
   GPIO_AF_FDCAN1_9    : constant GPIO_Alternate_Function;
   GPIO_AF_FDCAN2_9    : constant GPIO_Alternate_Function;
   GPIO_AF_TIM13_9     : constant GPIO_Alternate_Function;
   GPIO_AF_TIM14_9     : constant GPIO_Alternate_Function;
   GPIO_AF_QUADSPI_9   : constant GPIO_Alternate_Function;
   GPIO_AF_FMC_9       : constant GPIO_Alternate_Function;
   GPIO_AF_SDMMC2_9    : constant GPIO_Alternate_Function;
   GPIO_AF_LCD_9       : constant GPIO_Alternate_Function;
   GPIO_AF_SPDIFRX1_9  : constant GPIO_Alternate_Function;
   GPIO_AF_SAI2_10     : constant GPIO_Alternate_Function;
   GPIO_AF_SAI4_10     : constant GPIO_Alternate_Function;
   GPIO_AF_TIM8_10     : constant GPIO_Alternate_Function;
   GPIO_AF_QUADSPI_10  : constant GPIO_Alternate_Function;
   GPIO_AF_SDMMC2_10   : constant GPIO_Alternate_Function;
   GPIO_AF_OTG1_10     : constant GPIO_Alternate_Function;
   GPIO_AF_OTG2_10     : constant GPIO_Alternate_Function;
   GPIO_AF_LCD_10      : constant GPIO_Alternate_Function;
   GPIO_AF_LPTIM1_11   : constant GPIO_Alternate_Function;
   GPIO_AF_I2C4_11     : constant GPIO_Alternate_Function;
   GPIO_AF_UART7_11    : constant GPIO_Alternate_Function;
   GPIO_AF_SWPMI1_11   : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_11     : constant GPIO_Alternate_Function;
   GPIO_AF_TIM8_11     : constant GPIO_Alternate_Function;
   GPIO_AF_DFSDM1_11   : constant GPIO_Alternate_Function;
   GPIO_AF_SDMMC2_11   : constant GPIO_Alternate_Function;
   GPIO_AF_MDIOS_11    : constant GPIO_Alternate_Function;
   GPIO_AF_ETH_11      : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_12     : constant GPIO_Alternate_Function;
   GPIO_AF_TIM8_12     : constant GPIO_Alternate_Function;
   GPIO_AF_FMC_12      : constant GPIO_Alternate_Function;
   GPIO_AF_SDMMC1_12   : constant GPIO_Alternate_Function;
   GPIO_AF_MDIOS_12    : constant GPIO_Alternate_Function;
   GPIO_AF_OTG1_12     : constant GPIO_Alternate_Function;
   GPIO_AF_LCD_12      : constant GPIO_Alternate_Function;
   GPIO_AF_TIM1_13     : constant GPIO_Alternate_Function;
   GPIO_AF_DCMI_13     : constant GPIO_Alternate_Function;
   GPIO_AF_LCD_13      : constant GPIO_Alternate_Function;
   GPIO_AF_COMP_13     : constant GPIO_Alternate_Function;
   GPIO_AF_UART5_14    : constant GPIO_Alternate_Function;
   GPIO_AF_LCD_14      : constant GPIO_Alternate_Function;
   GPIO_AF_EVENTOUT_15 : constant GPIO_Alternate_Function;

   ---------
   -- ADC --
   ---------

   ADC_1 : aliased Analog_To_Digital_Converter
     with Volatile, Import, Address => ADC1_Base;
   ADC_2 : aliased Analog_To_Digital_Converter
     with Volatile, Import, Address => ADC2_Base;
   ADC_3 : aliased Analog_To_Digital_Converter
     with Volatile, Import, Address => ADC3_Base;

   Temperature_Channel : constant Analog_Input_Channel := 18;
   Temperature_Sensor  : constant ADC_Point :=
     (ADC_3'Access, Channel => Temperature_Channel);
   --  The internal temperature sensor (VTS) is intenally connected to
   --  ADC3_INP18. See RM0433 rev 7 pg 923 chapter 25.4.2 table 205.
   --  The VSENSESEL bit in the ADCxCCR register is used to switch to the
   --  temperature sensor.
   --  see RM0433 rev 7 pg 998, section 25.4.33.

   VRef_Channel : constant Analog_Input_Channel := 19;
   VRef_Sensor  : constant ADC_Point :=
     (ADC_3'Access, Channel => VRef_Channel);
   --  The internal reference voltage (VREFINT) is internally connected
   --  to ADC3_INP19. See RM0433 rev 7 pg 923 chapter 25.4.2 table 205.
   --  The VREFEN bit in the ADCxCCR register is used to switch to VREFINT.
   --  see RM0433 rev 7 pg 1000, section 25.4.35.

   VBat_Channel : constant Analog_Input_Channel := 17;
   VBat_Sensor  : constant ADC_Point :=
     (ADC_3'Access, Channel => VBat_Channel);
   --  The internal temperature sensor (VTS) is intenally connected to
   --  ADC3_INP17. See RM0433 rev 7 pg 923 chapter 25.4.2 table 205.
   --  The VBATSEL bit in the ADCxCCR register is used to switch to the
   --  battery voltage.
   --  see RM0433 rev 7 pg 999, section 25.4.34.
   VBat : constant ADC_Point := (ADC_3'Access, Channel => VBat_Channel);

   VBat_Bridge_Divisor : constant := 4;
   --  The VBAT pin is internally connected to a bridge divider. The actual
   --  voltage is the raw conversion value * the divisor. See section 25.4.34,
   --  pg 999 of the RM0433 rev 7.

   procedure Enable_Clock (This : aliased Analog_To_Digital_Converter);

   procedure Reset_All_ADC_Units;

   type ADC_Clock_Source is (PLL2P, PLL3R, PER);
   --  Select ADC Clock Mux.

   procedure Select_Clock_Source (This   : Analog_To_Digital_Converter;
                                  Source : ADC_Clock_Source)
     with Post => Read_Clock_Source (This) = Source;
   --  Set ADC123 Clock Mux Source.

   function Read_Clock_Source (This : Analog_To_Digital_Converter)
     return ADC_Clock_Source;
   --  Return ADC123 Clock Mux Source.

   ---------
   -- DAC --
   ---------

   DAC_1 : aliased Digital_To_Analog_Converter
     with Import, Volatile, Address => DAC_Base;

   DAC_1_OUT_1_IO : GPIO_Point renames PA4;
   DAC_1_OUT_2_IO : GPIO_Point renames PA5;

   procedure Enable_Clock
     (This : aliased Digital_To_Analog_Converter)
     with Inline;

   procedure Reset
     (This : aliased Digital_To_Analog_Converter)
     with Inline;

   -----------
   -- Audio --
   -----------

   subtype SAI_Port is STM32_SVD.SAI.SAI_Peripheral;

   SAI_1 : SAI_Port renames STM32_SVD.SAI.SAI1_Periph;
   SAI_2 : SAI_Port renames STM32_SVD.SAI.SAI2_Periph;
   SAI_3 : SAI_Port renames STM32_SVD.SAI.SAI3_Periph;
   SAI_4 : SAI_Port renames STM32_SVD.SAI.SAI4_Periph;

   procedure Enable_Clock (This : SAI_Port);
   procedure Reset (This : SAI_Port);

   type SAI_Clock_Source is (PLL1Q, PLL2P, PLL3P, I2S_CKIN, PER)
     with Size => 3;
   --  SAI Clock Mux.

   procedure Select_Clock_Source (This   : SAI_Port;
                                  Source : SAI_Clock_Source)
     with Post => Read_Clock_Source (This) = Source;
   --  Set SAI Clock Mux source.

   function Read_Clock_Source (This : SAI_Port) return SAI_Clock_Source;
   --  Return SAI Clock Mux source.

   function Get_Clock_Frequency (This : SAI_Port) return UInt32;

   ---------
   -- CRC --
   ---------

   CRC_Unit : CRC_32 with Import, Volatile, Address => CRC_Base;

   procedure Enable_Clock (This : CRC_32) with Inline;

   procedure Disable_Clock (This : CRC_32) with Inline;

   procedure Reset (This : CRC_32);

   ---------
   -- RNG --
   ---------

   RNG_Unit : RNG_Generator
     with Import, Volatile, Address => RNG_Base;

   procedure Enable_Clock (This : RNG_Generator) with Inline;

   procedure Disable_Clock (This : RNG_Generator) with Inline;

   procedure Reset (This : RNG_Generator);

   ---------
   -- DMA --
   ---------

   DMA_1 : aliased DMA_Controller
     with Import, Volatile, Address => DMA1_Base;
   DMA_2 : aliased DMA_Controller
     with Import, Volatile, Address => DMA2_Base;

   procedure Enable_Clock (This : aliased DMA_Controller);
   procedure Reset (This : aliased DMA_Controller);

   -----------
   -- USART --
   -----------

   Internal_USART_1 : aliased Internal_USART
     with Import, Volatile, Address => USART1_Base;
   Internal_USART_2 : aliased Internal_USART
     with Import, Volatile, Address => USART2_Base;
   Internal_USART_3 : aliased Internal_USART
     with Import, Volatile, Address => USART3_Base;
   Internal_UART_4 : aliased Internal_USART
     with Import, Volatile, Address => UART4_Base;
   Internal_UART_5 : aliased Internal_USART
     with Import, Volatile, Address => UART5_Base;
   Internal_USART_6 : aliased Internal_USART
     with Import, Volatile, Address => USART6_Base;
   Internal_UART_7 : aliased Internal_USART
     with Import, Volatile, Address => UART7_Base;
   Internal_UART_8 : aliased Internal_USART
     with Import, Volatile, Address => UART8_Base;
   Internal_LPUART_1 : aliased Internal_USART
     with Import, Volatile, Address => LPUART1_Base;

   USART_1  : aliased USART (Internal_USART_1'Access);
   USART_2  : aliased USART (Internal_USART_2'Access);
   USART_3  : aliased USART (Internal_USART_3'Access);
   UART_4   : aliased USART (Internal_UART_4'Access);
   UART_5   : aliased USART (Internal_UART_5'Access);
   USART_6  : aliased USART (Internal_USART_6'Access);
   UART_7   : aliased USART (Internal_UART_7'Access);
   UART_8   : aliased USART (Internal_UART_8'Access);
   LPUART_1 : aliased USART (Internal_LPUART_1'Access);

   procedure Enable_Clock (This : aliased USART);

   procedure Reset (This : aliased USART);

   type USART_Clock_Source is
     (Option_1, PLL2Q, PLL3Q, HSI, CSI, LSE)
     with Size => 3;
   --  USART Port  USART16    USART234578  LPUART1
   --  Option_1    PCLK2      PCLK1        PCLK3

   procedure Select_Clock_Source (This   : aliased USART;
                                  Source : USART_Clock_Source)
     with Post => Read_Clock_Source (This) = Source;

   function Read_Clock_Source (This : aliased USART)
     return USART_Clock_Source;

   function Get_Clock_Frequency (This : USART) return UInt32
     with Inline;
   --  Returns USART clock frequency, in Hertz.

   ---------
   -- I2C --
   ---------

   Internal_I2C_Port_1 : aliased Internal_I2C_Port
     with Import, Volatile, Address => I2C1_Base;
   Internal_I2C_Port_2 : aliased Internal_I2C_Port
     with Import, Volatile, Address => I2C2_Base;
   Internal_I2C_Port_3 : aliased Internal_I2C_Port
     with Import, Volatile, Address => I2C3_Base;
   Internal_I2C_Port_4 : aliased Internal_I2C_Port
     with Import, Volatile, Address => I2C4_Base;

   type I2C_Port_Id is (I2C_Id_1, I2C_Id_2, I2C_Id_3, I2C_Id_4);

   I2C_1 : aliased I2C_Port (Internal_I2C_Port_1'Access);
   I2C_2 : aliased I2C_Port (Internal_I2C_Port_2'Access);
   I2C_3 : aliased I2C_Port (Internal_I2C_Port_3'Access);
   I2C_4 : aliased I2C_Port (Internal_I2C_Port_4'Access);

   --  I2C_1_DMA : aliased I2C_Port_DMA (Internal_I2C_Port_1'Access);
   --  I2C_2_DMA : aliased I2C_Port_DMA (Internal_I2C_Port_2'Access);
   --  I2C_3_DMA : aliased I2C_Port_DMA (Internal_I2C_Port_3'Access);
   --  I2C_4_DMA : aliased I2C_Port_DMA (Internal_I2C_Port_4'Access);

   function As_Port_Id (Port : I2C_Port'Class) return I2C_Port_Id with Inline;

   procedure Enable_Clock (This : aliased I2C_Port'Class);
   procedure Enable_Clock (This : I2C_Port_Id);

   procedure Reset (This : I2C_Port'Class);
   procedure Reset (This : I2C_Port_Id);

   type I2C_Clock_Source is (Option_1, PLL3R, HSI, CSI);
   --  I2C Clock Mux source.
   --  I2C Port   I2C123  I2C4
   --  Option_1   PCLK1   PCLK4

   procedure Select_Clock_Source (This   : I2C_Port'Class;
                                  Source : I2C_Clock_Source)
     with Post => Read_Clock_Source (This) = Source;

   procedure Select_Clock_Source (This   : I2C_Port_Id;
                                  Source : I2C_Clock_Source)
     with Post => Read_Clock_Source (This) = Source;
   --  Set I2C Clock Mux source.

   function Read_Clock_Source (This : I2C_Port'Class) return I2C_Clock_Source;

   function Read_Clock_Source (This : I2C_Port_Id) return I2C_Clock_Source;
   --  Return I2C Clock Mux source.

   ---------
   -- SPI --
   ---------

   Internal_SPI_1 : aliased Internal_SPI_Port
     with Import, Volatile, Address => SPI1_Base;
   Internal_SPI_2 : aliased Internal_SPI_Port
     with Import, Volatile, Address => SPI2_Base;
   Internal_SPI_3 : aliased Internal_SPI_Port
     with Import, Volatile, Address => SPI3_Base;
   Internal_SPI_4 : aliased Internal_SPI_Port
     with Import, Volatile, Address => SPI4_Base;
   Internal_SPI_5 : aliased Internal_SPI_Port
     with Import, Volatile, Address => SPI5_Base;
   Internal_SPI_6 : aliased Internal_SPI_Port
     with Import, Volatile, Address => SPI6_Base;

   SPI_1 : aliased SPI_Port (Internal_SPI_1'Access);
   SPI_2 : aliased SPI_Port (Internal_SPI_2'Access);
   SPI_3 : aliased SPI_Port (Internal_SPI_3'Access);
   SPI_4 : aliased SPI_Port (Internal_SPI_4'Access);
   SPI_5 : aliased SPI_Port (Internal_SPI_5'Access);
   SPI_6 : aliased SPI_Port (Internal_SPI_6'Access);

   SPI_1_DMA : aliased SPI_Port_DMA (Internal_SPI_1'Access);
   SPI_2_DMA : aliased SPI_Port_DMA (Internal_SPI_2'Access);
   SPI_3_DMA : aliased SPI_Port_DMA (Internal_SPI_3'Access);
   SPI_4_DMA : aliased SPI_Port_DMA (Internal_SPI_4'Access);
   SPI_5_DMA : aliased SPI_Port_DMA (Internal_SPI_5'Access);
   SPI_6_DMA : aliased SPI_Port_DMA (Internal_SPI_6'Access);

   procedure Enable_Clock (This : SPI_Port'Class);
   procedure Reset (This : SPI_Port'Class);

   type SPI_Clock_Source is
     (Option_1,
      Option_2,
      Option_3,
      Option_4,
      Option_5,
      HSE)
     with Size => 3;
   --  SPI Port   SPI123    SPI45    SPI6     QSPI
   --  Option_1   PLL1Q     PCLK2    PCLK4    HCLK3
   --  Option_2   PLL2P     PLL2Q    PLL2Q    PLL1Q
   --  Option_3   PLL3P     PLL3Q    PLL3Q    PLL2R
   --  Option_4   I2S_CKIN  HSI      HSI      PER_CK
   --  Option_5   PER       CSI      CSI

   procedure Select_Clock_Source
     (This   : SPI_Port'Class;
      Source : SPI_Clock_Source)
     with Post => Read_Clock_Source (This) = Source;
   --  Set SPI Clock Mux source.

   function Read_Clock_Source (This : SPI_Port'Class) return SPI_Clock_Source;
   --  Return SPI Clock Mux source.

   ---------
   -- I2S --
   ---------

   Internal_I2S_1     : aliased Internal_I2S_Port
     with Import, Volatile, Address => SPI1_Base;
   Internal_I2S_2     : aliased Internal_I2S_Port
     with Import, Volatile, Address => SPI2_Base;
   Internal_I2S_3     : aliased Internal_I2S_Port
     with Import, Volatile, Address => SPI3_Base;

   I2S_1 : aliased I2S_Port (Internal_I2S_1'Access, Extended => False);
   I2S_2 : aliased I2S_Port (Internal_I2S_2'Access, Extended => False);
   I2S_3 : aliased I2S_Port (Internal_I2S_3'Access, Extended => False);

   procedure Enable_Clock (This : I2S_Port);
   --  The I2S_1 to I2S_3 peripherals use the SPI interface hardware, that are
   --  mapped to SPI1 to SPI3. SPI4 to SPI6 don't have the I2S mode.

   procedure Reset (This : I2S_Port);
   --  The I2S_1 to I2S_3 peripherals use the SPI interface hardware, that are
   --  mapped to SPI1 to SPI3. SPI4 to SPI6 don't have the I2S mode.

   type I2S_Clock_Source is (PLL1Q, PLL2P, PLL3P, I2S_CKIN, PER)
     with Size => 3;

   procedure Select_Clock_Source (This   : I2S_Port'Class;
                                  Source : I2S_Clock_Source)
     with Post => Read_Clock_Source (This) = Source;
   --  Set I2S Clock Mux source (the same source for I2S1 .. I2S3).

   function Read_Clock_Source (This : I2S_Port'Class) return I2S_Clock_Source;
   --  Return I2S Clock Mux source.

   function Get_Clock_Frequency (This : I2S_Port) return UInt32;
   --  Return I2S frequency.

   ---------
   -- RTC --
   ---------

   RTC : aliased RTC_Device;

   procedure Enable_Clock (This : RTC_Device);

   type RTC_Clock_Source is (No_Clock, LSE, LSI, HSE)
     with Size => 2;

   subtype RTC_HSE_Prescaler_Range   is Integer range 1 ..  63;
   --  The value 1 is no clock.

   procedure Select_Clock_Source
     (This       : RTC_Device;
      Source     : RTC_Clock_Source;
      HSE_Pre    : RTC_HSE_Prescaler_Range := RTC_HSE_Prescaler_Range'First)
     with Post => Read_Clock_Source (This) = Source;
   --  Set RTC Clock Mux source. These bits can be written only one time
   --  (except in case of failure detection on LSE). These bits must be
   --  written before LSECSSON is enabled. The BDRST bit can be used to
   --  reset them, then it can be written one time again.
   --  If HSE is selected as RTC clock: this clock is lost when the system
   --  is in Stop mode or in case of a pin reset (NRST).
   --  These bits must be set correctly to ensure that the clock supplied to
   --  the RTC is lower than 1 MHz. The value HSE_Pre is valid when the
   --  selected source is HSE.

   function Read_Clock_Source (This : RTC_Device) return RTC_Clock_Source;
   --  Return RTC Clock Mux source.

   -----------
   -- Timer --
   -----------

   Timer_1   : aliased Timer with Import, Volatile, Address => TIM1_Base;
   Timer_2   : aliased Timer with Import, Volatile, Address => TIM2_Base;
   Timer_3   : aliased Timer with Import, Volatile, Address => TIM3_Base;
   Timer_4   : aliased Timer with Import, Volatile, Address => TIM4_Base;
   Timer_5   : aliased Timer with Import, Volatile, Address => TIM5_Base;
   Timer_6   : aliased Timer with Import, Volatile, Address => TIM6_Base;
   Timer_7   : aliased Timer with Import, Volatile, Address => TIM7_Base;
   Timer_12  : aliased Timer with Import, Volatile, Address => TIM12_Base;
   Timer_13  : aliased Timer with Import, Volatile, Address => TIM13_Base;
   Timer_14  : aliased Timer with Import, Volatile, Address => TIM14_Base;
   Timer_15  : aliased Timer with Import, Volatile, Address => TIM15_Base;
   Timer_16  : aliased Timer with Import, Volatile, Address => TIM16_Base;
   Timer_17  : aliased Timer with Import, Volatile, Address => TIM17_Base;

   procedure Enable_Clock (This : Timer);

   procedure Reset (This : Timer);

   function Get_Clock_Frequency (This : Timer) return UInt32;
   --  Return the timer input frequency in Hz.

   -------------
   -- LPTimer --
   -------------

   LPTimer_1 : aliased LPTimer
     with Import, Volatile, Address => LPTIM1_Base;
   LPTimer_2 : aliased LPTimer
     with Import, Volatile, Address => LPTIM2_Base;
   LPTimer_3 : aliased LPTimer
     with Import, Volatile, Address => LPTIM3_Base;
   LPTimer_4 : aliased LPTimer
     with Import, Volatile, Address => LPTIM4_Base;
   LPTimer_5 : aliased LPTimer
     with Import, Volatile, Address => LPTIM5_Base;

   procedure Enable_Clock (This : LPTimer);

   procedure Reset (This : LPTimer);

   type LPTimer_Clock_Source is (Option_1, PLL2P, PLL3R, LSE, LSI, PER);
   --  Set LPTIM Clock Mux.
   --  LPTIM Port  LPTIM1  LPTIM2  LPTIM345
   --  Option_1    PCLK1   PCLK4   PCLK4

   procedure Select_Clock_Source (This   : LPTimer;
                                  Source : LPTimer_Clock_Source)
     with Post => Read_Clock_Source (This) = Source;
   --  Set clock to any internal LPTIM Clock Mux source or external through
   --  Input1.

   function Read_Clock_Source (This : LPTimer) return LPTimer_Clock_Source;
   --  Return LPTIM1 Clock Mux source.

   function Get_Clock_Frequency (This : LPTimer) return UInt32;
   --  Return the timer input frequency in Hz.

   -------------
   -- HRTimer --
   -------------

   HRTimer_M : aliased HRTimer_Master
     with Import, Volatile, Address => HRTIM_Master_Base;

   HRTimer_A : aliased HRTimer_Channel
     with Import, Volatile, Address => HRTIM_TIMA_Base;
   HRTimer_B : aliased HRTimer_Channel
     with Import, Volatile, Address => HRTIM_TIMB_Base;
   HRTimer_C : aliased HRTimer_Channel
     with Import, Volatile, Address => HRTIM_TIMC_Base;
   HRTimer_D : aliased HRTimer_Channel
     with Import, Volatile, Address => HRTIM_TIMD_Base;
   HRTimer_E : aliased HRTimer_Channel
     with Import, Volatile, Address => HRTIM_TIME_Base;

   procedure Enable_Clock (This : HRTimer_Master);

   procedure Enable_Clock (This : HRTimer_Channel);

   procedure Reset (This : HRTimer_Master);

   procedure Reset (This : HRTimer_Channel);

   type HRTimer_Clock_Source is (TIMCLK, CPUCLK);

   procedure Select_Clock_Source (This   : HRTimer_Master;
                                  Source : HRTimer_Clock_Source)
     with Post => Read_Clock_Source (This) = Source;
   --  Set clock to HRTIM source to CPU clock (HCLK1) or to APB1 Timer clock.

   function Read_Clock_Source
     (This : HRTimer_Master) return HRTimer_Clock_Source;
   --  Return HRTIM clock source.

   function Get_Clock_Frequency (This : HRTimer_Master) return UInt32;
   --  Returns the timer input frequency in Hz.

   function Get_Clock_Frequency (This : HRTimer_Channel) return UInt32;
   --  Returns the timer input frequency in Hz.

   ----------------
   -- Comparator --
   ----------------

   Comp_1 : aliased Comparator
     with Import, Volatile,
     Address => STM32_SVD.COMP.COMP_Periph.CFGR1'Address;
   Comp_2 : aliased Comparator
     with Import, Volatile,
     Address => STM32_SVD.COMP.COMP_Periph.CFGR2'Address;

   procedure Enable_Clock
     (This : aliased Comparator)
     with Inline;

   procedure Reset
     (This : aliased Comparator)
     with Inline;

   -----------
   -- OpAmp --
   -----------

   Opamp_1 : aliased Operational_Amplifier
     with Import, Volatile,
     Address => STM32_SVD.OPAMP.OPAMP_Periph.OPAMP1_CSR'Address;
   Opamp_2 : aliased Operational_Amplifier
     with Import, Volatile,
     Address => STM32_SVD.OPAMP.OPAMP_Periph.OPAMP2_CSR'Address;

   procedure Enable_Clock
     (This : aliased Operational_Amplifier)
     with Inline;

   procedure Reset
     (This : aliased Operational_Amplifier)
     with Inline;

   -----------------------------
   -- Reset and Clock Control --
   -----------------------------

   --  See RM0433 rev. 7 pg. 334 chapter 8.5, and pg. 335 for clock tree
   type RCC_System_Clocks is record
      SYSCLK    : UInt32;
      HCLK1     : UInt32; --  CPU clock
      HCLK2     : UInt32; --  AHBs peripheral clocks
      PCLK1     : UInt32; --  APB1 peripheral clock (D2PPRE1)
      PCLK2     : UInt32; --  APB2 peripheral clock (D2PPRE2)
      PCLK3     : UInt32; --  APB3 peripheral clock (D1PPRE)
      PCLK4     : UInt32; --  APB4 peripheral clock (D3PPRE)
      PERCLK    : UInt32; --  PER_CK clock
      TIMCLK1   : UInt32; --  APB1 timer clock for TIMs 2 .. 7, 12 .. 14
      TIMCLK2   : UInt32; --  APB2 timer clock for TIMs 1, 8, 15 .. 17
      TIMCLK3   : UInt32; --  APB1 timer clock for HRTIM1
   end record;

   function System_Clock_Frequencies return RCC_System_Clocks;
   --  Returns each RCC system clock frequency in Hz.

private

   GPIO_AF_RTC_OUT     : constant GPIO_Alternate_Function := 0;
   GPIO_AF_MCO_0       : constant GPIO_Alternate_Function := 0;
   GPIO_AF_PWR_0       : constant GPIO_Alternate_Function := 0;
   GPIO_AF_SWJ_0       : constant GPIO_Alternate_Function := 0;
   GPIO_AF_TRACE_0     : constant GPIO_Alternate_Function := 0;
   GPIO_AF_CSLEEP_0    : constant GPIO_Alternate_Function := 0;
   GPIO_AF_TRG_0       : constant GPIO_Alternate_Function := 0;
   GPIO_AF_TIM1_1      : constant GPIO_Alternate_Function := 1;
   GPIO_AF_TIM2_1      : constant GPIO_Alternate_Function := 1;
   GPIO_AF_TIM16_1     : constant GPIO_Alternate_Function := 1;
   GPIO_AF_TIM17_1     : constant GPIO_Alternate_Function := 1;
   GPIO_AF_LPTIM1_1    : constant GPIO_Alternate_Function := 1;
   GPIO_AF_HRTIM1_1    : constant GPIO_Alternate_Function := 1;
   GPIO_AF_SAI1_2      : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM3_2      : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM4_2      : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM5_2      : constant GPIO_Alternate_Function := 2;
   GPIO_AF_TIM12_2     : constant GPIO_Alternate_Function := 2;
   GPIO_AF_HRTIM1_2    : constant GPIO_Alternate_Function := 2;
   GPIO_AF_LPUART_3    : constant GPIO_Alternate_Function := 3;
   GPIO_AF_TIM8_3      : constant GPIO_Alternate_Function := 3;
   GPIO_AF_LPTIM2_3    : constant GPIO_Alternate_Function := 3;
   GPIO_AF_LPTIM3_3    : constant GPIO_Alternate_Function := 3;
   GPIO_AF_LPTIM4_3    : constant GPIO_Alternate_Function := 3;
   GPIO_AF_LPTIM5_3    : constant GPIO_Alternate_Function := 3;
   GPIO_AF_HRTIM1_3    : constant GPIO_Alternate_Function := 3;
   GPIO_AF_DFSDM1_3    : constant GPIO_Alternate_Function := 3;
   GPIO_AF_I2C1_4      : constant GPIO_Alternate_Function := 4;
   GPIO_AF_I2C2_4      : constant GPIO_Alternate_Function := 4;
   GPIO_AF_I2C3_4      : constant GPIO_Alternate_Function := 4;
   GPIO_AF_I2C4_4      : constant GPIO_Alternate_Function := 4;
   GPIO_AF_USART1_4    : constant GPIO_Alternate_Function := 4;
   GPIO_AF_TIM15_4     : constant GPIO_Alternate_Function := 4;
   GPIO_AF_LPTIM2_4    : constant GPIO_Alternate_Function := 4;
   GPIO_AF_DFSDM1_4    : constant GPIO_Alternate_Function := 4;
   GPIO_AF_CEC_4       : constant GPIO_Alternate_Function := 4;
   GPIO_AF_SPI1_5      : constant GPIO_Alternate_Function := 5;
   GPIO_AF_SPI2_5      : constant GPIO_Alternate_Function := 5;
   GPIO_AF_SPI3_5      : constant GPIO_Alternate_Function := 5;
   GPIO_AF_SPI4_5      : constant GPIO_Alternate_Function := 5;
   GPIO_AF_SPI5_5      : constant GPIO_Alternate_Function := 5;
   GPIO_AF_SPI6_5      : constant GPIO_Alternate_Function := 5;
   GPIO_AF_CEC_5       : constant GPIO_Alternate_Function := 5;
   GPIO_AF_SPI2_6      : constant GPIO_Alternate_Function := 6;
   GPIO_AF_SPI3_6      : constant GPIO_Alternate_Function := 6;
   GPIO_AF_SAI1_6      : constant GPIO_Alternate_Function := 6;
   GPIO_AF_SAI3_6      : constant GPIO_Alternate_Function := 6;
   GPIO_AF_I2C4_6      : constant GPIO_Alternate_Function := 6;
   GPIO_AF_UART4_6     : constant GPIO_Alternate_Function := 6;
   GPIO_AF_DFSDM1_6    : constant GPIO_Alternate_Function := 6;
   GPIO_AF_SPI2_7      : constant GPIO_Alternate_Function := 7;
   GPIO_AF_SPI3_7      : constant GPIO_Alternate_Function := 7;
   GPIO_AF_SPI6_7      : constant GPIO_Alternate_Function := 7;
   GPIO_AF_USART1_7    : constant GPIO_Alternate_Function := 7;
   GPIO_AF_USART2_7    : constant GPIO_Alternate_Function := 7;
   GPIO_AF_USART3_7    : constant GPIO_Alternate_Function := 7;
   GPIO_AF_USART6_7    : constant GPIO_Alternate_Function := 7;
   GPIO_AF_UART7_7     : constant GPIO_Alternate_Function := 7;
   GPIO_AF_SDMMC1_7    : constant GPIO_Alternate_Function := 7;
   GPIO_AF_SPI6_8      : constant GPIO_Alternate_Function := 8;
   GPIO_AF_SAI2_8      : constant GPIO_Alternate_Function := 8;
   GPIO_AF_SAI4_8      : constant GPIO_Alternate_Function := 8;
   GPIO_AF_UART4_8     : constant GPIO_Alternate_Function := 8;
   GPIO_AF_UART5_8     : constant GPIO_Alternate_Function := 8;
   GPIO_AF_UART8_8     : constant GPIO_Alternate_Function := 8;
   GPIO_AF_LPUART1_8   : constant GPIO_Alternate_Function := 8;
   GPIO_AF_SPDIFRX1_8  : constant GPIO_Alternate_Function := 8;
   GPIO_AF_SAI4_9      : constant GPIO_Alternate_Function := 9;
   GPIO_AF_FDCAN1_9    : constant GPIO_Alternate_Function := 9;
   GPIO_AF_FDCAN2_9    : constant GPIO_Alternate_Function := 9;
   GPIO_AF_TIM13_9     : constant GPIO_Alternate_Function := 9;
   GPIO_AF_TIM14_9     : constant GPIO_Alternate_Function := 9;
   GPIO_AF_QUADSPI_9   : constant GPIO_Alternate_Function := 9;
   GPIO_AF_FMC_9       : constant GPIO_Alternate_Function := 9;
   GPIO_AF_SDMMC2_9    : constant GPIO_Alternate_Function := 9;
   GPIO_AF_LCD_9       : constant GPIO_Alternate_Function := 9;
   GPIO_AF_SPDIFRX1_9  : constant GPIO_Alternate_Function := 9;
   GPIO_AF_SAI2_10     : constant GPIO_Alternate_Function := 10;
   GPIO_AF_SAI4_10     : constant GPIO_Alternate_Function := 10;
   GPIO_AF_TIM8_10     : constant GPIO_Alternate_Function := 10;
   GPIO_AF_QUADSPI_10  : constant GPIO_Alternate_Function := 10;
   GPIO_AF_SDMMC2_10   : constant GPIO_Alternate_Function := 10;
   GPIO_AF_OTG1_10     : constant GPIO_Alternate_Function := 10;
   GPIO_AF_OTG2_10     : constant GPIO_Alternate_Function := 10;
   GPIO_AF_LCD_10      : constant GPIO_Alternate_Function := 10;
   GPIO_AF_LPTIM1_11   : constant GPIO_Alternate_Function := 11;
   GPIO_AF_I2C4_11     : constant GPIO_Alternate_Function := 11;
   GPIO_AF_UART7_11    : constant GPIO_Alternate_Function := 11;
   GPIO_AF_SWPMI1_11   : constant GPIO_Alternate_Function := 11;
   GPIO_AF_TIM1_11     : constant GPIO_Alternate_Function := 11;
   GPIO_AF_TIM8_11     : constant GPIO_Alternate_Function := 11;
   GPIO_AF_DFSDM1_11   : constant GPIO_Alternate_Function := 11;
   GPIO_AF_SDMMC2_11   : constant GPIO_Alternate_Function := 11;
   GPIO_AF_MDIOS_11    : constant GPIO_Alternate_Function := 11;
   GPIO_AF_ETH_11      : constant GPIO_Alternate_Function := 11;
   GPIO_AF_TIM1_12     : constant GPIO_Alternate_Function := 12;
   GPIO_AF_TIM8_12     : constant GPIO_Alternate_Function := 12;
   GPIO_AF_FMC_12      : constant GPIO_Alternate_Function := 12;
   GPIO_AF_SDMMC1_12   : constant GPIO_Alternate_Function := 12;
   GPIO_AF_MDIOS_12    : constant GPIO_Alternate_Function := 12;
   GPIO_AF_OTG1_12     : constant GPIO_Alternate_Function := 12;
   GPIO_AF_LCD_12      : constant GPIO_Alternate_Function := 12;
   GPIO_AF_TIM1_13     : constant GPIO_Alternate_Function := 13;
   GPIO_AF_DCMI_13     : constant GPIO_Alternate_Function := 13;
   GPIO_AF_LCD_13      : constant GPIO_Alternate_Function := 13;
   GPIO_AF_COMP_13     : constant GPIO_Alternate_Function := 13;
   GPIO_AF_UART5_14    : constant GPIO_Alternate_Function := 14;
   GPIO_AF_LCD_14      : constant GPIO_Alternate_Function := 14;
   GPIO_AF_EVENTOUT_15 : constant GPIO_Alternate_Function := 15;

end STM32.Device;
