------------------------------------------------------------------------------
--                                                                          --
--                  Copyright (C) 2015-2017, AdaCore                        --
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
--   @file    stm32f4xx_hal_adc.h                                           --
--   @author  MCD Application Team                                          --
--   @version V1.3.1                                                        --
--   @date    25-March-2015                                                 --
--   @brief   Header file of ADC HAL module.                                --
--                                                                          --
--   COPYRIGHT(c) 2014 STMicroelectronics                                   --
------------------------------------------------------------------------------

--  This file provides interfaces for the analog-to-digital converters on the
--  STM32H7 (ARM Cortex M7F) microcontrollers from ST Microelectronics.

--  Differential P channels are mapped to GPIO_Point values as follows. For N
--  differential channels see the STM32H743x datasheet DS12110 rev 8 Chapter 5
--  pg 64 Table 9 "Pin/ball definition" in the column "Aditional functions".
--
--  Channel    ADC    ADC    ADC
--    #         1      2      3
--
--    0
--    1
--    2        PF11   PF13   PF9
--    3        PA6    PA6    PF7
--    4        PC4    PC4    PF5
--    5        PB1    PB1    PF3
--    6        PF12   PF14   PF10
--    7        PA7    PA7    PF8
--    8        PC5    PC5    PF6
--    9        PB0    PB0    PF4
--   10        PC0    PC0    PC0
--   11        PC1    PC1    PC1
--   12        PC2    PC2    PC2
--   13        PC3    PC3    PH2
--   14        PA2    PA2    PH3
--   15        PA3    PA3    PH4
--   16        PA0           PH5
--   17        PA1
--   18        PA4    PA4
--   19        PA5    PA5

with System;        use System;
with Ada.Real_Time; use Ada.Real_Time;

private with STM32_SVD.ADC;

