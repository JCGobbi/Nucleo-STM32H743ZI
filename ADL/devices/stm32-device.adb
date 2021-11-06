------------------------------------------------------------------------------
--                                                                          --
--                     Copyright (C) 2015-2016, AdaCore                     --
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

with System;          use System;

with STM32_SVD.RCC;   use STM32_SVD.RCC;
with STM32_SVD.CRC;   use STM32_SVD.CRC;

package body STM32.Device is

   HPRE_Presc_Table : constant array (UInt4) of UInt32 :=
     (1, 1, 1, 1, 1, 1, 1, 1, 2, 4, 8, 16, 64, 128, 256, 512);

   PPRE_Presc_Table : constant array (UInt3) of UInt32 :=
     (1, 1, 1, 1, 2, 4, 8, 16);

   ------------------
   -- Enable_Clock --
   ------------------

   procedure Enable_Clock (This : aliased GPIO_Port) is
   begin
      if This'Address = GPIOA_Base then
         RCC_Periph.AHB4ENR.GPIOAEN := True;
      elsif This'Address = GPIOB_Base then
         RCC_Periph.AHB4ENR.GPIOBEN := True;
      elsif This'Address = GPIOC_Base then
         RCC_Periph.AHB4ENR.GPIOCEN := True;
      elsif This'Address = GPIOD_Base then
         RCC_Periph.AHB4ENR.GPIODEN := True;
      elsif This'Address = GPIOE_Base then
         RCC_Periph.AHB4ENR.GPIOEEN := True;
      elsif This'Address = GPIOF_Base then
         RCC_Periph.AHB4ENR.GPIOFEN := True;
      elsif This'Address = GPIOG_Base then
         RCC_Periph.AHB4ENR.GPIOGEN := True;
      elsif This'Address = GPIOH_Base then
         RCC_Periph.AHB4ENR.GPIOHEN := True;
      elsif This'Address = GPIOI_Base then
         RCC_Periph.AHB4ENR.GPIOIEN := True;
      elsif This'Address = GPIOJ_Base then
         RCC_Periph.AHB4ENR.GPIOJEN := True;
      elsif This'Address = GPIOK_Base then
         RCC_Periph.AHB4ENR.GPIOKEN := True;
      else
         raise Unknown_Device;
      end if;
   end Enable_Clock;

   ------------------
   -- Enable_Clock --
   ------------------

   procedure Enable_Clock (Point : GPIO_Point)
   is
   begin
      Enable_Clock (Point.Periph.all);
   end Enable_Clock;

   ------------------
   -- Enable_Clock --
   ------------------

   procedure Enable_Clock (Points : GPIO_Points)
   is
   begin
      for Point of Points loop
         Enable_Clock (Point.Periph.all);
      end loop;
   end Enable_Clock;

   -----------
   -- Reset --
   -----------

   procedure Reset (This : aliased GPIO_Port) is
   begin
      if This'Address = GPIOA_Base then
         RCC_Periph.AHB4RSTR.GPIOARST := True;
         RCC_Periph.AHB4RSTR.GPIOARST := False;
      elsif This'Address = GPIOB_Base then
         RCC_Periph.AHB4RSTR.GPIOBRST := True;
         RCC_Periph.AHB4RSTR.GPIOBRST := False;
      elsif This'Address = GPIOC_Base then
         RCC_Periph.AHB4RSTR.GPIOCRST := True;
         RCC_Periph.AHB4RSTR.GPIOCRST := False;
      elsif This'Address = GPIOD_Base then
         RCC_Periph.AHB4RSTR.GPIODRST := True;
         RCC_Periph.AHB4RSTR.GPIODRST := False;
      elsif This'Address = GPIOE_Base then
         RCC_Periph.AHB4RSTR.GPIOERST := True;
         RCC_Periph.AHB4RSTR.GPIOERST := False;
      elsif This'Address = GPIOF_Base then
         RCC_Periph.AHB4RSTR.GPIOFRST := True;
         RCC_Periph.AHB4RSTR.GPIOFRST := False;
      elsif This'Address = GPIOG_Base then
         RCC_Periph.AHB4RSTR.GPIOGRST := True;
         RCC_Periph.AHB4RSTR.GPIOGRST := False;
      elsif This'Address = GPIOH_Base then
         RCC_Periph.AHB4RSTR.GPIOHRST := True;
         RCC_Periph.AHB4RSTR.GPIOHRST := False;
      elsif This'Address = GPIOI_Base then
         RCC_Periph.AHB4RSTR.GPIOIRST := True;
         RCC_Periph.AHB4RSTR.GPIOIRST := False;
      elsif This'Address = GPIOJ_Base then
         RCC_Periph.AHB4RSTR.GPIOJRST := True;
         RCC_Periph.AHB4RSTR.GPIOJRST := False;
      elsif This'Address = GPIOK_Base then
         RCC_Periph.AHB4RSTR.GPIOKRST := True;
         RCC_Periph.AHB4RSTR.GPIOKRST := False;
      else
         raise Unknown_Device;
      end if;
   end Reset;

   -----------
   -- Reset --
   -----------

   procedure Reset (Point : GPIO_Point) is
   begin
      Reset (Point.Periph.all);
   end Reset;

   -----------
   -- Reset --
   -----------

   procedure Reset (Points : GPIO_Points)
   is
      Do_Reset : Boolean;
   begin
      for J in Points'Range loop
         Do_Reset := True;
         for K in Points'First .. J - 1 loop
            if Points (K).Periph = Points (J).Periph then
               Do_Reset := False;

               exit;
            end if;
         end loop;

         if Do_Reset then
            Reset (Points (J).Periph.all);
         end if;
      end loop;
   end Reset;

   ------------------------------
   -- GPIO_Port_Representation --
   ------------------------------

   function GPIO_Port_Representation (Port : GPIO_Port) return UInt4 is
   begin
      --  TODO: rather ugly to have this board-specific range here
      if Port'Address = GPIOA_Base then
         return 0;
      elsif Port'Address = GPIOB_Base then
         return 1;
      elsif Port'Address = GPIOC_Base then
         return 2;
      elsif Port'Address = GPIOD_Base then
         return 3;
      elsif Port'Address = GPIOE_Base then
         return 4;
      elsif Port'Address = GPIOF_Base then
         return 5;
      elsif Port'Address = GPIOG_Base then
         return 6;
      elsif Port'Address = GPIOH_Base then
         return 7;
      elsif Port'Address = GPIOI_Base then
         return 8;
      elsif Port'Address = GPIOJ_Base then
         return 9;
      elsif Port'Address = GPIOK_Base then
         return 10;
      else
         raise Program_Error;
      end if;
   end GPIO_Port_Representation;

   ------------------
   -- Enable_Clock --
   ------------------

   procedure Enable_Clock (This : aliased Analog_To_Digital_Converter)
   is
   begin
      if This'Address = ADC1_Base then
         RCC_Periph.AHB1ENR.ADC12EN := True;
      elsif This'Address = ADC2_Base then
         RCC_Periph.AHB1ENR.ADC12EN := True;
      elsif This'Address = ADC3_Base then
         RCC_Periph.AHB4ENR.ADC3EN := True;
      else
         raise Unknown_Device;
      end if;
   end Enable_Clock;

   -------------------------
   -- Reset_All_ADC_Units --
   -------------------------

   procedure Reset_All_ADC_Units is
   begin
         RCC_Periph.AHB1RSTR.ADC12RST := True;
         RCC_Periph.AHB1RSTR.ADC12RST := False;
         RCC_Periph.AHB4RSTR.ADC3RST := True;
         RCC_Periph.AHB4RSTR.ADC3RST := False;
   end Reset_All_ADC_Units;

   ------------------------
   -- Write_Clock_Source --
   ------------------------

   procedure Write_Clock_Source (This   : Analog_To_Digital_Converter;
                                 Source : ADC_Clock_Source)
   is
   begin
      if This'Address = ADC1_Base or
        This'Address = ADC2_Base or
        This'Address = ADC3_Base
      then
         RCC_Periph.D3CCIPR.ADCSEL := Source'Enum_Rep;
      else
         raise Unknown_Device;
      end if;
   end Write_Clock_Source;

   -----------------------
   -- Read_Clock_Source --
   -----------------------

   function Read_Clock_Source (This : Analog_To_Digital_Converter)
                               return ADC_Clock_Source
   is
   begin
      if This'Address = ADC1_Base or
        This'Address = ADC2_Base or
        This'Address = ADC3_Base
      then
         return ADC_Clock_Source'Val (RCC_Periph.D3CCIPR.ADCSEL);
      else
         raise Unknown_Device;
      end if;
   end Read_Clock_Source;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock
   --    (This : aliased Digital_To_Analog_Converter)
   --  is
   --  begin
   --     if This'Address = DAC_Base then
   --        RCC_Periph.APB1LENR.DAC12EN := True;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Enable_Clock;

   -----------
   -- Reset --
   -----------

   --  procedure Reset (This : aliased Digital_To_Analog_Converter)
   --  is
   --  begin
   --     if This'Address = DAC_Base then
   --        RCC_Periph.APB1LRSTR.DAC12RST := True;
   --        RCC_Periph.APB1LRSTR.DAC12RST := False;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Reset;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock (This : SAI_Port)
   --  is
   --  begin
   --     if This'Address = SAI1_Base then
   --        RCC_Periph.APB2ENR.SAI1EN := True;
   --     elsif This'Address = SAI2_Base then
   --        RCC_Periph.APB2ENR.SAI2EN := True;
   --     elsif This'Address = SAI3_Base then
   --        RCC_Periph.APB2ENR.SAI3EN := True;
   --     elsif This'Address = SAI4_Base then
   --        RCC_Periph.APB4ENR.SAI4EN := True;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Enable_Clock;

   -----------
   -- Reset --
   -----------

   --  procedure Reset (This : SAI_Port)
   --  is
   --  begin
   --     if This'Address = SAI1_Base then
   --        RCC_Periph.APB2RSTR.SAI1RST := True;
   --        RCC_Periph.APB2RSTR.SAI1RST := False;
   --     elsif This'Address = SAI2_Base then
   --        RCC_Periph.APB2RSTR.SAI2RST := True;
   --        RCC_Periph.APB2RSTR.SAI2RST := False;
   --     elsif This'Address = SAI3_Base then
   --        RCC_Periph.APB2RSTR.SAI3RST := True;
   --        RCC_Periph.APB2RSTR.SAI3RST := False;
   --     elsif This'Address = SAI4_Base then
   --        RCC_Periph.APB4RSTR.SAI4RST := True;
   --        RCC_Periph.APB4RSTR.SAI4RST := False;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Reset;

   ------------------------
   -- Write_Clock_Source --
   ------------------------

   --  procedure Write_Clock_Source (This   : SAI_Port;
   --                                Source : SAI_Clock_Source)
   --  is
   --  begin
   --     if This'Address = SAI1_Base then
   --        RCC_Periph.D2CCIP1R.SAI1SEL := Source'Enum_Rep;
   --     elsif This'Address = SAI2_Base or
   --           This'Address = SAI3_Base
   --     then
   --        RCC_Periph.D2CCIP1R.SAI23SEL := Source'Enum_Rep;
   --     elsif This'Address = SAI4_Base then
   --        RCC_Periph.D3CCIPR.SAI4ASEL := Source'Enum_Rep;
   --        RCC_Periph.D3CCIPR.SAI4BSEL := Source'Enum_Rep;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Write_Clock_Source;

   ------------------------
   -- Read_Clock_Source --
   ------------------------

   --  function Read_Clock_Source (This : SAI_Port) return SAI_Clock_Source
   --  is
   --  begin
   --     if This'Address = SAI1_Base then
   --        return SAI_Clock_Source'Val (RCC_Periph.D2CCIP1R.SAI1SEL);
   --     elsif This'Address = SAI2_Base or
   --           This'Address = SAI3_Base
   --     then
   --        return SAI_Clock_Source'Val (RCC_Periph.D2CCIP1R.SAI23SEL);
   --     elsif This'Address = SAI4_Base then
   --        return SAI_Clock_Source'Val (RCC_Periph.D3CCIPR.SAI4ASEL);
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Read_Clock_Source;

   -------------------------
   -- Get_Clock_Frequency --
   -------------------------

   --  function Get_Clock_Frequency (This : SAI_Port) return UInt32
   --  is
   --     Input_Selector : SAI_Clock_Source;
   --     VCO_Input      : UInt32;
   --  begin
   --     if This'Address = SAI1_Base then
   --        Input_Selector := SAI_Clock_Source'Val (RCC_Periph.D2CCIP1R.SAI1SEL);
   --     elsif This'Address = SAI2_Base or
   --           This'Address = SAI3_Base
   --     then
   --        Input_Selector := SAI_Clock_Source'Val (RCC_Periph.D2CCIP1R.SAI23SEL);
   --     elsif This'Address = SAI4_Base then
   --        Input_Selector := SAI_Clock_Source'Val (RCC_Periph.D3CCIPR.SAI4ASEL);
   --     else
   --        raise Unknown_Device;
   --     end if;
   --
   --     case Input_Selector is
   --        when PLL1Q =>
   --           VCO_Input := System_Clock_Frequencies.PCLK1; --  PLL1Q;
   --        when PLL2P =>
   --           VCO_Input := System_Clock_Frequencies.PCLK1; --  PLL2P;
   --        when PLL3P =>
   --           VCO_Input := System_Clock_Frequencies.PCLK1; --  PLL3P;
   --        when I2S_CKIN =>
   --           VCO_Input := I2SCLK;
   --        when PER =>
   --           VCO_Input := System_Clock_Frequencies.PERCLK;
   --     end case;
   --
   --     return VCO_Input;
   --  end Get_Clock_Frequency;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock (This : CRC_32) is
   --     pragma Unreferenced (This);
   --  begin
   --     RCC_Periph.AHB4ENR.CRCEN := True;
   --  end Enable_Clock;

   -------------------
   -- Disable_Clock --
   -------------------

   --  procedure Disable_Clock (This : CRC_32) is
   --     pragma Unreferenced (This);
   --  begin
   --     RCC_Periph.AHB4ENR.CRCEN := False;
   --  end Disable_Clock;

   -----------
   -- Reset --
   -----------

   --  procedure Reset (This : CRC_32) is
   --     pragma Unreferenced (This);
   --  begin
   --     RCC_Periph.AHB4RSTR.CRCRST := True;
   --     RCC_Periph.AHB4RSTR.CRCRST := False;
   --  end Reset;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock (This : RNG_Generator) is
   --     pragma Unreferenced (This);
   --  begin
   --     RCC_Periph.AHB2ENR.RNGEN := True;
   --  end Enable_Clock;

   -------------------
   -- Disable_Clock --
   -------------------

   --  procedure Disable_Clock (This : RNG_Generator) is
   --     pragma Unreferenced (This);
   --  begin
   --     RCC_Periph.AHB2ENR.RNGEN := False;
   --  end Disable_Clock;

   -----------
   -- Reset --
   -----------

   --  procedure Reset (This : RNG_Generator) is
   --     pragma Unreferenced (This);
   --  begin
   --     RCC_Periph.AHB2RSTR.RNGRST := True;
   --     RCC_Periph.AHB2RSTR.RNGRST := False;
   --  end Reset;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock (This : aliased DMA_Controller) is
   --  begin
   --     if This'Address = STM32_SVD.DMA1_Base then
   --        RCC_Periph.AHB1ENR.DMA1EN := True;
   --     elsif This'Address = STM32_SVD.DMA2_Base then
   --        RCC_Periph.AHB1ENR.DMA2EN := True;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Enable_Clock;

   -----------
   -- Reset --
   -----------

   --  procedure Reset (This : aliased DMA_Controller) is
   --  begin
   --     if This'Address = STM32_SVD.DMA1_Base then
   --        RCC_Periph.AHB1RSTR.DMA1RST := True;
   --        RCC_Periph.AHB1RSTR.DMA1RST := False;
   --     elsif This'Address = STM32_SVD.DMA2_Base then
   --        RCC_Periph.AHB1RSTR.DMA2RST := True;
   --        RCC_Periph.AHB1RSTR.DMA2RST := False;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Reset;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock (This : aliased USART) is
   --  begin
   --     if This.Periph.all'Address = USART1_Base then
   --        RCC_Periph.APB2ENR.USART1EN := True;
   --     elsif This.Periph.all'Address = USART2_Base then
   --        RCC_Periph.APB1LENR.USART2EN := True;
   --     elsif This.Periph.all'Address = USART3_Base then
   --        RCC_Periph.APB1LENR.USART3EN := True;
   --     elsif This.Periph.all'Address = UART4_Base then
   --        RCC_Periph.APB1LENR.UART4EN := True;
   --     elsif This.Periph.all'Address = UART5_Base then
   --        RCC_Periph.APB1LENR.UART5EN := True;
   --     elsif This.Periph.all'Address = USART6_Base then
   --        RCC_Periph.APB2ENR.USART6EN := True;
   --     elsif This.Periph.all'Address = UART7_Base then
   --        RCC_Periph.APB1LENR.UART7EN := True;
   --     elsif This.Periph.all'Address = UART8_Base then
   --        RCC_Periph.APB1LENR.UART8EN := True;
   --     elsif This.Periph.all'Address = LPUART1_Base then
   --        RCC_Periph.APB4ENR.LPUART1EN := True;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Enable_Clock;

   -----------
   -- Reset --
   -----------

   --  procedure Reset (This : aliased USART) is
   --  begin
   --     if This.Periph.all'Address = USART1_Base then
   --        RCC_Periph.APB2RSTR.USART1RST := True;
   --        RCC_Periph.APB2RSTR.USART1RST := False;
   --     elsif This.Periph.all'Address = USART2_Base then
   --        RCC_Periph.APB1LRSTR.USART2RST := True;
   --        RCC_Periph.APB1LRSTR.USART2RST := False;
   --     elsif This.Periph.all'Address = USART3_Base then
   --        RCC_Periph.APB1LRSTR.USART3RST := True;
   --        RCC_Periph.APB1LRSTR.USART3RST := False;
   --     elsif This.Periph.all'Address = UART4_Base then
   --        RCC_Periph.APB1LRSTR.UART4RST := True;
   --        RCC_Periph.APB1LRSTR.UART4RST := False;
   --     elsif This.Periph.all'Address = UART5_Base then
   --        RCC_Periph.APB1LRSTR.UART5RST := True;
   --        RCC_Periph.APB1LRSTR.UART5RST := False;
   --     elsif This.Periph.all'Address = USART6_Base then
   --        RCC_Periph.APB2RSTR.USART6RST := True;
   --        RCC_Periph.APB2RSTR.USART6RST := False;
   --     elsif This.Periph.all'Address = UART7_Base then
   --        RCC_Periph.APB1LRSTR.UART7RST := True;
   --        RCC_Periph.APB1LRSTR.UART7RST := False;
   --     elsif This.Periph.all'Address = UART8_Base then
   --        RCC_Periph.APB1LRSTR.UART8RST := True;
   --        RCC_Periph.APB1LRSTR.UART8RST := False;
   --     elsif This.Periph.all'Address = LPUART1_Base then
   --        RCC_Periph.APB4RSTR.LPUART1RST := True;
   --        RCC_Periph.APB4RSTR.LPUART1RST := False;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Reset;

   ------------------------
   -- Write_Clock_Source --
   ------------------------

   --  procedure Write_Clock_Source (This   : aliased USART;
   --                                Source : USART_Clock_Source)
   --  is
   --  begin
   --     if This'Address = USART1_Base or
   --        This'Address = USART6_Base
   --     then
   --        RCC_Periph.D2CCIP2R.USART16SEL := Source'Enum_Rep;
   --     elsif This'Address = USART2_Base or
   --           This'Address = USART3_Base or
   --           This'Address = UART4_Base or
   --           This'Address = UART5_Base or
   --           This'Address = UART7_Base or
   --           This'Address = UART8_Base
   --     then
   --        RCC_Periph.D2CCIP2R.USART234578SEL := Source'Enum_Rep;
   --     elsif This'Address = LPUART1_Base then
   --        RCC_Periph.D3CCIPR.LPUART1SEL := Source'Enum_Rep;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Write_Clock_Source;

   -----------------------
   -- Read_Clock_Source --
   -----------------------

   --  function Read_Clock_Source (This : aliased USART)
   --    return USART_Clock_Source
   --  is
   --  begin
   --     if This'Address = USART1_Base or
   --        This'Address = USART6_Base
   --     then
   --        return USART_Clock_Source'Val (RCC_Periph.D2CCIP2R.USART16SEL);
   --     elsif This'Address = USART2_Base or
   --           This'Address = USART3_Base or
   --           This'Address = UART4_Base or
   --           This'Address = UART5_Base or
   --           This'Address = UART7_Base or
   --           This'Address = UART8_Base
   --     then
   --        return USART_Clock_Source'Val (RCC_Periph.D2CCIP2R.USART234578SEL);
   --     elsif This'Address = LPUART1_Base then
   --        return USART_Clock_Source'Val (RCC_Periph.D3CCIPR.LPUART1SEL);
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Read_Clock_Source;

   -------------------------
   -- Get_Clock_Frequency --
   -------------------------

   --  function Get_Clock_Frequency (This : USART) return UInt32
   --  is
   --     Input_Selector : USART_Clock_Source;
   --     Clock_Input    : UInt32;
   --  begin
   --     if This'Address = USART1_Base or
   --        This'Address = USART6_Base
   --     then
   --        Input_Selector := USART_Clock_Source'Val (RCC_Periph.D2CCIP2R.USART16SEL);
   --     elsif This'Address = USART2_Base or
   --           This'Address = USART3_Base or
   --           This'Address = UART4_Base or
   --           This'Address = UART5_Base or
   --           This'Address = UART7_Base or
   --           This'Address = UART8_Base
   --     then
   --        Input_Selector := USART_Clock_Source'Val (RCC_Periph.D2CCIP2R.USART234578SEL);
   --     elsif This'Address = LPUART1_Base then
   --        Input_Selector := USART_Clock_Source'Val (RCC_Periph.D3CCIPR.LPUART1SEL);
   --     else
   --        raise Unknown_Device;
   --     end if;
   --
   --     case Input_Selector is
   --        when Option_1 =>
   --           if This'Address = USART1_Base or
   --              This'Address = USART6_Base
   --           then
   --              Clock_Input := System_Clock_Frequencies.PCLK2;
   --           elsif This'Address = USART2_Base or
   --                 This'Address = USART3_Base or
   --                 This'Address = UART4_Base or
   --                 This'Address = UART5_Base or
   --                 This'Address = UART7_Base or
   --                 This'Address = UART8_Base
   --           then
   --              Clock_Input := System_Clock_Frequencies.PCLK1;
   --           else --  LPUART1
   --              Clock_Input := System_Clock_Frequencies.PCLK3;
   --           end if;
   --
   --        when PLL2Q =>
   --           Clock_Input := System_Clock_Frequencies.PCLK1;
   --        when PLL3Q =>
   --           Clock_Input := System_Clock_Frequencies.PCLK1;
   --        when HSI =>
   --           Clock_Input := HSI_VALUE;
   --        when CSI =>
   --           Clock_Input := CSI_VALUE;
   --        when LSE =>
   --           Clock_Input := LSE_VALUE;
   --     end case;
   --
   --     return Clock_Input;
   --  end Get_Clock_Frequency;

   ----------------
   -- As_Port_Id --
   ----------------

   --  function As_Port_Id (Port : I2C_Port'Class) return I2C_Port_Id is
   --  begin
   --     if Port.Periph.all'Address = I2C1_Base then
   --        return I2C_Id_1;
   --     elsif Port.Periph.all'Address = I2C2_Base then
   --        return I2C_Id_2;
   --     elsif Port.Periph.all'Address = I2C3_Base then
   --        return I2C_Id_3;
   --     elsif Port.Periph.all'Address = I2C4_Base then
   --        return I2C_Id_4;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end As_Port_Id;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock (This : aliased I2C_Port'Class) is
   --  begin
   --     Enable_Clock (As_Port_Id (This));
   --  end Enable_Clock;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock (This : I2C_Port_Id) is
   --  begin
   --     case This is
   --        when I2C_Id_1 =>
   --           RCC_Periph.APB1LENR.I2C1EN := True;
   --        when I2C_Id_2 =>
   --           RCC_Periph.APB1LENR.I2C2EN := True;
   --        when I2C_Id_3 =>
   --           RCC_Periph.APB1LENR.I2C3EN := True;
   --        when I2C_Id_4 =>
   --           RCC_Periph.APB4ENR.I2C4EN := True;
   --     end case;
   --  end Enable_Clock;

   -----------
   -- Reset --
   -----------

   --  procedure Reset (This : I2C_Port'Class) is
   --  begin
   --     Reset (As_Port_Id (This));
   --  end Reset;
   --
   --  -----------
   --  -- Reset --
   --  -----------
   --
   --  procedure Reset (This : I2C_Port_Id) is
   --  begin
   --     case This is
   --        when I2C_Id_1 =>
   --           RCC_Periph.APB1LRSTR.I2C1RST := True;
   --           RCC_Periph.APB1LRSTR.I2C1RST := False;
   --        when I2C_Id_2 =>
   --           RCC_Periph.APB1LRSTR.I2C2RST := True;
   --           RCC_Periph.APB1LRSTR.I2C2RST := False;
   --        when I2C_Id_3 =>
   --           RCC_Periph.APB1LRSTR.I2C3RST := True;
   --           RCC_Periph.APB1LRSTR.I2C3RST := False;
   --        when I2C_Id_4 =>
   --           RCC_Periph.APB4RSTR.I2C4RST := True;
   --           RCC_Periph.APB4RSTR.I2C4RST := False;
   --     end case;
   --  end Reset;

   ------------------------
   -- Write_Clock_Source --
   ------------------------

   --  procedure Write_Clock_Source (This   : I2C_Port'Class;
   --                                Source : I2C_Clock_Source)
   --  is
   --  begin
   --     Write_Clock_Source (As_Port_Id (This), Source);
   --  end Write_Clock_Source;

   ------------------------
   -- Write_Clock_Source --
   ------------------------

   --  procedure Write_Clock_Source (This   : I2C_Port_Id;
   --                                Source : I2C_Clock_Source)
   --  is
   --  begin
   --     case This is
   --        when I2C_Id_1 | I2C_Id_2 | I2C_Id_3 =>
   --           RCC_Periph.D2CCIP2R.I2C123SEL := Source'Enum_Rep;
   --        when I2C_Id_4 =>
   --           RCC_Periph.D3CCIPR.I2C4SEL := Source'Enum_Rep;
   --     end case;
   --  end Write_Clock_Source;

   -----------------------
   -- Read_Clock_Source --
   -----------------------

   --  function Read_Clock_Source (This : I2C_Port'Class) return I2C_Clock_Source
   --  is
   --  begin
   --     return Read_Clock_Source (As_Port_Id (This));
   --  end Read_Clock_Source;

   ------------------------
   -- Read_Clock_Source --
   ------------------------

   --  function Read_Clock_Source (This : I2C_Port_Id) return I2C_Clock_Source
   --  is
   --  begin
   --     case This is
   --        when  I2C_Id_1 | I2C_Id_2 | I2C_Id_3 =>
   --           return I2C_Clock_Source'Val (RCC_Periph.D2CCIP2R.I2C123SEL);
   --        when I2C_Id_4 =>
   --           return I2C_Clock_Source'Val (RCC_Periph.D3CCIPR.I2C4SEL);
   --     end case;
   --  end Read_Clock_Source;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock (This : SPI_Port'Class) is
   --  begin
   --     if This.Periph.all'Address = SPI1_Base then
   --        RCC_Periph.APB2ENR.SPI1EN := True;
   --     elsif This.Periph.all'Address = SPI2_Base then
   --        RCC_Periph.APB1LENR.SPI2EN := True;
   --     elsif This.Periph.all'Address = SPI3_Base then
   --        RCC_Periph.APB1LENR.SPI3EN := True;
   --     elsif This.Periph.all'Address = SPI4_Base then
   --        RCC_Periph.APB2ENR.SPI4EN := True;
   --     elsif This.Periph.all'Address = SPI5_Base then
   --        RCC_Periph.APB2ENR.SPI5EN := True;
   --     elsif This.Periph.all'Address = SPI6_Base then
   --        RCC_Periph.APB4ENR.SPI6EN := True;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Enable_Clock;

   -----------
   -- Reset --
   -----------

   --  procedure Reset (This : SPI_Port'Class) is
   --  begin
   --     if This.Periph.all'Address = SPI1_Base then
   --        RCC_Periph.APB2RSTR.SPI1RST := True;
   --        RCC_Periph.APB2RSTR.SPI1RST := False;
   --     elsif This.Periph.all'Address = SPI2_Base then
   --        RCC_Periph.APB1LRSTR.SPI2RST := True;
   --        RCC_Periph.APB1LRSTR.SPI2RST := False;
   --     elsif This.Periph.all'Address = SPI3_Base then
   --        RCC_Periph.APB1LRSTR.SPI3RST := True;
   --        RCC_Periph.APB1LRSTR.SPI3RST := False;
   --     elsif This.Periph.all'Address = SPI4_Base then
   --        RCC_Periph.APB2RSTR.SPI4RST := True;
   --        RCC_Periph.APB2RSTR.SPI4RST := False;
   --     elsif This.Periph.all'Address = SPI5_Base then
   --        RCC_Periph.APB2RSTR.SPI5RST := True;
   --        RCC_Periph.APB2RSTR.SPI5RST := False;
   --     elsif This.Periph.all'Address = SPI6_Base then
   --        RCC_Periph.APB4RSTR.SPI6RST := True;
   --        RCC_Periph.APB4RSTR.SPI6RST := False;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Reset;

   ------------------------
   -- Write_Clock_Source --
   ------------------------

   --  procedure Write_Clock_Source (This   : SPI_Port'Class;
   --                                Source : SPI_Clock_Source)
   --  is
   --  begin
   --     if This.Periph.all'Address = SPI1_Base or
   --        This.Periph.all'Address = SPI2_Base or
   --        This.Periph.all'Address = SPI3_Base
   --     then
   --        RCC_Periph.D2CCIP1R.SPI123SEL := Source'Enum_Rep;
   --     elsif This.Periph.all'Address = SPI4_Base or
   --           This.Periph.all'Address = SPI5_Base
   --     then
   --        RCC_Periph.D2CCIP1R.SPI45SEL := Source'Enum_Rep;
   --     elsif This.Periph.all'Address = SPI6_Base
   --     then
   --        RCC_Periph.D3CCIPR.SPI6SEL := Source'Enum_Rep;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Write_Clock_Source;

   ------------------------
   -- Read_Clock_Source --
   ------------------------

   --  function Read_Clock_Source (This : SPI_Port'Class) return SPI_Clock_Source
   --  is
   --  begin
   --     if This.Periph.all'Address = SPI1_Base or
   --        This.Periph.all'Address = SPI2_Base or
   --        This.Periph.all'Address = SPI3_Base
   --     then
   --        return SPI_Clock_Source'Val (RCC_Periph.D2CCIP1R.SPI123SEL);
   --     elsif This.Periph.all'Address = SPI4_Base or
   --           This.Periph.all'Address = SPI5_Base
   --     then
   --        return SPI_Clock_Source'Val (RCC_Periph.D2CCIP1R.SPI45SEL);
   --     elsif This.Periph.all'Address = SPI6_Base
   --     then
   --        return SPI_Clock_Source'Val (RCC_Periph.D3CCIPR.SPI6SEL);
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Read_Clock_Source;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock (This : I2S_Port) is
   --  begin
   --     if This.Periph.all'Address = SPI1_Base then
   --        RCC_Periph.APB2ENR.SPI1EN := True;
   --     elsif This.Periph.all'Address = SPI2_Base then
   --        RCC_Periph.APB1LENR.SPI2EN := True;
   --     elsif This.Periph.all'Address = SPI3_Base then
   --        RCC_Periph.APB1LENR.SPI3EN := True;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Enable_Clock;

   -----------
   -- Reset --
   -----------

   --  procedure Reset (This : I2S_Port) is
   --  begin
   --     if This.Periph.all'Address = SPI1_Base then
   --        RCC_Periph.APB2RSTR.SPI1RST := True;
   --        RCC_Periph.APB2RSTR.SPI1RST := False;
   --     elsif This.Periph.all'Address = SPI2_Base then
   --        RCC_Periph.APB1LRSTR.SPI2RST := True;
   --        RCC_Periph.APB1LRSTR.SPI2RST := False;
   --     elsif This.Periph.all'Address = SPI3_Base then
   --        RCC_Periph.APB1LRSTR.SPI3RST := True;
   --        RCC_Periph.APB1LRSTR.SPI3RST := False;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Reset;

   ------------------------
   -- Write_Clock_Source --
   ------------------------

   --  procedure Write_Clock_Source (This   : I2S_Port'Class;
   --                                Source : I2S_Clock_Source)
   --  is
   --  begin
   --     if This.Periph.all'Address = SPI1_Base or
   --        This.Periph.all'Address = SPI2_Base or
   --        This.Periph.all'Address = SPI3_Base
   --     then
   --        RCC_Periph.D2CCIP1R.SPI123SEL := Source'Enum_Rep;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Write_Clock_Source;

   ------------------------
   -- Read_Clock_Source --
   ------------------------

   --  function Read_Clock_Source (This : I2S_Port'Class) return I2S_Clock_Source
   --  is
   --  begin
   --     if This.Periph.all'Address = SPI1_Base or
   --        This.Periph.all'Address = SPI2_Base or
   --        This.Periph.all'Address = SPI3_Base
   --     then
   --        return I2S_Clock_Source'Val (RCC_Periph.D2CCIP1R.SPI123SEL);
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Read_Clock_Source;

   -------------------------
   -- Get_Clock_Frequency --
   -------------------------

   --  function Get_Clock_Frequency (This : I2S_Port) return UInt32 is
   --     Source : constant I2S_Clock_Source :=
   --       I2S_Clock_Source'Val (RCC_Periph.D2CCIP1R.SPI123SEL);
   --  begin
   --     if This.Periph.all'Address = SPI1_Base or
   --        This.Periph.all'Address = SPI2_Base or
   --        This.Periph.all'Address = SPI3_Base
   --     then
   --        case Source is
   --           when PLL1Q =>
   --              return System_Clock_Frequencies.PCLK1;
   --           when PLL2P =>
   --              return System_Clock_Frequencies.PCLK1;
   --           when PLL3P =>
   --              return System_Clock_Frequencies.PCLK1;
   --           when I2S_CKIN =>
   --              return I2SCLK;
   --           when PER =>
   --              return System_Clock_Frequencies.PERCLK;
   --        end case;
   --
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Get_Clock_Frequency;

   ------------------------
   -- Write_Clock_Source --
   ------------------------

   --  procedure Write_Clock_Source
   --    (This    : RTC_Device;
   --     Source  : RTC_Clock_Source;
   --     HSE_Pre : RTC_HSE_Prescaler_Range := RTC_HSE_Prescaler_Range'First)
   --  is
   --     pragma Unreferenced (This);
   --  begin
   --     RCC_Periph.BDCR.RTCSEL := Source'Enum_Rep;
   --     if Source = HSE then
   --        RCC_Periph.CFGR.RTCPRE := UInt6 (HSE_Pre);
   --     end if;
   --  end Write_Clock_Source;

   ------------------------
   -- Read_Clock_Source --
   ------------------------

   --  function Read_Clock_Source (This : RTC_Device) return RTC_Clock_Source
   --  is
   --     pragma Unreferenced (This);
   --  begin
   --     return RTC_Clock_Source'Val (RCC_Periph.BDCR.RTCSEL);
   --  end Read_Clock_Source;

   ------------------
   -- Enable_Clock --
   ------------------

   procedure Enable_Clock (This : Timer) is
   begin
      if This'Address = TIM1_Base then
         RCC_Periph.APB2ENR.TIM1EN := True;
      elsif This'Address = TIM2_Base then
         RCC_Periph.APB1LENR.TIM2EN := True;
      elsif This'Address = TIM3_Base then
         RCC_Periph.APB1LENR.TIM3EN := True;
      elsif This'Address = TIM4_Base then
         RCC_Periph.APB1LENR.TIM4EN := True;
      elsif This'Address = TIM5_Base then
         RCC_Periph.APB1LENR.TIM5EN := True;
      elsif This'Address = TIM6_Base then
         RCC_Periph.APB1LENR.TIM6EN := True;
      elsif This'Address = TIM7_Base then
         RCC_Periph.APB1LENR.TIM7EN := True;
      elsif This'Address = TIM8_Base then
         RCC_Periph.APB2ENR.TIM8EN := True;
      elsif This'Address = TIM12_Base then
         RCC_Periph.APB1LENR.TIM12EN := True;
      elsif This'Address = TIM13_Base then
         RCC_Periph.APB1LENR.TIM13EN := True;
      elsif This'Address = TIM14_Base then
         RCC_Periph.APB1LENR.TIM14EN := True;
      elsif This'Address = TIM15_Base then
         RCC_Periph.APB2ENR.TIM15EN := True;
      elsif This'Address = TIM16_Base then
         RCC_Periph.APB2ENR.TIM16EN := True;
      elsif This'Address = TIM17_Base then
         RCC_Periph.APB2ENR.TIM17EN := True;
      else
         raise Unknown_Device;
      end if;
   end Enable_Clock;

   -----------
   -- Reset --
   -----------

   procedure Reset (This : Timer) is
   begin
      if This'Address = TIM1_Base then
         RCC_Periph.APB2RSTR.TIM1RST := True;
         RCC_Periph.APB2RSTR.TIM1RST := False;
      elsif This'Address = TIM2_Base then
         RCC_Periph.APB1LRSTR.TIM2RST := True;
         RCC_Periph.APB1LRSTR.TIM2RST := False;
      elsif This'Address = TIM3_Base then
         RCC_Periph.APB1LRSTR.TIM3RST := True;
         RCC_Periph.APB1LRSTR.TIM3RST := False;
      elsif This'Address = TIM4_Base then
         RCC_Periph.APB1LRSTR.TIM4RST := True;
         RCC_Periph.APB1LRSTR.TIM4RST := False;
      elsif This'Address = TIM5_Base then
         RCC_Periph.APB1LRSTR.TIM5RST := True;
         RCC_Periph.APB1LRSTR.TIM5RST := False;
      elsif This'Address = TIM6_Base then
         RCC_Periph.APB1LRSTR.TIM6RST := True;
         RCC_Periph.APB1LRSTR.TIM6RST := False;
      elsif This'Address = TIM7_Base then
         RCC_Periph.APB1LRSTR.TIM7RST := True;
         RCC_Periph.APB1LRSTR.TIM7RST := False;
      elsif This'Address = TIM8_Base then
         RCC_Periph.APB2RSTR.TIM8RST := True;
         RCC_Periph.APB2RSTR.TIM8RST := False;
      elsif This'Address = TIM12_Base then
         RCC_Periph.APB1LRSTR.TIM12RST := True;
         RCC_Periph.APB1LRSTR.TIM12RST := False;
      elsif This'Address = TIM13_Base then
         RCC_Periph.APB1LRSTR.TIM13RST := True;
         RCC_Periph.APB1LRSTR.TIM13RST := False;
      elsif This'Address = TIM14_Base then
         RCC_Periph.APB1LRSTR.TIM14RST := True;
         RCC_Periph.APB1LRSTR.TIM14RST := False;
      elsif This'Address = TIM15_Base then
         RCC_Periph.APB2RSTR.TIM15RST := True;
         RCC_Periph.APB2RSTR.TIM15RST := False;
      elsif This'Address = TIM16_Base then
         RCC_Periph.APB2RSTR.TIM16RST := True;
         RCC_Periph.APB2RSTR.TIM16RST := False;
      elsif This'Address = TIM17_Base then
         RCC_Periph.APB2RSTR.TIM17RST := True;
         RCC_Periph.APB2RSTR.TIM17RST := False;
      else
         raise Unknown_Device;
      end if;
   end Reset;

   -------------------------
   -- Get_Clock_Frequency --
   -------------------------

   function Get_Clock_Frequency (This : Timer) return UInt32 is
   begin
      --  TIMs 2 .. 7, 12 .. 14
      if This'Address = TIM2_Base or
        This'Address = TIM3_Base or
        This'Address = TIM4_Base or
        This'Address = TIM5_Base or
        This'Address = TIM6_Base or
        This'Address = TIM7_Base or
        This'Address = TIM12_Base or
        This'Address = TIM13_Base or
        This'Address = TIM14_Base
      then
         return System_Clock_Frequencies.TIMCLK1;

      --  TIMs 1, 8, 15 .. 17
      elsif This'Address = TIM1_Base or
        This'Address = TIM8_Base or
        This'Address = TIM15_Base or
        This'Address = TIM16_Base or
        This'Address = TIM17_Base
      then
         return System_Clock_Frequencies.TIMCLK2;
      else
         raise Unknown_Device;
      end if;
   end Get_Clock_Frequency;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock (This : LPTimer) is
   --  begin
   --     if This'Address = LPTIM1_Base then
   --        RCC_Periph.APB1LENR.LPTIM1EN := True;
   --     elsif This'Address = LPTIM2_Base then
   --        RCC_Periph.APB4ENR.LPTIM2EN := True;
   --     elsif This'Address = LPTIM3_Base then
   --        RCC_Periph.APB4ENR.LPTIM3EN := True;
   --     elsif This'Address = LPTIM4_Base then
   --        RCC_Periph.APB4ENR.LPTIM4EN := True;
   --     elsif This'Address = LPTIM5_Base then
   --        RCC_Periph.APB4ENR.LPTIM5EN := True;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Enable_Clock;

   -----------
   -- Reset --
   -----------

   --  procedure Reset (This : LPTimer) is
   --  begin
   --     if This'Address = LPTIM1_Base then
   --        RCC_Periph.APB1LRSTR.LPTIM1RST := True;
   --        RCC_Periph.APB1LRSTR.LPTIM1RST := False;
   --     elsif This'Address = LPTIM2_Base then
   --        RCC_Periph.APB4RSTR.LPTIM2RST := True;
   --        RCC_Periph.APB4RSTR.LPTIM2RST := False;
   --     elsif This'Address = LPTIM3_Base then
   --        RCC_Periph.APB4RSTR.LPTIM3RST := True;
   --        RCC_Periph.APB4RSTR.LPTIM3RST := False;
   --     elsif This'Address = LPTIM4_Base then
   --        RCC_Periph.APB4RSTR.LPTIM4RST := True;
   --        RCC_Periph.APB4RSTR.LPTIM4RST := False;
   --     elsif This'Address = LPTIM5_Base then
   --        RCC_Periph.APB4RSTR.LPTIM5RST := True;
   --        RCC_Periph.APB4RSTR.LPTIM5RST := False;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Reset;

   ------------------------
   -- Write_Clock_Source --
   ------------------------

   --  procedure Write_Clock_Source (This   : LPTimer;
   --                                Source : LPTimer_Clock_Source)
   --  is
   --  begin
   --     if This'Address = LPTIM1_Base then
   --        RCC_Periph.D2CCIP2R.LPTIM1SEL := Source'Enum_Rep;
   --     elsif This'Address = LPTIM2_Base then
   --        RCC_Periph.D3CCIPR.LPTIM2SEL := Source'Enum_Rep;
   --     elsif This'Address = LPTIM3_Base or
   --           This'Address = LPTIM4_Base or
   --           This'Address = LPTIM5_Base
   --     then
   --        RCC_Periph.D3CCIPR.LPTIM345SEL := Source'Enum_Rep;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Write_Clock_Source;

   -----------------------
   -- Read_Clock_Source --
   -----------------------

   --  function Read_Clock_Source (This : LPTimer) return LPTimer_Clock_Source is
   --  begin
   --     if This'Address = LPTIM1_Base then
   --        return LPTimer_Clock_Source'Val (RCC_Periph.D2CCIP2R.LPTIM1SEL);
   --     elsif This'Address = LPTIM2_Base then
   --        return LPTimer_Clock_Source'Val (RCC_Periph.D3CCIPR.LPTIM2SEL);
   --     elsif This'Address = LPTIM3_Base or
   --           This'Address = LPTIM4_Base or
   --           This'Address = LPTIM5_Base
   --     then
   --        return LPTimer_Clock_Source'Val (RCC_Periph.D3CCIPR.LPTIM345SEL);
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Read_Clock_Source;

   -------------------------
   -- Get_Clock_Frequency --
   -------------------------

   --  function Get_Clock_Frequency (This : LPTimer) return UInt32 is
   --  begin
   --     if This'Address = LPTIM1_Base then
   --        return System_Clock_Frequencies.PCLK1;
   --     elsif This'Address = LPTIM2_Base or
   --           This'Address = LPTIM3_Base or
   --           This'Address = LPTIM4_Base or
   --           This'Address = LPTIM5_Base
   --     then
   --        return System_Clock_Frequencies.PCLK4;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Get_Clock_Frequency;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock (This : HRTimer_Master) is
   --  begin
   --     if This'Address = HRTIM_Master_Base then
   --        RCC_Periph.APB2ENR.HRTIMEN := True;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Enable_Clock;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock (This : HRTimer_Channel) is
   --  begin
   --     if This'Address = HRTIM_TIMA_Base or
   --        This'Address = HRTIM_TIMB_Base or
   --        This'Address = HRTIM_TIMC_Base or
   --        This'Address = HRTIM_TIMD_Base or
   --        This'Address = HRTIM_TIME_Base
   --     then
   --        RCC_Periph.APB2ENR.HRTIMEN := True;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Enable_Clock;

   -----------
   -- Reset --
   -----------

   --  procedure Reset (This : HRTimer_Master) is
   --  begin
   --     if This'Address = HRTIM_Master_Base then
   --        RCC_Periph.APB2RSTR.HRTIMRST := True;
   --        RCC_Periph.APB2RSTR.HRTIMRST := False;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Reset;

   -----------
   -- Reset --
   -----------

   --  procedure Reset (This : HRTimer_Channel) is
   --  begin
   --     if This'Address = HRTIM_TIMA_Base or
   --        This'Address = HRTIM_TIMB_Base or
   --        This'Address = HRTIM_TIMC_Base or
   --        This'Address = HRTIM_TIMD_Base or
   --        This'Address = HRTIM_TIME_Base
   --     then
   --        RCC_Periph.APB2RSTR.HRTIMRST := True;
   --        RCC_Periph.APB2RSTR.HRTIMRST := False;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Reset;

   ---------------------------
   -- Write_Clock_Frequency --
   ---------------------------

   --  procedure Write_Clock_Source (This   : HRTimer_Master;
   --                                Source : HRTimer_Clock_Source)
   --  is
   --     pragma Unreferenced (This);
   --  begin
   --     RCC_Periph.CFGR.HRTIMSEL := Source = CPUCLK;
   --  end Write_Clock_Source;

   -------------------------
   -- Get_Clock_Frequency --
   -------------------------

   --  function Read_Clock_Source
   --    (This : HRTimer_Master) return HRTimer_Clock_Source
   --  is
   --     pragma Unreferenced (This);
   --  begin
   --     if RCC_Periph.CFGR.HRTIMSEL then
   --        return CPUCLK;
   --     else
   --        return TIMCLK;
   --     end if;
   --  end Read_Clock_Source;

   -------------------------
   -- Get_Clock_Frequency --
   -------------------------

   --  function Get_Clock_Frequency (This : HRTimer_Master) return UInt32 is
   --     pragma Unreferenced (This);
   --  begin
   --     return System_Clock_Frequencies.TIMCLK3;
   --  end Get_Clock_Frequency;

   -------------------------
   -- Get_Clock_Frequency --
   -------------------------

   --  function Get_Clock_Frequency (This : HRTimer_Channel) return UInt32 is
   --     pragma Unreferenced (This);
   --  begin
   --     return System_Clock_Frequencies.TIMCLK3;
   --  end Get_Clock_Frequency;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock
   --    (This : aliased Comparator)
   --  is
   --  begin
   --     if This'Address = Comp_1'Address or
   --        This'Address = Comp_2'Address
   --     then
   --        RCC_Periph.APB4ENR.COMP12EN := True;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Enable_Clock;

   -----------
   -- Reset --
   -----------

   --  procedure Reset (This : aliased Comparator)
   --  is
   --  begin
   --     if This'Address = Comp_1'Address or
   --        This'Address = Comp_2'Address
   --     then
   --        RCC_Periph.APB4RSTR.COMP12RST := True;
   --        RCC_Periph.APB4RSTR.COMP12RST := False;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Reset;

   ------------------
   -- Enable_Clock --
   ------------------

   --  procedure Enable_Clock
   --    (This : aliased Operational_Amplifier)
   --  is
   --  begin
   --     if This'Address = Opamp_1'Address or
   --        This'Address = Opamp_2'Address
   --     then
   --        RCC_Periph.APB1HENR.OPAMPEN := True;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Enable_Clock;

   -----------
   -- Reset --
   -----------

   --  procedure Reset (This : aliased Operational_Amplifier)
   --  is
   --  begin
   --     if This'Address = Opamp_1'Address or
   --        This'Address = Opamp_2'Address
   --     then
   --        RCC_Periph.APB1HRSTR.OPAMPRST := True;
   --        RCC_Periph.APB1HRSTR.OPAMPRST := False;
   --     else
   --        raise Unknown_Device;
   --     end if;
   --  end Reset;

   ------------------------------
   -- System_Clock_Frequencies --
   ------------------------------

   function System_Clock_Frequencies return RCC_System_Clocks
   is
      Source : constant SYSCLK_Source :=
        SYSCLK_Source'Val (RCC_Periph.CFGR.SWS);
      --  Get System_Clock_Mux selection

      Result : RCC_System_Clocks;

   begin
      --  System clock Mux
      case Source is
         --  HSE as source
         when SYSCLK_SRC_HSE =>
            Result.SYSCLK := HSE_VALUE;
         --  HSI as source
         when SYSCLK_SRC_HSI =>
            Result.SYSCLK := HSI_VALUE / (2 ** Natural (RCC_Periph.CR.HSIDIV));
         --  CSI as source
         when SYSCLK_SRC_CSI =>
            Result.SYSCLK := CSI_VALUE;

         --  PLL1 as source
         when SYSCLK_SRC_PLL =>
            declare
               Pllm : constant UInt32 := UInt32 (RCC_Periph.PLLCKSELR.DIVM1);
               --  Get the correct value of Pll M divisor
               Plln : constant UInt32 :=
                 UInt32 (RCC_Periph.PLL1DIVR.DIVN1 + 1);
               --  Get the correct value of Pll N multiplier
               Pllp : constant UInt32 :=
                 UInt32 (RCC_Periph.PLL1DIVR.DIVR1 + 1);
               --  Get the correct value of Pll R divisor
               PLLSRC : constant PLL_Source :=
                 PLL_Source'Val (RCC_Periph.PLLCKSELR.PLLSRC);
               --  Get PLL Source Mux
               PLLCLK : UInt32;
            begin
               case PLLSRC is
                  when PLL_SRC_HSE => --  HSE as source
                     PLLCLK := ((HSE_VALUE / Pllm) * Plln) / Pllp;
                  when PLL_SRC_HSI => --  HSI as source
                     PLLCLK := ((HSI_VALUE / Pllm) * Plln) / Pllp;
                  when PLL_SRC_CSI => --  CSI as source
                     PLLCLK := ((CSI_VALUE / Pllm) * Plln) / Pllp;
               end case;
               Result.SYSCLK := PLLCLK;
            end;
      end case;

      declare
         HPRE1 : constant UInt4 := RCC_Periph.D1CFGR.D1CPRE;
         HPRE2 : constant UInt4 := RCC_Periph.D1CFGR.HPRE;
         PPRE1 : constant UInt3 := RCC_Periph.D2CFGR.D2PPRE1;
         PPRE2 : constant UInt3 := RCC_Periph.D2CFGR.D2PPRE2;
         PPRE3 : constant UInt3 := RCC_Periph.D1CFGR.D1PPRE;
         PPRE4 : constant UInt3 := RCC_Periph.D3CFGR.D3PPRE;
      begin
         Result.HCLK1 := Result.SYSCLK / HPRE_Presc_Table (HPRE1);
         Result.HCLK2 := Result.HCLK1 / HPRE_Presc_Table (HPRE2);
         Result.PCLK1 := Result.HCLK2 / PPRE_Presc_Table (PPRE1);
         Result.PCLK2 := Result.HCLK2 / PPRE_Presc_Table (PPRE2);
         Result.PCLK3 := Result.HCLK2 / PPRE_Presc_Table (PPRE3);
         Result.PCLK4 := Result.HCLK2 / PPRE_Presc_Table (PPRE4);

         --  Timer clocks
         --  If APB1 (D2PPRE1) and APB2 (D2PPRE2) prescaler (D2PPRE1, D2PPRE2
         --  in the RCC_D2CFGR register) are configured to a division factor of
         --  1 or 2 with RCC_CFGR.TIMPRE = 0 (or also 4 with RCC_CFGR.TIMPRE
         --  = 1), then TIMxCLK = PCLKx.
         --  Otherwise, the timer clock frequencies are set to twice to the
         --  frequency of the APB domain to which the timers are connected with
         --  RCC_CFGR.TIMPRE = 0, so TIMxCLK = 2 x PCLKx (or TIMxCLK =
         --  4 x PCLKx with RCC_CFGR.TIMPRE = 1).

         if not RCC_Periph.CFGR.TIMPRE then
            --  TIMs 2 .. 7, 12 .. 14
            if PPRE1 <= 2 then
               Result.TIMCLK1 := Result.PCLK1;
            else
               Result.TIMCLK1 := Result.PCLK1 * 2;
            end if;
            --  TIMs TIMs 1, 8, 15 .. 17
            if PPRE2 <= 2 then
               Result.TIMCLK2 := Result.PCLK2;
            else
               Result.TIMCLK2 := Result.PCLK2 * 2;
            end if;
         else
            --  TIMs 2 .. 7, 12 .. 14
            if PPRE1 <= 4 then
               Result.TIMCLK1 := Result.PCLK1;
            else
               Result.TIMCLK1 := Result.PCLK1 * 4;
            end if;
            --  TIMs 1, 8, 15 .. 17
            if PPRE2 <= 4 then
               Result.TIMCLK2 := Result.PCLK2;
            else
               Result.TIMCLK2 := Result.PCLK2 * 4;
            end if;
         end if;

         --  HRTIM clock
         --  If RCC_CFGR.HRTIMSEL = 0, HRTIM prescaler clock cource is the same
         --  as timer 2 (TIMCLK1), otherwise it is the CPU clock (HCLK2).
         if not RCC_Periph.CFGR.HRTIMSEL then
            Result.TIMCLK3 := Result.TIMCLK1;
         else
            Result.TIMCLK3 := Result.HCLK1;
         end if;
      end;

      declare
         Source : constant PER_Source :=
           PER_Source'Val (RCC_Periph.D1CCIPR.CKPERSEL);
         --  Get PER_Clock_Mux selection
      begin
         case Source is
            --  HSE as source
            when PER_SRC_HSE =>
               Result.PERCLK := HSE_VALUE;
            --  HSI as source
            when PER_SRC_HSI =>
               Result.SYSCLK := HSI_VALUE / (2 ** Natural (RCC_Periph.CR.HSIDIV));
            --  CSI as source
            when PER_SRC_CSI =>
               Result.PERCLK := CSI_VALUE;
         end case;
      end;

      return Result;
   end System_Clock_Frequencies;

end STM32.Device;
