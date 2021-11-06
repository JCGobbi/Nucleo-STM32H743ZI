------------------------------------------------------------------------------
--                                                                          --
--                    Copyright (C) 2015, AdaCore                           --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of STMicroelectronics nor the names of its       --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
--                                                                          --
--  This file is based on:                                                  --
--                                                                          --
--   @file    stm32f4xx_hal_spi.h                                           --
--   @author  MCD Application Team                                          --
--   @version V1.1.0                                                        --
--   @date    19-June-2014                                                  --
--   @brief   Header file of SPI HAL module.                                --
--                                                                          --
--   COPYRIGHT(c) 2014 STMicroelectronics                                   --
------------------------------------------------------------------------------

--  This file provides definitions for the STM32G4 (ARM Cortex M4F
--  from ST Microelectronics) Serial Peripheral Interface (SPI) facility.

private with STM32_SVD.SPI;
with HAL.SPI;
with System;

package STM32.SPI is

   type Internal_SPI_Port is private;

   type SPI_Port (Periph : not null access Internal_SPI_Port) is
      limited new HAL.SPI.SPI_Port with private;

   type SPI_Data_Direction is
     (D2Lines_FullDuplex,
      D1Line_Tx,
      D1Line_Rx,
      D2Lines_RxOnly);

   type SPI_Mode is (Master, Slave);

   type SPI_Data_Size is
     (Bits_4,
      Bits_5,
      Bits_6,
      Bits_7,
      Bits_8,
      Bits_9,
      Bits_10,
      Bits_11,
      Bits_12,
      Bits_13,
      Bits_14,
      Bits_15,
      Bits_16,
      Bits_17,
      Bits_18,
      Bits_19,
      Bits_20,
      Bits_21,
      Bits_22,
      Bits_23,
      Bits_24,
      Bits_25,
      Bits_26,
      Bits_27,
      Bits_28,
      Bits_29,
      Bits_30,
      Bits_31,
      Bits_32)
     with Size => 5;

   for SPI_Data_Size use
     (Bits_4  => 2#00011#,
      Bits_5  => 2#00100#,
      Bits_6  => 2#00101#,
      Bits_7  => 2#00110#,
      Bits_8  => 2#00111#,
      Bits_9  => 2#01000#,
      Bits_10 => 2#01001#,
      Bits_11 => 2#01010#,
      Bits_12 => 2#01011#,
      Bits_13 => 2#01100#,
      Bits_14 => 2#01101#,
      Bits_15 => 2#01110#,
      Bits_16 => 2#01111#,
      Bits_17 => 2#10000#,
      Bits_18 => 2#10001#,
      Bits_19 => 2#10010#,
      Bits_20 => 2#10011#,
      Bits_21 => 2#10100#,
      Bits_22 => 2#10101#,
      Bits_23 => 2#10110#,
      Bits_24 => 2#10111#,
      Bits_25 => 2#11000#,
      Bits_26 => 2#11001#,
      Bits_27 => 2#11010#,
      Bits_28 => 2#11011#,
      Bits_29 => 2#11100#,
      Bits_30 => 2#11101#,
      Bits_31 => 2#11110#,
      Bits_32 => 2#11111#);

   type SPI_Clock_Polarity is (High, Low);

   type SPI_Clock_Phase is (P1Edge, P2Edge);

   type SPI_Slave_Management is (Software_Managed, Hardware_Managed);

   type SPI_Baud_Rate_Prescaler is
     (Div_2, Div_4, Div_8, Div_16, Div_32, Div_64, Div_128, Div_256);

   type SPI_First_Bit is (MSB, LSB);

   type SPI_Configuration is record
      Direction           : SPI_Data_Direction;
      Mode                : SPI_Mode;
      Data_Size           : HAL.SPI.SPI_Data_Size;
      Clock_Polarity      : SPI_Clock_Polarity;
      Clock_Phase         : SPI_Clock_Phase;
      Slave_Management    : SPI_Slave_Management;
      Baud_Rate_Prescaler : SPI_Baud_Rate_Prescaler;
      First_Bit           : SPI_First_Bit;
      CRC_Poly            : UInt32;
   end record;

   procedure Configure (This : in out SPI_Port; Conf : SPI_Configuration);

   procedure Enable (This : in out SPI_Port);

   procedure Disable (This : in out SPI_Port);

   function Enabled (This : SPI_Port) return Boolean;

   procedure Send (This : in out SPI_Port; Data : UInt32);

   procedure Send (This : in out SPI_Port; Data : UInt16);

   procedure Send (This : in out SPI_Port; Data : UInt8);

   function Data_Tx (This : SPI_Port) return UInt32
     with Inline;

   function Data_Rx (This : SPI_Port) return UInt32
     with Inline;

   function Is_Busy (This : SPI_Port) return Boolean
     with Inline;

   function Rx_Is_Empty (This : SPI_Port) return Boolean
     with Inline;

   function Tx_Is_Empty (This : SPI_Port) return Boolean
     with Inline;

   function Busy (This : SPI_Port) return Boolean
     with Inline;

   function Underrun_Indicated (This : SPI_Port) return Boolean
     with Inline;

   function CRC_Error_Indicated (This : SPI_Port) return Boolean
     with Inline;

   function Mode_Fault_Indicated (This : SPI_Port) return Boolean
     with Inline;

   function Overrun_Indicated (This : SPI_Port) return Boolean
     with Inline;

   function Frame_Fmt_Error_Indicated (This : SPI_Port) return Boolean
     with Inline;

   procedure Clear_Overrun (This : SPI_Port);

   procedure Configure_CRC
     (This   : SPI_Port;
      Size   : HAL.SPI.SPI_Data_Size := HAL.SPI.Data_Size_8b;
      Poly   : UInt32 := 16#107#);
   --  The default 9-bit polynomial setting 0x107 corresponds to default 8-bit
   --  setting of DSIZE. It is compatible with setting 0x07 used at some other
   --  ST products with fixed length of the polynomial string where the most
   --  significant bit of the string is always kept hidden.
   --  Length of the polynomial is given by the most significant bit of the
   --  value stored at this register. It has to be set greater than DSIZE.
   --  CRC33_17 bit has to be set additionally with SRCPOLY register when DSIZE
   --  is configured to maximum 32-bit or 16-bit size and CRC is enabled (to
   --  keep polynomial length grater than data size).

   function CRC_Enabled (This : SPI_Port) return Boolean;

   procedure Reset_CRC (This : in out SPI_Port);

   function Is_Data_Frame_32bit (This : SPI_Port) return Boolean;

   function Is_Data_Frame_16bit (This : SPI_Port) return Boolean;

   function Current_Mode (This : SPI_Port) return SPI_Mode;

   function Current_Data_Direction (This : SPI_Port) return SPI_Data_Direction;

   --  The following I/O routines implement the higher level functionality for
   --  CRC and data direction, among others.

   type UInt8_Buffer is array (Natural range <>) of UInt8
     with Alignment => 4;
   --  The alignment is set to 4 because we treat four components as word
   --  values when sending/receiving in 32-bit mode, so the alignment of 4
   --  ensures that the address is divisible by 4.

   --  Blocking

   overriding
   function Data_Size (This : SPI_Port) return HAL.SPI.SPI_Data_Size;

   overriding
   procedure Transmit
     (This   : in out SPI_Port;
      Data   : HAL.SPI.SPI_Data_8b;
      Status : out HAL.SPI.SPI_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Transmit
     (This   : in out SPI_Port;
      Data   : HAL.SPI.SPI_Data_16b;
      Status : out HAL.SPI.SPI_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Transmit
     (This   : in out SPI_Port;
      Data   : HAL.SPI.SPI_Data_32b;
      Status : out HAL.SPI.SPI_Status;
      Timeout : Natural := 1000);

   procedure Transmit
     (This     : in out SPI_Port;
      Outgoing : UInt8);

   overriding
   procedure Receive
     (This    : in out SPI_Port;
      Data    : out HAL.SPI.SPI_Data_8b;
      Status  : out HAL.SPI.SPI_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Receive
     (This    : in out SPI_Port;
      Data    : out HAL.SPI.SPI_Data_16b;
      Status  : out HAL.SPI.SPI_Status;
      Timeout : Natural := 1000);

   overriding
   procedure Receive
     (This    : in out SPI_Port;
      Data    : out HAL.SPI.SPI_Data_32b;
      Status  : out HAL.SPI.SPI_Status;
      Timeout : Natural := 1000);

   procedure Receive
     (This     : in out SPI_Port;
      Incoming : out UInt8);

   procedure Transmit_Receive
     (This      : in out SPI_Port;
      Outgoing  : UInt8_Buffer;
      Incoming  : out UInt8_Buffer;
      Size      : Positive);

   procedure Transmit_Receive
     (This      : in out SPI_Port;
      Outgoing  : UInt8;
      Incoming  : out UInt8);

   --  TODO: add the other higher-level HAL routines for interrupts and DMA

   function Data_Tx_Register_Address
     (This : SPI_Port)
      return System.Address;
   --  For DMA transfer

   function Data_Rx_Register_Address
     (This : SPI_Port)
      return System.Address;
   --  For DMA transfer

private

   type Internal_SPI_Port is new STM32_SVD.SPI.SPI_Peripheral;

   type SPI_Port (Periph : not null access Internal_SPI_Port) is
     limited new HAL.SPI.SPI_Port with null record;

   procedure Send_Receive_32bit_Mode
     (This     : in out SPI_Port;
      Outgoing : UInt8_Buffer;
      Incoming : out UInt8_Buffer;
      Size     : Positive);

   procedure Send_Receive_16bit_Mode
     (This     : in out SPI_Port;
      Outgoing : UInt8_Buffer;
      Incoming : out UInt8_Buffer;
      Size     : Positive);

   procedure Send_Receive_8bit_Mode
     (This     : in out SPI_Port;
      Outgoing : UInt8_Buffer;
      Incoming : out UInt8_Buffer;
      Size     : Positive);

   procedure Send_32bit_Mode
     (This     : in out SPI_Port;
      Outgoing : HAL.SPI.SPI_Data_32b);

   procedure Send_16bit_Mode
     (This     : in out SPI_Port;
      Outgoing : HAL.SPI.SPI_Data_16b);

   procedure Send_8bit_Mode
     (This     : in out SPI_Port;
      Outgoing : HAL.SPI.SPI_Data_8b);

   procedure Receive_32bit_Mode
     (This     : in out SPI_Port;
      Incoming : out HAL.SPI.SPI_Data_32b);

   procedure Receive_16bit_Mode
     (This     : in out SPI_Port;
      Incoming : out HAL.SPI.SPI_Data_16b);

   procedure Receive_8bit_Mode
     (This     : in out SPI_Port;
      Incoming : out HAL.SPI.SPI_Data_8b);

end STM32.SPI;
