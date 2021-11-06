with STM32_SVD.COMP; use STM32_SVD.COMP;
with STM32.Device;

package body STM32.COMP is

   ------------
   -- Enable --
   ------------

   procedure Enable (This : in out Comparator) is
   begin
      This.CFGR.EN := True;
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

   -------------------------------
   -- Read_Inverting_Input_Port --
   -------------------------------

   function Read_Inverting_Input_Port
     (This : Comparator) return Inverting_Input_Port is
   begin
      return Inverting_Input_Port'Val (This.CFGR.INMSEL);
   end Read_Inverting_Input_Port;

   ---------------------------------
   -- Set_NonInverting_Input_Port --
   ---------------------------------

   procedure Set_NonInverting_Input_Port
     (This  : in out Comparator;
      Input : NonInverting_Input_Port) is
   begin
      This.CFGR.INPSEL := Boolean'Val (Input'Enum_Rep);
   end Set_NonInverting_Input_Port;

   ----------------------------------
   -- Read_NonInverting_Input_Port --
   ----------------------------------

   function Read_NonInverting_Input_Port
     (This : Comparator) return NonInverting_Input_Port is
   begin
      if This.CFGR.INPSEL then
         return Option_1;
      else
         return Option_2;
      end if;
   end Read_NonInverting_Input_Port;

   -------------------------
   -- Set_Output_Polarity --
   -------------------------

   procedure Set_Output_Polarity (This   : in out Comparator;
                                  Output : Output_Polarity) is
   begin
      This.CFGR.POLARITY := Output = Inverted;
   end Set_Output_Polarity;

   --------------------------
   -- Read_Output_Polarity --
   --------------------------

   function Read_Output_Polarity (This : Comparator) return Output_Polarity is
   begin
      if This.CFGR.POLARITY then
         return Inverted;
      else
         return Not_Inverted;
      end if;
   end Read_Output_Polarity;

   -------------------------------
   -- Set_Comparator_Hysteresis --
   -------------------------------

   procedure Set_Comparator_Hysteresis (This  : in out Comparator;
                                        Value : Comparator_Hysteresis) is
   begin
      This.CFGR.HYST := Value'Enum_Rep;
   end Set_Comparator_Hysteresis;

   --------------------------------
   -- Read_Comparator_Hysteresis --
   --------------------------------

   function Read_Comparator_Hysteresis (This : Comparator)
                                        return Comparator_Hysteresis is
   begin
      return Comparator_Hysteresis'Val (This.CFGR.HYST);
   end Read_Comparator_Hysteresis;

   -------------------------
   -- Set_Output_Blanking --
   -------------------------

   procedure Set_Output_Blanking (This   : in out Comparator;
                                  Output : Output_Blanking) is
   begin
      This.CFGR.BLANKING := Output'Enum_Rep;
   end Set_Output_Blanking;

   --------------------------
   -- Read_Output_Blanking --
   --------------------------

   function Read_Output_Blanking (This : Comparator) return Output_Blanking is
   begin
      return Output_Blanking'Val (This.CFGR.BLANKING);
   end Read_Output_Blanking;

   ---------------------------------
   -- Set_Vrefint_Scaler_Resistor --
   ---------------------------------

   procedure Set_Vrefint_Scaler_Resistor
     (This   : in out Comparator;
      Output : Boolean)
   is
   begin
      This.CFGR.BRGEN := Output;
   end Set_Vrefint_Scaler_Resistor;

   ----------------------------------
   -- Read_Vrefint_Scaler_Resistor --
   ----------------------------------

   function Read_Vrefint_Scaler_Resistor (This  : Comparator) return Boolean is
   begin
      return This.CFGR.BRGEN;
   end Read_Vrefint_Scaler_Resistor;

   ------------------------
   -- Set_Vrefint_Scaler --
   ------------------------

   procedure Set_Vrefint_Scaler
     (This   : in out Comparator;
      Output : Boolean)
   is
   begin
      This.CFGR.SCALEN := Output;
   end Set_Vrefint_Scaler;

   -------------------------
   -- Read_Vrefint_Scaler --
   -------------------------

   function Read_Vrefint_Scaler (This  : Comparator) return Boolean is
   begin
      return This.CFGR.SCALEN;
   end Read_Vrefint_Scaler;

   ----------------------------
   -- Read_Comparator_Output --
   ----------------------------

   function Read_Comparator_Output
     (This : Comparator) return Comparator_Output is
      use STM32.Device;
   begin
      if This = Comp_1 then
         if COMP_Periph.SR.C1VAL then
            return High;
         end if;
      elsif This = Comp_2 then
         if COMP_Periph.SR.C2VAL then
            return High;
         end if;
      end if;
      return Low;
   end Read_Comparator_Output;

   ------------------------
   -- Set_AF_Port_Source --
   ------------------------

   procedure Set_AF_Port_Source
     (This : Comparator;
      Port : AF_Port_Source)
   is
      use STM32.Device;
   begin
      if This = Comp_1 then
         COMP_Periph.OR_k.AFOP := COMP_Periph.OR_k.AFOP and
            not (2 ** Natural (Port'Enum_Rep));
      elsif This = Comp_2 then
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

   ------------
   -- Status --
   ------------

   function Status
     (This : Comparator;
      Flag : COMP_Status_Flag) return Boolean
   is
      use STM32.Device;
   begin
      if This = Comp_1 then
         case Flag is
            when Comparator_Output_Value =>
               return COMP_Periph.SR.C1VAL;
            when Interrupt_Indicated =>
               return COMP_Periph.SR.C1IF;
         end case;
      elsif This = Comp_2 then
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
   begin
      if This = Comp_1 then
         COMP_Periph.ICFR.CC1IF := True;
      elsif This = Comp_2 then
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

   --------------------------
   -- Read_Lock_Comparator --
   --------------------------

   function Read_Lock_Comparator (This : Comparator) return Boolean is
   begin
      return This.CFGR.LOCK;
   end Read_Lock_Comparator;

end STM32.COMP;
