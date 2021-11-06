with Ada.Real_Time; use Ada.Real_Time;
with Startup;

with Last_Chance_Handler; pragma Unreferenced (Last_Chance_Handler);
--  The "last chance handler" is the user-defined routine that is called when
--  an exception is propagated. We need it in the executable, therefore it
--  must be somewhere in the closure of the context clauses.

procedure Main is
begin
   --  Start-up GPIOs, ADCs, Timer and PWM
   Startup.Initialize;

   Startup.Start_Inverter;

   --  Enter steady state
   loop
      --  Set_Toggle (Green_LED);
      delay until Clock + Milliseconds (3000);  -- arbitrary
   end loop;

end Main;
