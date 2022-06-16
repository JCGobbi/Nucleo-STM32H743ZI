--
--  Copyright (C) 2022, AdaCore
--

pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32H743x.svd


with System;

package Interfaces.STM32.Flash is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype ACR_LATENCY_Field is Interfaces.STM32.UInt4;
   subtype ACR_WRHIGHFREQ_Field is Interfaces.STM32.UInt2;

   --  Access control register
   type ACR_Register is record
      --  Read latency
      LATENCY       : ACR_LATENCY_Field := 16#0#;
      --  Flash signal delay
      WRHIGHFREQ    : ACR_WRHIGHFREQ_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : Interfaces.STM32.UInt26 := 16#18#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ACR_Register use record
      LATENCY       at 0 range 0 .. 3;
      WRHIGHFREQ    at 0 range 4 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype CR1_LOCK1_Field is Interfaces.STM32.Bit;
   subtype CR1_PG1_Field is Interfaces.STM32.Bit;
   subtype CR1_SER1_Field is Interfaces.STM32.Bit;
   subtype CR1_BER1_Field is Interfaces.STM32.Bit;
   subtype CR1_PSIZE1_Field is Interfaces.STM32.UInt2;
   subtype CR1_FW1_Field is Interfaces.STM32.Bit;
   subtype CR1_START1_Field is Interfaces.STM32.Bit;
   subtype CR1_SNB1_Field is Interfaces.STM32.UInt3;
   subtype CR1_CRC_EN_Field is Interfaces.STM32.Bit;
   subtype CR1_EOPIE1_Field is Interfaces.STM32.Bit;
   subtype CR1_WRPERRIE1_Field is Interfaces.STM32.Bit;
   subtype CR1_PGSERRIE1_Field is Interfaces.STM32.Bit;
   subtype CR1_STRBERRIE1_Field is Interfaces.STM32.Bit;
   subtype CR1_INCERRIE1_Field is Interfaces.STM32.Bit;
   subtype CR1_OPERRIE1_Field is Interfaces.STM32.Bit;
   subtype CR1_RDPERRIE1_Field is Interfaces.STM32.Bit;
   subtype CR1_RDSERRIE1_Field is Interfaces.STM32.Bit;
   subtype CR1_SNECCERRIE1_Field is Interfaces.STM32.Bit;
   subtype CR1_DBECCERRIE1_Field is Interfaces.STM32.Bit;
   subtype CR1_CRCENDIE1_Field is Interfaces.STM32.Bit;

   --  FLASH control register for bank 1
   type CR1_Register is record
      --  Bank 1 configuration lock bit
      LOCK1          : CR1_LOCK1_Field := 16#0#;
      --  Bank 1 program enable bit
      PG1            : CR1_PG1_Field := 16#0#;
      --  Bank 1 sector erase request
      SER1           : CR1_SER1_Field := 16#0#;
      --  Bank 1 erase request
      BER1           : CR1_BER1_Field := 16#0#;
      --  Bank 1 program size
      PSIZE1         : CR1_PSIZE1_Field := 16#0#;
      --  Bank 1 write forcing control bit
      FW1            : CR1_FW1_Field := 16#0#;
      --  Bank 1 bank or sector erase start control bit
      START1         : CR1_START1_Field := 16#0#;
      --  Bank 1 sector erase selection number
      SNB1           : CR1_SNB1_Field := 16#0#;
      --  unspecified
      Reserved_11_14 : Interfaces.STM32.UInt4 := 16#0#;
      --  Bank 1 CRC control bit
      CRC_EN         : CR1_CRC_EN_Field := 16#0#;
      --  Bank 1 end-of-program interrupt control bit
      EOPIE1         : CR1_EOPIE1_Field := 16#0#;
      --  Bank 1 write protection error interrupt enable bit
      WRPERRIE1      : CR1_WRPERRIE1_Field := 16#0#;
      --  Bank 1 programming sequence error interrupt enable bit
      PGSERRIE1      : CR1_PGSERRIE1_Field := 16#0#;
      --  Bank 1 strobe error interrupt enable bit
      STRBERRIE1     : CR1_STRBERRIE1_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#0#;
      --  Bank 1 inconsistency error interrupt enable bit
      INCERRIE1      : CR1_INCERRIE1_Field := 16#0#;
      --  Bank 1 write/erase error interrupt enable bit
      OPERRIE1       : CR1_OPERRIE1_Field := 16#0#;
      --  Bank 1 read protection error interrupt enable bit
      RDPERRIE1      : CR1_RDPERRIE1_Field := 16#0#;
      --  Bank 1 secure error interrupt enable bit
      RDSERRIE1      : CR1_RDSERRIE1_Field := 16#0#;
      --  Bank 1 ECC single correction error interrupt enable bit
      SNECCERRIE1    : CR1_SNECCERRIE1_Field := 16#0#;
      --  Bank 1 ECC double detection error interrupt enable bit
      DBECCERRIE1    : CR1_DBECCERRIE1_Field := 16#0#;
      --  Bank 1 end of CRC calculation interrupt enable bit
      CRCENDIE1      : CR1_CRCENDIE1_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.STM32.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      LOCK1          at 0 range 0 .. 0;
      PG1            at 0 range 1 .. 1;
      SER1           at 0 range 2 .. 2;
      BER1           at 0 range 3 .. 3;
      PSIZE1         at 0 range 4 .. 5;
      FW1            at 0 range 6 .. 6;
      START1         at 0 range 7 .. 7;
      SNB1           at 0 range 8 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      CRC_EN         at 0 range 15 .. 15;
      EOPIE1         at 0 range 16 .. 16;
      WRPERRIE1      at 0 range 17 .. 17;
      PGSERRIE1      at 0 range 18 .. 18;
      STRBERRIE1     at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      INCERRIE1      at 0 range 21 .. 21;
      OPERRIE1       at 0 range 22 .. 22;
      RDPERRIE1      at 0 range 23 .. 23;
      RDSERRIE1      at 0 range 24 .. 24;
      SNECCERRIE1    at 0 range 25 .. 25;
      DBECCERRIE1    at 0 range 26 .. 26;
      CRCENDIE1      at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype SR1_BSY1_Field is Interfaces.STM32.Bit;
   subtype SR1_WBNE1_Field is Interfaces.STM32.Bit;
   subtype SR1_QW1_Field is Interfaces.STM32.Bit;
   subtype SR1_CRC_BUSY1_Field is Interfaces.STM32.Bit;
   subtype SR1_EOP1_Field is Interfaces.STM32.Bit;
   subtype SR1_WRPERR1_Field is Interfaces.STM32.Bit;
   subtype SR1_PGSERR1_Field is Interfaces.STM32.Bit;
   subtype SR1_STRBERR1_Field is Interfaces.STM32.Bit;
   subtype SR1_INCERR1_Field is Interfaces.STM32.Bit;
   subtype SR1_OPERR1_Field is Interfaces.STM32.Bit;
   subtype SR1_RDPERR1_Field is Interfaces.STM32.Bit;
   subtype SR1_RDSERR1_Field is Interfaces.STM32.Bit;
   subtype SR1_SNECCERR11_Field is Interfaces.STM32.Bit;
   subtype SR1_DBECCERR1_Field is Interfaces.STM32.Bit;
   subtype SR1_CRCEND1_Field is Interfaces.STM32.Bit;

   --  FLASH status register for bank 1
   type SR1_Register is record
      --  Bank 1 ongoing program flag
      BSY1           : SR1_BSY1_Field := 16#0#;
      --  Bank 1 write buffer not empty flag
      WBNE1          : SR1_WBNE1_Field := 16#0#;
      --  Bank 1 wait queue flag
      QW1            : SR1_QW1_Field := 16#0#;
      --  Bank 1 CRC busy flag
      CRC_BUSY1      : SR1_CRC_BUSY1_Field := 16#0#;
      --  unspecified
      Reserved_4_15  : Interfaces.STM32.UInt12 := 16#0#;
      --  Bank 1 end-of-program flag
      EOP1           : SR1_EOP1_Field := 16#0#;
      --  Bank 1 write protection error flag
      WRPERR1        : SR1_WRPERR1_Field := 16#0#;
      --  Bank 1 programming sequence error flag
      PGSERR1        : SR1_PGSERR1_Field := 16#0#;
      --  Bank 1 strobe error flag
      STRBERR1       : SR1_STRBERR1_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#0#;
      --  Bank 1 inconsistency error flag
      INCERR1        : SR1_INCERR1_Field := 16#0#;
      --  Bank 1 write/erase error flag
      OPERR1         : SR1_OPERR1_Field := 16#0#;
      --  Bank 1 read protection error flag
      RDPERR1        : SR1_RDPERR1_Field := 16#0#;
      --  Bank 1 secure error flag
      RDSERR1        : SR1_RDSERR1_Field := 16#0#;
      --  Bank 1 single correction error flag
      SNECCERR11     : SR1_SNECCERR11_Field := 16#0#;
      --  Bank 1 ECC double detection error flag
      DBECCERR1      : SR1_DBECCERR1_Field := 16#0#;
      --  Bank 1 CRC-complete flag
      CRCEND1        : SR1_CRCEND1_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.STM32.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR1_Register use record
      BSY1           at 0 range 0 .. 0;
      WBNE1          at 0 range 1 .. 1;
      QW1            at 0 range 2 .. 2;
      CRC_BUSY1      at 0 range 3 .. 3;
      Reserved_4_15  at 0 range 4 .. 15;
      EOP1           at 0 range 16 .. 16;
      WRPERR1        at 0 range 17 .. 17;
      PGSERR1        at 0 range 18 .. 18;
      STRBERR1       at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      INCERR1        at 0 range 21 .. 21;
      OPERR1         at 0 range 22 .. 22;
      RDPERR1        at 0 range 23 .. 23;
      RDSERR1        at 0 range 24 .. 24;
      SNECCERR11     at 0 range 25 .. 25;
      DBECCERR1      at 0 range 26 .. 26;
      CRCEND1        at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype CCR1_CLR_EOP1_Field is Interfaces.STM32.Bit;
   subtype CCR1_CLR_WRPERR1_Field is Interfaces.STM32.Bit;
   subtype CCR1_CLR_PGSERR1_Field is Interfaces.STM32.Bit;
   subtype CCR1_CLR_STRBERR1_Field is Interfaces.STM32.Bit;
   subtype CCR1_CLR_INCERR1_Field is Interfaces.STM32.Bit;
   subtype CCR1_CLR_OPERR1_Field is Interfaces.STM32.Bit;
   subtype CCR1_CLR_RDPERR1_Field is Interfaces.STM32.Bit;
   subtype CCR1_CLR_RDSERR1_Field is Interfaces.STM32.Bit;
   subtype CCR1_CLR_SNECCERR1_Field is Interfaces.STM32.Bit;
   subtype CCR1_CLR_DBECCERR1_Field is Interfaces.STM32.Bit;
   subtype CCR1_CLR_CRCEND1_Field is Interfaces.STM32.Bit;

   --  FLASH clear control register for bank 1
   type CCR1_Register is record
      --  unspecified
      Reserved_0_15  : Interfaces.STM32.UInt16 := 16#0#;
      --  Bank 1 EOP1 flag clear bit
      CLR_EOP1       : CCR1_CLR_EOP1_Field := 16#0#;
      --  Bank 1 WRPERR1 flag clear bit
      CLR_WRPERR1    : CCR1_CLR_WRPERR1_Field := 16#0#;
      --  Bank 1 PGSERR1 flag clear bi
      CLR_PGSERR1    : CCR1_CLR_PGSERR1_Field := 16#0#;
      --  Bank 1 STRBERR1 flag clear bit
      CLR_STRBERR1   : CCR1_CLR_STRBERR1_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#0#;
      --  Bank 1 INCERR1 flag clear bit
      CLR_INCERR1    : CCR1_CLR_INCERR1_Field := 16#0#;
      --  Bank 1 OPERR1 flag clear bit
      CLR_OPERR1     : CCR1_CLR_OPERR1_Field := 16#0#;
      --  Bank 1 RDPERR1 flag clear bit
      CLR_RDPERR1    : CCR1_CLR_RDPERR1_Field := 16#0#;
      --  Bank 1 RDSERR1 flag clear bit
      CLR_RDSERR1    : CCR1_CLR_RDSERR1_Field := 16#0#;
      --  Bank 1 SNECCERR1 flag clear bit
      CLR_SNECCERR1  : CCR1_CLR_SNECCERR1_Field := 16#0#;
      --  Bank 1 DBECCERR1 flag clear bit
      CLR_DBECCERR1  : CCR1_CLR_DBECCERR1_Field := 16#0#;
      --  Bank 1 CRCEND1 flag clear bit
      CLR_CRCEND1    : CCR1_CLR_CRCEND1_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.STM32.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR1_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      CLR_EOP1       at 0 range 16 .. 16;
      CLR_WRPERR1    at 0 range 17 .. 17;
      CLR_PGSERR1    at 0 range 18 .. 18;
      CLR_STRBERR1   at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      CLR_INCERR1    at 0 range 21 .. 21;
      CLR_OPERR1     at 0 range 22 .. 22;
      CLR_RDPERR1    at 0 range 23 .. 23;
      CLR_RDSERR1    at 0 range 24 .. 24;
      CLR_SNECCERR1  at 0 range 25 .. 25;
      CLR_DBECCERR1  at 0 range 26 .. 26;
      CLR_CRCEND1    at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype OPTCR_OPTLOCK_Field is Interfaces.STM32.Bit;
   subtype OPTCR_OPTSTART_Field is Interfaces.STM32.Bit;
   subtype OPTCR_MER_Field is Interfaces.STM32.Bit;
   subtype OPTCR_OPTCHANGEERRIE_Field is Interfaces.STM32.Bit;
   subtype OPTCR_SWAP_BANK_Field is Interfaces.STM32.Bit;

   --  FLASH option control register
   type OPTCR_Register is record
      --  FLASH_OPTCR lock option configuration bit
      OPTLOCK        : OPTCR_OPTLOCK_Field := 16#0#;
      --  Option byte start change option configuration bit
      OPTSTART       : OPTCR_OPTSTART_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : Interfaces.STM32.UInt2 := 16#0#;
      --  Flash mass erase enable bit
      MER            : OPTCR_MER_Field := 16#0#;
      --  unspecified
      Reserved_5_29  : Interfaces.STM32.UInt25 := 16#0#;
      --  Option byte change error interrupt enable bit
      OPTCHANGEERRIE : OPTCR_OPTCHANGEERRIE_Field := 16#0#;
      --  Bank swapping configuration bit
      SWAP_BANK      : OPTCR_SWAP_BANK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPTCR_Register use record
      OPTLOCK        at 0 range 0 .. 0;
      OPTSTART       at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      MER            at 0 range 4 .. 4;
      Reserved_5_29  at 0 range 5 .. 29;
      OPTCHANGEERRIE at 0 range 30 .. 30;
      SWAP_BANK      at 0 range 31 .. 31;
   end record;

   subtype OPTSR_CUR_OPT_BUSY_Field is Interfaces.STM32.Bit;
   subtype OPTSR_CUR_BOR_LEV_Field is Interfaces.STM32.UInt2;
   subtype OPTSR_CUR_IWDG1_HW_Field is Interfaces.STM32.Bit;
   subtype OPTSR_CUR_nRST_STOP_D1_Field is Interfaces.STM32.Bit;
   subtype OPTSR_CUR_nRST_STBY_D1_Field is Interfaces.STM32.Bit;
   subtype OPTSR_CUR_RDP_Field is Interfaces.STM32.Byte;
   subtype OPTSR_CUR_FZ_IWDG_STOP_Field is Interfaces.STM32.Bit;
   subtype OPTSR_CUR_FZ_IWDG_SDBY_Field is Interfaces.STM32.Bit;
   subtype OPTSR_CUR_ST_RAM_SIZE_Field is Interfaces.STM32.UInt2;
   subtype OPTSR_CUR_SECURITY_Field is Interfaces.STM32.Bit;
   subtype OPTSR_CUR_RSS1_Field is Interfaces.STM32.Bit;
   subtype OPTSR_CUR_PERSO_OK_Field is Interfaces.STM32.Bit;
   subtype OPTSR_CUR_IO_HSLV_Field is Interfaces.STM32.Bit;
   subtype OPTSR_CUR_OPTCHANGEERR_Field is Interfaces.STM32.Bit;
   subtype OPTSR_CUR_SWAP_BANK_OPT_Field is Interfaces.STM32.Bit;

   --  FLASH option status register
   type OPTSR_CUR_Register is record
      --  Option byte change ongoing flag
      OPT_BUSY       : OPTSR_CUR_OPT_BUSY_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : Interfaces.STM32.Bit := 16#0#;
      --  Brownout level option status bit
      BOR_LEV        : OPTSR_CUR_BOR_LEV_Field := 16#0#;
      --  IWDG1 control option status bit
      IWDG1_HW       : OPTSR_CUR_IWDG1_HW_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : Interfaces.STM32.Bit := 16#0#;
      --  D1 DStop entry reset option status bit
      nRST_STOP_D1   : OPTSR_CUR_nRST_STOP_D1_Field := 16#0#;
      --  D1 DStandby entry reset option status bit
      nRST_STBY_D1   : OPTSR_CUR_nRST_STBY_D1_Field := 16#0#;
      --  Readout protection level option status byte
      RDP            : OPTSR_CUR_RDP_Field := 16#0#;
      --  unspecified
      Reserved_16_16 : Interfaces.STM32.Bit := 16#0#;
      --  IWDG Stop mode freeze option status bit
      FZ_IWDG_STOP   : OPTSR_CUR_FZ_IWDG_STOP_Field := 16#0#;
      --  IWDG Standby mode freeze option status bit
      FZ_IWDG_SDBY   : OPTSR_CUR_FZ_IWDG_SDBY_Field := 16#0#;
      --  DTCM RAM size option status
      ST_RAM_SIZE    : OPTSR_CUR_ST_RAM_SIZE_Field := 16#0#;
      --  Security enable option status bit
      SECURITY       : OPTSR_CUR_SECURITY_Field := 16#0#;
      --  unspecified
      Reserved_22_25 : Interfaces.STM32.UInt4 := 16#0#;
      --  User option bit 1
      RSS1           : OPTSR_CUR_RSS1_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : Interfaces.STM32.Bit := 16#0#;
      --  Device personalization status bit
      PERSO_OK       : OPTSR_CUR_PERSO_OK_Field := 16#0#;
      --  I/O high-speed at low-voltage status bit (PRODUCT_BELOW_25V)
      IO_HSLV        : OPTSR_CUR_IO_HSLV_Field := 16#0#;
      --  Option byte change error flag
      OPTCHANGEERR   : OPTSR_CUR_OPTCHANGEERR_Field := 16#0#;
      --  Bank swapping option status bit
      SWAP_BANK_OPT  : OPTSR_CUR_SWAP_BANK_OPT_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPTSR_CUR_Register use record
      OPT_BUSY       at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      BOR_LEV        at 0 range 2 .. 3;
      IWDG1_HW       at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      nRST_STOP_D1   at 0 range 6 .. 6;
      nRST_STBY_D1   at 0 range 7 .. 7;
      RDP            at 0 range 8 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      FZ_IWDG_STOP   at 0 range 17 .. 17;
      FZ_IWDG_SDBY   at 0 range 18 .. 18;
      ST_RAM_SIZE    at 0 range 19 .. 20;
      SECURITY       at 0 range 21 .. 21;
      Reserved_22_25 at 0 range 22 .. 25;
      RSS1           at 0 range 26 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      PERSO_OK       at 0 range 28 .. 28;
      IO_HSLV        at 0 range 29 .. 29;
      OPTCHANGEERR   at 0 range 30 .. 30;
      SWAP_BANK_OPT  at 0 range 31 .. 31;
   end record;

   subtype OPTSR_PRG_BOR_LEV_Field is Interfaces.STM32.UInt2;
   subtype OPTSR_PRG_IWDG1_HW_Field is Interfaces.STM32.Bit;
   subtype OPTSR_PRG_nRST_STOP_D1_Field is Interfaces.STM32.Bit;
   subtype OPTSR_PRG_nRST_STBY_D1_Field is Interfaces.STM32.Bit;
   subtype OPTSR_PRG_RDP_Field is Interfaces.STM32.Byte;
   subtype OPTSR_PRG_FZ_IWDG_STOP_Field is Interfaces.STM32.Bit;
   subtype OPTSR_PRG_FZ_IWDG_SDBY_Field is Interfaces.STM32.Bit;
   subtype OPTSR_PRG_ST_RAM_SIZE_Field is Interfaces.STM32.UInt2;
   subtype OPTSR_PRG_SECURITY_Field is Interfaces.STM32.Bit;
   --  OPTSR_PRG_RSS array element
   subtype OPTSR_PRG_RSS_Element is Interfaces.STM32.Bit;

   --  OPTSR_PRG_RSS array
   type OPTSR_PRG_RSS_Field_Array is array (1 .. 2) of OPTSR_PRG_RSS_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for OPTSR_PRG_RSS
   type OPTSR_PRG_RSS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RSS as a value
            Val : Interfaces.STM32.UInt2;
         when True =>
            --  RSS as an array
            Arr : OPTSR_PRG_RSS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for OPTSR_PRG_RSS_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype OPTSR_PRG_IO_HSLV_Field is Interfaces.STM32.Bit;
   subtype OPTSR_PRG_SWAP_BANK_OPT_Field is Interfaces.STM32.Bit;

   --  FLASH option status register
   type OPTSR_PRG_Register is record
      --  unspecified
      Reserved_0_1   : Interfaces.STM32.UInt2 := 16#0#;
      --  BOR reset level option configuration bits
      BOR_LEV        : OPTSR_PRG_BOR_LEV_Field := 16#0#;
      --  IWDG1 option configuration bit
      IWDG1_HW       : OPTSR_PRG_IWDG1_HW_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : Interfaces.STM32.Bit := 16#0#;
      --  Option byte erase after D1 DStop option configuration bit
      nRST_STOP_D1   : OPTSR_PRG_nRST_STOP_D1_Field := 16#0#;
      --  Option byte erase after D1 DStandby option configuration bit
      nRST_STBY_D1   : OPTSR_PRG_nRST_STBY_D1_Field := 16#0#;
      --  Readout protection level option configuration byte
      RDP            : OPTSR_PRG_RDP_Field := 16#0#;
      --  unspecified
      Reserved_16_16 : Interfaces.STM32.Bit := 16#0#;
      --  IWDG Stop mode freeze option configuration bit
      FZ_IWDG_STOP   : OPTSR_PRG_FZ_IWDG_STOP_Field := 16#0#;
      --  IWDG Standby mode freeze option configuration bit
      FZ_IWDG_SDBY   : OPTSR_PRG_FZ_IWDG_SDBY_Field := 16#0#;
      --  DTCM size select option configuration bits
      ST_RAM_SIZE    : OPTSR_PRG_ST_RAM_SIZE_Field := 16#0#;
      --  Security option configuration bit
      SECURITY       : OPTSR_PRG_SECURITY_Field := 16#0#;
      --  unspecified
      Reserved_22_25 : Interfaces.STM32.UInt4 := 16#0#;
      --  User option configuration bit 1
      RSS            : OPTSR_PRG_RSS_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_28_28 : Interfaces.STM32.Bit := 16#0#;
      --  I/O high-speed at low-voltage (PRODUCT_BELOW_25V)
      IO_HSLV        : OPTSR_PRG_IO_HSLV_Field := 16#0#;
      --  unspecified
      Reserved_30_30 : Interfaces.STM32.Bit := 16#0#;
      --  Bank swapping option configuration bit
      SWAP_BANK_OPT  : OPTSR_PRG_SWAP_BANK_OPT_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPTSR_PRG_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      BOR_LEV        at 0 range 2 .. 3;
      IWDG1_HW       at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      nRST_STOP_D1   at 0 range 6 .. 6;
      nRST_STBY_D1   at 0 range 7 .. 7;
      RDP            at 0 range 8 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      FZ_IWDG_STOP   at 0 range 17 .. 17;
      FZ_IWDG_SDBY   at 0 range 18 .. 18;
      ST_RAM_SIZE    at 0 range 19 .. 20;
      SECURITY       at 0 range 21 .. 21;
      Reserved_22_25 at 0 range 22 .. 25;
      RSS            at 0 range 26 .. 27;
      Reserved_28_28 at 0 range 28 .. 28;
      IO_HSLV        at 0 range 29 .. 29;
      Reserved_30_30 at 0 range 30 .. 30;
      SWAP_BANK_OPT  at 0 range 31 .. 31;
   end record;

   subtype OPTCCR_CLR_OPTCHANGEERR_Field is Interfaces.STM32.Bit;

   --  FLASH option clear control register
   type OPTCCR_Register is record
      --  unspecified
      Reserved_0_29    : Interfaces.STM32.UInt30 := 16#0#;
      --  Write-only. OPTCHANGEERR reset bit
      CLR_OPTCHANGEERR : OPTCCR_CLR_OPTCHANGEERR_Field := 16#0#;
      --  unspecified
      Reserved_31_31   : Interfaces.STM32.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPTCCR_Register use record
      Reserved_0_29    at 0 range 0 .. 29;
      CLR_OPTCHANGEERR at 0 range 30 .. 30;
      Reserved_31_31   at 0 range 31 .. 31;
   end record;

   subtype PRAR_CUR1_PROT_AREA_START1_Field is Interfaces.STM32.UInt12;
   subtype PRAR_CUR1_PROT_AREA_END1_Field is Interfaces.STM32.UInt12;
   subtype PRAR_CUR1_DMEP1_Field is Interfaces.STM32.Bit;

   --  FLASH protection address for bank 1
   type PRAR_CUR1_Register is record
      --  Read-only. Bank 1 lowest PCROP protected address
      PROT_AREA_START1 : PRAR_CUR1_PROT_AREA_START1_Field;
      --  unspecified
      Reserved_12_15   : Interfaces.STM32.UInt4;
      --  Read-only. Bank 1 highest PCROP protected address
      PROT_AREA_END1   : PRAR_CUR1_PROT_AREA_END1_Field;
      --  unspecified
      Reserved_28_30   : Interfaces.STM32.UInt3;
      --  Read-only. Bank 1 PCROP protected erase enable option status bit
      DMEP1            : PRAR_CUR1_DMEP1_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRAR_CUR1_Register use record
      PROT_AREA_START1 at 0 range 0 .. 11;
      Reserved_12_15   at 0 range 12 .. 15;
      PROT_AREA_END1   at 0 range 16 .. 27;
      Reserved_28_30   at 0 range 28 .. 30;
      DMEP1            at 0 range 31 .. 31;
   end record;

   subtype PRAR_PRG1_PROT_AREA_START1_Field is Interfaces.STM32.UInt12;
   subtype PRAR_PRG1_PROT_AREA_END1_Field is Interfaces.STM32.UInt12;
   subtype PRAR_PRG1_DMEP1_Field is Interfaces.STM32.Bit;

   --  FLASH protection address for bank 1
   type PRAR_PRG1_Register is record
      --  Bank 1 lowest PCROP protected address configuration
      PROT_AREA_START1 : PRAR_PRG1_PROT_AREA_START1_Field := 16#0#;
      --  unspecified
      Reserved_12_15   : Interfaces.STM32.UInt4 := 16#0#;
      --  Bank 1 highest PCROP protected address configuration
      PROT_AREA_END1   : PRAR_PRG1_PROT_AREA_END1_Field := 16#0#;
      --  unspecified
      Reserved_28_30   : Interfaces.STM32.UInt3 := 16#0#;
      --  Bank 1 PCROP protected erase enable option configuration bit
      DMEP1            : PRAR_PRG1_DMEP1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRAR_PRG1_Register use record
      PROT_AREA_START1 at 0 range 0 .. 11;
      Reserved_12_15   at 0 range 12 .. 15;
      PROT_AREA_END1   at 0 range 16 .. 27;
      Reserved_28_30   at 0 range 28 .. 30;
      DMEP1            at 0 range 31 .. 31;
   end record;

   subtype PRAR_PRG2_PROT_AREA_START2_Field is Interfaces.STM32.UInt12;
   subtype PRAR_PRG2_PROT_AREA_END2_Field is Interfaces.STM32.UInt12;
   subtype PRAR_PRG2_DMEP2_Field is Interfaces.STM32.Bit;

   --  FLASH protection address for bank 2
   type PRAR_PRG2_Register is record
      --  Bank 2 lowest PCROP protected address configuration
      PROT_AREA_START2 : PRAR_PRG2_PROT_AREA_START2_Field := 16#0#;
      --  unspecified
      Reserved_12_15   : Interfaces.STM32.UInt4 := 16#0#;
      --  Bank 2 highest PCROP protected address configuration
      PROT_AREA_END2   : PRAR_PRG2_PROT_AREA_END2_Field := 16#0#;
      --  unspecified
      Reserved_28_30   : Interfaces.STM32.UInt3 := 16#0#;
      --  Bank 2 PCROP protected erase enable option configuration bit
      DMEP2            : PRAR_PRG2_DMEP2_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRAR_PRG2_Register use record
      PROT_AREA_START2 at 0 range 0 .. 11;
      Reserved_12_15   at 0 range 12 .. 15;
      PROT_AREA_END2   at 0 range 16 .. 27;
      Reserved_28_30   at 0 range 28 .. 30;
      DMEP2            at 0 range 31 .. 31;
   end record;

   subtype SCAR_CUR1_SEC_AREA_START1_Field is Interfaces.STM32.UInt12;
   subtype SCAR_CUR1_SEC_AREA_END1_Field is Interfaces.STM32.UInt12;
   subtype SCAR_CUR1_DMES1_Field is Interfaces.STM32.Bit;

   --  FLASH secure address for bank 1
   type SCAR_CUR1_Register is record
      --  Bank 1 lowest secure protected address
      SEC_AREA_START1 : SCAR_CUR1_SEC_AREA_START1_Field := 16#0#;
      --  unspecified
      Reserved_12_15  : Interfaces.STM32.UInt4 := 16#0#;
      --  Bank 1 highest secure protected address
      SEC_AREA_END1   : SCAR_CUR1_SEC_AREA_END1_Field := 16#0#;
      --  unspecified
      Reserved_28_30  : Interfaces.STM32.UInt3 := 16#0#;
      --  Bank 1 secure protected erase enable option status bit
      DMES1           : SCAR_CUR1_DMES1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCAR_CUR1_Register use record
      SEC_AREA_START1 at 0 range 0 .. 11;
      Reserved_12_15  at 0 range 12 .. 15;
      SEC_AREA_END1   at 0 range 16 .. 27;
      Reserved_28_30  at 0 range 28 .. 30;
      DMES1           at 0 range 31 .. 31;
   end record;

   subtype SCAR_PRG1_SEC_AREA_START1_Field is Interfaces.STM32.UInt12;
   subtype SCAR_PRG1_SEC_AREA_END1_Field is Interfaces.STM32.UInt12;
   subtype SCAR_PRG1_DMES1_Field is Interfaces.STM32.Bit;

   --  FLASH secure address for bank 1
   type SCAR_PRG1_Register is record
      --  Bank 1 lowest secure protected address configuration
      SEC_AREA_START1 : SCAR_PRG1_SEC_AREA_START1_Field := 16#0#;
      --  unspecified
      Reserved_12_15  : Interfaces.STM32.UInt4 := 16#0#;
      --  Bank 1 highest secure protected address configuration
      SEC_AREA_END1   : SCAR_PRG1_SEC_AREA_END1_Field := 16#0#;
      --  unspecified
      Reserved_28_30  : Interfaces.STM32.UInt3 := 16#0#;
      --  Bank 1 secure protected erase enable option configuration bit
      DMES1           : SCAR_PRG1_DMES1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCAR_PRG1_Register use record
      SEC_AREA_START1 at 0 range 0 .. 11;
      Reserved_12_15  at 0 range 12 .. 15;
      SEC_AREA_END1   at 0 range 16 .. 27;
      Reserved_28_30  at 0 range 28 .. 30;
      DMES1           at 0 range 31 .. 31;
   end record;

   subtype WPSN_CUR1R_WRPSn1_Field is Interfaces.STM32.Byte;

   --  FLASH write sector protection for bank 1
   type WPSN_CUR1R_Register is record
      --  Read-only. Bank 1 sector write protection option status byte
      WRPSn1        : WPSN_CUR1R_WRPSn1_Field;
      --  unspecified
      Reserved_8_31 : Interfaces.STM32.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WPSN_CUR1R_Register use record
      WRPSn1        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype WPSN_PRG1R_WRPSn1_Field is Interfaces.STM32.Byte;

   --  FLASH write sector protection for bank 1
   type WPSN_PRG1R_Register is record
      --  Bank 1 sector write protection configuration byte
      WRPSn1        : WPSN_PRG1R_WRPSn1_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.STM32.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WPSN_PRG1R_Register use record
      WRPSn1        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  BOOT_CURR_BOOT_ADD array element
   subtype BOOT_CURR_BOOT_ADD_Element is Interfaces.STM32.UInt16;

   --  BOOT_CURR_BOOT_ADD array
   type BOOT_CURR_BOOT_ADD_Field_Array is array (0 .. 1)
     of BOOT_CURR_BOOT_ADD_Element
     with Component_Size => 16, Size => 32;

   --  FLASH register with boot address
   type BOOT_CURR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BOOT_ADD as a value
            Val : Interfaces.STM32.UInt32;
         when True =>
            --  BOOT_ADD as an array
            Arr : BOOT_CURR_BOOT_ADD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOT_CURR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  BOOT_PRGR_BOOT_ADD array element
   subtype BOOT_PRGR_BOOT_ADD_Element is Interfaces.STM32.UInt16;

   --  BOOT_PRGR_BOOT_ADD array
   type BOOT_PRGR_BOOT_ADD_Field_Array is array (0 .. 1)
     of BOOT_PRGR_BOOT_ADD_Element
     with Component_Size => 16, Size => 32;

   --  FLASH register with boot address
   type BOOT_PRGR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BOOT_ADD as a value
            Val : Interfaces.STM32.UInt32;
         when True =>
            --  BOOT_ADD as an array
            Arr : BOOT_PRGR_BOOT_ADD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BOOT_PRGR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   subtype CRCCR_CRC_SECT_Field is Interfaces.STM32.UInt3;
   subtype CRCCR_ALL_BANK_Field is Interfaces.STM32.Bit;
   subtype CRCCR_CRC_BY_SECT_Field is Interfaces.STM32.Bit;
   subtype CRCCR_ADD_SECT_Field is Interfaces.STM32.Bit;
   subtype CRCCR_CLEAN_SECT_Field is Interfaces.STM32.Bit;
   subtype CRCCR_START_CRC_Field is Interfaces.STM32.Bit;
   subtype CRCCR_CLEAN_CRC_Field is Interfaces.STM32.Bit;
   subtype CRCCR_CRC_BURST_Field is Interfaces.STM32.UInt2;

   --  FLASH CRC control register for bank 1
   type CRCCR_Register is record
      --  Bank 1 CRC sector number
      CRC_SECT       : CRCCR_CRC_SECT_Field := 16#0#;
      --  unspecified
      Reserved_3_6   : Interfaces.STM32.UInt4 := 16#0#;
      --  Bank 1 CRC select bit
      ALL_BANK       : CRCCR_ALL_BANK_Field := 16#0#;
      --  Bank 1 CRC sector mode select bit
      CRC_BY_SECT    : CRCCR_CRC_BY_SECT_Field := 16#0#;
      --  Bank 1 CRC sector select bit
      ADD_SECT       : CRCCR_ADD_SECT_Field := 16#0#;
      --  Bank 1 CRC sector list clear bit
      CLEAN_SECT     : CRCCR_CLEAN_SECT_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : Interfaces.STM32.UInt5 := 16#0#;
      --  Bank 1 CRC start bit
      START_CRC      : CRCCR_START_CRC_Field := 16#0#;
      --  Bank 1 CRC clear bit
      CLEAN_CRC      : CRCCR_CLEAN_CRC_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : Interfaces.STM32.UInt2 := 16#0#;
      --  Bank 1 CRC burst size
      CRC_BURST      : CRCCR_CRC_BURST_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.STM32.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRCCR_Register use record
      CRC_SECT       at 0 range 0 .. 2;
      Reserved_3_6   at 0 range 3 .. 6;
      ALL_BANK       at 0 range 7 .. 7;
      CRC_BY_SECT    at 0 range 8 .. 8;
      ADD_SECT       at 0 range 9 .. 9;
      CLEAN_SECT     at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      START_CRC      at 0 range 16 .. 16;
      CLEAN_CRC      at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      CRC_BURST      at 0 range 20 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype ECC_FA1R_FAIL_ECC_ADDR1_Field is Interfaces.STM32.UInt15;

   --  FLASH ECC fail address for bank 1
   type ECC_FA1R_Register is record
      --  Read-only. Bank 1 ECC error address
      FAIL_ECC_ADDR1 : ECC_FA1R_FAIL_ECC_ADDR1_Field;
      --  unspecified
      Reserved_15_31 : Interfaces.STM32.UInt17;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ECC_FA1R_Register use record
      FAIL_ECC_ADDR1 at 0 range 0 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype CR2_LOCK2_Field is Interfaces.STM32.Bit;
   subtype CR2_PG2_Field is Interfaces.STM32.Bit;
   subtype CR2_SER2_Field is Interfaces.STM32.Bit;
   subtype CR2_BER2_Field is Interfaces.STM32.Bit;
   subtype CR2_PSIZE2_Field is Interfaces.STM32.UInt2;
   subtype CR2_FW2_Field is Interfaces.STM32.Bit;
   subtype CR2_START2_Field is Interfaces.STM32.Bit;
   subtype CR2_SNB2_Field is Interfaces.STM32.UInt3;
   subtype CR2_CRC_EN_Field is Interfaces.STM32.Bit;
   subtype CR2_EOPIE2_Field is Interfaces.STM32.Bit;
   subtype CR2_WRPERRIE2_Field is Interfaces.STM32.Bit;
   subtype CR2_PGSERRIE2_Field is Interfaces.STM32.Bit;
   subtype CR2_STRBERRIE2_Field is Interfaces.STM32.Bit;
   subtype CR2_INCERRIE2_Field is Interfaces.STM32.Bit;
   subtype CR2_OPERRIE2_Field is Interfaces.STM32.Bit;
   subtype CR2_RDPERRIE2_Field is Interfaces.STM32.Bit;
   subtype CR2_RDSERRIE2_Field is Interfaces.STM32.Bit;
   subtype CR2_SNECCERRIE2_Field is Interfaces.STM32.Bit;
   subtype CR2_DBECCERRIE2_Field is Interfaces.STM32.Bit;
   subtype CR2_CRCENDIE2_Field is Interfaces.STM32.Bit;

   --  FLASH control register for bank 2
   type CR2_Register is record
      --  Bank 2 configuration lock bit
      LOCK2          : CR2_LOCK2_Field := 16#0#;
      --  Bank 2 program enable bit
      PG2            : CR2_PG2_Field := 16#0#;
      --  Bank 2 sector erase request
      SER2           : CR2_SER2_Field := 16#0#;
      --  Bank 2 erase request
      BER2           : CR2_BER2_Field := 16#0#;
      --  Bank 2 program size
      PSIZE2         : CR2_PSIZE2_Field := 16#0#;
      --  Bank 2 write forcing control bit
      FW2            : CR2_FW2_Field := 16#0#;
      --  Bank 2 bank or sector erase start control bit
      START2         : CR2_START2_Field := 16#0#;
      --  Bank 2 sector erase selection number
      SNB2           : CR2_SNB2_Field := 16#0#;
      --  unspecified
      Reserved_11_14 : Interfaces.STM32.UInt4 := 16#0#;
      --  Bank 2 CRC control bit
      CRC_EN         : CR2_CRC_EN_Field := 16#0#;
      --  Bank 2 end-of-program interrupt control bit
      EOPIE2         : CR2_EOPIE2_Field := 16#0#;
      --  Bank 2 write protection error interrupt enable bit
      WRPERRIE2      : CR2_WRPERRIE2_Field := 16#0#;
      --  Bank 2 programming sequence error interrupt enable bit
      PGSERRIE2      : CR2_PGSERRIE2_Field := 16#0#;
      --  Bank 2 strobe error interrupt enable bit
      STRBERRIE2     : CR2_STRBERRIE2_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#0#;
      --  Bank 2 inconsistency error interrupt enable bit
      INCERRIE2      : CR2_INCERRIE2_Field := 16#0#;
      --  Bank 2 write/erase error interrupt enable bit
      OPERRIE2       : CR2_OPERRIE2_Field := 16#0#;
      --  Bank 2 read protection error interrupt enable bit
      RDPERRIE2      : CR2_RDPERRIE2_Field := 16#0#;
      --  Bank 2 secure error interrupt enable bit
      RDSERRIE2      : CR2_RDSERRIE2_Field := 16#0#;
      --  Bank 2 ECC single correction error interrupt enable bit
      SNECCERRIE2    : CR2_SNECCERRIE2_Field := 16#0#;
      --  Bank 2 ECC double detection error interrupt enable bit
      DBECCERRIE2    : CR2_DBECCERRIE2_Field := 16#0#;
      --  Bank 2 end of CRC calculation interrupt enable bit
      CRCENDIE2      : CR2_CRCENDIE2_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.STM32.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      LOCK2          at 0 range 0 .. 0;
      PG2            at 0 range 1 .. 1;
      SER2           at 0 range 2 .. 2;
      BER2           at 0 range 3 .. 3;
      PSIZE2         at 0 range 4 .. 5;
      FW2            at 0 range 6 .. 6;
      START2         at 0 range 7 .. 7;
      SNB2           at 0 range 8 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      CRC_EN         at 0 range 15 .. 15;
      EOPIE2         at 0 range 16 .. 16;
      WRPERRIE2      at 0 range 17 .. 17;
      PGSERRIE2      at 0 range 18 .. 18;
      STRBERRIE2     at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      INCERRIE2      at 0 range 21 .. 21;
      OPERRIE2       at 0 range 22 .. 22;
      RDPERRIE2      at 0 range 23 .. 23;
      RDSERRIE2      at 0 range 24 .. 24;
      SNECCERRIE2    at 0 range 25 .. 25;
      DBECCERRIE2    at 0 range 26 .. 26;
      CRCENDIE2      at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype SR2_BSY2_Field is Interfaces.STM32.Bit;
   subtype SR2_WBNE2_Field is Interfaces.STM32.Bit;
   subtype SR2_QW2_Field is Interfaces.STM32.Bit;
   subtype SR2_CRC_BUSY2_Field is Interfaces.STM32.Bit;
   subtype SR2_EOP2_Field is Interfaces.STM32.Bit;
   subtype SR2_WRPERR2_Field is Interfaces.STM32.Bit;
   subtype SR2_PGSERR2_Field is Interfaces.STM32.Bit;
   subtype SR2_STRBERR2_Field is Interfaces.STM32.Bit;
   subtype SR2_INCERR2_Field is Interfaces.STM32.Bit;
   subtype SR2_OPERR2_Field is Interfaces.STM32.Bit;
   subtype SR2_RDPERR2_Field is Interfaces.STM32.Bit;
   subtype SR2_RDSERR2_Field is Interfaces.STM32.Bit;
   subtype SR2_SNECCERR2_Field is Interfaces.STM32.Bit;
   subtype SR2_DBECCERR2_Field is Interfaces.STM32.Bit;
   subtype SR2_CRCEND2_Field is Interfaces.STM32.Bit;

   --  FLASH status register for bank 2
   type SR2_Register is record
      --  Bank 2 ongoing program flag
      BSY2           : SR2_BSY2_Field := 16#0#;
      --  Bank 2 write buffer not empty flag
      WBNE2          : SR2_WBNE2_Field := 16#0#;
      --  Bank 2 wait queue flag
      QW2            : SR2_QW2_Field := 16#0#;
      --  Bank 2 CRC busy flag
      CRC_BUSY2      : SR2_CRC_BUSY2_Field := 16#0#;
      --  unspecified
      Reserved_4_15  : Interfaces.STM32.UInt12 := 16#0#;
      --  Bank 2 end-of-program flag
      EOP2           : SR2_EOP2_Field := 16#0#;
      --  Bank 2 write protection error flag
      WRPERR2        : SR2_WRPERR2_Field := 16#0#;
      --  Bank 2 programming sequence error flag
      PGSERR2        : SR2_PGSERR2_Field := 16#0#;
      --  Bank 2 strobe error flag
      STRBERR2       : SR2_STRBERR2_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#0#;
      --  Bank 2 inconsistency error flag
      INCERR2        : SR2_INCERR2_Field := 16#0#;
      --  Bank 2 write/erase error flag
      OPERR2         : SR2_OPERR2_Field := 16#0#;
      --  Bank 2 read protection error flag
      RDPERR2        : SR2_RDPERR2_Field := 16#0#;
      --  Bank 2 secure error flag
      RDSERR2        : SR2_RDSERR2_Field := 16#0#;
      --  Bank 2 single correction error flag
      SNECCERR2      : SR2_SNECCERR2_Field := 16#0#;
      --  Bank 2 ECC double detection error flag
      DBECCERR2      : SR2_DBECCERR2_Field := 16#0#;
      --  Bank 2 CRC-complete flag
      CRCEND2        : SR2_CRCEND2_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.STM32.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR2_Register use record
      BSY2           at 0 range 0 .. 0;
      WBNE2          at 0 range 1 .. 1;
      QW2            at 0 range 2 .. 2;
      CRC_BUSY2      at 0 range 3 .. 3;
      Reserved_4_15  at 0 range 4 .. 15;
      EOP2           at 0 range 16 .. 16;
      WRPERR2        at 0 range 17 .. 17;
      PGSERR2        at 0 range 18 .. 18;
      STRBERR2       at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      INCERR2        at 0 range 21 .. 21;
      OPERR2         at 0 range 22 .. 22;
      RDPERR2        at 0 range 23 .. 23;
      RDSERR2        at 0 range 24 .. 24;
      SNECCERR2      at 0 range 25 .. 25;
      DBECCERR2      at 0 range 26 .. 26;
      CRCEND2        at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype CCR2_CLR_EOP2_Field is Interfaces.STM32.Bit;
   subtype CCR2_CLR_WRPERR2_Field is Interfaces.STM32.Bit;
   subtype CCR2_CLR_PGSERR2_Field is Interfaces.STM32.Bit;
   subtype CCR2_CLR_STRBERR2_Field is Interfaces.STM32.Bit;
   subtype CCR2_CLR_INCERR2_Field is Interfaces.STM32.Bit;
   subtype CCR2_CLR_OPERR2_Field is Interfaces.STM32.Bit;
   subtype CCR2_CLR_RDPERR2_Field is Interfaces.STM32.Bit;
   subtype CCR2_CLR_RDSERR1_Field is Interfaces.STM32.Bit;
   subtype CCR2_CLR_SNECCERR2_Field is Interfaces.STM32.Bit;
   subtype CCR2_CLR_DBECCERR1_Field is Interfaces.STM32.Bit;
   subtype CCR2_CLR_CRCEND2_Field is Interfaces.STM32.Bit;

   --  FLASH clear control register for bank 2
   type CCR2_Register is record
      --  unspecified
      Reserved_0_15  : Interfaces.STM32.UInt16 := 16#0#;
      --  Bank 1 EOP1 flag clear bit
      CLR_EOP2       : CCR2_CLR_EOP2_Field := 16#0#;
      --  Bank 2 WRPERR1 flag clear bit
      CLR_WRPERR2    : CCR2_CLR_WRPERR2_Field := 16#0#;
      --  Bank 2 PGSERR1 flag clear bi
      CLR_PGSERR2    : CCR2_CLR_PGSERR2_Field := 16#0#;
      --  Bank 2 STRBERR1 flag clear bit
      CLR_STRBERR2   : CCR2_CLR_STRBERR2_Field := 16#0#;
      --  unspecified
      Reserved_20_20 : Interfaces.STM32.Bit := 16#0#;
      --  Bank 2 INCERR1 flag clear bit
      CLR_INCERR2    : CCR2_CLR_INCERR2_Field := 16#0#;
      --  Bank 2 OPERR1 flag clear bit
      CLR_OPERR2     : CCR2_CLR_OPERR2_Field := 16#0#;
      --  Bank 2 RDPERR1 flag clear bit
      CLR_RDPERR2    : CCR2_CLR_RDPERR2_Field := 16#0#;
      --  Bank 1 RDSERR1 flag clear bit
      CLR_RDSERR1    : CCR2_CLR_RDSERR1_Field := 16#0#;
      --  Bank 2 SNECCERR1 flag clear bit
      CLR_SNECCERR2  : CCR2_CLR_SNECCERR2_Field := 16#0#;
      --  Bank 1 DBECCERR1 flag clear bit
      CLR_DBECCERR1  : CCR2_CLR_DBECCERR1_Field := 16#0#;
      --  Bank 2 CRCEND1 flag clear bit
      CLR_CRCEND2    : CCR2_CLR_CRCEND2_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.STM32.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR2_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      CLR_EOP2       at 0 range 16 .. 16;
      CLR_WRPERR2    at 0 range 17 .. 17;
      CLR_PGSERR2    at 0 range 18 .. 18;
      CLR_STRBERR2   at 0 range 19 .. 19;
      Reserved_20_20 at 0 range 20 .. 20;
      CLR_INCERR2    at 0 range 21 .. 21;
      CLR_OPERR2     at 0 range 22 .. 22;
      CLR_RDPERR2    at 0 range 23 .. 23;
      CLR_RDSERR1    at 0 range 24 .. 24;
      CLR_SNECCERR2  at 0 range 25 .. 25;
      CLR_DBECCERR1  at 0 range 26 .. 26;
      CLR_CRCEND2    at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype PRAR_CUR2_PROT_AREA_START2_Field is Interfaces.STM32.UInt12;
   subtype PRAR_CUR2_PROT_AREA_END2_Field is Interfaces.STM32.UInt12;
   subtype PRAR_CUR2_DMEP2_Field is Interfaces.STM32.Bit;

   --  FLASH protection address for bank 1
   type PRAR_CUR2_Register is record
      --  Read-only. Bank 2 lowest PCROP protected address
      PROT_AREA_START2 : PRAR_CUR2_PROT_AREA_START2_Field;
      --  unspecified
      Reserved_12_15   : Interfaces.STM32.UInt4;
      --  Read-only. Bank 2 highest PCROP protected address
      PROT_AREA_END2   : PRAR_CUR2_PROT_AREA_END2_Field;
      --  unspecified
      Reserved_28_30   : Interfaces.STM32.UInt3;
      --  Read-only. Bank 2 PCROP protected erase enable option status bit
      DMEP2            : PRAR_CUR2_DMEP2_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRAR_CUR2_Register use record
      PROT_AREA_START2 at 0 range 0 .. 11;
      Reserved_12_15   at 0 range 12 .. 15;
      PROT_AREA_END2   at 0 range 16 .. 27;
      Reserved_28_30   at 0 range 28 .. 30;
      DMEP2            at 0 range 31 .. 31;
   end record;

   subtype SCAR_CUR2_SEC_AREA_START2_Field is Interfaces.STM32.UInt12;
   subtype SCAR_CUR2_SEC_AREA_END2_Field is Interfaces.STM32.UInt12;
   subtype SCAR_CUR2_DMES2_Field is Interfaces.STM32.Bit;

   --  FLASH secure address for bank 2
   type SCAR_CUR2_Register is record
      --  Bank 2 lowest secure protected address
      SEC_AREA_START2 : SCAR_CUR2_SEC_AREA_START2_Field := 16#0#;
      --  unspecified
      Reserved_12_15  : Interfaces.STM32.UInt4 := 16#0#;
      --  Bank 2 highest secure protected address
      SEC_AREA_END2   : SCAR_CUR2_SEC_AREA_END2_Field := 16#0#;
      --  unspecified
      Reserved_28_30  : Interfaces.STM32.UInt3 := 16#0#;
      --  Bank 2 secure protected erase enable option status bit
      DMES2           : SCAR_CUR2_DMES2_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCAR_CUR2_Register use record
      SEC_AREA_START2 at 0 range 0 .. 11;
      Reserved_12_15  at 0 range 12 .. 15;
      SEC_AREA_END2   at 0 range 16 .. 27;
      Reserved_28_30  at 0 range 28 .. 30;
      DMES2           at 0 range 31 .. 31;
   end record;

   subtype SCAR_PRG2_SEC_AREA_START2_Field is Interfaces.STM32.UInt12;
   subtype SCAR_PRG2_SEC_AREA_END2_Field is Interfaces.STM32.UInt12;
   subtype SCAR_PRG2_DMES2_Field is Interfaces.STM32.Bit;

   --  FLASH secure address for bank 2
   type SCAR_PRG2_Register is record
      --  Bank 2 lowest secure protected address configuration
      SEC_AREA_START2 : SCAR_PRG2_SEC_AREA_START2_Field := 16#0#;
      --  unspecified
      Reserved_12_15  : Interfaces.STM32.UInt4 := 16#0#;
      --  Bank 2 highest secure protected address configuration
      SEC_AREA_END2   : SCAR_PRG2_SEC_AREA_END2_Field := 16#0#;
      --  unspecified
      Reserved_28_30  : Interfaces.STM32.UInt3 := 16#0#;
      --  Bank 2 secure protected erase enable option configuration bit
      DMES2           : SCAR_PRG2_DMES2_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCAR_PRG2_Register use record
      SEC_AREA_START2 at 0 range 0 .. 11;
      Reserved_12_15  at 0 range 12 .. 15;
      SEC_AREA_END2   at 0 range 16 .. 27;
      Reserved_28_30  at 0 range 28 .. 30;
      DMES2           at 0 range 31 .. 31;
   end record;

   subtype WPSN_CUR2R_WRPSn2_Field is Interfaces.STM32.Byte;

   --  FLASH write sector protection for bank 2
   type WPSN_CUR2R_Register is record
      --  Read-only. Bank 2 sector write protection option status byte
      WRPSn2        : WPSN_CUR2R_WRPSn2_Field;
      --  unspecified
      Reserved_8_31 : Interfaces.STM32.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WPSN_CUR2R_Register use record
      WRPSn2        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype WPSN_PRG2R_WRPSn2_Field is Interfaces.STM32.Byte;

   --  FLASH write sector protection for bank 2
   type WPSN_PRG2R_Register is record
      --  Bank 2 sector write protection configuration byte
      WRPSn2        : WPSN_PRG2R_WRPSn2_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.STM32.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WPSN_PRG2R_Register use record
      WRPSn2        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ECC_FA2R_FAIL_ECC_ADDR2_Field is Interfaces.STM32.UInt15;

   --  FLASH ECC fail address for bank 2
   type ECC_FA2R_Register is record
      --  Read-only. Bank 2 ECC error address
      FAIL_ECC_ADDR2 : ECC_FA2R_FAIL_ECC_ADDR2_Field;
      --  unspecified
      Reserved_15_31 : Interfaces.STM32.UInt17;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ECC_FA2R_Register use record
      FAIL_ECC_ADDR2 at 0 range 0 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type Flash_Disc is
     (Val_1,
      Val_2);

   --  Flash
   type Flash_Peripheral
     (Discriminent : Flash_Disc := Val_1)
   is record
      --  Access control register
      ACR         : aliased ACR_Register;
      --  FLASH key register for bank 1
      KEYR1       : aliased Interfaces.STM32.UInt32;
      --  FLASH option key register
      OPTKEYR     : aliased Interfaces.STM32.UInt32;
      --  FLASH control register for bank 1
      CR1         : aliased CR1_Register;
      --  FLASH status register for bank 1
      SR1         : aliased SR1_Register;
      --  FLASH clear control register for bank 1
      CCR1        : aliased CCR1_Register;
      --  FLASH option control register
      OPTCR       : aliased OPTCR_Register;
      --  FLASH option status register
      OPTSR_CUR   : aliased OPTSR_CUR_Register;
      --  FLASH option status register
      OPTSR_PRG   : aliased OPTSR_PRG_Register;
      --  FLASH option clear control register
      OPTCCR      : aliased OPTCCR_Register;
      --  FLASH protection address for bank 1
      PRAR_CUR1   : aliased PRAR_CUR1_Register;
      --  FLASH secure address for bank 1
      SCAR_CUR1   : aliased SCAR_CUR1_Register;
      --  FLASH secure address for bank 1
      SCAR_PRG1   : aliased SCAR_PRG1_Register;
      --  FLASH write sector protection for bank 1
      WPSN_CUR1R  : aliased WPSN_CUR1R_Register;
      --  FLASH write sector protection for bank 1
      WPSN_PRG1R  : aliased WPSN_PRG1R_Register;
      --  FLASH register with boot address
      BOOT_CURR   : aliased BOOT_CURR_Register;
      --  FLASH register with boot address
      BOOT_PRGR   : aliased BOOT_PRGR_Register;
      --  FLASH CRC control register for bank 1
      CRCCR1      : aliased CRCCR_Register;
      --  FLASH CRC start address register for bank 1
      CRCSADD1R   : aliased Interfaces.STM32.UInt32;
      --  FLASH CRC end address register for bank 1
      CRCEADD1R   : aliased Interfaces.STM32.UInt32;
      --  FLASH CRC data register
      CRCDATAR    : aliased Interfaces.STM32.UInt32;
      --  FLASH ECC fail address for bank 1
      ECC_FA1R    : aliased ECC_FA1R_Register;
      --  Access control register
      ACR_1       : aliased ACR_Register;
      --  FLASH key register for bank 2
      KEYR2       : aliased Interfaces.STM32.UInt32;
      --  FLASH option key register
      OPTKEYR_1   : aliased Interfaces.STM32.UInt32;
      --  FLASH control register for bank 2
      CR2         : aliased CR2_Register;
      --  FLASH status register for bank 2
      SR2         : aliased SR2_Register;
      --  FLASH clear control register for bank 2
      CCR2        : aliased CCR2_Register;
      --  FLASH option control register
      OPTCR_1     : aliased OPTCR_Register;
      --  FLASH option status register
      OPTSR_CUR_1 : aliased OPTSR_CUR_Register;
      --  FLASH option status register
      OPTSR_PRG_1 : aliased OPTSR_PRG_Register;
      --  FLASH option clear control register
      OPTCCR_1    : aliased OPTCCR_Register;
      --  FLASH protection address for bank 1
      PRAR_CUR2   : aliased PRAR_CUR2_Register;
      --  FLASH secure address for bank 2
      SCAR_CUR2   : aliased SCAR_CUR2_Register;
      --  FLASH secure address for bank 2
      SCAR_PRG2   : aliased SCAR_PRG2_Register;
      --  FLASH write sector protection for bank 2
      WPSN_CUR2R  : aliased WPSN_CUR2R_Register;
      --  FLASH write sector protection for bank 2
      WPSN_PRG2R  : aliased WPSN_PRG2R_Register;
      --  FLASH CRC control register for bank 1
      CRCCR2      : aliased CRCCR_Register;
      --  FLASH CRC start address register for bank 2
      CRCSADD2R   : aliased Interfaces.STM32.UInt32;
      --  FLASH CRC end address register for bank 2
      CRCEADD2R   : aliased Interfaces.STM32.UInt32;
      --  FLASH ECC fail address for bank 2
      ECC_FA2R    : aliased ECC_FA2R_Register;
      case Discriminent is
         when Val_1 =>
            --  FLASH protection address for bank 1
            PRAR_PRG1 : aliased PRAR_PRG1_Register;
         when Val_2 =>
            --  FLASH protection address for bank 2
            PRAR_PRG2 : aliased PRAR_PRG2_Register;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for Flash_Peripheral use record
      ACR         at 16#0# range 0 .. 31;
      KEYR1       at 16#4# range 0 .. 31;
      OPTKEYR     at 16#8# range 0 .. 31;
      CR1         at 16#C# range 0 .. 31;
      SR1         at 16#10# range 0 .. 31;
      CCR1        at 16#14# range 0 .. 31;
      OPTCR       at 16#18# range 0 .. 31;
      OPTSR_CUR   at 16#1C# range 0 .. 31;
      OPTSR_PRG   at 16#20# range 0 .. 31;
      OPTCCR      at 16#24# range 0 .. 31;
      PRAR_CUR1   at 16#28# range 0 .. 31;
      SCAR_CUR1   at 16#30# range 0 .. 31;
      SCAR_PRG1   at 16#34# range 0 .. 31;
      WPSN_CUR1R  at 16#38# range 0 .. 31;
      WPSN_PRG1R  at 16#3C# range 0 .. 31;
      BOOT_CURR   at 16#40# range 0 .. 31;
      BOOT_PRGR   at 16#44# range 0 .. 31;
      CRCCR1      at 16#50# range 0 .. 31;
      CRCSADD1R   at 16#54# range 0 .. 31;
      CRCEADD1R   at 16#58# range 0 .. 31;
      CRCDATAR    at 16#5C# range 0 .. 31;
      ECC_FA1R    at 16#60# range 0 .. 31;
      ACR_1       at 16#100# range 0 .. 31;
      KEYR2       at 16#104# range 0 .. 31;
      OPTKEYR_1   at 16#108# range 0 .. 31;
      CR2         at 16#10C# range 0 .. 31;
      SR2         at 16#110# range 0 .. 31;
      CCR2        at 16#114# range 0 .. 31;
      OPTCR_1     at 16#118# range 0 .. 31;
      OPTSR_CUR_1 at 16#11C# range 0 .. 31;
      OPTSR_PRG_1 at 16#120# range 0 .. 31;
      OPTCCR_1    at 16#124# range 0 .. 31;
      PRAR_CUR2   at 16#128# range 0 .. 31;
      SCAR_CUR2   at 16#130# range 0 .. 31;
      SCAR_PRG2   at 16#134# range 0 .. 31;
      WPSN_CUR2R  at 16#138# range 0 .. 31;
      WPSN_PRG2R  at 16#13C# range 0 .. 31;
      CRCCR2      at 16#150# range 0 .. 31;
      CRCSADD2R   at 16#154# range 0 .. 31;
      CRCEADD2R   at 16#158# range 0 .. 31;
      ECC_FA2R    at 16#160# range 0 .. 31;
      PRAR_PRG1   at 16#2C# range 0 .. 31;
      PRAR_PRG2   at 16#2C# range 0 .. 31;
   end record;

   --  Flash
   Flash_Periph : aliased Flash_Peripheral
     with Import, Address => Flash_Base;

end Interfaces.STM32.Flash;
