
--  This demonstration illustrates the use of PWM to control the brightness of
--  an LED. The effect is to make the LED increase and decrease in brightness,
--  iteratively, for as long as the application runs. In effect the LED light
--  waxes and wanes as function of a PWM sine wave generated with the CORDIC
--  coprocessor.
--
--  The demo uses an abstract data type PWM_Modulator to control the power to
--  the LED via pulse-width-modulation. A timer is still used underneath, but
--  the details are hidden.  For direct use of the timer see the other demo.

with STM32.Device;     use STM32.Device;
with STM32.Timers.PWM; use STM32.Timers, STM32.Timers.PWM;

with STM_Board;        use STM_Board;

with Last_Chance_Handler; pragma Unreferenced (Last_Chance_Handler);
--  The "last chance handler" is the user-defined routine that is called when
--  an exception is propagated. We need it in the executable, therefore it
--  must be somewhere in the closure of the context clauses.

procedure Test_LED_PWM is

   --  The LD2 green led at GPIO PA5 is the TIM2_CH1 timer output when
   --  programmed as AF1 alternate function.
   Selected_Timer : Timer renames Timer_3;
   Timer_AF : constant STM32.GPIO_Alternate_Function := GPIO_AF_TIM3_2;
   Output_Channel : constant Timer_Channel := Channel_3;
   Requested_Frequency : constant Hertz := 25_000;
   Power_Control : PWM_Modulator;

   function Sine (Input : Long_Float) return Long_Float;

   --  We use the sine function to drive the power applied to the LED, thereby
   --  making the LED increase and decrease in brightness. We attach the timer
   --  to the LED and then control how much power is supplied by changing the
   --  value of the timer's output compare register. The sine function drives
   --  that value, thus the waxing/waning effect.
   function Sine (Input : Long_Float) return Long_Float is
      Pi : constant Long_Float := 3.14159_26535_89793_23846;
      X  : constant Long_Float := Long_Float'Remainder (Input, Pi * 2.0);
      B  : constant Long_Float := 4.0 / Pi;
      C  : constant Long_Float := (-4.0) / (Pi * Pi);
      Y  : constant Long_Float := B * X + C * X * abs (X);
      P  : constant Long_Float := 0.225;
   begin
      return P * (Y * abs (Y) - Y) + Y;
   end Sine;

begin

   Configure_PWM_Timer (Selected_Timer'Access, Requested_Frequency);

   Power_Control.Attach_PWM_Channel
     (Selected_Timer'Access,
      Channel => Output_Channel,
      Point   => Green_LED,
      PWM_AF  => Timer_AF);

   Power_Control.Enable_Output;

   declare
      Arg       : Long_Float := 0.0;
      Value     : Percentage;
      Increment : constant Long_Float := 0.000003;
      --  The Increment value controls the rate at which the brightness
      --  increases and decreases. The value is more or less arbitrary, but
      --  note that the effect of compiler optimization is observable.
   begin
      loop
         Value := Percentage (50.0 * (1.0 + Sine (Arg)));
         Power_Control.Set_Duty_Cycle (Value);
         Arg := Arg + Increment;
      end loop;
   end;
end Test_LED_PWM;
