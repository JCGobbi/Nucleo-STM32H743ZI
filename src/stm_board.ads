with System;               use System;
with STM32.Device;         use STM32.Device;
with STM32.GPIO;           use STM32.GPIO;
with STM32.EXTI;           use STM32.EXTI;
with STM32.Timers;         use STM32.Timers;
with STM32.ADC;            use STM32.ADC;
with Ada.Interrupts.Names; use Ada.Interrupts.Names;
with Ada.Real_Time;        use Ada.Real_Time;

package STM_Board is

   ---------------
   -- Constants --
   ---------------

   subtype Frequency_Hz is Float;

   ---------------------
   -- PWM Full-bridge --
   ---------------------

   PWM_Timer        : Timer renames Timer_1;
   --  Timer for reading sine table values.
   PWM_Interrupt    : Ada.Interrupts.Interrupt_ID renames TIM1_UP_Interrupt;
   PWM_ISR_Priority : constant Interrupt_Priority := Interrupt_Priority'Last - 2;

   PWM_A_Channel : Timer_Channel renames Channel_1;
   PWM_A_H_Pin   : GPIO_Point renames PA8;
   PWM_A_L_Pin   : GPIO_Point renames PA7;
   PWM_A_GPIO_AF : STM32.GPIO_Alternate_Function renames GPIO_AF_TIM1_1;

   PWM_B_Channel : Timer_Channel renames Channel_3; --  because Channel 2 has two LEDs
   PWM_B_H_Pin   : GPIO_Point renames PA10;
   PWM_B_L_Pin   : GPIO_Point renames PB1;
   PWM_B_GPIO_AF : STM32.GPIO_Alternate_Function renames GPIO_AF_TIM1_1;

   PWM_Gate_Power : GPIO_Point renames PA11;
   --  Output for the FET/IGBT gate drivers.

   ------------------------------
   -- Voltage and Current ADCs --
   ------------------------------

   Sensor_ADC           : constant access Analog_To_Digital_Converter := ADC_1'Access;
   Sensor_Trigger_Event : External_Events_Regular_Group := Timer6_TRGO_Event;
   Sensor_Interrupt     : Ada.Interrupts.Interrupt_ID renames ADC1_2_Interrupt;
   Sensor_ISR_Priority  : constant Interrupt_Priority := Interrupt_Priority'Last - 3;

   ADC_Battery_V_Point : constant ADC_Point := (Sensor_ADC, Channel => 10);
   ADC_Battery_V_Pin   : GPIO_Point renames PC0;

   ADC_Battery_I_Point : constant ADC_Point := (Sensor_ADC, Channel => 11);
   ADC_Battery_I_Pin   : GPIO_Point renames PC1;

   ADC_Output_V_Point : constant ADC_Point := (Sensor_ADC, Channel => 12);
   ADC_Output_V_Pin   : GPIO_Point renames PC2;

   ---------------
   -- ADC Timer --
   ---------------

   --  To syncronize A/D conversion and timers, the ADCs could be triggered
   --  by any of TIM1, TIM2, TIM3, TIM6, TIM7, TIM15, TIM16 or TIM17 timer.
   Sensor_Timer : Timer renames Timer_6;

   -------------------
   -- General Timer --
   -------------------

   General_Timer              : Timer renames Timer_3;
   General_Timer_Interrupt    : Ada.Interrupts.Interrupt_ID renames TIM3_Interrupt;
   General_Timer_ISR_Priority : constant Interrupt_Priority := Interrupt_Priority'Last - 3;

   --  Channel for reading analog inputs (5 kHz, 200 us)
   Sensor_Timer_Channel : Timer_Channel renames Channel_4;
   Sensor_Timer_AF      : STM32.GPIO_Alternate_Function renames GPIO_AF_TIM3_2;
   Sensor_Timer_Point   : GPIO_Point renames PC9;
   --  Point not used because this timer only start an interrupt.

   -------------------------
   -- Other GPIO Channels --
   -------------------------

   AC_Frequency_Pin : GPIO_Point renames PA0;
   --  Input for AC frequency select jumper.

   Button : GPIO_Point renames PC13;
   --  B1 user button input
   Button_EXTI_Line    : External_Line_Number renames EXTI_Line_13;
   Button_Interrupt    : Ada.Interrupts.Interrupt_ID renames EXTI15_10_Interrupt;
   Button_ISR_Priority : constant Interrupt_Priority := Interrupt_Priority'Last;

   Green_LED : GPIO_Point renames PB0; -- LD1
   --  Output for OK indication in the nucleo board.

   Yellow_LED : GPIO_Point renames PE1; -- LD2
   --  Output for OK indication in the nucleo board.

   Red_LED : GPIO_Point renames PB14; -- LD3
   --  Output for problem indication in the nucleo board.
   LCH_LED : GPIO_Point renames Red_LED;
   --  Last chance handler led.

   All_LEDs : GPIO_Points := Green_LED & Yellow_LED & Red_LED;

   Buzzer : GPIO_Point renames PB2;
   --  Output for buzzer alarm.

   ------------------------------
   -- Procedures and functions --
   ------------------------------

   procedure Initialize_GPIO;
   --  Initialize GPIO inputs and outputs.

   function Read_Input (This : GPIO_Point) return Boolean
     with Pre => Is_Initialized;
   --  Read the specified input.

   procedure Turn_On (This : in out GPIO_Point)
     with Pre => Is_Initialized and (This /= PWM_Gate_Power);
   --  Turns ON the specified output.

   procedure Turn_Off (This : in out GPIO_Point)
     with Pre => Is_Initialized and (This /= PWM_Gate_Power);
   --  Turns OFF the specified output.

   procedure Set_Toggle (This : in out GPIO_Point)
     with Pre => Is_Initialized and (This /= PWM_Gate_Power);
   --  Toggle the specified output.

   procedure All_LEDs_Off
     with Pre => Is_Initialized;
   --  Turns OFF all LEDs.

   procedure All_LEDs_On
     with Pre => Is_Initialized;
   --  Turns ON all LEDs.

   procedure Toggle_LEDs (These : in out GPIO_Points)
     with Pre => Is_Initialized;
   --  Toggle the specified LEDs.

   function Is_Initialized return Boolean;
   --  Returns True if the board specifics are initialized.

private

   Initialized : Boolean := False;

   Debounce_Time : constant Time_Span := Milliseconds (300);

   protected Button_Handler is
      pragma Interrupt_Priority (Button_ISR_Priority);

   private
      Last_Time : Time := Clock;

      procedure Button_ISR_Handler with
        Attach_Handler => Button_Interrupt;

   end Button_Handler;

end STM_Board;
