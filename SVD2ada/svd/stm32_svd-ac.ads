pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32H743x.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.AC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype ITCMCR_SZ_Field is HAL.UInt4;

   --  Instruction and Data Tightly-Coupled Memory Control Registers
   type ITCMCR_Register is record
      --  EN
      EN            : Boolean := False;
      --  RMW
      RMW           : Boolean := False;
      --  RETEN
      RETEN         : Boolean := False;
      --  SZ
      SZ            : ITCMCR_SZ_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITCMCR_Register use record
      EN            at 0 range 0 .. 0;
      RMW           at 0 range 1 .. 1;
      RETEN         at 0 range 2 .. 2;
      SZ            at 0 range 3 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype DTCMCR_SZ_Field is HAL.UInt4;

   --  Instruction and Data Tightly-Coupled Memory Control Registers
   type DTCMCR_Register is record
      --  EN
      EN            : Boolean := False;
      --  RMW
      RMW           : Boolean := False;
      --  RETEN
      RETEN         : Boolean := False;
      --  SZ
      SZ            : DTCMCR_SZ_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DTCMCR_Register use record
      EN            at 0 range 0 .. 0;
      RMW           at 0 range 1 .. 1;
      RETEN         at 0 range 2 .. 2;
      SZ            at 0 range 3 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype AHBPCR_SZ_Field is HAL.UInt3;

   --  AHBP Control register
   type AHBPCR_Register is record
      --  EN
      EN            : Boolean := False;
      --  SZ
      SZ            : AHBPCR_SZ_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHBPCR_Register use record
      EN            at 0 range 0 .. 0;
      SZ            at 0 range 1 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Auxiliary Cache Control register
   type CACR_Register is record
      --  SIWT
      SIWT          : Boolean := False;
      --  ECCEN
      ECCEN         : Boolean := False;
      --  FORCEWT
      FORCEWT       : Boolean := False;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CACR_Register use record
      SIWT          at 0 range 0 .. 0;
      ECCEN         at 0 range 1 .. 1;
      FORCEWT       at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype AHBSCR_CTL_Field is HAL.UInt2;
   subtype AHBSCR_TPRI_Field is HAL.UInt9;
   subtype AHBSCR_INITCOUNT_Field is HAL.UInt5;

   --  AHB Slave Control register
   type AHBSCR_Register is record
      --  CTL
      CTL            : AHBSCR_CTL_Field := 16#0#;
      --  TPRI
      TPRI           : AHBSCR_TPRI_Field := 16#0#;
      --  INITCOUNT
      INITCOUNT      : AHBSCR_INITCOUNT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHBSCR_Register use record
      CTL            at 0 range 0 .. 1;
      TPRI           at 0 range 2 .. 10;
      INITCOUNT      at 0 range 11 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ABFSR_AXIMTYPE_Field is HAL.UInt2;

   --  Auxiliary Bus Fault Status register
   type ABFSR_Register is record
      --  ITCM
      ITCM           : Boolean := False;
      --  DTCM
      DTCM           : Boolean := False;
      --  AHBP
      AHBP           : Boolean := False;
      --  AXIM
      AXIM           : Boolean := False;
      --  EPPB
      EPPB           : Boolean := False;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  AXIMTYPE
      AXIMTYPE       : ABFSR_AXIMTYPE_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ABFSR_Register use record
      ITCM           at 0 range 0 .. 0;
      DTCM           at 0 range 1 .. 1;
      AHBP           at 0 range 2 .. 2;
      AXIM           at 0 range 3 .. 3;
      EPPB           at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      AXIMTYPE       at 0 range 8 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Access control
   type AC_Peripheral is record
      --  Instruction and Data Tightly-Coupled Memory Control Registers
      ITCMCR : aliased ITCMCR_Register;
      --  Instruction and Data Tightly-Coupled Memory Control Registers
      DTCMCR : aliased DTCMCR_Register;
      --  AHBP Control register
      AHBPCR : aliased AHBPCR_Register;
      --  Auxiliary Cache Control register
      CACR   : aliased CACR_Register;
      --  AHB Slave Control register
      AHBSCR : aliased AHBSCR_Register;
      --  Auxiliary Bus Fault Status register
      ABFSR  : aliased ABFSR_Register;
   end record
     with Volatile;

   for AC_Peripheral use record
      ITCMCR at 16#0# range 0 .. 31;
      DTCMCR at 16#4# range 0 .. 31;
      AHBPCR at 16#8# range 0 .. 31;
      CACR   at 16#C# range 0 .. 31;
      AHBSCR at 16#10# range 0 .. 31;
      ABFSR  at 16#18# range 0 .. 31;
   end record;

   --  Access control
   AC_Periph : aliased AC_Peripheral
     with Import, Address => AC_Base;

end STM32_SVD.AC;
