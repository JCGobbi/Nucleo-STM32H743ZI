------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                        S Y S T E M . F O R E _ D                         --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--            Copyright (C) 2020-2021, Free Software Foundation, Inc.       --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

package body System.Fore_D is

   ------------------
   -- Fore_Decimal --
   ------------------

   function Fore_Decimal (Lo, Hi : Int; Scale : Integer) return Natural is

      function Negative_Abs (Val : Int) return Int is
        (if Val <= 0 then Val else -Val);
      --  Return the opposite of the absolute value of Val

      T : Int := Int'Min (Negative_Abs (Lo), Negative_Abs (Hi));
      F : Natural;

   begin
      --  Initial value of 2 allows for sign and mandatory single digit

      F := 2;

      --  Loop to increase Fore as needed to include full range of values

      while T <= -10 loop
         T := T / 10;
         F := F + 1;
      end loop;

      return Natural'Max (F - Scale, 2);
   end Fore_Decimal;

end System.Fore_D;