package STM32.ADC is
   pragma Elaborate_Body;

   type Analog_To_Digital_Converter is limited private;

   subtype Analog_Input_Channel is UInt5 range 0 .. 19;

   type ADC_Point is record
      ADC     : access Analog_To_Digital_Converter;
      Channel : Analog_Input_Channel;
   end record;

   Temperature_Channel : constant Analog_Input_Channel := 18;
   --  See RM0433 rev 7 pg 923 chapter 25.4.2 table 205.
   subtype TemperatureSensor_Channel is Analog_Input_Channel;

   VRef_Channel : constant Analog_Input_Channel := 19;
   --  See RM0433 rev 7 pg 923 chapter 25.4.2 table 205.

   VBat_Channel : constant Analog_Input_Channel := 17;
   --  See RM0433 rev 7 pg 923 chapter 25.4.2 table 205.

   ADC_Supply_Voltage : constant := 3000;  -- millivolts
   --  This is the ideal value, likely not the actual.

   procedure Enable (This : in out Analog_To_Digital_Converter) with
     Pre => not Conversion_Started (This) and
            not Injected_Conversion_Started (This),
     Post => Enabled (This);

   procedure Disable (This : in out Analog_To_Digital_Converter) with
     Pre => not Conversion_Started (This) and
            not Injected_Conversion_Started (This),
     Post => not Enabled (This);

   function Enabled (This : Analog_To_Digital_Converter) return Boolean;

   type ADC_Resolution is
     (ADC_Resolution_16_Bits,
      ADC_Resolution_14_Bits, --  Devices revision Y, legacy for revision V
      ADC_Resolution_12_Bits, --  Devices revision Y, legacy for revision V
      ADC_Resolution_10_Bits,
      ADC_Resolution_8_Bits, --  Devices revision Y
      ADC_Resolution_14_Bits_V, --  Devices revision V
      ADC_Resolution_12_Bits_V, --  Devices revision V
      ADC_Resolution_8_Bits_V); --  Devices revision V

   for ADC_Resolution use
     (ADC_Resolution_16_Bits   => 2#000#,
      ADC_Resolution_14_Bits   => 2#001#,
      ADC_Resolution_12_Bits   => 2#010#,
      ADC_Resolution_10_Bits   => 2#011#,
      ADC_Resolution_8_Bits    => 2#100#,
      ADC_Resolution_14_Bits_V => 2#101#,
      ADC_Resolution_12_Bits_V => 2#110#,
      ADC_Resolution_8_Bits_V  => 2#111#);

   type Data_Alignment is (Right_Aligned, Left_Aligned);

   type Left_Shift_Factor is
     (No_Left_Shift,
      Shift_Left_1_Bit,
      Shift_Left_2_Bits,
      Shift_Left_3_Bits,
      Shift_Left_4_Bits,
      Shift_Left_5_Bits,
      Shift_Left_6_Bits,
      Shift_Left_7_Bits,
      Shift_Left_8_Bits,
      Shift_Left_9_Bits,
      Shift_Left_10_Bits,
      Shift_Left_11_Bits,
      Shift_Left_12_Bits,
      Shift_Left_13_Bits,
      Shift_Left_14_Bits,
      Shift_Left_15_Bits);
   --  The OVSS[3:0] and LSHIFT[3:0] bitfields in the ADC_CFGR2 register selects
   --  the alignment of the data stored after conversion. Data can be right- or
   --  left-aligned as shown in figures 166, 167, 168 and 169 of RM0433 rev 7
   --  chapter 25.4.27 Data Management.

   procedure Configure_Unit
     (This       : in out Analog_To_Digital_Converter;
      Resolution : ADC_Resolution;
      Alignment  : Data_Alignment)
    with
      Post => Current_Resolution (This) = Resolution and
              Current_Alignment (This) = Alignment;

   function Current_Resolution (This : Analog_To_Digital_Converter)
      return ADC_Resolution;

   function Current_Alignment (This : Analog_To_Digital_Converter)
      return Data_Alignment;

   type Differential_Mode is (Single_Ended, Differential);

   procedure Set_Differential_Mode
     (This    : in out Analog_To_Digital_Converter;
      Channel : Analog_Input_Channel;
      Mode    : Differential_Mode);

   type Channel_Sampling_Times is
     (Sample_1P5_Cycles,
      Sample_2P5_Cycles,
      Sample_8P5_Cycles,
      Sample_16P5_Cycles,
      Sample_32P5_Cycles,
      Sample_64P5_Cycles,
      Sample_387P5_Cycles,
      Sample_810P5_Cycles)
     with Size => 3;
   --  The elapsed time between the start of a conversion and the end of
   --  conversion is the sum of the configured sampling time plus the
   --  successive approximation time (SAR = 7.5 for 14 bit) depending on data
   --  resolution. See RM0433 rev 7 chapter 25.4.17 Timing.

   type External_Trigger is
     (Trigger_Disabled,
      Trigger_Rising_Edge,
      Trigger_Falling_Edge,
      Trigger_Both_Edges);

   type Regular_Channel_Rank is new Natural range 1 .. 16;

   type Injected_Channel_Rank is new Natural range 1 .. 4;

   type External_Events_Regular_Group is
     (Timer1_CC1_Event,
      Timer1_CC2_Event,
      Timer1_CC3_Event,
      Timer2_CC2_Event,
      Timer3_TRGO_Event,
      Timer4_CC4_Event,
      EXTI_Line11,
      Timer8_TRGO_Event,
      Timer8_TRGO2_Event,
      Timer1_TRGO_Event,
      Timer1_TRGO2_Event,
      Timer2_TRGO_Event,
      Timer4_TRGO_Event,
      Timer6_TRGO_Event,
      Timer15_TRGO_Event,
      Timer3_CC4_Event,
      HRTimer_ADC_TRG1_Event,
      HRTimer_ADC_TRG3_Event,
      LPTimer1_OUT_Event,
      LPTimer2_OUT_Event,
      LPTimer3_OUT_Event)
     with Size => 5;
   --  External triggers for regular channels.
   --  RM0433 rev 7 Table 2083 pg. 946 for ADC123.

   type Regular_Channel_Conversion_Trigger (Enabler : External_Trigger) is
      record
         case Enabler is
            when Trigger_Disabled =>
               null;
            when others =>
               Event : External_Events_Regular_Group;
         end case;
      end record;

   Software_Triggered : constant Regular_Channel_Conversion_Trigger
     := (Enabler => Trigger_Disabled);

   procedure Configure_Regular_Trigger
     (This       : in out Analog_To_Digital_Converter;
      Continuous : Boolean;
      Trigger    : Regular_Channel_Conversion_Trigger);

   type Regular_Channel_Conversion is record
      Channel     : Analog_Input_Channel;
      Sample_Time : Channel_Sampling_Times;
   end record;

   procedure Configure_Regular_Channel
     (This        : in out Analog_To_Digital_Converter;
      Channel     : Analog_Input_Channel;
      Rank        : Regular_Channel_Rank;
      Sample_Time : Channel_Sampling_Times);

   procedure Configure_Regular_Channel_Nbr
     (This   : in out Analog_To_Digital_Converter;
      Number : UInt4);

   type Regular_Channel_Conversions is
     array (Regular_Channel_Rank range <>) of Regular_Channel_Conversion;

   procedure Configure_Regular_Conversions
     (This        : in out Analog_To_Digital_Converter;
      Continuous  : Boolean;
      Trigger     : Regular_Channel_Conversion_Trigger;
      Conversions : Regular_Channel_Conversions)
     with
       Pre => Conversions'Length > 0,
       Post =>
         Length_Matches_Expected (This, Conversions) and
         --  if there are multiple channels to be converted, we must want to
         --  scan them so we set Scan_Mode accordingly
         (if Conversions'Length > 1 then Scan_Mode_Enabled (This)) and
         --  The VBat and VRef internal connections are enabled if This is
         --  ADC_3 and the corresponding channels are included in the lists.
         (VBat_May_Be_Enabled (This, Conversions) or else
          VRef_TemperatureSensor_May_Be_Enabled (This, Conversions));
   --  Configures all the regular channel conversions described in the array
   --  Conversions. Note that the order of conversions in the array is the
   --  order in which they are scanned, ie, their index is their "rank" in
   --  the data structure. Note that if the VBat and Temperature channels are
   --  the same channel, then only the VBat conversion takes place and only
   --  that one will be enabled, so we must check the two in that order.

   function Regular_Conversions_Expected (This : Analog_To_Digital_Converter)
     return Natural;
   --  Returns the total number of regular channel conversions specified in the
   --  hardware.

   function Scan_Mode_Enabled (This : Analog_To_Digital_Converter)
     return Boolean;
   --  Returns whether only one channel is converted, or if multiple channels
   --  are converted (i.e., scanned). Note that this is independent of whether
   --  the conversions are continuous.

   type External_Events_Injected_Group is
     (Timer1_TRGO_Event,
      Timer1_CC4_Event,
      Timer2_TRGO_Event,
      Timer2_CC1_Event,
      Timer3_CC4_Event,
      Timer4_TRGO_Event,
      EXTI_Line15,
      Timer8_CC4_Event,
      Timer1_TRGO2_Event,
      Timer8_TRGO_Event,
      Timer8_TRGO2_Event,
      Timer3_CC3_Event,
      Timer3_TRGO_Event,
      Timer3_CC1_Event,
      Timer6_TRGO_Event,
      Timer15_TRGO_Event,
      HRTimer_ADC_TRG2_Event,
      HRTimer_ADC_TRG4_Event,
      LPTimer1_OUT_Event,
      LPTimer2_OUT_Event,
      LPTimer3_OUT_Event)
     with Size => 5;
   --  External triggers for injected channels.
   --  RM0433 rev 7 Table 209 pg. 947.

   type Injected_Channel_Conversion_Trigger (Enabler : External_Trigger) is
      record
         case Enabler is
            when Trigger_Disabled =>
               null;
            when others =>
               Event : External_Events_Injected_Group;
         end case;
      end record;

   Software_Triggered_Injected : constant Injected_Channel_Conversion_Trigger
     := (Enabler => Trigger_Disabled);

   procedure Configure_Injected_Trigger
     (This          : in out Analog_To_Digital_Converter;
      AutoInjection : Boolean;
      Trigger       : Injected_Channel_Conversion_Trigger)
     with Pre => (if AutoInjection then Trigger = Software_Triggered_Injected) and
                 (if AutoInjection then
                   not Discontinuous_Mode_Injected_Enabled (This));

   subtype Injected_Data_Offset is UInt26;

   type Injected_Channel_Conversion is record
      Channel     : Analog_Input_Channel;
      Sample_Time : Channel_Sampling_Times;
      Offset      : Injected_Data_Offset := 0;
   end record;

   procedure Configure_Injected_Channel
     (This        : in out Analog_To_Digital_Converter;
      Channel     : Analog_Input_Channel;
      Rank        : Injected_Channel_Rank;
      Sample_Time : Channel_Sampling_Times;
      Offset      : Injected_Data_Offset);

   procedure Configure_Injected_Channel_Nbr
     (This   : in out Analog_To_Digital_Converter;
      Number : UInt2);

   type Injected_Channel_Conversions is
     array (Injected_Channel_Rank range <>) of Injected_Channel_Conversion;

   procedure Configure_Injected_Conversions
     (This          : in out Analog_To_Digital_Converter;
      AutoInjection : Boolean;
      Trigger       : Injected_Channel_Conversion_Trigger;
      Conversions   : Injected_Channel_Conversions)
     with
       Pre =>
         Conversions'Length > 0 and
         (if AutoInjection then Trigger = Software_Triggered_Injected) and
         (if AutoInjection then
           not Discontinuous_Mode_Injected_Enabled (This)),
       Post =>
         Length_Is_Expected (This, Conversions) and
         --  The VBat and VRef internal connections are enabled if This is
         --  ADC_1 and the corresponding channels are included in the lists.
         (VBat_May_Be_Enabled (This, Conversions)  or else
          VRef_TemperatureSensor_May_Be_Enabled (This, Conversions));
   --  Configures all the injected channel conversions described in the array
   --  Conversions. Note that the order of conversions in the array is the
   --  order in which they are scanned, ie, their index is their "rank" in
   --  the data structure. Note that if the VBat and Temperature channels are
   --  the same channel, then only the VBat conversion takes place and only
   --  that one will be enabled, so we must check the two in that order.

   function Injected_Conversions_Expected (This : Analog_To_Digital_Converter)
     return Natural;
   --  Returns the total number of injected channel conversions to be done.

   function VBat_Enabled (This : Analog_To_Digital_Converter) return Boolean;
   --  Returns whether the hardware has the VBat internal connection enabled.

   function VRef_TemperatureSensor_Enabled
     (This : Analog_To_Digital_Converter) return Boolean;
   --  Returns whether the hardware has the VRef or temperature sensor internal
   --  connection enabled.

   procedure Start_Conversion (This : in out Analog_To_Digital_Converter) with
     Pre => Enabled (This) and Regular_Conversions_Expected (This) > 0;
   --  Starts the conversion(s) for the regular channels.

   procedure Stop_Conversion (This : in out Analog_To_Digital_Converter) with
     Pre => Conversion_Started (This) and Enabled (This);
   --  Stops the conversion(s) for the regular channels.

   function Conversion_Started (This : Analog_To_Digital_Converter)
     return Boolean;
   --  Returns whether the regular channels' conversions have started. Note
   --  that the ADC hardware clears the corresponding bit immediately, as
   --  part of starting.

   function Conversion_Value (This : Analog_To_Digital_Converter)
      return UInt32 with Inline;
   --  Returns the latest regular conversion result for the specified ADC unit.

   function Data_Register_Address (This : Analog_To_Digital_Converter)
     return System.Address
     with Inline;
   --  Returns the address of the ADC Data Register. This is exported
   --  STRICTLY for the sake of clients using DMA. All other
   --  clients of this package should use the Conversion_Value functions!
   --  Seriously, don't use this function otherwise.

   procedure Start_Injected_Conversion
     (This : in out Analog_To_Digital_Converter)
     with Pre => Enabled (This) and Injected_Conversions_Expected (This) > 0;
   --  Note that the ADC hardware clears the corresponding bit immediately, as
   --  part of starting.

   function Injected_Conversion_Started (This : Analog_To_Digital_Converter)
      return Boolean;
   --  Returns whether the injected channels' conversions have started.

   function Injected_Conversion_Value
     (This : Analog_To_Digital_Converter;
      Rank : Injected_Channel_Rank)
      return UInt32
     with Inline;
   --  Returns the latest conversion result for the analog input channel at
   --  the injected sequence position given by Rank on the specified ADC unit.
   --
   --  Note that the offset corresponding to the specified Rank is subtracted
   --  automatically, so check the sign bit for a negative result.

   type CDR_Data is (Master, Slave);

   function Multimode_Conversion_Value
     (This  : Analog_To_Digital_Converter;
      Value : CDR_Data) return UInt16;

   function Multimode_Conversion_Value
     (This : Analog_To_Digital_Converter) return UInt32
     with inline;
   --  Returns the latest ADC_1, ADC_2 or ADC_3, ADC_4, ADC_5 regular channel
   --  conversions' results based on the selected multi ADC mode.

   --  Discontinuous Management  --------------------------------------------------------

   type Discontinuous_Mode_Channel_Count is range 1 .. 8;
   --  Note this uses a biased representation implicitly because the underlying
   --  representational bit values are 0 ... 7.

   procedure Enable_Discontinuous_Mode
     (This    : in out Analog_To_Digital_Converter;
      Regular : Boolean;  -- if False, applies to Injected channels
      Count   : Discontinuous_Mode_Channel_Count)
     with
       Pre => not AutoInjection_Enabled (This),
       Post =>
         (if Regular then
            (Discontinuous_Mode_Regular_Enabled (This)) and
            (not Discontinuous_Mode_Injected_Enabled (This))
          else
            (not Discontinuous_Mode_Regular_Enabled (This)) and
            (Discontinuous_Mode_Injected_Enabled (This)));
   --  Enables discontinuous mode and sets the count. If Regular is True,
   --  enables the mode only for regular channels. If Regular is False, enables
   --  the mode only for Injected channels. The note in RM 13.3.10, pg 393,
   --  says we cannot enable the mode for both regular and injected channels
   --  at the same time, so this flag ensures we follow that rule.

   procedure Disable_Discontinuous_Mode_Regular
     (This : in out Analog_To_Digital_Converter)
      with Post => not Discontinuous_Mode_Regular_Enabled (This);

   procedure Disable_Discontinuous_Mode_Injected
     (This : in out Analog_To_Digital_Converter)
      with Post => not Discontinuous_Mode_Injected_Enabled (This);

   function Discontinuous_Mode_Regular_Enabled
     (This : Analog_To_Digital_Converter)
     return Boolean;

   function Discontinuous_Mode_Injected_Enabled
     (This : Analog_To_Digital_Converter)
      return Boolean;

   function AutoInjection_Enabled
     (This : Analog_To_Digital_Converter)
      return Boolean;

   --  DMA Management  --------------------------------------------------------

   type Data_Management is
     (Regular_Data_In_DR, --  No DMA
      DMA_One_Shot_Mode,
      DFSDM_Mode,
      DMA_Circular_Mode);
   --  In DFSDM mode, data is transferred to the Digital Filter for Sigma Delta
   --  Modulators. See RM0433 rev 7 Chapter 25.4.28.

   procedure Enable_DMA (This : in out Analog_To_Digital_Converter) with
     Pre => not Conversion_Started (This) and
            not Injected_Conversion_Started (This),
     Post => DMA_Enabled (This);

   procedure Disable_DMA (This : in out Analog_To_Digital_Converter) with
     Pre => not Conversion_Started (This) and
            not Injected_Conversion_Started (This),
     Post => not DMA_Enabled (This);

   function DMA_Enabled (This : Analog_To_Digital_Converter) return Boolean;

   procedure Enable_DMA_After_Last_Transfer
     (This : in out Analog_To_Digital_Converter) with
     Pre => not Conversion_Started (This) and
            not Injected_Conversion_Started (This),
     Post => DMA_Enabled_After_Last_Transfer (This);

   procedure Disable_DMA_After_Last_Transfer
     (This : in out Analog_To_Digital_Converter) with
     Pre => not Conversion_Started (This) and
            not Injected_Conversion_Started (This),
     Post => not DMA_Enabled_After_Last_Transfer (This);

   function DMA_Enabled_After_Last_Transfer
     (This : Analog_To_Digital_Converter)
      return Boolean;

   --  Analog Watchdog  -------------------------------------------------------

   subtype Watchdog_Threshold is UInt26;
   --  The threshold can be up to 26-bits (16-bit resolution with oversampling,
   --  OSVR[9:0]=1024). See RM0433 rev 7 Chapter 25.4.30.

   type Analog_Watchdog_Modes is
     (Watchdog_All_Regular_Channels,
      Watchdog_All_Injected_Channels,
      Watchdog_All_Both_Kinds,
      Watchdog_Single_Regular_Channel,
      Watchdog_Single_Injected_Channel,
      Watchdog_Single_Both_Kinds);

   subtype Multiple_Channels_Watchdog is Analog_Watchdog_Modes
     range Watchdog_All_Regular_Channels .. Watchdog_All_Both_Kinds;

   procedure Watchdog_Enable_Channels
     (This : in out Analog_To_Digital_Converter;
      Mode : Multiple_Channels_Watchdog;
      Low  : Watchdog_Threshold;
      High : Watchdog_Threshold)
     with
       Pre  => not Watchdog_Enabled (This),
       Post => Watchdog_Enabled (This);
   --  Enables the watchdog on all channels; channel kind depends on Mode.
   --  A call to this routine is considered a complete configuration of the
   --  watchdog so do not call the other enabler routine (for a single channel)
   --  while this configuration is active. You must first disable the watchdog
   --  if you want to enable the watchdog for a single channel.
   --  see RM0433 rev 7 Chapter 25.4.30, pg 974, Table 214.

   subtype Single_Channel_Watchdog is Analog_Watchdog_Modes
     range Watchdog_Single_Regular_Channel .. Watchdog_Single_Both_Kinds;

   procedure Watchdog_Enable_Channel
     (This    : in out Analog_To_Digital_Converter;
      Mode    : Single_Channel_Watchdog;
      Channel : Analog_Input_Channel;
      Low     : Watchdog_Threshold;
      High    : Watchdog_Threshold)
     with
       Pre  => not Watchdog_Enabled (This),
       Post => Watchdog_Enabled (This);
   --  Enables the watchdog on this single channel, and no others. The kind of
   --  channel depends on Mode. A call to this routine is considered a complete
   --  configuration of the watchdog so do not call the other enabler routine
   --  (for all channels) while this configuration is active. You must
   --  first disable the watchdog if you want to enable the watchdog for
   --  all channels.
   --  see RM0433 rev 7 Chapter 25.4.30, pg 974, Table 214

   procedure Watchdog_Disable (This : in out Analog_To_Digital_Converter)
     with Post => not Watchdog_Enabled (This);
   --  Whether watching a single channel or all of them, the watchdog is now
   --  disabled.

   function Watchdog_Enabled (This : Analog_To_Digital_Converter)
                              return Boolean;

   type Analog_Window_Watchdog is (Watchdog_2, Watchdog_3);

   type Analog_Input_Channels is
     array (Analog_Input_Channel range <>) of Analog_Input_Channel;

   procedure Watchdog_Enable_Channel
     (This     : in out Analog_To_Digital_Converter;
      Watchdog : Analog_Window_Watchdog;
      Channel  : Analog_Input_Channel;
      Low      : Watchdog_Threshold;
      High     : Watchdog_Threshold)
     with
       Pre  => not Conversion_Started (This),
       Post => Watchdog_Enabled (This, Watchdog);
   --  Enable the watchdog 2 or 3 for any selected channel. The channels
   --  selected by AWDxCH must be also selected into the ADC regular or injected
   --  sequence registers SQRi or JSQRi registers. The watchdog is disabled when
   --  none channel is selected.
   --  The watchdog threshold can be up to 26 bits (16-bit resolution with
   --  oversampling, OSVR[9:0]=1024). When converting data with a resolution of
   --  less than 16 bits (according to bits RES[2:0]), the LSBs of the programmed
   --  thresholds must be kept cleared, the internal comparison being performed
   --  on the full 16-bit converted data (left aligned to the half-word boundary).
   --  See RM0433 rev 7, chapter 25.4.30, table 215 for 16- to 8-bit resolutions.

   procedure Watchdog_Disable_Channel
     (This     : in out Analog_To_Digital_Converter;
      Watchdog : Analog_Window_Watchdog;
      Channel  : Analog_Input_Channel)
     with
       Pre  => not Conversion_Started (This);

   procedure Watchdog_Disable
     (This     : in out Analog_To_Digital_Converter;
      Watchdog : Analog_Window_Watchdog)
     with Post => not Watchdog_Enabled (This, Watchdog);
   --  The watchdog is disabled when none channel is selected.

   function Watchdog_Enabled
     (This     : Analog_To_Digital_Converter;
      Watchdog : Analog_Window_Watchdog) return Boolean;
   --  The watchdog is enabled when any channel is selected.

   --  Status Management  -----------------------------------------------------

   type ADC_Status_Flag is
     (ADC_Ready,
      Regular_Channel_Sampling_Completed,
      Regular_Channel_Conversion_Completed,
      Regular_Sequence_Conversion_Completed,
      Overrun,
      Injected_Channel_Conversion_Completed,
      Injected_Sequence_Conversion_Completed,
      Analog_Watchdog_1_Event_Occurred,
      Analog_Watchdog_2_Event_Occurred,
      Analog_Watchdog_3_Event_Occurred,
      Injected_Context_Queue_Overflow,
      LDO_Voltage_Regulator_Ready);

   function Status
     (This : Analog_To_Digital_Converter;
      Flag : ADC_Status_Flag)
      return Boolean
     with Inline;
   --  Returns whether Flag is indicated, ie set in the Status Register.

   procedure Clear_Status
     (This : in out Analog_To_Digital_Converter;
      Flag : ADC_Status_Flag)
     with
       Inline,
       Post => not Status (This, Flag);

   procedure Poll_For_Status
     (This    : in out Analog_To_Digital_Converter;
      Flag    : ADC_Status_Flag;
      Success : out Boolean;
      Timeout : Time_Span := Time_Span_Last);
   --  Continuously polls for the specified status flag to be set, up to the
   --  deadline computed by the value of Clock + Timeout. Sets the Success
   --  argument accordingly. The default Time_Span_Last value is the largest
   --  possible value, thereby setting a very long, but not infinite, timeout.

   --  Interrupt Management  --------------------------------------------------

   type ADC_Interrupts is
     (ADC_Ready,
      Regular_Channel_Sampling_Completed,
      Regular_Channel_Conversion_Complete,
      Regular_Sequence_Conversion_Complete,
      Overrun,
      Injected_Channel_Conversion_Complete,
      Injected_Sequence_Conversion_Complete,
      Analog_Watchdog_1_Event_Occurr,
      Analog_Watchdog_2_Event_Occurr,
      Analog_Watchdog_3_Event_Occurr,
      Injected_Context_Queue_Overflow);

   procedure Enable_Interrupts
     (This   : in out Analog_To_Digital_Converter;
      Source : ADC_Interrupts)
     with
       Inline,
       Post => Interrupt_Enabled (This, Source);

   procedure Disable_Interrupts
     (This   : in out Analog_To_Digital_Converter;
      Source : ADC_Interrupts)
     with
       Inline,
       Post => not Interrupt_Enabled (This, Source);

   function Interrupt_Enabled
     (This   : Analog_To_Digital_Converter;
      Source : ADC_Interrupts)
      return Boolean
     with Inline;

   procedure Clear_Interrupt_Pending
     (This   : in out Analog_To_Digital_Converter;
      Source : ADC_Interrupts)
     with Inline;

   --  Common Properties ------------------------------------------------------

   type ADC_Prescaler is
     (Div_1,
      Div_2,
      Div_4,
      Div_6,
      Div_8,
      Div_10,
      Div_12,
      Div_16,
      Div_32,
      Div_64,
      Div_128,
      Div_256)
   with Size => 4;

   type Dual_ADC_Data_Format is
     (Without_Data_Packing, --  ADCx_CDR and ADCx_CDR2 not used
      Data_Packing_Mode_1, --  Formatting mode for 32 down to 10-bit resolution
      Data_Packing_Mode_2); --  Formatting mode for 8-bit resolution

   for Dual_ADC_Data_Format use
     (Without_Data_Packing => 2#00#,
      Data_Packing_Mode_1  => 2#10#,
      Data_Packing_Mode_2  => 2#11#);

   type ADC_Clock_Mode is
     (Asynchronous,
      Synchronous_Div_1,
      Synchronous_Div_2,
      Synchronous_Div_4)
   with Size => 2;
   --  See RM0433 ver 7 pg 1043 about differences in clock mode between devices
   --  revision Y and V.

   type Sampling_Delay_Selections is
     (Sampling_Delay_5_Cycles,
      Sampling_Delay_6_Cycles,
      Sampling_Delay_7_Cycles,
      Sampling_Delay_8_Cycles,
      Sampling_Delay_9_Cycles,
      Sampling_Delay_10_Cycles,
      Sampling_Delay_11_Cycles,
      Sampling_Delay_12_Cycles,
      Sampling_Delay_13_Cycles)
   with Size => 5;
   --  These values of delay between sampling phases are arbitrary because they
   --  depend on the ADC kernel clock and resolution. See RM0433 rev 7 Table
   --  218 "DELAY bits versus resolution" at pg 1044.

   type Multi_ADC_Mode_Selections is
     (Independent,
      Dual_Combined_Regular_Injected_Simultaneous,
      Dual_Combined_Regular_Simultaneous_Alternate_Trigger,
      Dual_Combined_Interleaved_Injected_Simultaneous,
      Dual_Injected_Simultaneous,
      Dual_Regular_Simultaneous,
      Dual_Interleaved,
      Dual_Alternate_Trigger)
   with Size => 5;
   --  In dual mode, master (ADC1) and slave (ADC2) ADCs work together and need
   --  only a start conversion on the master channel. ADC3 is single converter.

   for Multi_ADC_Mode_Selections use
     (Independent                                            => 2#00000#,
      Dual_Combined_Regular_Injected_Simultaneous            => 2#00001#,
      Dual_Combined_Regular_Simultaneous_Alternate_Trigger   => 2#00010#,
      Dual_Combined_Interleaved_Injected_Simultaneous        => 2#00011#,
      Dual_Injected_Simultaneous                             => 2#00101#,
      Dual_Regular_Simultaneous                              => 2#00110#,
      Dual_Interleaved                                       => 2#00111#,
      Dual_Alternate_Trigger                                 => 2#01001#);

   procedure Configure_Common_Properties
     (This           : in out Analog_To_Digital_Converter;
      Mode           : Multi_ADC_Mode_Selections;
      Prescaler      : ADC_Prescaler;
      Clock_Mode     : ADC_Clock_Mode;
      DMA_Mode       : Data_Management;
      Sampling_Delay : Sampling_Delay_Selections);
   --  These properties are common to all the ADC units on the board.

   --  These Multi_DMA_Mode commands needs to be separate from the
   --  Configure_Common_Properties procedure for the sake of dealing
   --  with overruns etc.

   --  Queries ----------------------------------------------------------------

   function VBat_Conversion
     (This    : Analog_To_Digital_Converter;
      Channel : Analog_Input_Channel)
      return Boolean with Inline;

   function VRef_TemperatureSensor_Conversion
     (This    : Analog_To_Digital_Converter;
      Channel : Analog_Input_Channel)
      return Boolean with Inline;
   --  Returns whether the ADC unit and channel specified are that of a VRef
   --  OR a temperature sensor conversion. Note that one control bit is used
   --  to enable either one, ie it is shared.

   function VBat_May_Be_Enabled
     (This  : Analog_To_Digital_Converter;
      These : Regular_Channel_Conversions)
      return Boolean
   is
     ((for all Conversion of These =>
           (if VBat_Conversion (This, Conversion.Channel)
            then VBat_Enabled (This))));

   function VBat_May_Be_Enabled
     (This  : Analog_To_Digital_Converter;
      These : Injected_Channel_Conversions)
      return Boolean
   is
     ((for all Conversion of These =>
        (if VBat_Conversion (This, Conversion.Channel)
         then VBat_Enabled (This))));

   function VRef_TemperatureSensor_May_Be_Enabled
     (This  : Analog_To_Digital_Converter;
      These : Regular_Channel_Conversions)
      return Boolean
   is
     (for all Conversion of These =>
        (if VRef_TemperatureSensor_Conversion (This, Conversion.Channel)
         then VRef_TemperatureSensor_Enabled (This)));

   function VRef_TemperatureSensor_May_Be_Enabled
     (This  : Analog_To_Digital_Converter;
      These : Injected_Channel_Conversions)
      return Boolean
   is
     (for all Conversion of These =>
        (if VRef_TemperatureSensor_Conversion (This, Conversion.Channel)
         then VRef_TemperatureSensor_Enabled (This)));

   --  The *_Conversions_Expected functions will always return at least the
   --  value 1 because the hardware uses a biased representation (in which
   --  zero indicates the value one, one indicates the value two, and so on).
   --  Therefore, we don't invoke the functions unless we know they will be
   --  greater than zero.

   function Length_Matches_Expected
     (This  : Analog_To_Digital_Converter;
      These : Regular_Channel_Conversions)
      return Boolean
   is
     (if These'Length > 0 then
         Regular_Conversions_Expected (This) = These'Length);

   function Length_Is_Expected
     (This  : Analog_To_Digital_Converter;
      These : Injected_Channel_Conversions)
      return Boolean
   is
     (if These'Length > 0 then
         Injected_Conversions_Expected (This) = These'Length);

private

   ADC_Stabilization                : constant Time_Span := Microseconds (3);
   Temperature_Sensor_Stabilization : constant Time_Span := Microseconds (10);
   --  The RM, section 13.3.6, says stabilization times are required. These
   --  values are specified in the datasheets, eg section 5.3.20, pg 129,
   --  and section 5.3.21, pg 134, of the STM32F405/7xx, DocID022152 Rev 4.

   procedure Enable_VBat_Connection (This : Analog_To_Digital_Converter)
     with Post => VBat_Enabled (This);

   procedure Enable_VRef_TemperatureSensor_Connection
     (This : Analog_To_Digital_Converter)
     with Post => VRef_TemperatureSensor_Enabled (This);
   --  One bit controls both the VRef and the temperature internal connections.

   type Analog_To_Digital_Converter is new STM32_SVD.ADC.ADC1_Peripheral;

   function VBat_Conversion
     (This    : Analog_To_Digital_Converter;
      Channel : Analog_Input_Channel)
      return Boolean
   is (This'Address = STM32_SVD.ADC.ADC1_Periph'Address and
         Channel = VBat_Channel);

   function VRef_TemperatureSensor_Conversion
     (This    : Analog_To_Digital_Converter;
      Channel : Analog_Input_Channel)
      return Boolean
   is (This'Address = STM32_SVD.ADC.ADC1_Periph'Address and
         (Channel in VRef_Channel | TemperatureSensor_Channel));

end STM32.ADC;
