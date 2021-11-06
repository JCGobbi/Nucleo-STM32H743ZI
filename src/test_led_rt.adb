with Ada.Real_Time; use Ada.Real_Time;

--  with STM32.RCC;

with STM_Board;     use STM_Board;

procedure Test_LED_RT is
   --  This demonstration program only initializes the GPIOs and flash a LED
   --  with Ada.Real_Time. There is no initialization for PWM, ADC and timer.
begin
   --  STM32.RCC.PWR_Overdrive_Enable;

   --  Initialize GPIO ports
   Initialize_GPIO;

   --  Enter steady state
   loop
      Set_Toggle (Yellow_LED);
      delay until Clock + Milliseconds (100);  -- arbitrary
   end loop;

end Test_LED_RT;
