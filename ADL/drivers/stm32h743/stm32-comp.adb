with System; use System;
with STM32.Device;
with Ada.Real_Time;

package body STM32.COMP is

   ------------
   -- Enable --
   ------------

   procedure Enable (This : in out Comparator)
   is
      use Ada.Real_Time;
   begin
      This.CFGR.EN := True;
      --  Delay for COMP startup time.
      delay until Clock + Microseconds (80);
   end Enable;

   -------------
   -- Disable --
   -------------

   procedure Disable (This : in out Comparator) is
   begin
      This.CFGR.EN := False;
   end Disable;

   -------------
   -- Enabled --
   -------------

   function Enabled (This : Comparator) return Boolean is
   begin
      return This.CFGR.EN;
   end Enabled;

   ------------------------------
   -- Set_Inverting_Input_Port --
   ------------------------------

   procedure Set_Inverting_Input_Port
     (This  : in out Comparator;
      Input : Inverting_Input_Port) is
   begin
      This.CFGR.INMSEL := Input'Enum_Rep;
   end Set_Inverting_Input_Port;

   ------------------------------
   -- Get_Inverting_Input_Port --
   ------------------------------

   function Get_Inverting_Input_Port
     (This : Comparator) return Inverting_Input_Port is
   begin
      return Inverting_Input_Port'Val (This.CFGR.INMSEL);
   end Get_Inverting_Input_Port;

   ---------------------------------
   -- Set_NonInverting_Input_Port --
   ---------------------------------

   procedure Set_NonInverting_Input_Port
     (This  : in out Comparator;
      Input : NonInverting_Input_Port) is
   begin
      This.CFGR.INPSEL := Boolean'Val (Input'Enum_Rep);
   end Set_NonInverting_Input_Port;

   ---------------------------------
   -- Get_NonInverting_Input_Port --
   ---------------------------------

   function Get_NonInverting_Input_Port
     (This : Comparator) return NonInverting_Input_Port is
   begin
      return NonInverting_Input_Port'Val (Boolean'Pos (This.CFGR.INPSEL));
   end Get_NonInverting_Input_Port;

   -------------------------
   -- Set_Output_Polarity --
   -------------------------

   procedure Set_Output_Polarity (This   : in out Comparator;
                                  Output : Output_Polarity) is
   begin
      This.CFGR.POLARITY := Output = Inverted;
   end Set_Output_Polarity;

   -------------------------
   -- Get_Output_Polarity --
   -------------------------

   function Get_Output_Polarity (This : Comparator) return Output_Polarity is
   begin
      return Output_Polarity'Val (Boolean'Pos (This.CFGR.POLARITY));
   end Get_Output_Polarity;

   -------------------------------
   -- Set_Comparator_Hysteresis --
   -------------------------------

   procedure Set_Comparator_Hysteresis
     (This  : in out Comparator;
      Value : Comparator_Hysteresis)
   is
   begin
      This.CFGR.HYST := Value'Enum_Rep;
   end Set_Comparator_Hysteresis;

   -------------------------------
   -- Get_Comparator_Hysteresis --
   -------------------------------

   function Get_Comparator_Hysteresis
     (This : Comparator)
      return Comparator_Hysteresis
   is
   begin
      return Comparator_Hysteresis'Val (This.CFGR.HYST);
   end Get_Comparator_Hysteresis;

   -------------------------
   -- Set_Output_Blanking --
   -------------------------

   procedure Set_Output_Blanking
     (This   : in out Comparator;
      Output : Output_Blanking)
   is
   begin
      This.CFGR.BLANKING := Output'Enum_Rep;
   end Set_Output_Blanking;

   -------------------------
   -- Get_Output_Blanking --
   -------------------------

   function Get_Output_Blanking (This : Comparator) return Output_Blanking is
   begin
      return Output_Blanking'Val (This.CFGR.BLANKING);
   end Get_Output_Blanking;

   ---------------------------------
   -- Set_Vrefint_Scaler_Resistor --
   ---------------------------------

   procedure Set_Vrefint_Scaler_Resistor
     (This    : in out Comparator;
      Enabled : Boolean)
   is
   begin
      This.CFGR.BRGEN := Enabled;
   end Set_Vrefint_Scaler_Resistor;

   ---------------------------------
   -- Get_Vrefint_Scaler_Resistor --
   ---------------------------------

   function Get_Vrefint_Scaler_Resistor (This  : Comparator) return Boolean is
   begin
      return This.CFGR.BRGEN;
   end Get_Vrefint_Scaler_Resistor;

   ------------------------
   -- Set_Vrefint_Scaler --
   ------------------------

   procedure Set_Vrefint_Scaler
     (This    : in out Comparator;
      Enabled : Boolean)
   is
      use Ada.Real_Time;
   begin
      This.CFGR.SCALEN := Enabled;
      --  Delay for COMP voltage scaler stabilization time.
      delay until Clock + Microseconds (250);
   end Set_Vrefint_Scaler;

   ------------------------
   -- Get_Vrefint_Scaler --
   ------------------------

   function Get_Vrefint_Scaler (This  : Comparator) return Boolean is
   begin
      return This.CFGR.SCALEN;
   end Get_Vrefint_Scaler;

   ---------------------------
   -- Get_Comparator_Output --
   ---------------------------

   function Get_Comparator_Output
     (This : Comparator) return Comparator_Output
   is
      use STM32.Device;
      use STM32_SVD.COMP;
   begin
      if This'Address = Comp_1'Address then
         if COMP_Periph.SR.C1VAL then
            return High;
         end if;
      elsif This'Address = Comp_2'Address then
         if COMP_Periph.SR.C2VAL then
            return High;
         end if;
      end if;
      return Low;
   end Get_Comparator_Output;

   ------------------------
   -- Set_AF_Port_Source --
   ------------------------

   procedure Set_AF_Port_Source
     (This : Comparator;
      Port : AF_Port_Source)
   is
      use STM32.Device;
      use STM32_SVD.COMP;
   begin
      if This'Address = Comp_1'Address then
         COMP_Periph.OR_k.AFOP := COMP_Periph.OR_k.AFOP and
            not (2 ** Natural (Port'Enum_Rep));
      elsif This'Address = Comp_2'Address then
         COMP_Periph.OR_k.AFOP := COMP_Periph.OR_k.AFOP or
           (2 ** Natural (Port'Enum_Rep));
      end if;
   end Set_AF_Port_Source;

   --------------------
   -- Set_Power_Mode --
   --------------------

   procedure Set_Power_Mode
     (This : in out Comparator;
      Mode : COMP_Power_Mode)
   is
   begin
      This.CFGR.PWRMODE := Mode'Enum_Rep;
   end Set_Power_Mode;

   --------------------------
   -- Configure_Comparator --
   --------------------------

   procedure Configure_Comparator
     (This  : in out Comparator;
      Param : Init_Parameters)
   is
   begin
      This.CFGR :=
        (INMSEL   => Param.Input_Minus'Enum_Rep,
         INPSEL   => Boolean'Val (Param.Input_Plus'Enum_Rep),
         POLARITY => Param.Output_Pol = Inverted,
         HYST     => Param.Hysteresis'Enum_Rep,
         BLANKING => Param.Blanking_Source'Enum_Rep,
         PWRMODE  => Param.Power_Mode'Enum_Rep,
         others   => <>);
   end Configure_Comparator;

   ------------
   -- Status --
   ------------

   function Status
     (This : Comparator;
      Flag : COMP_Status_Flag) return Boolean
   is
      use STM32.Device;
      use STM32_SVD.COMP;
   begin
      if This'Address = Comp_1'Address then
         case Flag is
            when Comparator_Output_Value =>
               return COMP_Periph.SR.C1VAL;
            when Interrupt_Indicated =>
               return COMP_Periph.SR.C1IF;
         end case;
      elsif This'Address = Comp_2'Address then
         case Flag is
            when Comparator_Output_Value =>
               return COMP_Periph.SR.C2VAL;
            when Interrupt_Indicated =>
               return COMP_Periph.SR.C2IF;
         end case;
      end if;
      return False;
   end Status;

   ----------------------
   -- Enable_Interrupt --
   ----------------------

   procedure Enable_Interrupt (This : in out Comparator) is
   begin
      This.CFGR.ITEN := True;
   end Enable_Interrupt;

   -----------------------
   -- Disable_Interrupt --
   -----------------------

   procedure Disable_Interrupt (This : in out Comparator) is
   begin
      This.CFGR.ITEN := False;
   end Disable_Interrupt;

   -----------------------
   -- Interrupt_Enabled --
   -----------------------

   function Interrupt_Enabled (This : Comparator) return Boolean is
   begin
      return This.CFGR.ITEN;
   end Interrupt_Enabled;

   -----------------------------
   -- Clear_Interrupt_Pending --
   -----------------------------

   procedure Clear_Interrupt_Pending (This : in out Comparator) is
      use STM32.Device;
      use STM32_SVD.COMP;
   begin
      if This'Address = Comp_1'Address then
         COMP_Periph.ICFR.CC1IF := True;
      elsif This'Address = Comp_2'Address then
         COMP_Periph.ICFR.CC2IF := True;
      end if;
   end Clear_Interrupt_Pending;

   -------------------------
   -- Set_Lock_Comparator --
   -------------------------

   procedure Set_Lock_Comparator (This : in out Comparator) is
   begin
      This.CFGR.LOCK := True;
   end Set_Lock_Comparator;

   -------------------------
   -- Get_Lock_Comparator --
   -------------------------

   function Get_Lock_Comparator (This : Comparator) return Boolean is
   begin
      return This.CFGR.LOCK;
   end Get_Lock_Comparator;

end STM32.COMP;
