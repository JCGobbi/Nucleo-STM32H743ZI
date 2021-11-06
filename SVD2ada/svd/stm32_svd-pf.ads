pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32H743x.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.PF is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  CLIDR_CL array element
   subtype CLIDR_CL_Element is HAL.UInt3;

   --  CLIDR_CL array
   type CLIDR_CL_Field_Array is array (1 .. 7) of CLIDR_CL_Element
     with Component_Size => 3, Size => 21;

   --  Type definition for CLIDR_CL
   type CLIDR_CL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CL as a value
            Val : HAL.UInt21;
         when True =>
            --  CL as an array
            Arr : CLIDR_CL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 21;

   for CLIDR_CL_Field use record
      Val at 0 range 0 .. 20;
      Arr at 0 range 0 .. 20;
   end record;

   subtype CLIDR_LoUIS_Field is HAL.UInt3;
   subtype CLIDR_LoC_Field is HAL.UInt3;
   subtype CLIDR_LoU_Field is HAL.UInt3;

   --  Cache Level ID register
   type CLIDR_Register is record
      --  Read-only. CL1
      CL             : CLIDR_CL_Field;
      --  Read-only. LoUIS
      LoUIS          : CLIDR_LoUIS_Field;
      --  Read-only. LoC
      LoC            : CLIDR_LoC_Field;
      --  Read-only. LoU
      LoU            : CLIDR_LoU_Field;
      --  unspecified
      Reserved_30_31 : HAL.UInt2;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLIDR_Register use record
      CL             at 0 range 0 .. 20;
      LoUIS          at 0 range 21 .. 23;
      LoC            at 0 range 24 .. 26;
      LoU            at 0 range 27 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype CTR_IminLine_Field is HAL.UInt4;
   subtype CTR_DMinLine_Field is HAL.UInt4;
   subtype CTR_ERG_Field is HAL.UInt4;
   subtype CTR_CWG_Field is HAL.UInt4;
   subtype CTR_Format_Field is HAL.UInt3;

   --  Cache Type register
   type CTR_Register is record
      --  Read-only. IminLine
      IminLine       : CTR_IminLine_Field;
      --  unspecified
      Reserved_4_15  : HAL.UInt12;
      --  Read-only. DMinLine
      DMinLine       : CTR_DMinLine_Field;
      --  Read-only. ERG
      ERG            : CTR_ERG_Field;
      --  Read-only. CWG
      CWG            : CTR_CWG_Field;
      --  unspecified
      Reserved_28_28 : HAL.Bit;
      --  Read-only. Format
      Format         : CTR_Format_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTR_Register use record
      IminLine       at 0 range 0 .. 3;
      Reserved_4_15  at 0 range 4 .. 15;
      DMinLine       at 0 range 16 .. 19;
      ERG            at 0 range 20 .. 23;
      CWG            at 0 range 24 .. 27;
      Reserved_28_28 at 0 range 28 .. 28;
      Format         at 0 range 29 .. 31;
   end record;

   subtype CCSIDR_LineSize_Field is HAL.UInt3;
   subtype CCSIDR_Associativity_Field is HAL.UInt10;
   subtype CCSIDR_NumSets_Field is HAL.UInt15;

   --  Cache Size ID register
   type CCSIDR_Register is record
      --  Read-only. LineSize
      LineSize      : CCSIDR_LineSize_Field;
      --  Read-only. Associativity
      Associativity : CCSIDR_Associativity_Field;
      --  Read-only. NumSets
      NumSets       : CCSIDR_NumSets_Field;
      --  Read-only. WA
      WA            : Boolean;
      --  Read-only. RA
      RA            : Boolean;
      --  Read-only. WB
      WB            : Boolean;
      --  Read-only. WT
      WT            : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCSIDR_Register use record
      LineSize      at 0 range 0 .. 2;
      Associativity at 0 range 3 .. 12;
      NumSets       at 0 range 13 .. 27;
      WA            at 0 range 28 .. 28;
      RA            at 0 range 29 .. 29;
      WB            at 0 range 30 .. 30;
      WT            at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Processor features
   type PF_Peripheral is record
      --  Cache Level ID register
      CLIDR  : aliased CLIDR_Register;
      --  Cache Type register
      CTR    : aliased CTR_Register;
      --  Cache Size ID register
      CCSIDR : aliased CCSIDR_Register;
   end record
     with Volatile;

   for PF_Peripheral use record
      CLIDR  at 16#0# range 0 .. 31;
      CTR    at 16#4# range 0 .. 31;
      CCSIDR at 16#8# range 0 .. 31;
   end record;

   --  Processor features
   PF_Periph : aliased PF_Peripheral
     with Import, Address => PF_Base;

end STM32_SVD.PF;
