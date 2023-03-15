/****************************************************************************
 *                                                                          *
 *                         GNAT COMPILER COMPONENTS                         *
 *                                                                          *
 *                                  A R M                                   *
 *                                                                          *
 *                            Linker Script File                            *
 *                                                                          *
 *      Copyright (C) 1999-2002 Universidad Politecnica de Madrid           *
 *             Copyright (C) 2003-2006 The European Space Agency            *
 *                   Copyright (C) 2003-2015 AdaCore                        *
 *                                                                          *
 * GNAT is free software;  you can  redistribute it  and/or modify it under *
 * terms of the  GNU General Public License as published  by the Free Soft- *
 * ware  Foundation;  either version 2,  or (at your option) any later ver- *
 * sion.  GNAT is distributed in the hope that it will be useful, but WITH- *
 * OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY *
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License *
 * for  more details.  You should have  received  a copy of the GNU General *
 * Public License  distributed with GNAT;  see file COPYING.  If not, write *
 * to  the  Free Software Foundation,  51  Franklin  Street,  Fifth  Floor, *
 * Boston, MA 02110-1301, USA.                                              *
 *                                                                          *
 * As a  special  exception,  if you  link  this file  with other  files to *
 * produce an executable,  this file does not by itself cause the resulting *
 * executable to be covered by the GNU General Public License. This except- *
 * ion does not  however invalidate  any other reasons  why the  executable *
 * file might be covered by the  GNU Public License.                        *
 *                                                                          *
 * GNARL was developed by the GNARL team at Florida State University.       *
 * Extensive contributions were provided by Ada Core Technologies, Inc.     *
 * The  executive  was developed  by the  Real-Time  Systems  Group  at the *
 * Technical University of Madrid.                                          *
 *                                                                          *
 ****************************************************************************/

/* Entry Point */
ENTRY(Reset_Handler)

/* Highest address of the user mode stack */
_estack = 0x20020000;    /* end of RAM */
/* Generate a link error if heap and stack don't fit into RAM */
_Min_Heap_Size = 0x200;      /* required amount of heap  */
_Min_Stack_Size = 0x400; /* required amount of stack */

/* Specify the memory areas:
 *
 * Device                  | Memory type | Syze | Address start
 * ------------------------------------------------------------
 * STM32H750xB             | FLASH       | 128K | 0x0800 0000
 * STM32H742xI/743xI/753xI | FLASH       | 2M   | 0x0800 0000
 * STM32H742xG/743xG       | FLASH       | 512k | 0x0800 0000
 *                         |             | 512k | 0x0810 0000
 * See RM0433 Table 7 in section 2.3.2 and Table 14 to 16 in section 4.3.4 */

MEMORY
{
FLASH (rx)     : ORIGIN = 0x08000000, LENGTH = 2048K /* Flash memory */
ITCM (xrw)     : ORIGIN = 0x00000000, LENGTH = 64K /* ITCM */
DTCM (xrw)     : ORIGIN = 0x20000000, LENGTH = 128K /* DTCM */
SRAM_AXI (xrw) : ORIGIN = 0x24000000, LENGTH = 512K /*  AXI SRAM */
SRAM123 (xrw)  : ORIGIN = 0x30000000, LENGTH = 288K /* SRAM 1,2 and 3 */
SRAM4 (xrw)    : ORIGIN = 0x38000000, LENGTH = 64K /* SRAM4 */
RAM_BKP (xrw)  : ORIGIN = 0x38800000, LENGTH = 4K /* Backup SRAM */
}

/* Do not place anything into the dtcm as it is used as Data cache by the CPU*/
REGION_ALIAS("flash",   FLASH)
REGION_ALIAS("itcm",    ITCM)
REGION_ALIAS("dtcm",    DTCM)
REGION_ALIAS("sram_bs", SRAM_AXI)
REGION_ALIAS("sram_da", SRAM_AXI)
REGION_ALIAS("sram_tx", SRAM_AXI)
REGION_ALIAS("sram_ro", SRAM_AXI)
REGION_ALIAS("ccm_da",  DTCM)
REGION_ALIAS("sram_bkp", RAM_BKP)

