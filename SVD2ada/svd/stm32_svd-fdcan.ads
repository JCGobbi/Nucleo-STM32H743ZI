pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32H743x.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.FDCAN is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CREL_DAY_Field is HAL.UInt8;
   subtype CREL_MON_Field is HAL.UInt8;
   subtype CREL_YEAR_Field is HAL.UInt4;
   subtype CREL_SUBSTEP_Field is HAL.UInt4;
   subtype CREL_STEP_Field is HAL.UInt4;
   subtype CREL_REL_Field is HAL.UInt4;

   --  Clock Calibration Unit Core Release Register
   type CREL_Register is record
      --  Time Stamp Day
      DAY     : CREL_DAY_Field := 16#0#;
      --  Time Stamp Month
      MON     : CREL_MON_Field := 16#0#;
      --  Time Stamp Year
      YEAR    : CREL_YEAR_Field := 16#0#;
      --  Sub-step of Core Release
      SUBSTEP : CREL_SUBSTEP_Field := 16#0#;
      --  Step of Core Release
      STEP    : CREL_STEP_Field := 16#0#;
      --  Core Release
      REL     : CREL_REL_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CREL_Register use record
      DAY     at 0 range 0 .. 7;
      MON     at 0 range 8 .. 15;
      YEAR    at 0 range 16 .. 19;
      SUBSTEP at 0 range 20 .. 23;
      STEP    at 0 range 24 .. 27;
      REL     at 0 range 28 .. 31;
   end record;

   subtype CCFG_TQBT_Field is HAL.UInt5;
   subtype CCFG_OCPM_Field is HAL.UInt8;
   subtype CCFG_CDIV_Field is HAL.UInt4;

   --  Calibration Configuration Register
   type CCFG_Register is record
      --  Time Quanta per Bit Time
      TQBT           : CCFG_TQBT_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      --  Bypass Clock Calibration
      BCC            : Boolean := False;
      --  Calibration Field Length
      CFL            : Boolean := False;
      --  Oscillator Clock Periods Minimum
      OCPM           : CCFG_OCPM_Field := 16#0#;
      --  Clock Divider
      CDIV           : CCFG_CDIV_Field := 16#0#;
      --  unspecified
      Reserved_20_30 : HAL.UInt11 := 16#0#;
      --  Software Reset
      SWR            : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCFG_Register use record
      TQBT           at 0 range 0 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      BCC            at 0 range 6 .. 6;
      CFL            at 0 range 7 .. 7;
      OCPM           at 0 range 8 .. 15;
      CDIV           at 0 range 16 .. 19;
      Reserved_20_30 at 0 range 20 .. 30;
      SWR            at 0 range 31 .. 31;
   end record;

   subtype CSTAT_OCPC_Field is HAL.UInt18;
   subtype CSTAT_TQC_Field is HAL.UInt11;
   subtype CSTAT_CALS_Field is HAL.UInt2;

   --  Calibration Status Register
   type CSTAT_Register is record
      --  Oscillator Clock Period Counter
      OCPC           : CSTAT_OCPC_Field := 16#0#;
      --  Time Quanta Counter
      TQC            : CSTAT_TQC_Field := 16#0#;
      --  unspecified
      Reserved_29_29 : HAL.Bit := 16#0#;
      --  Calibration State
      CALS           : CSTAT_CALS_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSTAT_Register use record
      OCPC           at 0 range 0 .. 17;
      TQC            at 0 range 18 .. 28;
      Reserved_29_29 at 0 range 29 .. 29;
      CALS           at 0 range 30 .. 31;
   end record;

   subtype CWD_WDC_Field is HAL.UInt16;
   subtype CWD_WDV_Field is HAL.UInt16;

   --  Calibration Watchdog Register
   type CWD_Register is record
      --  WDC
      WDC : CWD_WDC_Field := 16#0#;
      --  WDV
      WDV : CWD_WDV_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CWD_Register use record
      WDC at 0 range 0 .. 15;
      WDV at 0 range 16 .. 31;
   end record;

   --  Clock Calibration Unit Interrupt Register
   type IR_Register is record
      --  Calibration Watchdog Event
      CWE           : Boolean := False;
      --  Calibration State Changed
      CSC           : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IR_Register use record
      CWE           at 0 range 0 .. 0;
      CSC           at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  Clock Calibration Unit Interrupt Enable Register
   type IE_Register is record
      --  Calibration Watchdog Event Enable
      CWEE          : Boolean := False;
      --  Calibration State Changed Enable
      CSCE          : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IE_Register use record
      CWEE          at 0 range 0 .. 0;
      CSCE          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  FDCAN Core Release Register
   type CREL_Register_1 is record
      --  Read-only. Timestamp Day
      DAY     : CREL_DAY_Field;
      --  Read-only. Timestamp Month
      MON     : CREL_MON_Field;
      --  Read-only. Timestamp Year
      YEAR    : CREL_YEAR_Field;
      --  Read-only. Sub-step of Core release
      SUBSTEP : CREL_SUBSTEP_Field;
      --  Read-only. Step of Core release
      STEP    : CREL_STEP_Field;
      --  Read-only. Core release
      REL     : CREL_REL_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CREL_Register_1 use record
      DAY     at 0 range 0 .. 7;
      MON     at 0 range 8 .. 15;
      YEAR    at 0 range 16 .. 19;
      SUBSTEP at 0 range 20 .. 23;
      STEP    at 0 range 24 .. 27;
      REL     at 0 range 28 .. 31;
   end record;

   subtype DBTP_DSJW_Field is HAL.UInt4;
   subtype DBTP_DTSEG2_Field is HAL.UInt4;
   subtype DBTP_DTSEG1_Field is HAL.UInt5;
   subtype DBTP_DBRP_Field is HAL.UInt5;

   --  FDCAN Data Bit Timing and Prescaler Register
   type DBTP_Register is record
      --  Read-only. Synchronization Jump Width
      DSJW           : DBTP_DSJW_Field;
      --  Read-only. Data time segment after sample point
      DTSEG2         : DBTP_DTSEG2_Field;
      --  Read-only. Data time segment after sample point
      DTSEG1         : DBTP_DTSEG1_Field;
      --  unspecified
      Reserved_13_15 : HAL.UInt3;
      --  Read-only. Data BIt Rate Prescaler
      DBRP           : DBTP_DBRP_Field;
      --  unspecified
      Reserved_21_22 : HAL.UInt2;
      --  Read-only. Transceiver Delay Compensation
      TDC            : Boolean;
      --  unspecified
      Reserved_24_31 : HAL.UInt8;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DBTP_Register use record
      DSJW           at 0 range 0 .. 3;
      DTSEG2         at 0 range 4 .. 7;
      DTSEG1         at 0 range 8 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      DBRP           at 0 range 16 .. 20;
      Reserved_21_22 at 0 range 21 .. 22;
      TDC            at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TEST_TX_Field is HAL.UInt2;

   --  FDCAN Test Register
   type TEST_Register is record
      --  unspecified
      Reserved_0_3  : HAL.UInt4;
      --  Read-only. Loop Back mode
      LBCK          : Boolean;
      --  Read-only. Loop Back mode
      TX            : TEST_TX_Field;
      --  Read-only. Control of Transmit Pin
      RX            : Boolean;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TEST_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      LBCK          at 0 range 4 .. 4;
      TX            at 0 range 5 .. 6;
      RX            at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype RWD_WDC_Field is HAL.UInt8;
   subtype RWD_WDV_Field is HAL.UInt8;

   --  FDCAN RAM Watchdog Register
   type RWD_Register is record
      --  Read-only. Watchdog configuration
      WDC            : RWD_WDC_Field;
      --  Read-only. Watchdog value
      WDV            : RWD_WDV_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RWD_Register use record
      WDC            at 0 range 0 .. 7;
      WDV            at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  FDCAN CC Control Register
   type CCCR_Register is record
      --  Initialization
      INIT           : Boolean := False;
      --  Configuration Change Enable
      CCE            : Boolean := False;
      --  ASM Restricted Operation Mode
      ASM            : Boolean := False;
      --  Clock Stop Acknowledge
      CSA            : Boolean := False;
      --  Clock Stop Request
      CSR            : Boolean := False;
      --  Bus Monitoring Mode
      MON            : Boolean := False;
      --  Disable Automatic Retransmission
      DAR            : Boolean := False;
      --  Test Mode Enable
      TEST           : Boolean := False;
      --  FD Operation Enable
      FDOE           : Boolean := False;
      --  FDCAN Bit Rate Switching
      BRSE           : Boolean := False;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      --  Protocol Exception Handling Disable
      PXHD           : Boolean := False;
      --  Edge Filtering during Bus Integration
      EFBI           : Boolean := False;
      --  TXP
      TXP            : Boolean := False;
      --  Non ISO Operation
      NISO           : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCCR_Register use record
      INIT           at 0 range 0 .. 0;
      CCE            at 0 range 1 .. 1;
      ASM            at 0 range 2 .. 2;
      CSA            at 0 range 3 .. 3;
      CSR            at 0 range 4 .. 4;
      MON            at 0 range 5 .. 5;
      DAR            at 0 range 6 .. 6;
      TEST           at 0 range 7 .. 7;
      FDOE           at 0 range 8 .. 8;
      BRSE           at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      PXHD           at 0 range 12 .. 12;
      EFBI           at 0 range 13 .. 13;
      TXP            at 0 range 14 .. 14;
      NISO           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype NBTP_NTSEG2_Field is HAL.UInt7;
   subtype NBTP_NTSEG1_Field is HAL.UInt8;
   subtype NBTP_NBRP_Field is HAL.UInt9;
   subtype NBTP_NSJW_Field is HAL.UInt7;

   --  FDCAN Nominal Bit Timing and Prescaler Register
   type NBTP_Register is record
      --  Nominal Time segment after sample point
      NTSEG2       : NBTP_NTSEG2_Field := 16#0#;
      --  unspecified
      Reserved_7_7 : HAL.Bit := 16#0#;
      --  Nominal Time segment before sample point
      NTSEG1       : NBTP_NTSEG1_Field := 16#0#;
      --  Bit Rate Prescaler
      NBRP         : NBTP_NBRP_Field := 16#0#;
      --  NSJW: Nominal (Re)Synchronization Jump Width
      NSJW         : NBTP_NSJW_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NBTP_Register use record
      NTSEG2       at 0 range 0 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
      NTSEG1       at 0 range 8 .. 15;
      NBRP         at 0 range 16 .. 24;
      NSJW         at 0 range 25 .. 31;
   end record;

   subtype TSCC_TSS_Field is HAL.UInt2;
   subtype TSCC_TCP_Field is HAL.UInt4;

   --  FDCAN Timestamp Counter Configuration Register
   type TSCC_Register is record
      --  Timestamp Select
      TSS            : TSCC_TSS_Field := 16#0#;
      --  unspecified
      Reserved_2_15  : HAL.UInt14 := 16#0#;
      --  Timestamp Counter Prescaler
      TCP            : TSCC_TCP_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSCC_Register use record
      TSS            at 0 range 0 .. 1;
      Reserved_2_15  at 0 range 2 .. 15;
      TCP            at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype TSCV_TSC_Field is HAL.UInt16;

   --  FDCAN Timestamp Counter Value Register
   type TSCV_Register is record
      --  Timestamp Counter
      TSC            : TSCV_TSC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSCV_Register use record
      TSC            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TOCC_TOS_Field is HAL.UInt2;
   subtype TOCC_TOP_Field is HAL.UInt16;

   --  FDCAN Timeout Counter Configuration Register
   type TOCC_Register is record
      --  Enable Timeout Counter
      ETOC          : Boolean := False;
      --  Timeout Select
      TOS           : TOCC_TOS_Field := 16#0#;
      --  unspecified
      Reserved_3_15 : HAL.UInt13 := 16#0#;
      --  Timeout Period
      TOP           : TOCC_TOP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TOCC_Register use record
      ETOC          at 0 range 0 .. 0;
      TOS           at 0 range 1 .. 2;
      Reserved_3_15 at 0 range 3 .. 15;
      TOP           at 0 range 16 .. 31;
   end record;

   subtype TOCV_TOC_Field is HAL.UInt16;

   --  FDCAN Timeout Counter Value Register
   type TOCV_Register is record
      --  Timeout Counter
      TOC            : TOCV_TOC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TOCV_Register use record
      TOC            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ECR_TEC_Field is HAL.UInt8;
   subtype ECR_TREC_Field is HAL.UInt7;
   subtype ECR_CEL_Field is HAL.UInt8;

   --  FDCAN Error Counter Register
   type ECR_Register is record
      --  Transmit Error Counter
      TEC            : ECR_TEC_Field := 16#0#;
      --  Receive Error Counter
      TREC           : ECR_TREC_Field := 16#0#;
      --  Receive Error Passive
      RP             : Boolean := False;
      --  AN Error Logging
      CEL            : ECR_CEL_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ECR_Register use record
      TEC            at 0 range 0 .. 7;
      TREC           at 0 range 8 .. 14;
      RP             at 0 range 15 .. 15;
      CEL            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PSR_LEC_Field is HAL.UInt3;
   subtype PSR_ACT_Field is HAL.UInt2;
   subtype PSR_DLEC_Field is HAL.UInt3;
   subtype PSR_TDCV_Field is HAL.UInt7;

   --  FDCAN Protocol Status Register
   type PSR_Register is record
      --  Last Error Code
      LEC            : PSR_LEC_Field := 16#0#;
      --  Activity
      ACT            : PSR_ACT_Field := 16#0#;
      --  Error Passive
      EP             : Boolean := False;
      --  Warning Status
      EW             : Boolean := False;
      --  Bus_Off Status
      BO             : Boolean := False;
      --  Data Last Error Code
      DLEC           : PSR_DLEC_Field := 16#0#;
      --  ESI flag of last received FDCAN Message
      RESI           : Boolean := False;
      --  BRS flag of last received FDCAN Message
      RBRS           : Boolean := False;
      --  Received FDCAN Message
      REDL           : Boolean := False;
      --  Protocol Exception Event
      PXE            : Boolean := False;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      --  Transmitter Delay Compensation Value
      TDCV           : PSR_TDCV_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : HAL.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PSR_Register use record
      LEC            at 0 range 0 .. 2;
      ACT            at 0 range 3 .. 4;
      EP             at 0 range 5 .. 5;
      EW             at 0 range 6 .. 6;
      BO             at 0 range 7 .. 7;
      DLEC           at 0 range 8 .. 10;
      RESI           at 0 range 11 .. 11;
      RBRS           at 0 range 12 .. 12;
      REDL           at 0 range 13 .. 13;
      PXE            at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      TDCV           at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype TDCR_TDCF_Field is HAL.UInt7;
   subtype TDCR_TDCO_Field is HAL.UInt7;

   --  FDCAN Transmitter Delay Compensation Register
   type TDCR_Register is record
      --  Read-only. Transmitter Delay Compensation Filter Window Length
      TDCF           : TDCR_TDCF_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Transmitter Delay Compensation Offset
      TDCO           : TDCR_TDCO_Field;
      --  unspecified
      Reserved_15_31 : HAL.UInt17;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TDCR_Register use record
      TDCF           at 0 range 0 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      TDCO           at 0 range 8 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  FDCAN Interrupt Register
   type IR_Register_1 is record
      --  Read-only. Rx FIFO 0 New Message
      RF0N           : Boolean;
      --  Read-only. Rx FIFO 0 Full
      RF0W           : Boolean;
      --  Read-only. Rx FIFO 0 Full
      RF0F           : Boolean;
      --  Read-only. Rx FIFO 0 Message Lost
      RF0L           : Boolean;
      --  Read-only. Rx FIFO 1 New Message
      RF1N           : Boolean;
      --  Read-only. Rx FIFO 1 Watermark Reached
      RF1W           : Boolean;
      --  Read-only. Rx FIFO 1 Watermark Reached
      RF1F           : Boolean;
      --  Read-only. Rx FIFO 1 Message Lost
      RF1L           : Boolean;
      --  Read-only. High Priority Message
      HPM            : Boolean;
      --  Read-only. Transmission Completed
      TC             : Boolean;
      --  Read-only. Transmission Cancellation Finished
      TCF            : Boolean;
      --  Read-only. Tx FIFO Empty
      TEF            : Boolean;
      --  Read-only. Tx Event FIFO New Entry
      TEFN           : Boolean;
      --  Read-only. Tx Event FIFO Watermark Reached
      TEFW           : Boolean;
      --  Read-only. Tx Event FIFO Full
      TEFF           : Boolean;
      --  Read-only. Tx Event FIFO Element Lost
      TEFL           : Boolean;
      --  Read-only. Timestamp Wraparound
      TSW            : Boolean;
      --  Read-only. Message RAM Access Failure
      MRAF           : Boolean;
      --  Read-only. Timeout Occurred
      TOO            : Boolean;
      --  Read-only. Message stored to Dedicated Rx Buffer
      DRX            : Boolean;
      --  unspecified
      Reserved_20_21 : HAL.UInt2;
      --  Read-only. Error Logging Overflow
      ELO            : Boolean;
      --  Read-only. Error Passive
      EP             : Boolean;
      --  Read-only. Warning Status
      EW             : Boolean;
      --  Read-only. Bus_Off Status
      BO             : Boolean;
      --  Read-only. Watchdog Interrupt
      WDI            : Boolean;
      --  Read-only. Protocol Error in Arbitration Phase (Nominal Bit Time is
      --  used)
      PEA            : Boolean;
      --  Read-only. Protocol Error in Data Phase (Data Bit Time is used)
      PED            : Boolean;
      --  Read-only. Access to Reserved Address
      ARA            : Boolean;
      --  unspecified
      Reserved_30_31 : HAL.UInt2;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IR_Register_1 use record
      RF0N           at 0 range 0 .. 0;
      RF0W           at 0 range 1 .. 1;
      RF0F           at 0 range 2 .. 2;
      RF0L           at 0 range 3 .. 3;
      RF1N           at 0 range 4 .. 4;
      RF1W           at 0 range 5 .. 5;
      RF1F           at 0 range 6 .. 6;
      RF1L           at 0 range 7 .. 7;
      HPM            at 0 range 8 .. 8;
      TC             at 0 range 9 .. 9;
      TCF            at 0 range 10 .. 10;
      TEF            at 0 range 11 .. 11;
      TEFN           at 0 range 12 .. 12;
      TEFW           at 0 range 13 .. 13;
      TEFF           at 0 range 14 .. 14;
      TEFL           at 0 range 15 .. 15;
      TSW            at 0 range 16 .. 16;
      MRAF           at 0 range 17 .. 17;
      TOO            at 0 range 18 .. 18;
      DRX            at 0 range 19 .. 19;
      Reserved_20_21 at 0 range 20 .. 21;
      ELO            at 0 range 22 .. 22;
      EP             at 0 range 23 .. 23;
      EW             at 0 range 24 .. 24;
      BO             at 0 range 25 .. 25;
      WDI            at 0 range 26 .. 26;
      PEA            at 0 range 27 .. 27;
      PED            at 0 range 28 .. 28;
      ARA            at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  FDCAN Interrupt Enable Register
   type IE_Register_1 is record
      --  Read-only. Rx FIFO 0 New Message Enable
      RF0NE          : Boolean;
      --  Read-only. Rx FIFO 0 Full Enable
      RF0WE          : Boolean;
      --  Read-only. Rx FIFO 0 Full Enable
      RF0FE          : Boolean;
      --  Read-only. Rx FIFO 0 Message Lost Enable
      RF0LE          : Boolean;
      --  Read-only. Rx FIFO 1 New Message Enable
      RF1NE          : Boolean;
      --  Read-only. Rx FIFO 1 Watermark Reached Enable
      RF1WE          : Boolean;
      --  Read-only. Rx FIFO 1 Watermark Reached Enable
      RF1FE          : Boolean;
      --  Read-only. Rx FIFO 1 Message Lost Enable
      RF1LE          : Boolean;
      --  Read-only. High Priority Message Enable
      HPME           : Boolean;
      --  Read-only. Transmission Completed Enable
      TCE            : Boolean;
      --  Read-only. Transmission Cancellation Finished Enable
      TCFE           : Boolean;
      --  Read-only. Tx FIFO Empty Enable
      TEFE           : Boolean;
      --  Read-only. Tx Event FIFO New Entry Enable
      TEFNE          : Boolean;
      --  Read-only. Tx Event FIFO Watermark Reached Enable
      TEFWE          : Boolean;
      --  Read-only. Tx Event FIFO Full Enable
      TEFFE          : Boolean;
      --  Read-only. Tx Event FIFO Element Lost Enable
      TEFLE          : Boolean;
      --  Read-only. Timestamp Wraparound Enable
      TSWE           : Boolean;
      --  Read-only. Message RAM Access Failure Enable
      MRAFE          : Boolean;
      --  Read-only. Timeout Occurred Enable
      TOOE           : Boolean;
      --  Read-only. Message stored to Dedicated Rx Buffer Enable
      DRXE           : Boolean;
      --  Read-only. Bit Error Corrected Interrupt Enable
      BECE           : Boolean;
      --  Read-only. Bit Error Uncorrected Interrupt Enable
      BEUE           : Boolean;
      --  Read-only. Error Logging Overflow Enable
      ELOE           : Boolean;
      --  Read-only. Error Passive Enable
      EPE            : Boolean;
      --  Read-only. Warning Status Enable
      EWE            : Boolean;
      --  Read-only. Bus_Off Status Enable
      BOE            : Boolean;
      --  Read-only. Watchdog Interrupt Enable
      WDIE           : Boolean;
      --  Read-only. Protocol Error in Arbitration Phase Enable
      PEAE           : Boolean;
      --  Read-only. Protocol Error in Data Phase Enable
      PEDE           : Boolean;
      --  Read-only. Access to Reserved Address Enable
      ARAE           : Boolean;
      --  unspecified
      Reserved_30_31 : HAL.UInt2;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IE_Register_1 use record
      RF0NE          at 0 range 0 .. 0;
      RF0WE          at 0 range 1 .. 1;
      RF0FE          at 0 range 2 .. 2;
      RF0LE          at 0 range 3 .. 3;
      RF1NE          at 0 range 4 .. 4;
      RF1WE          at 0 range 5 .. 5;
      RF1FE          at 0 range 6 .. 6;
      RF1LE          at 0 range 7 .. 7;
      HPME           at 0 range 8 .. 8;
      TCE            at 0 range 9 .. 9;
      TCFE           at 0 range 10 .. 10;
      TEFE           at 0 range 11 .. 11;
      TEFNE          at 0 range 12 .. 12;
      TEFWE          at 0 range 13 .. 13;
      TEFFE          at 0 range 14 .. 14;
      TEFLE          at 0 range 15 .. 15;
      TSWE           at 0 range 16 .. 16;
      MRAFE          at 0 range 17 .. 17;
      TOOE           at 0 range 18 .. 18;
      DRXE           at 0 range 19 .. 19;
      BECE           at 0 range 20 .. 20;
      BEUE           at 0 range 21 .. 21;
      ELOE           at 0 range 22 .. 22;
      EPE            at 0 range 23 .. 23;
      EWE            at 0 range 24 .. 24;
      BOE            at 0 range 25 .. 25;
      WDIE           at 0 range 26 .. 26;
      PEAE           at 0 range 27 .. 27;
      PEDE           at 0 range 28 .. 28;
      ARAE           at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  FDCAN Interrupt Line Select Register
   type ILS_Register is record
      --  Read-only. Rx FIFO 0 New Message Interrupt Line
      RF0NL          : Boolean;
      --  Read-only. Rx FIFO 0 Watermark Reached Interrupt Line
      RF0WL          : Boolean;
      --  Read-only. Rx FIFO 0 Full Interrupt Line
      RF0FL          : Boolean;
      --  Read-only. Rx FIFO 0 Message Lost Interrupt Line
      RF0LL          : Boolean;
      --  Read-only. Rx FIFO 1 New Message Interrupt Line
      RF1NL          : Boolean;
      --  Read-only. Rx FIFO 1 Watermark Reached Interrupt Line
      RF1WL          : Boolean;
      --  Read-only. Rx FIFO 1 Full Interrupt Line
      RF1FL          : Boolean;
      --  Read-only. Rx FIFO 1 Message Lost Interrupt Line
      RF1LL          : Boolean;
      --  Read-only. High Priority Message Interrupt Line
      HPML           : Boolean;
      --  Read-only. Transmission Completed Interrupt Line
      TCL            : Boolean;
      --  Read-only. Transmission Cancellation Finished Interrupt Line
      TCFL           : Boolean;
      --  Read-only. Tx FIFO Empty Interrupt Line
      TFEL           : Boolean;
      --  Read-only. Tx Event FIFO New Entry Interrupt Line
      TEFNL          : Boolean;
      --  Read-only. Tx Event FIFO Watermark Reached Interrupt Line
      TEFWL          : Boolean;
      --  Read-only. Tx Event FIFO Full Interrupt Line
      TEFFL          : Boolean;
      --  Read-only. Tx Event FIFO Element Lost Interrupt Line
      TEFLL          : Boolean;
      --  Read-only. Timestamp Wraparound Interrupt Line
      TSWL           : Boolean;
      --  Read-only. Message RAM Access Failure Interrupt Line
      MRAFL          : Boolean;
      --  Read-only. Timeout Occurred Interrupt Line
      TOOL           : Boolean;
      --  Read-only. Message stored to Dedicated Rx Buffer Interrupt Line
      DRXL           : Boolean;
      --  Read-only. Bit Error Corrected Interrupt Line
      BECL           : Boolean;
      --  Read-only. Bit Error Uncorrected Interrupt Line
      BEUL           : Boolean;
      --  Read-only. Error Logging Overflow Interrupt Line
      ELOL           : Boolean;
      --  Read-only. Error Passive Interrupt Line
      EPL            : Boolean;
      --  Read-only. Warning Status Interrupt Line
      EWL            : Boolean;
      --  Read-only. Bus_Off Status
      BOL            : Boolean;
      --  Read-only. Watchdog Interrupt Line
      WDIL           : Boolean;
      --  Read-only. Protocol Error in Arbitration Phase Line
      PEAL           : Boolean;
      --  Read-only. Protocol Error in Data Phase Line
      PEDL           : Boolean;
      --  Read-only. Access to Reserved Address Line
      ARAL           : Boolean;
      --  unspecified
      Reserved_30_31 : HAL.UInt2;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ILS_Register use record
      RF0NL          at 0 range 0 .. 0;
      RF0WL          at 0 range 1 .. 1;
      RF0FL          at 0 range 2 .. 2;
      RF0LL          at 0 range 3 .. 3;
      RF1NL          at 0 range 4 .. 4;
      RF1WL          at 0 range 5 .. 5;
      RF1FL          at 0 range 6 .. 6;
      RF1LL          at 0 range 7 .. 7;
      HPML           at 0 range 8 .. 8;
      TCL            at 0 range 9 .. 9;
      TCFL           at 0 range 10 .. 10;
      TFEL           at 0 range 11 .. 11;
      TEFNL          at 0 range 12 .. 12;
      TEFWL          at 0 range 13 .. 13;
      TEFFL          at 0 range 14 .. 14;
      TEFLL          at 0 range 15 .. 15;
      TSWL           at 0 range 16 .. 16;
      MRAFL          at 0 range 17 .. 17;
      TOOL           at 0 range 18 .. 18;
      DRXL           at 0 range 19 .. 19;
      BECL           at 0 range 20 .. 20;
      BEUL           at 0 range 21 .. 21;
      ELOL           at 0 range 22 .. 22;
      EPL            at 0 range 23 .. 23;
      EWL            at 0 range 24 .. 24;
      BOL            at 0 range 25 .. 25;
      WDIL           at 0 range 26 .. 26;
      PEAL           at 0 range 27 .. 27;
      PEDL           at 0 range 28 .. 28;
      ARAL           at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  ILE_EINT array
   type ILE_EINT_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for ILE_EINT
   type ILE_EINT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EINT as a value
            Val : HAL.UInt2;
         when True =>
            --  EINT as an array
            Arr : ILE_EINT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for ILE_EINT_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  FDCAN Interrupt Line Enable Register
   type ILE_Register is record
      --  Enable Interrupt Line 0
      EINT          : ILE_EINT_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ILE_Register use record
      EINT          at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype GFC_ANFE_Field is HAL.UInt2;
   subtype GFC_ANFS_Field is HAL.UInt2;

   --  FDCAN Global Filter Configuration Register
   type GFC_Register is record
      --  Reject Remote Frames Extended
      RRFE          : Boolean := False;
      --  Reject Remote Frames Standard
      RRFS          : Boolean := False;
      --  Accept Non-matching Frames Extended
      ANFE          : GFC_ANFE_Field := 16#0#;
      --  Accept Non-matching Frames Standard
      ANFS          : GFC_ANFS_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GFC_Register use record
      RRFE          at 0 range 0 .. 0;
      RRFS          at 0 range 1 .. 1;
      ANFE          at 0 range 2 .. 3;
      ANFS          at 0 range 4 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype SIDFC_FLSSA_Field is HAL.UInt14;
   subtype SIDFC_LSS_Field is HAL.UInt8;

   --  FDCAN Standard ID Filter Configuration Register
   type SIDFC_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Filter List Standard Start Address
      FLSSA          : SIDFC_FLSSA_Field := 16#0#;
      --  List Size Standard
      LSS            : SIDFC_LSS_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIDFC_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      FLSSA          at 0 range 2 .. 15;
      LSS            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype XIDFC_FLESA_Field is HAL.UInt14;
   subtype XIDFC_LSE_Field is HAL.UInt8;

   --  FDCAN Extended ID Filter Configuration Register
   type XIDFC_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Filter List Standard Start Address
      FLESA          : XIDFC_FLESA_Field := 16#0#;
      --  List Size Extended
      LSE            : XIDFC_LSE_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for XIDFC_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      FLESA          at 0 range 2 .. 15;
      LSE            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype XIDAM_EIDM_Field is HAL.UInt29;

   --  FDCAN Extended ID and Mask Register
   type XIDAM_Register is record
      --  Extended ID Mask
      EIDM           : XIDAM_EIDM_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for XIDAM_Register use record
      EIDM           at 0 range 0 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype HPMS_BIDX_Field is HAL.UInt6;
   subtype HPMS_MSI_Field is HAL.UInt2;
   subtype HPMS_FIDX_Field is HAL.UInt7;

   --  FDCAN High Priority Message Status Register
   type HPMS_Register is record
      --  Read-only. Buffer Index
      BIDX           : HPMS_BIDX_Field;
      --  Read-only. Message Storage Indicator
      MSI            : HPMS_MSI_Field;
      --  Read-only. Filter Index
      FIDX           : HPMS_FIDX_Field;
      --  Read-only. Filter List
      FLST           : Boolean;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for HPMS_Register use record
      BIDX           at 0 range 0 .. 5;
      MSI            at 0 range 6 .. 7;
      FIDX           at 0 range 8 .. 14;
      FLST           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  NDAT1_ND array
   type NDAT1_ND_Field_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   --  FDCAN New Data 1 Register
   type NDAT1_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ND as a value
            Val : HAL.UInt32;
         when True =>
            --  ND as an array
            Arr : NDAT1_ND_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NDAT1_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  NDAT2_ND array
   type NDAT2_ND_Field_Array is array (32 .. 63) of Boolean
     with Component_Size => 1, Size => 32;

   --  FDCAN New Data 2 Register
   type NDAT2_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ND as a value
            Val : HAL.UInt32;
         when True =>
            --  ND as an array
            Arr : NDAT2_ND_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NDAT2_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   subtype RXF0C_F0SA_Field is HAL.UInt14;
   subtype RXF0C_F0S_Field is HAL.UInt7;
   subtype RXF0C_F0WM_Field is HAL.UInt7;

   --  FDCAN Rx FIFO 0 Configuration Register
   type RXF0C_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Rx FIFO 0 Start Address
      F0SA           : RXF0C_F0SA_Field := 16#0#;
      --  Rx FIFO 0 Size
      F0S            : RXF0C_F0S_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      --  FIFO 0 Watermark
      F0WM           : RXF0C_F0WM_Field := 16#0#;
      --  FIFO 0 operation mode
      F0OM           : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXF0C_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      F0SA           at 0 range 2 .. 15;
      F0S            at 0 range 16 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      F0WM           at 0 range 24 .. 30;
      F0OM           at 0 range 31 .. 31;
   end record;

   subtype RXF0S_F0FL_Field is HAL.UInt7;
   subtype RXF0S_F0G_Field is HAL.UInt6;
   subtype RXF0S_F0P_Field is HAL.UInt6;

   --  FDCAN Rx FIFO 0 Status Register
   type RXF0S_Register is record
      --  Rx FIFO 0 Fill Level
      F0FL           : RXF0S_F0FL_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Rx FIFO 0 Get Index
      F0G            : RXF0S_F0G_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      --  Rx FIFO 0 Put Index
      F0P            : RXF0S_F0P_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  Rx FIFO 0 Full
      F0F            : Boolean := False;
      --  Rx FIFO 0 Message Lost
      RF0L           : Boolean := False;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXF0S_Register use record
      F0FL           at 0 range 0 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      F0G            at 0 range 8 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      F0P            at 0 range 16 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      F0F            at 0 range 24 .. 24;
      RF0L           at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype RXF0A_FA01_Field is HAL.UInt6;

   --  CAN Rx FIFO 0 Acknowledge Register
   type RXF0A_Register is record
      --  Rx FIFO 0 Acknowledge Index
      FA01          : RXF0A_FA01_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXF0A_Register use record
      FA01          at 0 range 0 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype RXBC_RBSA_Field is HAL.UInt14;

   --  FDCAN Rx Buffer Configuration Register
   type RXBC_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Rx Buffer Start Address
      RBSA           : RXBC_RBSA_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXBC_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      RBSA           at 0 range 2 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RXF1C_F1SA_Field is HAL.UInt14;
   subtype RXF1C_F1S_Field is HAL.UInt7;
   subtype RXF1C_F1WM_Field is HAL.UInt7;

   --  FDCAN Rx FIFO 1 Configuration Register
   type RXF1C_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Rx FIFO 1 Start Address
      F1SA           : RXF1C_F1SA_Field := 16#0#;
      --  Rx FIFO 1 Size
      F1S            : RXF1C_F1S_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      --  Rx FIFO 1 Watermark
      F1WM           : RXF1C_F1WM_Field := 16#0#;
      --  FIFO 1 operation mode
      F1OM           : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXF1C_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      F1SA           at 0 range 2 .. 15;
      F1S            at 0 range 16 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      F1WM           at 0 range 24 .. 30;
      F1OM           at 0 range 31 .. 31;
   end record;

   subtype RXF1S_F1FL_Field is HAL.UInt7;
   subtype RXF1S_F1GI_Field is HAL.UInt7;
   subtype RXF1S_F1PI_Field is HAL.UInt7;
   subtype RXF1S_DMS_Field is HAL.UInt2;

   --  FDCAN Rx FIFO 1 Status Register
   type RXF1S_Register is record
      --  Rx FIFO 1 Fill Level
      F1FL           : RXF1S_F1FL_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Rx FIFO 1 Get Index
      F1GI           : RXF1S_F1GI_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      --  Rx FIFO 1 Put Index
      F1PI           : RXF1S_F1PI_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      --  Rx FIFO 1 Full
      F1F            : Boolean := False;
      --  Rx FIFO 1 Message Lost
      RF1L           : Boolean := False;
      --  unspecified
      Reserved_26_29 : HAL.UInt4 := 16#0#;
      --  Debug Message Status
      DMS            : RXF1S_DMS_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXF1S_Register use record
      F1FL           at 0 range 0 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      F1GI           at 0 range 8 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      F1PI           at 0 range 16 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      F1F            at 0 range 24 .. 24;
      RF1L           at 0 range 25 .. 25;
      Reserved_26_29 at 0 range 26 .. 29;
      DMS            at 0 range 30 .. 31;
   end record;

   subtype RXF1A_F1AI_Field is HAL.UInt6;

   --  FDCAN Rx FIFO 1 Acknowledge Register
   type RXF1A_Register is record
      --  Rx FIFO 1 Acknowledge Index
      F1AI          : RXF1A_F1AI_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXF1A_Register use record
      F1AI          at 0 range 0 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype RXESC_F0DS_Field is HAL.UInt3;
   subtype RXESC_F1DS_Field is HAL.UInt3;
   subtype RXESC_RBDS_Field is HAL.UInt3;

   --  FDCAN Rx Buffer Element Size Configuration Register
   type RXESC_Register is record
      --  Rx FIFO 1 Data Field Size:
      F0DS           : RXESC_F0DS_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  Rx FIFO 0 Data Field Size:
      F1DS           : RXESC_F1DS_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Rx Buffer Data Field Size:
      RBDS           : RXESC_RBDS_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXESC_Register use record
      F0DS           at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      F1DS           at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      RBDS           at 0 range 8 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype TXBC_TBSA_Field is HAL.UInt14;
   subtype TXBC_NDTB_Field is HAL.UInt6;
   subtype TXBC_TFQS_Field is HAL.UInt6;

   --  FDCAN Tx Buffer Configuration Register
   type TXBC_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Tx Buffers Start Address
      TBSA           : TXBC_TBSA_Field := 16#0#;
      --  Number of Dedicated Transmit Buffers
      NDTB           : TXBC_NDTB_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  Transmit FIFO/Queue Size
      TFQS           : TXBC_TFQS_Field := 16#0#;
      --  Tx FIFO/Queue Mode
      TFQM           : Boolean := False;
      --  unspecified
      Reserved_31_31 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXBC_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      TBSA           at 0 range 2 .. 15;
      NDTB           at 0 range 16 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      TFQS           at 0 range 24 .. 29;
      TFQM           at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype TXFQS_TFFL_Field is HAL.UInt6;
   subtype TXFQS_TFGI_Field is HAL.UInt5;
   subtype TXFQS_TFQPI_Field is HAL.UInt5;

   --  FDCAN Tx FIFO/Queue Status Register
   type TXFQS_Register is record
      --  Read-only. Tx FIFO Free Level
      TFFL           : TXFQS_TFFL_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. TFGI
      TFGI           : TXFQS_TFGI_Field;
      --  unspecified
      Reserved_13_15 : HAL.UInt3;
      --  Read-only. Tx FIFO/Queue Put Index
      TFQPI          : TXFQS_TFQPI_Field;
      --  Read-only. Tx FIFO/Queue Full
      TFQF           : Boolean;
      --  unspecified
      Reserved_22_31 : HAL.UInt10;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXFQS_Register use record
      TFFL           at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      TFGI           at 0 range 8 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      TFQPI          at 0 range 16 .. 20;
      TFQF           at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype TXESC_TBDS_Field is HAL.UInt3;

   --  FDCAN Tx Buffer Element Size Configuration Register
   type TXESC_Register is record
      --  Tx Buffer Data Field Size:
      TBDS          : TXESC_TBDS_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXESC_Register use record
      TBDS          at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype TXEFC_EFSA_Field is HAL.UInt14;
   subtype TXEFC_EFS_Field is HAL.UInt6;
   subtype TXEFC_EFWM_Field is HAL.UInt6;

   --  FDCAN Tx Event FIFO Configuration Register
   type TXEFC_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Event FIFO Start Address
      EFSA           : TXEFC_EFSA_Field := 16#0#;
      --  Event FIFO Size
      EFS            : TXEFC_EFS_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      --  Event FIFO Watermark
      EFWM           : TXEFC_EFWM_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXEFC_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      EFSA           at 0 range 2 .. 15;
      EFS            at 0 range 16 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      EFWM           at 0 range 24 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype TXEFS_EFFL_Field is HAL.UInt6;
   subtype TXEFS_EFGI_Field is HAL.UInt5;

   --  FDCAN Tx Event FIFO Status Register
   type TXEFS_Register is record
      --  Event FIFO Fill Level
      EFFL           : TXEFS_EFFL_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Event FIFO Get Index.
      EFGI           : TXEFS_EFGI_Field := 16#0#;
      --  unspecified
      Reserved_13_23 : HAL.UInt11 := 16#0#;
      --  Event FIFO Full.
      EFF            : Boolean := False;
      --  Tx Event FIFO Element Lost.
      TEFL           : Boolean := False;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXEFS_Register use record
      EFFL           at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      EFGI           at 0 range 8 .. 12;
      Reserved_13_23 at 0 range 13 .. 23;
      EFF            at 0 range 24 .. 24;
      TEFL           at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype TXEFA_EFAI_Field is HAL.UInt5;

   --  FDCAN Tx Event FIFO Acknowledge Register
   type TXEFA_Register is record
      --  Event FIFO Acknowledge Index
      EFAI          : TXEFA_EFAI_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXEFA_Register use record
      EFAI          at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype TTTMC_TMSA_Field is HAL.UInt14;
   subtype TTTMC_TME_Field is HAL.UInt7;

   --  FDCAN TT Trigger Memory Configuration Register
   type TTTMC_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Trigger Memory Start Address
      TMSA           : TTTMC_TMSA_Field := 16#0#;
      --  Trigger Memory Elements
      TME            : TTTMC_TME_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : HAL.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTTMC_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      TMSA           at 0 range 2 .. 15;
      TME            at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype TTRMC_RID_Field is HAL.UInt29;

   --  FDCAN TT Reference Message Configuration Register
   type TTRMC_Register is record
      --  Reference Identifier.
      RID            : TTRMC_RID_Field := 16#0#;
      --  unspecified
      Reserved_29_29 : HAL.Bit := 16#0#;
      --  Extended Identifier
      XTD            : Boolean := False;
      --  Reference Message Payload Select
      RMPS           : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTRMC_Register use record
      RID            at 0 range 0 .. 28;
      Reserved_29_29 at 0 range 29 .. 29;
      XTD            at 0 range 30 .. 30;
      RMPS           at 0 range 31 .. 31;
   end record;

   subtype TTOCF_OM_Field is HAL.UInt2;
   subtype TTOCF_LDSDL_Field is HAL.UInt3;
   subtype TTOCF_IRTO_Field is HAL.UInt7;
   subtype TTOCF_AWL_Field is HAL.UInt8;

   --  FDCAN TT Operation Configuration Register
   type TTOCF_Register is record
      --  Operation Mode
      OM             : TTOCF_OM_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : HAL.Bit := 16#0#;
      --  Gap Enable
      GEN            : Boolean := False;
      --  Time Master
      TM             : Boolean := False;
      --  LD of Synchronization Deviation Limit
      LDSDL          : TTOCF_LDSDL_Field := 16#0#;
      --  Initial Reference Trigger Offset
      IRTO           : TTOCF_IRTO_Field := 16#0#;
      --  Enable External Clock Synchronization
      EECS           : Boolean := False;
      --  Application Watchdog Limit
      AWL            : TTOCF_AWL_Field := 16#0#;
      --  Enable Global Time Filtering
      EGTF           : Boolean := False;
      --  Enable Clock Calibration
      ECC            : Boolean := False;
      --  Event Trigger Polarity
      EVTP           : Boolean := False;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTOCF_Register use record
      OM             at 0 range 0 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      GEN            at 0 range 3 .. 3;
      TM             at 0 range 4 .. 4;
      LDSDL          at 0 range 5 .. 7;
      IRTO           at 0 range 8 .. 14;
      EECS           at 0 range 15 .. 15;
      AWL            at 0 range 16 .. 23;
      EGTF           at 0 range 24 .. 24;
      ECC            at 0 range 25 .. 25;
      EVTP           at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype TTMLM_CCM_Field is HAL.UInt6;
   subtype TTMLM_CSS_Field is HAL.UInt2;
   subtype TTMLM_TXEW_Field is HAL.UInt4;
   subtype TTMLM_ENTT_Field is HAL.UInt12;

   --  FDCAN TT Matrix Limits Register
   type TTMLM_Register is record
      --  Cycle Count Max
      CCM            : TTMLM_CCM_Field := 16#0#;
      --  Cycle Start Synchronization
      CSS            : TTMLM_CSS_Field := 16#0#;
      --  Tx Enable Window
      TXEW           : TTMLM_TXEW_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Expected Number of Tx Triggers
      ENTT           : TTMLM_ENTT_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTMLM_Register use record
      CCM            at 0 range 0 .. 5;
      CSS            at 0 range 6 .. 7;
      TXEW           at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      ENTT           at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype TURCF_NCL_Field is HAL.UInt16;
   subtype TURCF_DC_Field is HAL.UInt14;

   --  FDCAN TUR Configuration Register
   type TURCF_Register is record
      --  Numerator Configuration Low.
      NCL            : TURCF_NCL_Field := 16#0#;
      --  Denominator Configuration.
      DC             : TURCF_DC_Field := 16#0#;
      --  unspecified
      Reserved_30_30 : HAL.Bit := 16#0#;
      --  Enable Local Time
      ELT            : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TURCF_Register use record
      NCL            at 0 range 0 .. 15;
      DC             at 0 range 16 .. 29;
      Reserved_30_30 at 0 range 30 .. 30;
      ELT            at 0 range 31 .. 31;
   end record;

   subtype TTOCN_SWS_Field is HAL.UInt2;
   subtype TTOCN_TMC_Field is HAL.UInt2;

   --  FDCAN TT Operation Control Register
   type TTOCN_Register is record
      --  Set Global time
      SGT            : Boolean := False;
      --  External Clock Synchronization
      ECS            : Boolean := False;
      --  Stop Watch Polarity
      SWP            : Boolean := False;
      --  Stop Watch Source.
      SWS            : TTOCN_SWS_Field := 16#0#;
      --  Register Time Mark Interrupt Pulse Enable
      RTIE           : Boolean := False;
      --  Register Time Mark Compare
      TMC            : TTOCN_TMC_Field := 16#0#;
      --  Trigger Time Mark Interrupt Pulse Enable
      TTIE           : Boolean := False;
      --  Gap Control Select
      GCS            : Boolean := False;
      --  Finish Gap.
      FGP            : Boolean := False;
      --  Time Mark Gap
      TMG            : Boolean := False;
      --  Next is Gap
      NIG            : Boolean := False;
      --  External Synchronization Control
      ESCN           : Boolean := False;
      --  unspecified
      Reserved_14_14 : HAL.Bit := 16#0#;
      --  TT Operation Control Register Locked
      LCKC           : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTOCN_Register use record
      SGT            at 0 range 0 .. 0;
      ECS            at 0 range 1 .. 1;
      SWP            at 0 range 2 .. 2;
      SWS            at 0 range 3 .. 4;
      RTIE           at 0 range 5 .. 5;
      TMC            at 0 range 6 .. 7;
      TTIE           at 0 range 8 .. 8;
      GCS            at 0 range 9 .. 9;
      FGP            at 0 range 10 .. 10;
      TMG            at 0 range 11 .. 11;
      NIG            at 0 range 12 .. 12;
      ESCN           at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      LCKC           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TTGTP_NCL_Field is HAL.UInt16;
   subtype TTGTP_CTP_Field is HAL.UInt16;

   --  FDCAN TT Global Time Preset Register
   type TTGTP_Register is record
      --  Time Preset
      NCL : TTGTP_NCL_Field := 16#0#;
      --  Cycle Time Target Phase
      CTP : TTGTP_CTP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTGTP_Register use record
      NCL at 0 range 0 .. 15;
      CTP at 0 range 16 .. 31;
   end record;

   subtype TTTMK_TM_Field is HAL.UInt16;
   subtype TTTMK_TICC_Field is HAL.UInt7;

   --  FDCAN TT Time Mark Register
   type TTTMK_Register is record
      --  Time Mark
      TM             : TTTMK_TM_Field := 16#0#;
      --  Time Mark Cycle Code
      TICC           : TTTMK_TICC_Field := 16#0#;
      --  unspecified
      Reserved_23_30 : HAL.UInt8 := 16#0#;
      --  TT Time Mark Register Locked
      LCKM           : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTTMK_Register use record
      TM             at 0 range 0 .. 15;
      TICC           at 0 range 16 .. 22;
      Reserved_23_30 at 0 range 23 .. 30;
      LCKM           at 0 range 31 .. 31;
   end record;

   --  TTIR_SE array
   type TTIR_SE_Field_Array is array (1 .. 2) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for TTIR_SE
   type TTIR_SE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SE as a value
            Val : HAL.UInt2;
         when True =>
            --  SE as an array
            Arr : TTIR_SE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TTIR_SE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  FDCAN TT Interrupt Register
   type TTIR_Register is record
      --  Start of Basic Cycle
      SBC            : Boolean := False;
      --  Start of Matrix Cycle
      SMC            : Boolean := False;
      --  Change of Synchronization Mode
      CSM            : Boolean := False;
      --  Start of Gap
      SOG            : Boolean := False;
      --  Register Time Mark Interrupt.
      RTMI           : Boolean := False;
      --  Trigger Time Mark Event Internal
      TTMI           : Boolean := False;
      --  Stop Watch Event
      SWE            : Boolean := False;
      --  Global Time Wrap
      GTW            : Boolean := False;
      --  Global Time Discontinuity
      GTD            : Boolean := False;
      --  Global Time Error
      GTE            : Boolean := False;
      --  Tx Count Underflow
      TXU            : Boolean := False;
      --  Tx Count Overflow
      TXO            : Boolean := False;
      --  Scheduling Error 1
      SE             : TTIR_SE_Field := (As_Array => False, Val => 16#0#);
      --  Error Level Changed.
      ELC            : Boolean := False;
      --  Initialization Watch Trigger
      IWTG           : Boolean := False;
      --  Watch Trigger
      WT             : Boolean := False;
      --  Application Watchdog
      AW             : Boolean := False;
      --  Configuration Error
      CER            : Boolean := False;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTIR_Register use record
      SBC            at 0 range 0 .. 0;
      SMC            at 0 range 1 .. 1;
      CSM            at 0 range 2 .. 2;
      SOG            at 0 range 3 .. 3;
      RTMI           at 0 range 4 .. 4;
      TTMI           at 0 range 5 .. 5;
      SWE            at 0 range 6 .. 6;
      GTW            at 0 range 7 .. 7;
      GTD            at 0 range 8 .. 8;
      GTE            at 0 range 9 .. 9;
      TXU            at 0 range 10 .. 10;
      TXO            at 0 range 11 .. 11;
      SE             at 0 range 12 .. 13;
      ELC            at 0 range 14 .. 14;
      IWTG           at 0 range 15 .. 15;
      WT             at 0 range 16 .. 16;
      AW             at 0 range 17 .. 17;
      CER            at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   --  FDCAN TT Interrupt Enable Register
   type TTIE_Register is record
      --  Start of Basic Cycle Interrupt Enable
      SBCE           : Boolean := False;
      --  Start of Matrix Cycle Interrupt Enable
      SMCE           : Boolean := False;
      --  Change of Synchronization Mode Interrupt Enable
      CSME           : Boolean := False;
      --  Start of Gap Interrupt Enable
      SOGE           : Boolean := False;
      --  Register Time Mark Interrupt Enable
      RTMIE          : Boolean := False;
      --  Trigger Time Mark Event Internal Interrupt Enable
      TTMIE          : Boolean := False;
      --  Stop Watch Event Interrupt Enable
      SWEE           : Boolean := False;
      --  Global Time Wrap Interrupt Enable
      GTWE           : Boolean := False;
      --  Global Time Discontinuity Interrupt Enable
      GTDE           : Boolean := False;
      --  Global Time Error Interrupt Enable
      GTEE           : Boolean := False;
      --  Tx Count Underflow Interrupt Enable
      TXUE           : Boolean := False;
      --  Tx Count Overflow Interrupt Enable
      TXOE           : Boolean := False;
      --  Scheduling Error 1 Interrupt Enable
      SE1E           : Boolean := False;
      --  Scheduling Error 2 Interrupt Enable
      SE2E           : Boolean := False;
      --  Change Error Level Interrupt Enable
      ELCE           : Boolean := False;
      --  Initialization Watch Trigger Interrupt Enable
      IWTGE          : Boolean := False;
      --  Watch Trigger Interrupt Enable
      WTE            : Boolean := False;
      --  Application Watchdog Interrupt Enable
      AWE            : Boolean := False;
      --  Configuration Error Interrupt Enable
      CERE           : Boolean := False;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTIE_Register use record
      SBCE           at 0 range 0 .. 0;
      SMCE           at 0 range 1 .. 1;
      CSME           at 0 range 2 .. 2;
      SOGE           at 0 range 3 .. 3;
      RTMIE          at 0 range 4 .. 4;
      TTMIE          at 0 range 5 .. 5;
      SWEE           at 0 range 6 .. 6;
      GTWE           at 0 range 7 .. 7;
      GTDE           at 0 range 8 .. 8;
      GTEE           at 0 range 9 .. 9;
      TXUE           at 0 range 10 .. 10;
      TXOE           at 0 range 11 .. 11;
      SE1E           at 0 range 12 .. 12;
      SE2E           at 0 range 13 .. 13;
      ELCE           at 0 range 14 .. 14;
      IWTGE          at 0 range 15 .. 15;
      WTE            at 0 range 16 .. 16;
      AWE            at 0 range 17 .. 17;
      CERE           at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   --  FDCAN TT Interrupt Line Select Register
   type TTILS_Register is record
      --  Start of Basic Cycle Interrupt Line
      SBCL           : Boolean := False;
      --  Start of Matrix Cycle Interrupt Line
      SMCL           : Boolean := False;
      --  Change of Synchronization Mode Interrupt Line
      CSML           : Boolean := False;
      --  Start of Gap Interrupt Line
      SOGL           : Boolean := False;
      --  Register Time Mark Interrupt Line
      RTMIL          : Boolean := False;
      --  Trigger Time Mark Event Internal Interrupt Line
      TTMIL          : Boolean := False;
      --  Stop Watch Event Interrupt Line
      SWEL           : Boolean := False;
      --  Global Time Wrap Interrupt Line
      GTWL           : Boolean := False;
      --  Global Time Discontinuity Interrupt Line
      GTDL           : Boolean := False;
      --  Global Time Error Interrupt Line
      GTEL           : Boolean := False;
      --  Tx Count Underflow Interrupt Line
      TXUL           : Boolean := False;
      --  Tx Count Overflow Interrupt Line
      TXOL           : Boolean := False;
      --  Scheduling Error 1 Interrupt Line
      SE1L           : Boolean := False;
      --  Scheduling Error 2 Interrupt Line
      SE2L           : Boolean := False;
      --  Change Error Level Interrupt Line
      ELCL           : Boolean := False;
      --  Initialization Watch Trigger Interrupt Line
      IWTGL          : Boolean := False;
      --  Watch Trigger Interrupt Line
      WTL            : Boolean := False;
      --  Application Watchdog Interrupt Line
      AWL            : Boolean := False;
      --  Configuration Error Interrupt Line
      CERL           : Boolean := False;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTILS_Register use record
      SBCL           at 0 range 0 .. 0;
      SMCL           at 0 range 1 .. 1;
      CSML           at 0 range 2 .. 2;
      SOGL           at 0 range 3 .. 3;
      RTMIL          at 0 range 4 .. 4;
      TTMIL          at 0 range 5 .. 5;
      SWEL           at 0 range 6 .. 6;
      GTWL           at 0 range 7 .. 7;
      GTDL           at 0 range 8 .. 8;
      GTEL           at 0 range 9 .. 9;
      TXUL           at 0 range 10 .. 10;
      TXOL           at 0 range 11 .. 11;
      SE1L           at 0 range 12 .. 12;
      SE2L           at 0 range 13 .. 13;
      ELCL           at 0 range 14 .. 14;
      IWTGL          at 0 range 15 .. 15;
      WTL            at 0 range 16 .. 16;
      AWL            at 0 range 17 .. 17;
      CERL           at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype TTOST_EL_Field is HAL.UInt2;
   subtype TTOST_MS_Field is HAL.UInt2;
   subtype TTOST_SYS_Field is HAL.UInt2;
   subtype TTOST_RTO_Field is HAL.UInt8;
   subtype TTOST_TMP_Field is HAL.UInt3;

   --  FDCAN TT Operation Status Register
   type TTOST_Register is record
      --  Error Level
      EL             : TTOST_EL_Field := 16#0#;
      --  Master State.
      MS             : TTOST_MS_Field := 16#0#;
      --  Synchronization State
      SYS            : TTOST_SYS_Field := 16#0#;
      --  Quality of Global Time Phase
      GTP            : Boolean := False;
      --  Quality of Clock Speed
      QCS            : Boolean := False;
      --  Reference Trigger Offset
      RTO            : TTOST_RTO_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : HAL.UInt6 := 16#0#;
      --  Wait for Global Time Discontinuity
      WGTD           : Boolean := False;
      --  Gap Finished Indicator.
      GFI            : Boolean := False;
      --  Time Master Priority
      TMP            : TTOST_TMP_Field := 16#0#;
      --  Gap Started Indicator.
      GSI            : Boolean := False;
      --  Wait for Event
      WFE            : Boolean := False;
      --  Application Watchdog Event
      AWE            : Boolean := False;
      --  Wait for External Clock Synchronization
      WECS           : Boolean := False;
      --  Schedule Phase Lock
      SPL            : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTOST_Register use record
      EL             at 0 range 0 .. 1;
      MS             at 0 range 2 .. 3;
      SYS            at 0 range 4 .. 5;
      GTP            at 0 range 6 .. 6;
      QCS            at 0 range 7 .. 7;
      RTO            at 0 range 8 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      WGTD           at 0 range 22 .. 22;
      GFI            at 0 range 23 .. 23;
      TMP            at 0 range 24 .. 26;
      GSI            at 0 range 27 .. 27;
      WFE            at 0 range 28 .. 28;
      AWE            at 0 range 29 .. 29;
      WECS           at 0 range 30 .. 30;
      SPL            at 0 range 31 .. 31;
   end record;

   subtype TURNA_NAV_Field is HAL.UInt18;

   --  FDCAN TUR Numerator Actual Register
   type TURNA_Register is record
      --  Read-only. Numerator Actual Value
      NAV            : TURNA_NAV_Field;
      --  unspecified
      Reserved_18_31 : HAL.UInt14;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TURNA_Register use record
      NAV            at 0 range 0 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype TTLGT_LT_Field is HAL.UInt16;
   subtype TTLGT_GT_Field is HAL.UInt16;

   --  FDCAN TT Local and Global Time Register
   type TTLGT_Register is record
      --  Read-only. Local Time
      LT : TTLGT_LT_Field;
      --  Read-only. Global Time
      GT : TTLGT_GT_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTLGT_Register use record
      LT at 0 range 0 .. 15;
      GT at 0 range 16 .. 31;
   end record;

   subtype TTCTC_CT_Field is HAL.UInt16;
   subtype TTCTC_CC_Field is HAL.UInt6;

   --  FDCAN TT Cycle Time and Count Register
   type TTCTC_Register is record
      --  Read-only. Cycle Time
      CT             : TTCTC_CT_Field;
      --  Read-only. Cycle Count
      CC             : TTCTC_CC_Field;
      --  unspecified
      Reserved_22_31 : HAL.UInt10;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTCTC_Register use record
      CT             at 0 range 0 .. 15;
      CC             at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype TTCPT_CT_Field is HAL.UInt6;
   subtype TTCPT_SWV_Field is HAL.UInt16;

   --  FDCAN TT Capture Time Register
   type TTCPT_Register is record
      --  Read-only. Cycle Count Value
      CT            : TTCPT_CT_Field;
      --  unspecified
      Reserved_6_15 : HAL.UInt10;
      --  Read-only. Stop Watch Value
      SWV           : TTCPT_SWV_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTCPT_Register use record
      CT            at 0 range 0 .. 5;
      Reserved_6_15 at 0 range 6 .. 15;
      SWV           at 0 range 16 .. 31;
   end record;

   subtype TTCSM_CSM_Field is HAL.UInt16;

   --  FDCAN TT Cycle Sync Mark Register
   type TTCSM_Register is record
      --  Read-only. Cycle Sync Mark
      CSM            : TTCSM_CSM_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTCSM_Register use record
      CSM            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TTTS_SWTDEL_Field is HAL.UInt2;
   subtype TTTS_EVTSEL_Field is HAL.UInt2;

   --  FDCAN TT Trigger Select Register
   type TTTS_Register is record
      --  Stop watch trigger input selection
      SWTDEL        : TTTS_SWTDEL_Field := 16#0#;
      --  unspecified
      Reserved_2_3  : HAL.UInt2 := 16#0#;
      --  Event trigger input selection
      EVTSEL        : TTTS_EVTSEL_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TTTS_Register use record
      SWTDEL        at 0 range 0 .. 1;
      Reserved_2_3  at 0 range 2 .. 3;
      EVTSEL        at 0 range 4 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  CCU registers
   type CAN_CCU_Peripheral is record
      --  Clock Calibration Unit Core Release Register
      CREL  : aliased CREL_Register;
      --  Calibration Configuration Register
      CCFG  : aliased CCFG_Register;
      --  Calibration Status Register
      CSTAT : aliased CSTAT_Register;
      --  Calibration Watchdog Register
      CWD   : aliased CWD_Register;
      --  Clock Calibration Unit Interrupt Register
      IR    : aliased IR_Register;
      --  Clock Calibration Unit Interrupt Enable Register
      IE    : aliased IE_Register;
   end record
     with Volatile;

   for CAN_CCU_Peripheral use record
      CREL  at 16#0# range 0 .. 31;
      CCFG  at 16#4# range 0 .. 31;
      CSTAT at 16#8# range 0 .. 31;
      CWD   at 16#C# range 0 .. 31;
      IR    at 16#10# range 0 .. 31;
      IE    at 16#14# range 0 .. 31;
   end record;

   --  CCU registers
   CAN_CCU_Periph : aliased CAN_CCU_Peripheral
     with Import, Address => CAN_CCU_Base;

   --  FDCAN
   type FDCAN_Peripheral is record
      --  FDCAN Core Release Register
      CREL   : aliased CREL_Register_1;
      --  FDCAN Core Release Register
      ENDN   : aliased HAL.UInt32;
      --  FDCAN Data Bit Timing and Prescaler Register
      DBTP   : aliased DBTP_Register;
      --  FDCAN Test Register
      TEST   : aliased TEST_Register;
      --  FDCAN RAM Watchdog Register
      RWD    : aliased RWD_Register;
      --  FDCAN CC Control Register
      CCCR   : aliased CCCR_Register;
      --  FDCAN Nominal Bit Timing and Prescaler Register
      NBTP   : aliased NBTP_Register;
      --  FDCAN Timestamp Counter Configuration Register
      TSCC   : aliased TSCC_Register;
      --  FDCAN Timestamp Counter Value Register
      TSCV   : aliased TSCV_Register;
      --  FDCAN Timeout Counter Configuration Register
      TOCC   : aliased TOCC_Register;
      --  FDCAN Timeout Counter Value Register
      TOCV   : aliased TOCV_Register;
      --  FDCAN Error Counter Register
      ECR    : aliased ECR_Register;
      --  FDCAN Protocol Status Register
      PSR    : aliased PSR_Register;
      --  FDCAN Transmitter Delay Compensation Register
      TDCR   : aliased TDCR_Register;
      --  FDCAN Interrupt Register
      IR     : aliased IR_Register_1;
      --  FDCAN Interrupt Enable Register
      IE     : aliased IE_Register_1;
      --  FDCAN Interrupt Line Select Register
      ILS    : aliased ILS_Register;
      --  FDCAN Interrupt Line Enable Register
      ILE    : aliased ILE_Register;
      --  FDCAN Global Filter Configuration Register
      GFC    : aliased GFC_Register;
      --  FDCAN Standard ID Filter Configuration Register
      SIDFC  : aliased SIDFC_Register;
      --  FDCAN Extended ID Filter Configuration Register
      XIDFC  : aliased XIDFC_Register;
      --  FDCAN Extended ID and Mask Register
      XIDAM  : aliased XIDAM_Register;
      --  FDCAN High Priority Message Status Register
      HPMS   : aliased HPMS_Register;
      --  FDCAN New Data 1 Register
      NDAT1  : aliased NDAT1_Register;
      --  FDCAN New Data 2 Register
      NDAT2  : aliased NDAT2_Register;
      --  FDCAN Rx FIFO 0 Configuration Register
      RXF0C  : aliased RXF0C_Register;
      --  FDCAN Rx FIFO 0 Status Register
      RXF0S  : aliased RXF0S_Register;
      --  CAN Rx FIFO 0 Acknowledge Register
      RXF0A  : aliased RXF0A_Register;
      --  FDCAN Rx Buffer Configuration Register
      RXBC   : aliased RXBC_Register;
      --  FDCAN Rx FIFO 1 Configuration Register
      RXF1C  : aliased RXF1C_Register;
      --  FDCAN Rx FIFO 1 Status Register
      RXF1S  : aliased RXF1S_Register;
      --  FDCAN Rx FIFO 1 Acknowledge Register
      RXF1A  : aliased RXF1A_Register;
      --  FDCAN Rx Buffer Element Size Configuration Register
      RXESC  : aliased RXESC_Register;
      --  FDCAN Tx Buffer Configuration Register
      TXBC   : aliased TXBC_Register;
      --  FDCAN Tx FIFO/Queue Status Register
      TXFQS  : aliased TXFQS_Register;
      --  FDCAN Tx Buffer Element Size Configuration Register
      TXESC  : aliased TXESC_Register;
      --  FDCAN Tx Buffer Request Pending Register
      TXBRP  : aliased HAL.UInt32;
      --  FDCAN Tx Buffer Add Request Register
      TXBAR  : aliased HAL.UInt32;
      --  FDCAN Tx Buffer Cancellation Request Register
      TXBCR  : aliased HAL.UInt32;
      --  FDCAN Tx Buffer Transmission Occurred Register
      TXBTO  : aliased HAL.UInt32;
      --  FDCAN Tx Buffer Cancellation Finished Register
      TXBCF  : aliased HAL.UInt32;
      --  FDCAN Tx Buffer Transmission Interrupt Enable Register
      TXBTIE : aliased HAL.UInt32;
      --  FDCAN Tx Buffer Cancellation Finished Interrupt Enable Register
      TXBCIE : aliased HAL.UInt32;
      --  FDCAN Tx Event FIFO Configuration Register
      TXEFC  : aliased TXEFC_Register;
      --  FDCAN Tx Event FIFO Status Register
      TXEFS  : aliased TXEFS_Register;
      --  FDCAN Tx Event FIFO Acknowledge Register
      TXEFA  : aliased TXEFA_Register;
      --  FDCAN TT Trigger Memory Configuration Register
      TTTMC  : aliased TTTMC_Register;
      --  FDCAN TT Reference Message Configuration Register
      TTRMC  : aliased TTRMC_Register;
      --  FDCAN TT Operation Configuration Register
      TTOCF  : aliased TTOCF_Register;
      --  FDCAN TT Matrix Limits Register
      TTMLM  : aliased TTMLM_Register;
      --  FDCAN TUR Configuration Register
      TURCF  : aliased TURCF_Register;
      --  FDCAN TT Operation Control Register
      TTOCN  : aliased TTOCN_Register;
      --  FDCAN TT Global Time Preset Register
      TTGTP  : aliased TTGTP_Register;
      --  FDCAN TT Time Mark Register
      TTTMK  : aliased TTTMK_Register;
      --  FDCAN TT Interrupt Register
      TTIR   : aliased TTIR_Register;
      --  FDCAN TT Interrupt Enable Register
      TTIE   : aliased TTIE_Register;
      --  FDCAN TT Interrupt Line Select Register
      TTILS  : aliased TTILS_Register;
      --  FDCAN TT Operation Status Register
      TTOST  : aliased TTOST_Register;
      --  FDCAN TUR Numerator Actual Register
      TURNA  : aliased TURNA_Register;
      --  FDCAN TT Local and Global Time Register
      TTLGT  : aliased TTLGT_Register;
      --  FDCAN TT Cycle Time and Count Register
      TTCTC  : aliased TTCTC_Register;
      --  FDCAN TT Capture Time Register
      TTCPT  : aliased TTCPT_Register;
      --  FDCAN TT Cycle Sync Mark Register
      TTCSM  : aliased TTCSM_Register;
      --  FDCAN TT Trigger Select Register
      TTTS   : aliased TTTS_Register;
   end record
     with Volatile;

   for FDCAN_Peripheral use record
      CREL   at 16#0# range 0 .. 31;
      ENDN   at 16#4# range 0 .. 31;
      DBTP   at 16#C# range 0 .. 31;
      TEST   at 16#10# range 0 .. 31;
      RWD    at 16#14# range 0 .. 31;
      CCCR   at 16#18# range 0 .. 31;
      NBTP   at 16#1C# range 0 .. 31;
      TSCC   at 16#20# range 0 .. 31;
      TSCV   at 16#24# range 0 .. 31;
      TOCC   at 16#28# range 0 .. 31;
      TOCV   at 16#2C# range 0 .. 31;
      ECR    at 16#40# range 0 .. 31;
      PSR    at 16#44# range 0 .. 31;
      TDCR   at 16#48# range 0 .. 31;
      IR     at 16#50# range 0 .. 31;
      IE     at 16#54# range 0 .. 31;
      ILS    at 16#58# range 0 .. 31;
      ILE    at 16#5C# range 0 .. 31;
      GFC    at 16#80# range 0 .. 31;
      SIDFC  at 16#84# range 0 .. 31;
      XIDFC  at 16#88# range 0 .. 31;
      XIDAM  at 16#90# range 0 .. 31;
      HPMS   at 16#94# range 0 .. 31;
      NDAT1  at 16#98# range 0 .. 31;
      NDAT2  at 16#9C# range 0 .. 31;
      RXF0C  at 16#A0# range 0 .. 31;
      RXF0S  at 16#A4# range 0 .. 31;
      RXF0A  at 16#A8# range 0 .. 31;
      RXBC   at 16#AC# range 0 .. 31;
      RXF1C  at 16#B0# range 0 .. 31;
      RXF1S  at 16#B4# range 0 .. 31;
      RXF1A  at 16#B8# range 0 .. 31;
      RXESC  at 16#BC# range 0 .. 31;
      TXBC   at 16#C0# range 0 .. 31;
      TXFQS  at 16#C4# range 0 .. 31;
      TXESC  at 16#C8# range 0 .. 31;
      TXBRP  at 16#CC# range 0 .. 31;
      TXBAR  at 16#D0# range 0 .. 31;
      TXBCR  at 16#D4# range 0 .. 31;
      TXBTO  at 16#D8# range 0 .. 31;
      TXBCF  at 16#DC# range 0 .. 31;
      TXBTIE at 16#E0# range 0 .. 31;
      TXBCIE at 16#E4# range 0 .. 31;
      TXEFC  at 16#F0# range 0 .. 31;
      TXEFS  at 16#F4# range 0 .. 31;
      TXEFA  at 16#F8# range 0 .. 31;
      TTTMC  at 16#100# range 0 .. 31;
      TTRMC  at 16#104# range 0 .. 31;
      TTOCF  at 16#108# range 0 .. 31;
      TTMLM  at 16#10C# range 0 .. 31;
      TURCF  at 16#110# range 0 .. 31;
      TTOCN  at 16#114# range 0 .. 31;
      TTGTP  at 16#118# range 0 .. 31;
      TTTMK  at 16#11C# range 0 .. 31;
      TTIR   at 16#120# range 0 .. 31;
      TTIE   at 16#124# range 0 .. 31;
      TTILS  at 16#128# range 0 .. 31;
      TTOST  at 16#12C# range 0 .. 31;
      TURNA  at 16#130# range 0 .. 31;
      TTLGT  at 16#134# range 0 .. 31;
      TTCTC  at 16#138# range 0 .. 31;
      TTCPT  at 16#13C# range 0 .. 31;
      TTCSM  at 16#140# range 0 .. 31;
      TTTS   at 16#300# range 0 .. 31;
   end record;

   --  FDCAN
   FDCAN_Periph : aliased FDCAN_Peripheral
     with Import, Address => FDCAN_Base;

   --  FDCAN
   FDCAN1_Periph : aliased FDCAN_Peripheral
     with Import, Address => FDCAN1_Base;

   --  FDCAN
   FDCAN2_Periph : aliased FDCAN_Peripheral
     with Import, Address => FDCAN2_Base;

end STM32_SVD.FDCAN;
