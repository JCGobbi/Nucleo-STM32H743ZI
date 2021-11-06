------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                   S Y S T E M . I M G _ E N U M _ 1 6                    --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--             Copyright (C) 2021, Free Software Foundation, Inc.           --
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

--  Instantiation of System.Image_N for enumeration types whose names table
--  has a length that fits in a 16-bit but not a 8-bit integer.

with Interfaces;
with System.Image_N;

package System.Img_Enum_16 is
   pragma Pure;

   package Impl is new Image_N (Interfaces.Integer_16);

   procedure Image_Enumeration_16
     (Pos     : Natural;
      S       : in out String;
      P       : out Natural;
      Names   : String;
      Indexes : System.Address)
     renames Impl.Image_Enumeration;

end System.Img_Enum_16;
