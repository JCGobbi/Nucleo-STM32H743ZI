------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                         ADA.STRINGS.TEXT_BUFFERS                         --
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

with Ada.Strings.UTF_Encoding.Wide_Strings;
with Ada.Strings.UTF_Encoding.Wide_Wide_Strings;

package body Ada.Strings.Text_Buffers is
   function Current_Indent
     (Buffer : Root_Buffer_Type) return Text_Buffer_Count is
     (Text_Buffer_Count (Buffer.Indentation));

   procedure Increase_Indent
     (Buffer : in out Root_Buffer_Type;
      Amount :        Text_Buffer_Count := Standard_Indent)
   is
   begin
      Buffer.Indentation := @ + Natural (Amount);
   end Increase_Indent;

   procedure Decrease_Indent
     (Buffer : in out Root_Buffer_Type;
      Amount :        Text_Buffer_Count := Standard_Indent)
   is
   begin
      Buffer.Indentation := @ - Natural (Amount);
   end Decrease_Indent;

   package body Output_Mapping is
      --  Implement indentation in Put_UTF_8 and New_Line.
      --  Implement other output procedures using Put_UTF_8.

      procedure Put (Buffer : in out Buffer_Type; Item : String) is
      begin
         Put_UTF_8 (Buffer, Item);
      end Put;

      procedure Wide_Put (Buffer : in out Buffer_Type; Item : Wide_String) is
      begin
         Buffer.All_8_Bits :=
           @ and then
           (for all WChar of Item => Wide_Character'Pos (WChar) < 256);

         Put_UTF_8 (Buffer, UTF_Encoding.Wide_Strings.Encode (Item));
      end Wide_Put;

      procedure Wide_Wide_Put
        (Buffer : in out Buffer_Type; Item : Wide_Wide_String)
      is
      begin
         Buffer.All_8_Bits :=
           @ and then
           (for all WWChar of Item => Wide_Wide_Character'Pos (WWChar) < 256);

         Put_UTF_8 (Buffer, UTF_Encoding.Wide_Wide_Strings.Encode (Item));
      end Wide_Wide_Put;

      procedure Put_UTF_8
        (Buffer : in out Buffer_Type;
         Item   :        UTF_Encoding.UTF_8_String) is
      begin
         if Item'Length = 0 then
            return;
         end if;

         if Buffer.Indent_Pending then
            Buffer.Indent_Pending := False;
            if Buffer.Indentation > 0 then
               Put_UTF_8_Implementation
                 (Buffer, (1 .. Buffer.Indentation => ' '));
            end if;
         end if;

         Put_UTF_8_Implementation (Buffer, Item);
      end Put_UTF_8;

      procedure Wide_Put_UTF_16
        (Buffer : in out Buffer_Type; Item : UTF_Encoding.UTF_16_Wide_String)
      is
      begin
         Wide_Wide_Put (Buffer, UTF_Encoding.Wide_Wide_Strings.Decode (Item));
      end Wide_Put_UTF_16;

      procedure New_Line (Buffer : in out Buffer_Type) is
      begin
         Buffer.Indent_Pending := False; --  just for a moment
         Put (Buffer, (1 => ASCII.LF));
         Buffer.Indent_Pending := True;
         Buffer.UTF_8_Column   := 1;
      end New_Line;

   end Output_Mapping;

end Ada.Strings.Text_Buffers;
