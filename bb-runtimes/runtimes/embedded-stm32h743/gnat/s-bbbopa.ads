------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--            S Y S T E M . B B . B O A R D _ P A R A M E T E R S           --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--                   Copyright (C) 2016-2017, AdaCore                       --
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

package System.BB.Board_Parameters is
   pragma No_Elaboration_Code_All;
   pragma Pure;

   --------------------
   -- Hardware clock --
   --------------------

   Main_Clock_Frequency : constant := 400_000_000;
   --  With 8 MHz HSE clock + PLL use 400 MHz,
   --  with 8 MHz HSE clock - PLL use 8 MHz,
   --  with 64 MHz HSI clock + PLL use 400 MHz,
   --  with 64 MHz HSI clock - PLL use 64 MHz,
   --  with 4 MHz CSI clock + PLL use 400 MHz,
   --  with 4 MHz CSI clock - PLL use 4 MHz.

   HSE_Clock_Frequency : constant := 8_000_000;
   --  Frequency of High Speed External clock.
   LSE_Clock_Frequency : constant := 32_768;
   --  Frequency of Low Speed External clock.
   HSI_Clock_Frequency : constant := 64_000_000;
   --  Frequency of High Speed Internal clock.
   HSI48_Clock_Frequency : constant := 48_000_000;
   --  Frequency of High Speed Internal clock.
   LSI_Clock_Frequency : constant := 32_000;
   --  Frequency of Low Speed Internal clock.
   CSI_Clock_Frequency : constant := 4_000_000;
   --  Frequency of High Speed Internal clock.

end System.BB.Board_Parameters;
