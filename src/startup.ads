
--  Initialization is executed only once at power-on and executes
--  routines that set-up peripherals.
package Startup is

   procedure Initialize;
   --  Initializes peripherals and configures them into a known state.

   procedure Start_Inverter;
   --  Start the inverter

private

   Initialized : Boolean := False;

end Startup;
