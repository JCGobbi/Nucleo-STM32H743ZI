with Ada.Real_Time;

package body STM32.OPAMP is

   ------------
   -- Enable --
   ------------

   procedure Enable (This : in out Operational_Amplifier) is
      use Ada.Real_Time;
   begin
      This.CSR.OPAEN := True;
      --  Delay 4 us for OPAMP startup time. See DS12110 Rev 8 chapter 7.3.27
      --  Operational amplifier characteristics.
      delay until Clock + Microseconds (4);
   end Enable;

   -------------
   -- Disable --
   -------------

   procedure Disable (This : in out Operational_Amplifier) is
   begin
      This.CSR.OPAEN := False;
   end Disable;

   -------------
   -- Enabled --
   -------------

   function Enabled (This : Operational_Amplifier) return Boolean is
   begin
      return This.CSR.OPAEN;
   end Enabled;

   -----------------------
   -- Set_NI_Input_Mode --
   -----------------------

   procedure Set_NI_Input_Mode
     (This  : in out Operational_Amplifier;
      Input : NI_Input_Mode) is
   begin
      This.CSR.FORCE_VP := Input = Calibration_Mode;
   end Set_NI_Input_Mode;

   -----------------------
   -- Get_NI_Input_Mode --
   -----------------------

   function Get_NI_Input_Mode
     (This : Operational_Amplifier) return NI_Input_Mode is
   begin
      return NI_Input_Mode'Val (Boolean'Pos (This.CSR.FORCE_VP));
   end Get_NI_Input_Mode;

   -----------------------
   -- Set_NI_Input_Port --
   -----------------------

   procedure Set_NI_Input_Port
     (This  : in out Operational_Amplifier;
      Input : NI_Input_Port) is
   begin
      This.CSR.VP_SEL := Input'Enum_Rep;
   end Set_NI_Input_Port;

   -----------------------
   -- Get_NI_Input_Port --
   -----------------------

   function Get_NI_Input_Port
     (This : Operational_Amplifier) return NI_Input_Port is
   begin
      return NI_Input_Port'Val (This.CSR.VP_SEL);
   end Get_NI_Input_Port;

   ----------------------
   -- Set_I_Input_Port --
   ----------------------

   procedure Set_I_Input_Port
     (This  : in out Operational_Amplifier;
      Input : I_Input_Port) is
   begin
      This.CSR.VM_SEL := Input'Enum_Rep;
   end Set_I_Input_Port;

   ----------------------
   -- Get_I_Input_Port --
   ----------------------

   function Get_I_Input_Port
     (This : Operational_Amplifier) return I_Input_Port is
   begin
      return I_Input_Port'Val (This.CSR.VM_SEL);
   end Get_I_Input_Port;

   -----------------------
   -- Set_PGA_Mode_Gain --
   -----------------------

   procedure Set_PGA_Mode_Gain
     (This  : in out Operational_Amplifier;
      Input : PGA_Mode_Gain) is
   begin
      This.CSR.PGA_GAIN := Input'Enum_Rep;
   end Set_PGA_Mode_Gain;

   -----------------------
   -- Get_PGA_Mode_Gain --
   -----------------------

   function Get_PGA_Mode_Gain
     (This : Operational_Amplifier) return PGA_Mode_Gain is
   begin
      return PGA_Mode_Gain'Val (This.CSR.PGA_GAIN);
   end Get_PGA_Mode_Gain;

   --------------------
   -- Set_Speed_Mode --
   --------------------

   procedure Set_Speed_Mode
     (This  : in out Operational_Amplifier; Input : Speed_Mode) is
   begin
      This.CSR.OPAHSM := Input = HighSpeed_Mode;
   end Set_Speed_Mode;

   ---------------------
   -- Get_Speed_Mode --
   ---------------------

   function Get_Speed_Mode
     (This : Operational_Amplifier) return Speed_Mode is
   begin
      return Speed_Mode'Val (Boolean'Pos (This.CSR.OPAHSM));
   end Get_Speed_Mode;

   ---------------------
   -- Configure_Opamp --
   ---------------------

   procedure Configure_Opamp
     (This  : in out Operational_Amplifier;
      Param : Init_Parameters)
   is
   begin
      Set_I_Input_Port (This, Param.Input_Minus);
      Set_NI_Input_Port (This, Param.Input_Plus);
      Set_PGA_Mode_Gain (This, Param.PGA_Mode);
      Set_Speed_Mode (This, Param.Power_Mode);
   end Configure_Opamp;

   -----------------------
   -- Set_User_Trimming --
   -----------------------

   procedure Set_User_Trimming
     (This   : in out Operational_Amplifier;
      Enabled : Boolean) is
   begin
      This.CSR.USERTRIM := Enabled;
   end Set_User_Trimming;

   ------------------------
   -- Get_User_Trimming --
   ------------------------

   function Get_User_Trimming
     (This : Operational_Amplifier) return Boolean is
   begin
      return This.CSR.USERTRIM;
   end Get_User_Trimming;

   -------------------------
   -- Set_Offset_Trimming --
   -------------------------

   procedure Set_Offset_Trimming
     (This  : in out Operational_Amplifier;
      Pair  : Differential_Pair;
      Input : UInt5) is
   begin
      if This.CSR.OPAHSM then
         case Pair is
            when NMOS =>
               This.HSOTR.TRIMHSOFFSETN := Input;
            when PMOS =>
               This.HSOTR.TRIMHSOFFSETP := Input;
         end case;
      else
         case Pair is
            when NMOS =>
               This.OTR.TRIMOFFSETN := Input;
            when PMOS =>
               This.OTR.TRIMOFFSETP := Input;
         end case;
      end if;
   end Set_Offset_Trimming;

   --------------------------
   -- Get_Offset_Trimming --
   --------------------------

   function Get_Offset_Trimming
     (This : Operational_Amplifier;
      Pair : Differential_Pair) return UInt5
   is
   begin
      if This.CSR.OPAHSM then
         case Pair is
            when NMOS =>
               return This.HSOTR.TRIMHSOFFSETN;
            when PMOS =>
               return This.HSOTR.TRIMHSOFFSETP;
         end case;
      else
         case Pair is
            when NMOS =>
               return This.OTR.TRIMOFFSETN;
            when PMOS =>
               return This.OTR.TRIMOFFSETP;
         end case;
      end if;
   end Get_Offset_Trimming;

   --------------------------
   -- Set_Calibration_Mode --
   --------------------------

   procedure Set_Calibration_Mode
     (This    : in out Operational_Amplifier;
      Enabled : Boolean) is
   begin
      This.CSR.CALON := Enabled;
   end Set_Calibration_Mode;

   --------------------------
   -- Get_Calibration_Mode --
   --------------------------

   function Get_Calibration_Mode
     (This : Operational_Amplifier) return Boolean is
   begin
      return This.CSR.CALON;
   end Get_Calibration_Mode;

   ---------------------------
   -- Set_Calibration_Value --
   ---------------------------

   procedure Set_Calibration_Value
     (This  : in out Operational_Amplifier;
      Input : Calibration_Value) is
   begin
      This.CSR.CALSEL := Input'Enum_Rep;
   end Set_Calibration_Value;

   ---------------------------
   -- Get_Calibration_Value --
   ---------------------------

   function Get_Calibration_Value
     (This : Operational_Amplifier) return Calibration_Value is
   begin
      return Calibration_Value'Val (This.CSR.CALSEL);
   end Get_Calibration_Value;

   ---------------
   -- Calibrate --
   ---------------

   procedure Calibrate (This : in out Operational_Amplifier) is
      use Ada.Real_Time;
      Trimoffset : UInt5 := 0;
   begin
      --  1. Enable OPAMP by setting the OPAMPxEN bit.
      if not Enabled (This) then
         Enable (This);
      end if;

      --  2. Enable the user offset trimming by setting the USERTRIM bit.
      Set_User_Trimming (This, Enabled => True);

      --  3. Connect VM and VP to the internal reference voltage by setting
      --  the CALON bit.
      Set_Calibration_Mode (This, Enabled => True);

      --  4. Set CALSEL to 11 (OPAMP internal reference = 0.9 x VDDA) for NMOS,
      --  Set CALSEL to 01 (OPAMP internal reference = 0.1 x VDDA) for PMOS.
      for Pair in Differential_Pair'Range loop
         if Pair = NMOS then
            Set_Calibration_Value (This, Input => VREFOPAMP_Is_90_VDDA);
         else
            Set_Calibration_Value (This, Input => VREFOPAMP_Is_10_VDDA);
         end if;

         --  5. In a loop, increment the TRIMOFFSETN (for NMOS) or TRIMOFFSETP
         --  (for PMOS) value. To exit from the loop, the OUTCAL bit must be
         --  reset (non-inverting < inverting).
         --  In this case, the TRIMOFFSETN value must be stored.
         Set_Offset_Trimming (This, Pair => Pair, Input => Trimoffset);
         --  Wait the OFFTRIMmax delay timing specified < 1 ms.
         delay until Clock + Milliseconds (1);

         while Get_Output_Status_Flag (This) = NI_Greater_Then_I loop
            Trimoffset := Trimoffset + 1;
            Set_Offset_Trimming (This, Pair => Pair, Input => Trimoffset);
            --  Wait the OFFTRIMmax delay timing specified < 1 ms.
            delay until Clock + Milliseconds (1);
         end loop;
      end loop;

      Set_User_Trimming (This, Enabled => False);
      Set_Calibration_Mode (This, Enabled => False);
   end Calibrate;

   -----------------------------
   -- Get_Output_Status_Flag --
   -----------------------------

   function Get_Output_Status_Flag
     (This : Operational_Amplifier) return Output_Status_Flag is
   begin
      return Output_Status_Flag'Val (Boolean'Pos (This.CSR.CALOUT));
   end Get_Output_Status_Flag;

end STM32.OPAMP;
