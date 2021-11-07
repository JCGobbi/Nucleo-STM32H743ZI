
--  This file provides interfaces for the comparators on the
--  STM32F3 (ARM Cortex M4F) microcontrollers from ST Microelectronics.

private with STM32_SVD.COMP;

package STM32.COMP is

   type Comparator is limited private;

-------------------------------------------------------------------------------
--  STM32.Devices Start
-------------------------------------------------------------------------------
--  The original Ada Drivers Library does not specify the hardaware devices on
--  the drivers files, but on the STM32.Device files (stm32-device.ads and
--  stm32-device.adb) because the driver files are used for more then one
--  microprocessor. So, isolating the devices listing in two files is easier to
--  adapt to each new processor: we need only change that two devices files.
--
--  The current driver files are designed for only one processor so, it is not
--  necessary to separate the devices definitions from the driver files. This
--  way, it is easier to add or subtract peripheral driver files to our project:
--  it is not necessary to comment or uncomment the unused routines from the
--  STM32.Device files and the references to the unused driver files.
-------------------------------------------------------------------------------







-------------------------------------------------------------------------------
--  STM32.Devices End
-------------------------------------------------------------------------------

   procedure Enable (This : in out Comparator)
     with Post => Enabled (This);

   procedure Disable (This : in out Comparator)
     with Post => not Enabled (This);

   function Enabled (This : Comparator) return Boolean;

   type Inverting_Input_Port is
     (One_Quarter_Vrefint,
      One_Half_Vrefint,
      Three_Quarter_Vrefint,
      Vrefint,
      DAC_CH1,
      DAC_CH2,
      Option_7,
      Option_8);
   --  These bits allows to select the source connected to the inverting input
   --  of the comparator. The first 6 options are common, the last 2 options
   --  change for each comparator:
   --  Option  COMP1     COMP2
   --  7         PB1       PE10
   --  8         PC4       PE7
   --  See RM0433 rev 7 chapter 24.3.2 pg 1094 Table 233: COMP input/output
   --  internal signals and Table 234: COMP input/output pins.

   procedure Set_Inverting_Input_Port
     (This  : in out Comparator;
      Input : Inverting_Input_Port)
     with Post => Read_Inverting_Input_Port (This) = Input;
   --  Select the source connected to the inverting input of the comparator.
   --  See RM0433 rev 7 chapter 24.3.2 pg 1094 Table 233: COMP input/output
   --  internal signals and Table 234: COMP input/output pins.

   function Read_Inverting_Input_Port
     (This : Comparator) return Inverting_Input_Port;
   --  Return the source connected to the inverting input of the comparator.

   type NonInverting_Input_Port is
     (Option_1,
      Option_2);
   --  These bits allows to select the source connected to the non-inverting
   --  input of the comparator:
   --  Option  COMP1     COMP2
   --  1         PB0       PE9
   --  2         PB2       PE11
   --  See RM0433 rev 7 chapter 24.3.2 pg 1094 Table 233: COMP input/output
   --  internal signals and Table 234: COMP input/output pins.

   procedure Set_NonInverting_Input_Port
     (This  : in out Comparator;
      Input : NonInverting_Input_Port)
     with Post => Read_NonInverting_Input_Port (This) = Input;
   --  Select the source connected to the non-inverting input of the comparator.
   --  See RM0433 rev 7 chapter 24.3.2 pg 1094 Table 233: COMP input/output
   --  internal signals and Table 234: COMP input/output pins.

   function Read_NonInverting_Input_Port
     (This : Comparator) return NonInverting_Input_Port;
   --  Return the source connected to the non-inverting input of the comparator.

   type Output_Polarity is
     (Not_Inverted,
      Inverted);
   --  This bit is used to invert the comparator output.

   procedure Set_Output_Polarity
     (This  : in out Comparator;
      Output : Output_Polarity)
     with Post => Read_Output_Polarity (This) = Output;
   --  Used to invert the comparator output.

   function Read_Output_Polarity (This : Comparator) return Output_Polarity;
   --  Return the comparator output polarity.

   type Comparator_Hysteresis is
     (No_Hysteresis,
      Low_Hysteresis,
      Medium_Hysteresis,
      High_Hysteresis);
   --  These bits select the hysteresis of the comparator.

   procedure Set_Comparator_Hysteresis
     (This  : in out Comparator;
      Value : Comparator_Hysteresis)
     with Post => Read_Comparator_Hysteresis (This) = Value;
   --  Select the comparator hysteresis value.

   function Read_Comparator_Hysteresis (This : Comparator)
     return Comparator_Hysteresis;
   --  Return the comparator hysteresis value.

   type Output_Blanking is
     (No_Blanking,
      TIM1_OC5,
      TIM2_OC3,
      TIM3_OC3,
      TIM3_OC4,
      TIM8_OC5,
      TIM15_OC1)
     with Size => 4;
   --  These bits select which Timer output controls the comparator output
   --  blanking.
   --  See RM0433 rev 7 chapter 24.3.2 pg 1094 Table 233: COMP input/output
   --  internal signals

   procedure Set_Output_Blanking
     (This  : in out Comparator;
      Output : Output_Blanking)
     with Post => Read_Output_Blanking (This) = Output;
   --  Select which Timer output controls the comparator output blanking.

   function Read_Output_Blanking (This : Comparator) return Output_Blanking;
   --  Return which Timer output controls the comparator output blanking.

   procedure Set_Vrefint_Scaler_Resistor
     (This   : in out Comparator;
      Output : Boolean)
     with Post => Read_Vrefint_Scaler_Resistor (This) = Output;
   --  Enables the operation of resistor bridge in the VREFINT scaler. To
   --  disable the resistor bridge, BRGEN bits of all COMP_CxCSR registers must
   --  be set to Disable state. When the resistor bridge is disabled, the 1/4
   --  VREFINT, 1/2 VREFINT, and 3/4 VREFINT inputs of the input selector
   --  receive VREFINT voltage.

   function Read_Vrefint_Scaler_Resistor (This : Comparator) return Boolean;
   --  Return True if VREFINT resistor bridge is enabled.

   procedure Set_Vrefint_Scaler
     (This  : in out Comparator;
      Output : Boolean)
     with Post => Read_Vrefint_Scaler (This) = Output;
   --  Enables the operation of VREFINT scaler at the inverting input of all
   --  comparator. To disable the VREFINT scaler, SCALEN bits of all COMP_CxCSR
   --  registers must be set to Disable state. When the VREFINT scaler is
   --  disabled, the 1/4 VREFINT, 1/2 VREFINT, 3/4 VREFINT and VREFINT inputs
   --  of the multiplexer should not be selected.

   function Read_Vrefint_Scaler (This : Comparator) return Boolean;
   --  Return True if VREFINT scaler is enabled.

   type Comparator_Output is (Low, High);

   function Read_Comparator_Output (This : Comparator) return Comparator_Output;
   --  Read the comparator output before the polarity selector and blanking:
   --  Low = non-inverting input is below inverting input,
   --  High = (non-inverting input is above inverting input

   type AF_Port_Source is
     (PA6, PA8, PB12, PE6, PE15, PG2, PG3, PG4, PI1, PI4, PK2)
     with Size => 4;

   procedure Set_AF_Port_Source
     (This : Comparator;
      Port : AF_Port_Source);

   type COMP_Power_Mode is
     (High_Speed,
      Medium_Speed_1,
      Medium_Speed_2,
      Very_Low_Speed);

   procedure Set_Power_Mode
     (This : in out Comparator;
      Mode : COMP_Power_Mode);

   type COMP_Status_Flag is
     (Comparator_Output_Value,
      Interrupt_Indicated);

   function Status
     (This : Comparator;
      Flag : COMP_Status_Flag)
      return Boolean;

   procedure Enable_Interrupt (This : in out Comparator)
     with Inline, Post => Interrupt_Enabled (This);

   procedure Disable_Interrupt (This : in out Comparator)
     with Inline, Post => not Interrupt_Enabled (This);

   function Interrupt_Enabled (This : Comparator) return Boolean
     with Inline;

   procedure Clear_Interrupt_Pending (This : in out Comparator)
     with Inline;

   procedure Set_Lock_Comparator (This : in out Comparator)
     with Post => Read_Lock_Comparator (This) = True;
   --  Allows to have COMPx_CFGR and COMP_OR registers as read-only. It can
   --  only be cleared by a system reset.

   function Read_Lock_Comparator (This : Comparator) return Boolean;
   --  Return the comparator lock bit state.

private

   -----------------
   -- Peripherals --
   -----------------

   --  representation for the whole Comparator type  -----------------

   type Comparator is record
      CFGR : STM32_SVD.COMP.CFGR1_Register;
   end record with Volatile, Size => 1 * 32;

   for Comparator use record
      CFGR at 16#00# range  0 .. 31;
   end record;

end STM32.COMP;
