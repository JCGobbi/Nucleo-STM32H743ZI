
--  This file provides interfaces for the operational amplifiers on the
--  STM32G4 (ARM Cortex M4F) microcontrollers from ST Microelectronics.

private with STM32_SVD.OPAMP;

package STM32.OPAMP is

   type Operational_Amplifier is limited private;

   procedure Enable (This : in out Operational_Amplifier)
     with Post => Enabled (This);

   procedure Disable (This : in out Operational_Amplifier)
     with Post => not Enabled (This);

   function Enabled (This : Operational_Amplifier) return Boolean;

   type NI_Input_Mode is (Normal_Mode, Calibration_Mode);

   procedure Set_NI_Input_Mode
     (This  : in out Operational_Amplifier;
      Input : NI_Input_Mode)
     with Post => Get_NI_Input_Mode (This) = Input;
   --  Select a calibration reference voltage on non-inverting input and
   --  disables external connections.

   function Get_NI_Input_Mode
     (This : Operational_Amplifier) return NI_Input_Mode;
   --  Return the source connected to the non-inverting input of the
   --  operational amplifier.

   type NI_Input_Port is (GPIO, Option_2)
     with Size => 2;
   --  These bits allows to select the source connected to the non-inverting
   --  input of the operational amplifier. The first 3 options are common, the
   --  last option change for each OPAMP:
   --  Option  OPAMP1    OPAMP2
   --  2       DAC1_OUT  DAC2_OUT

   procedure Set_NI_Input_Port
     (This  : in out Operational_Amplifier;
      Input : NI_Input_Port)
     with Post => Get_NI_Input_Port (This) = Input;
   --  Select the source connected to the non-inverting input of the
   --  operational amplifier.

   function Get_NI_Input_Port
     (This : Operational_Amplifier) return NI_Input_Port;
   --  Return the source connected to the non-inverting input of the
   --  operational amplifier.

   type I_Input_Port is
     (INM0,
      INM1,
      Feedback_Resistor_PGA_Mode,
      Follower_Mode);

   procedure Set_I_Input_Port
     (This  : in out Operational_Amplifier;
      Input : I_Input_Port)
     with Post => Get_I_Input_Port (This) = Input;
   --  Select the source connected to the inverting input of the
   --  operational amplifier.

   function Get_I_Input_Port
     (This : Operational_Amplifier) return I_Input_Port;
   --  Return the source connected to the inverting input of the
   --  operational amplifier.

   type PGA_Mode_Gain is
     (NI_Gain_2,
      NI_Gain_4,
      NI_Gain_8,
      NI_Gain_16,
      NI_Gain_2_Filtering_INM0,
      NI_Gain_4_Filtering_INM0,
      NI_Gain_8_Filtering_INM0,
      NI_Gain_16_Filtering_INM0,
      I_Gain_1_NI_Gain_2_INM0,
      I_Gain_3_NI_Gain_4_INM0,
      I_Gain_7_NI_Gain_8_INM0,
      I_Gain_15_NI_Gain_16_INM0,
      I_Gain_1_NI_Gain_2_INM0_INM1,
      I_Gain_3_NI_Gain_4_INM0_INM1,
      I_Gain_7_NI_Gain_8_INM0_INM1,
      I_Gain_15_NI_Gain_16_INM0_INM1)
     with Size => 4;
   --  Gain in PGA mode.

   procedure Set_PGA_Mode_Gain
     (This  : in out Operational_Amplifier;
      Input : PGA_Mode_Gain)
     with Post => Get_PGA_Mode_Gain (This) = Input;
   --  Select the gain in PGA mode.

   function Get_PGA_Mode_Gain
     (This : Operational_Amplifier) return PGA_Mode_Gain;
   --  Return the gain in PGA mode.

   type Speed_Mode is (Normal_Mode, HighSpeed_Mode);

   procedure Set_Speed_Mode
     (This  : in out Operational_Amplifier;
      Input : Speed_Mode)
     with Pre => not Enabled (This),
       Post => Get_Speed_Mode (This) = Input;
   --  OPAMP in normal or high-speed mode.

   function Get_Speed_Mode
     (This : Operational_Amplifier) return Speed_Mode;
   --  Return the OPAMP speed mode.

   type Init_Parameters is record
      Input_Minus     : I_Input_Port;
      Input_Plus      : NI_Input_Port;
      PGA_Mode        : PGA_Mode_Gain;
      Power_Mode      : Speed_Mode;
   end record;

   procedure Configure_Opamp
     (This  : in out Operational_Amplifier;
      Param : Init_Parameters);

   procedure Set_User_Trimming
     (This    : in out Operational_Amplifier;
      Enabled : Boolean)
     with Post => Get_User_Trimming (This) = Enabled;
   --  Allows to switch from ‘factory’ AOP offset trimmed values to ‘user’ AOP
   --  offset trimmed values.

   function Get_User_Trimming
     (This : Operational_Amplifier) return Boolean;
   --  Return the state of user trimming.

   type Differential_Pair is (NMOS, PMOS);

   procedure Set_Offset_Trimming
     (This  : in out Operational_Amplifier;
      Pair  : Differential_Pair;
      Input : UInt5)
     with Post => Get_Offset_Trimming (This, Pair) = Input;
   --  Select the offset trimming value for NMOS or PMOS.

   function Get_Offset_Trimming
     (This : Operational_Amplifier;
      Pair : Differential_Pair) return UInt5;
   --  Return the offset trimming value for NMOS or PMOS.

   procedure Set_Calibration_Mode
     (This    : in out Operational_Amplifier;
      Enabled : Boolean)
     with Post => Get_Calibration_Mode (This) = Enabled;
   --  Select the calibration mode connecting VM and VP to the OPAMP
   --  internal reference voltage.

   function Get_Calibration_Mode
     (This : Operational_Amplifier) return Boolean;
   --  Return the calibration mode.

   type Calibration_Value is
     (VREFOPAMP_Is_3_3_VDDA, --  3.3%
      VREFOPAMP_Is_10_VDDA, --  10%
      VREFOPAMP_Is_50_VDDA, --  50%
      VREFOPAMP_Is_90_VDDA --  90%
      );
   --  Offset calibration bus to generate the internal reference voltage.

   procedure Set_Calibration_Value
     (This  : in out Operational_Amplifier;
      Input : Calibration_Value)
     with Post => Get_Calibration_Value (This) = Input;
   --  Select the offset calibration bus used to generate the internal
   --  reference voltage when CALON = 1 or FORCE_VP = 1.

   function Get_Calibration_Value
     (This : Operational_Amplifier) return Calibration_Value;
   --  Return the offset calibration bus voltage.

   procedure Calibrate (This : in out Operational_Amplifier);
   --  Calibrate the NMOS and PMOS differential pair. This routine
   --  is described in the RM0440 rev 6 pg. 797. The offset trim time,
   --  during calibration, must respect the minimum time needed
   --  between two steps to have 1 mV accuracy.
   --  This routine must be executed first with normal speed mode, then with
   --  high-speed mode, if used.

   type Internal_Output is
     (Is_Output,
      Is_Not_Output);

   type Output_Status_Flag is
     (NI_Lesser_Then_I,
      NI_Greater_Then_I);

   function Get_Output_Status_Flag
     (This : Operational_Amplifier) return Output_Status_Flag;
   --  Return the output status flag when the OPAMP is used as comparator
   --  during calibration.

private

   --  representation for the whole Operationa Amplifier type  -----------------

   type Operational_Amplifier is limited record
      CSR   : STM32_SVD.OPAMP.OPAMP1_CSR_Register;
      OTR   : STM32_SVD.OPAMP.OPAMP1_OTR_Register;
      HSOTR : STM32_SVD.OPAMP.OPAMP1_HSOTR_Register;
   end record with Volatile, Size => 3 * 32;

   for Operational_Amplifier use record
      CSR   at 16#00# range  0 .. 31;
      OTR   at 16#04# range  0 .. 31;
      HSOTR at 16#08# range  0 .. 31;
   end record;

end STM32.OPAMP;
