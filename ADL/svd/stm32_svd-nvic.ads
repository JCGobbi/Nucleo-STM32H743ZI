pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32H743x.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.NVIC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  IPR_IPR_N array element
   subtype IPR_IPR_N_Element is HAL.UInt8;

   --  IPR_IPR_N array
   type IPR_IPR_N_Field_Array is array (0 .. 3) of IPR_IPR_N_Element
     with Component_Size => 8, Size => 32;

   --  Interrupt Priority Register
   type IPR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  IPR_N as a value
            Val : HAL.UInt32;
         when True =>
            --  IPR_N as an array
            Arr : IPR_IPR_N_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   subtype STIR_INTID_Field is HAL.UInt9;

   --  Software trigger interrupt register
   type STIR_Register is record
      --  Software generated interrupt ID
      INTID         : STIR_INTID_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for STIR_Register use record
      INTID         at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Nested Vectored Interrupt Controller
   type NVIC_Peripheral is record
      --  Interrupt Set-Enable Register
      ISER0 : aliased HAL.UInt32;
      --  Interrupt Set-Enable Register
      ISER1 : aliased HAL.UInt32;
      --  Interrupt Set-Enable Register
      ISER2 : aliased HAL.UInt32;
      --  Interrupt Set-Enable Register
      ISER3 : aliased HAL.UInt32;
      --  Interrupt Set-Enable Register
      ISER4 : aliased HAL.UInt32;
      --  Interrupt Clear-Enable Register
      ICER0 : aliased HAL.UInt32;
      --  Interrupt Clear-Enable Register
      ICER1 : aliased HAL.UInt32;
      --  Interrupt Clear-Enable Register
      ICER2 : aliased HAL.UInt32;
      --  Interrupt Clear-Enable Register
      ICER3 : aliased HAL.UInt32;
      --  Interrupt Clear-Enable Register
      ICER4 : aliased HAL.UInt32;
      --  Interrupt Set-Pending Register
      ISPR0 : aliased HAL.UInt32;
      --  Interrupt Set-Pending Register
      ISPR1 : aliased HAL.UInt32;
      --  Interrupt Set-Pending Register
      ISPR2 : aliased HAL.UInt32;
      --  Interrupt Set-Pending Register
      ISPR3 : aliased HAL.UInt32;
      --  Interrupt Set-Pending Register
      ISPR4 : aliased HAL.UInt32;
      --  Interrupt Clear-Pending Register
      ICPR0 : aliased HAL.UInt32;
      --  Interrupt Clear-Pending Register
      ICPR1 : aliased HAL.UInt32;
      --  Interrupt Clear-Pending Register
      ICPR2 : aliased HAL.UInt32;
      --  Interrupt Clear-Pending Register
      ICPR3 : aliased HAL.UInt32;
      --  Interrupt Clear-Pending Register
      ICPR4 : aliased HAL.UInt32;
      --  Interrupt Active Bit Register
      IABR0 : aliased HAL.UInt32;
      --  Interrupt Active Bit Register
      IABR1 : aliased HAL.UInt32;
      --  Interrupt Active Bit Register
      IABR2 : aliased HAL.UInt32;
      --  Interrupt Active Bit Register
      IABR3 : aliased HAL.UInt32;
      --  Interrupt Active Bit Register
      IABR4 : aliased HAL.UInt32;
      --  Interrupt Priority Register
      IPR0  : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR1  : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR2  : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR3  : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR4  : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR5  : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR6  : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR7  : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR8  : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR9  : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR10 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR11 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR12 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR13 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR14 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR15 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR16 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR17 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR18 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR19 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR20 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR21 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR22 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR23 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR24 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR25 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR26 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR27 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR28 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR29 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR30 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR31 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR32 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR33 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR34 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR35 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR36 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR37 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR38 : aliased IPR_Register;
      --  Interrupt Priority Register
      IPR39 : aliased IPR_Register;
   end record
     with Volatile;

   for NVIC_Peripheral use record
      ISER0 at 16#0# range 0 .. 31;
      ISER1 at 16#4# range 0 .. 31;
      ISER2 at 16#8# range 0 .. 31;
      ISER3 at 16#C# range 0 .. 31;
      ISER4 at 16#10# range 0 .. 31;
      ICER0 at 16#80# range 0 .. 31;
      ICER1 at 16#84# range 0 .. 31;
      ICER2 at 16#88# range 0 .. 31;
      ICER3 at 16#8C# range 0 .. 31;
      ICER4 at 16#90# range 0 .. 31;
      ISPR0 at 16#100# range 0 .. 31;
      ISPR1 at 16#104# range 0 .. 31;
      ISPR2 at 16#108# range 0 .. 31;
      ISPR3 at 16#10C# range 0 .. 31;
      ISPR4 at 16#110# range 0 .. 31;
      ICPR0 at 16#180# range 0 .. 31;
      ICPR1 at 16#184# range 0 .. 31;
      ICPR2 at 16#188# range 0 .. 31;
      ICPR3 at 16#1C0# range 0 .. 31;
      ICPR4 at 16#1C4# range 0 .. 31;
      IABR0 at 16#200# range 0 .. 31;
      IABR1 at 16#204# range 0 .. 31;
      IABR2 at 16#208# range 0 .. 31;
      IABR3 at 16#20C# range 0 .. 31;
      IABR4 at 16#210# range 0 .. 31;
      IPR0  at 16#300# range 0 .. 31;
      IPR1  at 16#304# range 0 .. 31;
      IPR2  at 16#308# range 0 .. 31;
      IPR3  at 16#30C# range 0 .. 31;
      IPR4  at 16#310# range 0 .. 31;
      IPR5  at 16#314# range 0 .. 31;
      IPR6  at 16#318# range 0 .. 31;
      IPR7  at 16#31C# range 0 .. 31;
      IPR8  at 16#320# range 0 .. 31;
      IPR9  at 16#324# range 0 .. 31;
      IPR10 at 16#328# range 0 .. 31;
      IPR11 at 16#32C# range 0 .. 31;
      IPR12 at 16#330# range 0 .. 31;
      IPR13 at 16#334# range 0 .. 31;
      IPR14 at 16#338# range 0 .. 31;
      IPR15 at 16#33C# range 0 .. 31;
      IPR16 at 16#340# range 0 .. 31;
      IPR17 at 16#344# range 0 .. 31;
      IPR18 at 16#348# range 0 .. 31;
      IPR19 at 16#34C# range 0 .. 31;
      IPR20 at 16#350# range 0 .. 31;
      IPR21 at 16#354# range 0 .. 31;
      IPR22 at 16#358# range 0 .. 31;
      IPR23 at 16#35C# range 0 .. 31;
      IPR24 at 16#360# range 0 .. 31;
      IPR25 at 16#364# range 0 .. 31;
      IPR26 at 16#368# range 0 .. 31;
      IPR27 at 16#36C# range 0 .. 31;
      IPR28 at 16#370# range 0 .. 31;
      IPR29 at 16#374# range 0 .. 31;
      IPR30 at 16#378# range 0 .. 31;
      IPR31 at 16#37C# range 0 .. 31;
      IPR32 at 16#380# range 0 .. 31;
      IPR33 at 16#384# range 0 .. 31;
      IPR34 at 16#388# range 0 .. 31;
      IPR35 at 16#38C# range 0 .. 31;
      IPR36 at 16#390# range 0 .. 31;
      IPR37 at 16#394# range 0 .. 31;
      IPR38 at 16#398# range 0 .. 31;
      IPR39 at 16#39C# range 0 .. 31;
   end record;

   --  Nested Vectored Interrupt Controller
   NVIC_Periph : aliased NVIC_Peripheral
     with Import, Address => NVIC_Base;

   --  Nested vectored interrupt controller
   type NVIC_STIR_Peripheral is record
      --  Software trigger interrupt register
      STIR : aliased STIR_Register;
   end record
     with Volatile;

   for NVIC_STIR_Peripheral use record
      STIR at 0 range 0 .. 31;
   end record;

   --  Nested vectored interrupt controller
   NVIC_STIR_Periph : aliased NVIC_STIR_Peripheral
     with Import, Address => NVIC_STIR_Base;

end STM32_SVD.NVIC;
