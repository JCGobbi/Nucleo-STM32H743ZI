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

--  This file provides register definitions for the STM32 (ARM Cortex M4/7F)
--  microcontrollers from ST Microelectronics.

package STM32.EXTI is

   type External_Line_Number is
     (EXTI_Line_0, --  GPIO
      EXTI_Line_1, --  GPIO
      EXTI_Line_2, --  GPIO
      EXTI_Line_3, --  GPIO
      EXTI_Line_4, --  GPIO
      EXTI_Line_5, --  GPIO
      EXTI_Line_6, --  GPIO
      EXTI_Line_7, --  GPIO
      EXTI_Line_8, --  GPIO
      EXTI_Line_9, --  GPIO
      EXTI_Line_10, --  GPIO
      EXTI_Line_11, --  GPIO
      EXTI_Line_12, --  GPIO
      EXTI_Line_13, --  GPIO
      EXTI_Line_14, --  GPIO
      EXTI_Line_15, --  GPIO
      EXTI_Line_16, --  PVD and AVD
      EXTI_Line_17, --  RTC Alarms
      EXTI_Line_18, --  RTC tamper and Timestamp and RCC LSECSS
      EXTI_Line_19, --  RTC wakeup timer
      EXTI_Line_20, --  COMP1
      EXTI_Line_21, --  COMP2
      EXTI_Line_22, --  I2C1 wakeup
      EXTI_Line_23, --  I2C2 wakeup
      EXTI_Line_24, --  I2C3 wakeup
      EXTI_Line_25, --  I2C4 wakeup
      EXTI_Line_26, --  USART1 wakeup
      EXTI_Line_27, --  USART2 wakeup
      EXTI_Line_28, --  USART3 wakeup
      EXTI_Line_29, --  USART6 wakeup
      EXTI_Line_30, --  UART4 wakeup
      EXTI_Line_31, --  UART5 wakeup
      EXTI_Line_32, --  UART7 wakeup
      EXTI_Line_33, --  UART8 wakeup
      EXTI_Line_34, --  LPUART1 RX wakeup
      EXTI_Line_35, --  LPUART1 TX wakeup
      EXTI_Line_36, --  SPI1 wakeup
      EXTI_Line_37, --  SPI2 wakeup
      EXTI_Line_38, --  SPI3 wakeup
      EXTI_Line_39, --  SPI4 wakeup
      EXTI_Line_40, --  SPI5 wakeup
      EXTI_Line_41, --  SPI6 wakeup
      EXTI_Line_42, --  MDIO wakeup
      EXTI_Line_43, --  USB1 wakeup
      EXTI_Line_44, --  USB2 wakeup
      EXTI_Line_47, --  LPTIM1 wakeup
      EXTI_Line_48, --  LPTIM2 wakeup
      EXTI_Line_49, --  LPTIM2 output
      EXTI_Line_50, --  LPTIM3 wakeup
      EXTI_Line_51, --  LPTIM3 output
      EXTI_Line_52, --  LPTIM4 wakeup
      EXTI_Line_53, --  LPTIM5 wakeup
      EXTI_Line_54, --  SWPMI wakeup
      EXTI_Line_55, --  WKUP1
      EXTI_Line_56, --  WKUP2
      EXTI_Line_57, --  WKUP3
      EXTI_Line_58, --  WKUP4
      EXTI_Line_59, --  WKUP5
      EXTI_Line_60, --  WKUP6
      EXTI_Line_61, --  RCC interrupt
      EXTI_Line_62, --  I2C4 Event interrupt
      EXTI_Line_63, --  I2C4 Error interrupt
      EXTI_Line_64, --  LPUART1 global interrupt
      EXTI_Line_65, --  SPI6 interrupt
      EXTI_Line_66, --  BDMA CH0 interrupt
      EXTI_Line_67, --  BDMA CH1 interrupt
      EXTI_Line_68, --  BDMA CH2 interrupt
      EXTI_Line_69, --  BDMA CH3 interrupt
      EXTI_Line_70, --  BDMA CH4 interrupt
      EXTI_Line_71, --  BDMA CH5 interrupt
      EXTI_Line_72, --  BDMA CH6 interrupt
      EXTI_Line_73, --  BDMA CH7 interrupt
      EXTI_Line_74, --  DMAMUX2 interrupt
      EXTI_Line_75, --  ADC3 interrupt
      EXTI_Line_76, --  SAI4 interrupt
      EXTI_Line_85, --  HDMI-CEC wakeup
      EXTI_Line_86, --  ETHERNET wakeup
      EXTI_Line_87); --  HSECSS interrupt
   --  See RM0433 rev 7 chapter 20.4 table 146 for EXTI event input mapping.

   for External_Line_Number use
     (EXTI_Line_0   => 0,
      EXTI_Line_1   => 1,
      EXTI_Line_2   => 2,
      EXTI_Line_3   => 3,
      EXTI_Line_4   => 4,
      EXTI_Line_5   => 5,
      EXTI_Line_6   => 6,
      EXTI_Line_7   => 7,
      EXTI_Line_8   => 8,
      EXTI_Line_9   => 9,
      EXTI_Line_10  => 10,
      EXTI_Line_11  => 11,
      EXTI_Line_12  => 12,
      EXTI_Line_13  => 13,
      EXTI_Line_14  => 14,
      EXTI_Line_15  => 15,
      EXTI_Line_16  => 16,
      EXTI_Line_17  => 17,
      EXTI_Line_18  => 18,
      EXTI_Line_19  => 19,
      EXTI_Line_20  => 20,
      EXTI_Line_21  => 21,
      EXTI_Line_22  => 22,
      EXTI_Line_23  => 23,
      EXTI_Line_24  => 24,
      EXTI_Line_25  => 25,
      EXTI_Line_26  => 26,
      EXTI_Line_27  => 27,
      EXTI_Line_28  => 28,
      EXTI_Line_29  => 29,
      EXTI_Line_30  => 30,
      EXTI_Line_31  => 31,
      EXTI_Line_32  => 32,
      EXTI_Line_33  => 33,
      EXTI_Line_34  => 34,
      EXTI_Line_35  => 35,
      EXTI_Line_36  => 36,
      EXTI_Line_37  => 37,
      EXTI_Line_38  => 38,
      EXTI_Line_39  => 39,
      EXTI_Line_40  => 40,
      EXTI_Line_41  => 41,
      EXTI_Line_42  => 42,
      EXTI_Line_43  => 43,
      EXTI_Line_44  => 44,
      EXTI_Line_47  => 47,
      EXTI_Line_48  => 48,
      EXTI_Line_49  => 49,
      EXTI_Line_50  => 50,
      EXTI_Line_51  => 51,
      EXTI_Line_52  => 52,
      EXTI_Line_53  => 53,
      EXTI_Line_54  => 54,
      EXTI_Line_55  => 55,
      EXTI_Line_56  => 56,
      EXTI_Line_57  => 57,
      EXTI_Line_58  => 58,
      EXTI_Line_59  => 59,
      EXTI_Line_60  => 60,
      EXTI_Line_61  => 61,
      EXTI_Line_62  => 62,
      EXTI_Line_63  => 63,
      EXTI_Line_64  => 64,
      EXTI_Line_65  => 65,
      EXTI_Line_66  => 66,
      EXTI_Line_67  => 67,
      EXTI_Line_68  => 68,
      EXTI_Line_69  => 69,
      EXTI_Line_70  => 70,
      EXTI_Line_71  => 71,
      EXTI_Line_72  => 72,
      EXTI_Line_73  => 73,
      EXTI_Line_74  => 74,
      EXTI_Line_75  => 75,
      EXTI_Line_76  => 76,
      EXTI_Line_85  => 85,
      EXTI_Line_86  => 86,
      EXTI_Line_87  => 87);

   type External_Triggers is
     (Interrupt_Rising_Edge,
      Interrupt_Falling_Edge,
      Interrupt_Rising_Falling_Edge,
      Event_Rising_Edge,
      Event_Falling_Edge,
      Event_Rising_Falling_Edge);

   subtype Interrupt_Triggers is External_Triggers
      range Interrupt_Rising_Edge .. Interrupt_Rising_Falling_Edge;

   subtype Event_Triggers is External_Triggers
      range Event_Rising_Edge .. Event_Rising_Falling_Edge;

   procedure Enable_External_Interrupt
     (Line    : External_Line_Number;
      Trigger : Interrupt_Triggers)
     with Inline;

   procedure Disable_External_Interrupt (Line : External_Line_Number)
     with Inline;

   procedure Enable_External_Event
     (Line    : External_Line_Number;
      Trigger : Event_Triggers)
     with Inline;

   procedure Disable_External_Event (Line : External_Line_Number)
     with Inline;


   procedure Generate_SWI (Line : External_Line_Number)
     with Inline;

   function External_Interrupt_Pending (Line : External_Line_Number)
     return Boolean
     with Inline;

   procedure Clear_External_Interrupt (Line : External_Line_Number)
     with Inline;

end STM32.EXTI;
