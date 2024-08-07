------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                   S Y S T E M . B B . P A R A M E T E R S                --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--        Copyright (C) 1999-2002 Universidad Politecnica de Madrid         --
--             Copyright (C) 2003-2005 The European Space Agency            --
--                     Copyright (C) 2003-2017, AdaCore                     --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
-- The port of GNARL to bare board targets was initially developed by the   --
-- Real-Time Systems Group at the Technical University of Madrid.           --
--                                                                          --
------------------------------------------------------------------------------

--  This package defines basic parameters used by the low level tasking system

with System.STM32;
with System.BB.Board_Parameters;
with System.BB.MCU_Parameters;

package System.BB.Parameters is
   pragma No_Elaboration_Code_All;
   pragma Preelaborate (System.BB.Parameters);

   Clock_Frequency : constant := Board_Parameters.Main_Clock_Frequency;
   pragma Compile_Time_Error
     (Clock_Frequency not in System.STM32.SYSCLK_Range,
        "bad Clock_Frequency value");
   Ticks_Per_Second : constant := Clock_Frequency;

   --  Set the requested SYSCLK frequency. Setup_Pll will try to set configure
   --  PLL to match this value when possible or reset the board.

   ----------------
   -- Prescalers --
   ----------------

   AHB1_PRE  : constant System.STM32.AHB_Prescaler :=
     (Enabled => False, Value => System.STM32.DIV2);
   --  AHB1_PRE corresponds to D1CPRE Prescaler
   AHB2_PRE  : constant System.STM32.AHB_Prescaler :=
     (Enabled => True, Value => System.STM32.DIV2);
   --  AHB2_PRE corresponds to HPRE Prescaler
   APB1_PRE : constant System.STM32.APB_Prescaler :=
     (Enabled => True, Value => System.STM32.DIV2);
   --  APB1_PRE corresponds to D2PPRE1
   APB2_PRE : constant System.STM32.APB_Prescaler :=
     (Enabled => True, Value => System.STM32.DIV2);
   --  APB2_PRE corresponds to D2PPRE2
   APB3_PRE : constant System.STM32.APB_Prescaler :=
     (Enabled => True, Value => System.STM32.DIV2);
   --  APB3_PRE corresponds to D1PPRE
   APB4_PRE : constant System.STM32.APB_Prescaler :=
     (Enabled => True, Value => System.STM32.DIV2);
   --  APB4_PRE corresponds to D3PPRE

   --------------------
   -- External Clock --
   --------------------

   --  The external clock can be specific for each board. We provide here
   --  a value for the most common STM32 boards.
   --  Change the value based on the external clock used on your specific
   --  hardware.

   HSE_Clock : constant := Board_Parameters.HSE_Clock_Frequency;
   LSE_Clock : constant := Board_Parameters.LSE_Clock_Frequency;

   HSI_Clock : constant := Board_Parameters.HSI_Clock_Frequency;
   HSI48_Clock : constant := Board_Parameters.HSI48_Clock_Frequency;
   CSI_Clock : constant := Board_Parameters.CSI_Clock_Frequency;
   LSI_Clock : constant := Board_Parameters.LSI_Clock_Frequency;

   Has_FPU : constant Boolean := True;
   --  Set to true if core has a FPU

   Has_VTOR : constant Boolean := True;
   --  Set to true if core has a Vector Table Offset Register (VTOR).
   --  VTOR is implemented in Cortex-M0+, Cortex-M4 and above.

   Has_OS_Extensions : constant Boolean := True;
   --  Set to true if core has armv6-m OS extensions (PendSV, MSP, PSP,
   --  etc...). The OS extensions are optional for the Cortex-M1.

   Is_ARMv6m : constant Boolean := False;
   --  Set to true if core is an armv6-m (Cortex-M0, Cortex-M0+, Cortex-M1)

   ----------------
   -- Interrupts --
   ----------------

   --  These definitions are in this package in order to isolate target
   --  dependencies.

   subtype Cortex_Priority_Bits_Width is Integer range 1 .. 8;
   --  The number of bits used by the hardware for priority levels, i.e.,
   --  within the BASEPRI register and IP priority registers. Priorities are
   --  at most eight bits wide but usually fewer. The value varies both with
   --  vendor and chip.

   NVIC_Priority_Bits : constant Cortex_Priority_Bits_Width := 4;
   --  The number of bits allocated by this specific hardware implementation.

   subtype Interrupt_Range is Integer
     range -1 .. MCU_Parameters.Number_Of_Interrupts;
   --  Number of interrupts for the interrupt controller

   Trap_Vectors : constant := 17;
   --  While on this target there is little difference between interrupts
   --  and traps, we consider the following traps:
   --
   --    Name                        Nr
   --
   --    Reset_Vector                 1
   --    NMI_Vector                   2
   --    Hard_Fault_Vector            3
   --    Mem_Manage_Vector            4
   --    Bus_Fault_Vector             5
   --    Usage_Fault_Vector           6
   --    SVC_Vector                  11
   --    Debug_Mon_Vector            12
   --    Pend_SV_Vector              14
   --    Sys_Tick_Vector             15
   --    Interrupt_Request_Vector    16
   --
   --  These trap vectors correspond to different low-level trap handlers in
   --  the run time. Note that as all interrupt requests (IRQs) will use the
   --  same interrupt wrapper, there is no benefit to consider using separate
   --  vectors for each.

   Context_Buffer_Capacity : constant := 10;
   --  The context buffer contains registers r4 .. r11 and the SP_process
   --  (PSP). The size is rounded up to an even number for alignment

   ------------
   -- Stacks --
   ------------

   Interrupt_Stack_Size : constant := 2 * 1024;
   --  Size of each of the interrupt stacks in bytes. While there nominally is
   --  an interrupt stack per interrupt priority, the entire space is used as a
   --  single stack.

   Interrupt_Sec_Stack_Size : constant := 128;
   --  Size of the secondary stack for interrupt handlers

   ----------
   -- CPUS --
   ----------

   Max_Number_Of_CPUs : constant := 1;
   --  Maximum number of CPUs

   Multiprocessor : constant Boolean := Max_Number_Of_CPUs /= 1;
   --  Are we on a multiprocessor board?

end System.BB.Parameters;
