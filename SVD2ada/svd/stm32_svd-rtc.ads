pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32H743x.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.RTC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype TR_SU_Field is HAL.UInt4;
   subtype TR_ST_Field is HAL.UInt3;
   subtype TR_MNU_Field is HAL.UInt4;
   subtype TR_MNT_Field is HAL.UInt3;
   subtype TR_HU_Field is HAL.UInt4;
   subtype TR_HT_Field is HAL.UInt2;

   --  The RTC_TR is the calendar time shadow register. This register must be
   --  written in initialization mode only. Refer to Calendar initialization
   --  and configuration on page9 and Reading the calendar on page10.This
   --  register is write protected. The write access procedure is described in
   --  RTC register write protection on page9.
   type TR_Register is record
      --  Second units in BCD format
      SU             : TR_SU_Field := 16#0#;
      --  Second tens in BCD format
      ST             : TR_ST_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Minute units in BCD format
      MNU            : TR_MNU_Field := 16#0#;
      --  Minute tens in BCD format
      MNT            : TR_MNT_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      --  Hour units in BCD format
      HU             : TR_HU_Field := 16#0#;
      --  Hour tens in BCD format
      HT             : TR_HT_Field := 16#0#;
      --  AM/PM notation
      PM             : Boolean := False;
      --  unspecified
      Reserved_23_31 : HAL.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TR_Register use record
      SU             at 0 range 0 .. 3;
      ST             at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MNU            at 0 range 8 .. 11;
      MNT            at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      HU             at 0 range 16 .. 19;
      HT             at 0 range 20 .. 21;
      PM             at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype DR_DU_Field is HAL.UInt4;
   subtype DR_DT_Field is HAL.UInt2;
   subtype DR_MU_Field is HAL.UInt4;
   subtype DR_WDU_Field is HAL.UInt3;
   subtype DR_YU_Field is HAL.UInt4;
   subtype DR_YT_Field is HAL.UInt4;

   --  The RTC_DR is the calendar date shadow register. This register must be
   --  written in initialization mode only. Refer to Calendar initialization
   --  and configuration on page9 and Reading the calendar on page10.This
   --  register is write protected. The write access procedure is described in
   --  RTC register write protection on page9.
   type DR_Register is record
      --  Date units in BCD format
      DU             : DR_DU_Field := 16#1#;
      --  Date tens in BCD format
      DT             : DR_DT_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Month units in BCD format
      MU             : DR_MU_Field := 16#1#;
      --  Month tens in BCD format
      MT             : Boolean := False;
      --  Week day units
      WDU            : DR_WDU_Field := 16#1#;
      --  Year units in BCD format
      YU             : DR_YU_Field := 16#0#;
      --  Year tens in BCD format
      YT             : DR_YT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR_Register use record
      DU             at 0 range 0 .. 3;
      DT             at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MU             at 0 range 8 .. 11;
      MT             at 0 range 12 .. 12;
      WDU            at 0 range 13 .. 15;
      YU             at 0 range 16 .. 19;
      YT             at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CR_WUCKSEL_Field is HAL.UInt3;
   subtype CR_OSEL_Field is HAL.UInt2;

   --  RTC control register
   type CR_Register is record
      --  Wakeup clock selection
      WUCKSEL        : CR_WUCKSEL_Field := 16#0#;
      --  Time-stamp event active edge TSE must be reset when TSEDGE is changed
      --  to avoid unwanted TSF setting.
      TSEDGE         : Boolean := False;
      --  RTC_REFIN reference clock detection enable (50 or 60Hz) Note:
      --  PREDIV_S must be 0x00FF.
      REFCKON        : Boolean := False;
      --  Bypass the shadow registers Note: If the frequency of the APB clock
      --  is less than seven times the frequency of RTCCLK, BYPSHAD must be set
      --  to 1.
      BYPSHAD        : Boolean := False;
      --  Hour format
      FMT            : Boolean := False;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Alarm A enable
      ALRAE          : Boolean := False;
      --  Alarm B enable
      ALRBE          : Boolean := False;
      --  Wakeup timer enable
      WUTE           : Boolean := False;
      --  timestamp enable
      TSE            : Boolean := False;
      --  Alarm A interrupt enable
      ALRAIE         : Boolean := False;
      --  Alarm B interrupt enable
      ALRBIE         : Boolean := False;
      --  Wakeup timer interrupt enable
      WUTIE          : Boolean := False;
      --  Time-stamp interrupt enable
      TSIE           : Boolean := False;
      --  Write-only. Add 1 hour (summer time change) When this bit is set
      --  outside initialization mode, 1 hour is added to the calendar time.
      --  This bit is always read as 0.
      ADD1H          : Boolean := False;
      --  Write-only. Subtract 1 hour (winter time change) When this bit is set
      --  outside initialization mode, 1 hour is subtracted to the calendar
      --  time if the current hour is not 0. This bit is always read as 0.
      --  Setting this bit has no effect when current hour is 0.
      SUB1H          : Boolean := False;
      --  Backup This bit can be written by the user to memorize whether the
      --  daylight saving time change has been performed or not.
      BKP            : Boolean := False;
      --  Calibration output selection When COE=1, this bit selects which
      --  signal is output on RTC_CALIB. These frequencies are valid for RTCCLK
      --  at 32.768 kHz and prescalers at their default values (PREDIV_A=127
      --  and PREDIV_S=255). Refer to Section24.3.15: Calibration clock output
      COSEL          : Boolean := False;
      --  Output polarity This bit is used to configure the polarity of
      --  RTC_ALARM output
      POL            : Boolean := False;
      --  Output selection These bits are used to select the flag to be routed
      --  to RTC_ALARM output
      OSEL           : CR_OSEL_Field := 16#0#;
      --  Calibration output enable This bit enables the RTC_CALIB output
      COE            : Boolean := False;
      --  timestamp on internal event enable
      ITSE           : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      WUCKSEL        at 0 range 0 .. 2;
      TSEDGE         at 0 range 3 .. 3;
      REFCKON        at 0 range 4 .. 4;
      BYPSHAD        at 0 range 5 .. 5;
      FMT            at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      ALRAE          at 0 range 8 .. 8;
      ALRBE          at 0 range 9 .. 9;
      WUTE           at 0 range 10 .. 10;
      TSE            at 0 range 11 .. 11;
      ALRAIE         at 0 range 12 .. 12;
      ALRBIE         at 0 range 13 .. 13;
      WUTIE          at 0 range 14 .. 14;
      TSIE           at 0 range 15 .. 15;
      ADD1H          at 0 range 16 .. 16;
      SUB1H          at 0 range 17 .. 17;
      BKP            at 0 range 18 .. 18;
      COSEL          at 0 range 19 .. 19;
      POL            at 0 range 20 .. 20;
      OSEL           at 0 range 21 .. 22;
      COE            at 0 range 23 .. 23;
      ITSE           at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  This register is write protected (except for RTC_ISR[13:8] bits). The
   --  write access procedure is described in RTC register write protection on
   --  page9.
   type ISR_Register is record
      --  Read-only. Alarm A write flag This bit is set by hardware when Alarm
      --  A values can be changed, after the ALRAE bit has been set to 0 in
      --  RTC_CR. It is cleared by hardware in initialization mode.
      ALRAWF         : Boolean := True;
      --  Read-only. Alarm B write flag This bit is set by hardware when Alarm
      --  B values can be changed, after the ALRBE bit has been set to 0 in
      --  RTC_CR. It is cleared by hardware in initialization mode.
      ALRBWF         : Boolean := True;
      --  Read-only. Wakeup timer write flag This bit is set by hardware up to
      --  2 RTCCLK cycles after the WUTE bit has been set to 0 in RTC_CR, and
      --  is cleared up to 2 RTCCLK cycles after the WUTE bit has been set to
      --  1. The wakeup timer values can be changed when WUTE bit is cleared
      --  and WUTWF is set.
      WUTWF          : Boolean := True;
      --  Read-only. Shift operation pending This flag is set by hardware as
      --  soon as a shift operation is initiated by a write to the RTC_SHIFTR
      --  register. It is cleared by hardware when the corresponding shift
      --  operation has been executed. Writing to the SHPF bit has no effect.
      SHPF           : Boolean := False;
      --  Read-only. Initialization status flag This bit is set by hardware
      --  when the calendar year field is different from 0 (Backup domain reset
      --  state).
      INITS          : Boolean := False;
      --  Registers synchronization flag This bit is set by hardware each time
      --  the calendar registers are copied into the shadow registers
      --  (RTC_SSRx, RTC_TRx and RTC_DRx). This bit is cleared by hardware in
      --  initialization mode, while a shift operation is pending (SHPF=1), or
      --  when in bypass shadow register mode (BYPSHAD=1). This bit can also be
      --  cleared by software. It is cleared either by software or by hardware
      --  in initialization mode.
      RSF            : Boolean := False;
      --  Read-only. Initialization flag When this bit is set to 1, the RTC is
      --  in initialization state, and the time, date and prescaler registers
      --  can be updated.
      INITF          : Boolean := False;
      --  Initialization mode
      INIT           : Boolean := False;
      --  Alarm A flag This flag is set by hardware when the time/date
      --  registers (RTC_TR and RTC_DR) match the Alarm A register
      --  (RTC_ALRMAR). This flag is cleared by software by writing 0.
      ALRAF          : Boolean := False;
      --  Alarm B flag This flag is set by hardware when the time/date
      --  registers (RTC_TR and RTC_DR) match the Alarm B register
      --  (RTC_ALRMBR). This flag is cleared by software by writing 0.
      ALRBF          : Boolean := False;
      --  Wakeup timer flag This flag is set by hardware when the wakeup
      --  auto-reload counter reaches 0. This flag is cleared by software by
      --  writing 0. This flag must be cleared by software at least 1.5 RTCCLK
      --  periods before WUTF is set to 1 again.
      WUTF           : Boolean := False;
      --  Time-stamp flag This flag is set by hardware when a time-stamp event
      --  occurs. This flag is cleared by software by writing 0.
      TSF            : Boolean := False;
      --  Time-stamp overflow flag This flag is set by hardware when a
      --  time-stamp event occurs while TSF is already set. This flag is
      --  cleared by software by writing 0. It is recommended to check and then
      --  clear TSOVF only after clearing the TSF bit. Otherwise, an overflow
      --  might not be noticed if a time-stamp event occurs immediately before
      --  the TSF bit is cleared.
      TSOVF          : Boolean := False;
      --  RTC_TAMP1 detection flag This flag is set by hardware when a tamper
      --  detection event is detected on the RTC_TAMP1 input. It is cleared by
      --  software writing 0
      TAMP1F         : Boolean := False;
      --  RTC_TAMP2 detection flag This flag is set by hardware when a tamper
      --  detection event is detected on the RTC_TAMP2 input. It is cleared by
      --  software writing 0
      TAMP2F         : Boolean := False;
      --  RTC_TAMP3 detection flag This flag is set by hardware when a tamper
      --  detection event is detected on the RTC_TAMP3 input. It is cleared by
      --  software writing 0
      TAMP3F         : Boolean := False;
      --  Read-only. Recalibration pending Flag The RECALPF status flag is
      --  automatically set to 1 when software writes to the RTC_CALR register,
      --  indicating that the RTC_CALR register is blocked. When the new
      --  calibration settings are taken into account, this bit returns to 0.
      --  Refer to Re-calibration on-the-fly.
      RECALPF        : Boolean := False;
      --  Internal tTime-stamp flag
      ITSF           : Boolean := False;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      ALRAWF         at 0 range 0 .. 0;
      ALRBWF         at 0 range 1 .. 1;
      WUTWF          at 0 range 2 .. 2;
      SHPF           at 0 range 3 .. 3;
      INITS          at 0 range 4 .. 4;
      RSF            at 0 range 5 .. 5;
      INITF          at 0 range 6 .. 6;
      INIT           at 0 range 7 .. 7;
      ALRAF          at 0 range 8 .. 8;
      ALRBF          at 0 range 9 .. 9;
      WUTF           at 0 range 10 .. 10;
      TSF            at 0 range 11 .. 11;
      TSOVF          at 0 range 12 .. 12;
      TAMP1F         at 0 range 13 .. 13;
      TAMP2F         at 0 range 14 .. 14;
      TAMP3F         at 0 range 15 .. 15;
      RECALPF        at 0 range 16 .. 16;
      ITSF           at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype PRER_PREDIV_S_Field is HAL.UInt15;
   subtype PRER_PREDIV_A_Field is HAL.UInt7;

   --  This register must be written in initialization mode only. The
   --  initialization must be performed in two separate write accesses. Refer
   --  to Calendar initialization and configuration on page9.This register is
   --  write protected. The write access procedure is described in RTC register
   --  write protection on page9.
   type PRER_Register is record
      --  Synchronous prescaler factor This is the synchronous division factor:
      --  ck_spre frequency = ck_apre frequency/(PREDIV_S+1)
      PREDIV_S       : PRER_PREDIV_S_Field := 16#FF#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      --  Asynchronous prescaler factor This is the asynchronous division
      --  factor: ck_apre frequency = RTCCLK frequency/(PREDIV_A+1)
      PREDIV_A       : PRER_PREDIV_A_Field := 16#7F#;
      --  unspecified
      Reserved_23_31 : HAL.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRER_Register use record
      PREDIV_S       at 0 range 0 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      PREDIV_A       at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype WUTR_WUT_Field is HAL.UInt16;

   --  This register can be written only when WUTWF is set to 1 in RTC_ISR.This
   --  register is write protected. The write access procedure is described in
   --  RTC register write protection on page9.
   type WUTR_Register is record
      --  Wakeup auto-reload value bits When the wakeup timer is enabled (WUTE
      --  set to 1), the WUTF flag is set every (WUT[15:0] + 1) ck_wut cycles.
      --  The ck_wut period is selected through WUCKSEL[2:0] bits of the RTC_CR
      --  register When WUCKSEL[2] = 1, the wakeup timer becomes 17-bits and
      --  WUCKSEL[1] effectively becomes WUT[16] the most-significant bit to be
      --  reloaded into the timer. The first assertion of WUTF occurs (WUT+1)
      --  ck_wut cycles after WUTE is set. Setting WUT[15:0] to 0x0000 with
      --  WUCKSEL[2:0] =011 (RTCCLK/2) is forbidden.
      WUT            : WUTR_WUT_Field := 16#FFFF#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WUTR_Register use record
      WUT            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ALRMAR_SU_Field is HAL.UInt4;
   subtype ALRMAR_ST_Field is HAL.UInt3;
   subtype ALRMAR_MNU_Field is HAL.UInt4;
   subtype ALRMAR_MNT_Field is HAL.UInt3;
   subtype ALRMAR_HU_Field is HAL.UInt4;
   subtype ALRMAR_HT_Field is HAL.UInt2;
   subtype ALRMAR_DU_Field is HAL.UInt4;
   subtype ALRMAR_DT_Field is HAL.UInt2;

   --  This register can be written only when ALRAWF is set to 1 in RTC_ISR, or
   --  in initialization mode.This register is write protected. The write
   --  access procedure is described in RTC register write protection on page9.
   type ALRMAR_Register is record
      --  Second units in BCD format.
      SU    : ALRMAR_SU_Field := 16#0#;
      --  Second tens in BCD format.
      ST    : ALRMAR_ST_Field := 16#0#;
      --  Alarm A seconds mask
      MSK1  : Boolean := False;
      --  Minute units in BCD format.
      MNU   : ALRMAR_MNU_Field := 16#0#;
      --  Minute tens in BCD format.
      MNT   : ALRMAR_MNT_Field := 16#0#;
      --  Alarm A minutes mask
      MSK2  : Boolean := False;
      --  Hour units in BCD format.
      HU    : ALRMAR_HU_Field := 16#0#;
      --  Hour tens in BCD format.
      HT    : ALRMAR_HT_Field := 16#0#;
      --  AM/PM notation
      PM    : Boolean := False;
      --  Alarm A hours mask
      MSK3  : Boolean := False;
      --  Date units or day in BCD format.
      DU    : ALRMAR_DU_Field := 16#0#;
      --  Date tens in BCD format.
      DT    : ALRMAR_DT_Field := 16#0#;
      --  Week day selection
      WDSEL : Boolean := False;
      --  Alarm A date mask
      MSK4  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMAR_Register use record
      SU    at 0 range 0 .. 3;
      ST    at 0 range 4 .. 6;
      MSK1  at 0 range 7 .. 7;
      MNU   at 0 range 8 .. 11;
      MNT   at 0 range 12 .. 14;
      MSK2  at 0 range 15 .. 15;
      HU    at 0 range 16 .. 19;
      HT    at 0 range 20 .. 21;
      PM    at 0 range 22 .. 22;
      MSK3  at 0 range 23 .. 23;
      DU    at 0 range 24 .. 27;
      DT    at 0 range 28 .. 29;
      WDSEL at 0 range 30 .. 30;
      MSK4  at 0 range 31 .. 31;
   end record;

   subtype ALRMBR_SU_Field is HAL.UInt4;
   subtype ALRMBR_ST_Field is HAL.UInt3;
   subtype ALRMBR_MNU_Field is HAL.UInt4;
   subtype ALRMBR_MNT_Field is HAL.UInt3;
   subtype ALRMBR_HU_Field is HAL.UInt4;
   subtype ALRMBR_HT_Field is HAL.UInt2;
   subtype ALRMBR_DU_Field is HAL.UInt4;
   subtype ALRMBR_DT_Field is HAL.UInt2;

   --  This register can be written only when ALRBWF is set to 1 in RTC_ISR, or
   --  in initialization mode.This register is write protected. The write
   --  access procedure is described in RTC register write protection on page9.
   type ALRMBR_Register is record
      --  Second units in BCD format
      SU    : ALRMBR_SU_Field := 16#0#;
      --  Second tens in BCD format
      ST    : ALRMBR_ST_Field := 16#0#;
      --  Alarm B seconds mask
      MSK1  : Boolean := False;
      --  Minute units in BCD format
      MNU   : ALRMBR_MNU_Field := 16#0#;
      --  Minute tens in BCD format
      MNT   : ALRMBR_MNT_Field := 16#0#;
      --  Alarm B minutes mask
      MSK2  : Boolean := False;
      --  Hour units in BCD format
      HU    : ALRMBR_HU_Field := 16#0#;
      --  Hour tens in BCD format
      HT    : ALRMBR_HT_Field := 16#0#;
      --  AM/PM notation
      PM    : Boolean := False;
      --  Alarm B hours mask
      MSK3  : Boolean := False;
      --  Date units or day in BCD format
      DU    : ALRMBR_DU_Field := 16#0#;
      --  Date tens in BCD format
      DT    : ALRMBR_DT_Field := 16#0#;
      --  Week day selection
      WDSEL : Boolean := False;
      --  Alarm B date mask
      MSK4  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMBR_Register use record
      SU    at 0 range 0 .. 3;
      ST    at 0 range 4 .. 6;
      MSK1  at 0 range 7 .. 7;
      MNU   at 0 range 8 .. 11;
      MNT   at 0 range 12 .. 14;
      MSK2  at 0 range 15 .. 15;
      HU    at 0 range 16 .. 19;
      HT    at 0 range 20 .. 21;
      PM    at 0 range 22 .. 22;
      MSK3  at 0 range 23 .. 23;
      DU    at 0 range 24 .. 27;
      DT    at 0 range 28 .. 29;
      WDSEL at 0 range 30 .. 30;
      MSK4  at 0 range 31 .. 31;
   end record;

   subtype WPR_KEY_Field is HAL.UInt8;

   --  RTC write protection register
   type WPR_Register is record
      --  Write-only. Write protection key This byte is written by software.
      --  Reading this byte always returns 0x00. Refer to RTC register write
      --  protection for a description of how to unlock RTC register write
      --  protection.
      KEY           : WPR_KEY_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WPR_Register use record
      KEY           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SSR_SS_Field is HAL.UInt16;

   --  RTC sub second register
   type SSR_Register is record
      --  Read-only. Sub second value SS[15:0] is the value in the synchronous
      --  prescaler counter. The fraction of a second is given by the formula
      --  below: Second fraction = (PREDIV_S - SS) / (PREDIV_S + 1) Note: SS
      --  can be larger than PREDIV_S only after a shift operation. In that
      --  case, the correct time/date is one second less than as indicated by
      --  RTC_TR/RTC_DR.
      SS             : SSR_SS_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSR_Register use record
      SS             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SHIFTR_SUBFS_Field is HAL.UInt15;

   --  This register is write protected. The write access procedure is
   --  described in RTC register write protection on page9.
   type SHIFTR_Register is record
      --  Write-only. Subtract a fraction of a second These bits are write only
      --  and is always read as zero. Writing to this bit has no effect when a
      --  shift operation is pending (when SHPF=1, in RTC_ISR). The value which
      --  is written to SUBFS is added to the synchronous prescaler counter.
      --  Since this counter counts down, this operation effectively subtracts
      --  from (delays) the clock by: Delay (seconds) = SUBFS / (PREDIV_S + 1)
      --  A fraction of a second can effectively be added to the clock
      --  (advancing the clock) when the ADD1S function is used in conjunction
      --  with SUBFS, effectively advancing the clock by: Advance (seconds) =
      --  (1 - (SUBFS / (PREDIV_S + 1))). Note: Writing to SUBFS causes RSF to
      --  be cleared. Software can then wait until RSF=1 to be sure that the
      --  shadow registers have been updated with the shifted time.
      SUBFS          : SHIFTR_SUBFS_Field := 16#0#;
      --  unspecified
      Reserved_15_30 : HAL.UInt16 := 16#0#;
      --  Write-only. Add one second This bit is write only and is always read
      --  as zero. Writing to this bit has no effect when a shift operation is
      --  pending (when SHPF=1, in RTC_ISR). This function is intended to be
      --  used with SUBFS (see description below) in order to effectively add a
      --  fraction of a second to the clock in an atomic operation.
      ADD1S          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHIFTR_Register use record
      SUBFS          at 0 range 0 .. 14;
      Reserved_15_30 at 0 range 15 .. 30;
      ADD1S          at 0 range 31 .. 31;
   end record;

   subtype TSTR_SU_Field is HAL.UInt4;
   subtype TSTR_ST_Field is HAL.UInt3;
   subtype TSTR_MNU_Field is HAL.UInt4;
   subtype TSTR_MNT_Field is HAL.UInt3;
   subtype TSTR_HU_Field is HAL.UInt4;
   subtype TSTR_HT_Field is HAL.UInt2;

   --  The content of this register is valid only when TSF is set to 1 in
   --  RTC_ISR. It is cleared when TSF bit is reset.
   type TSTR_Register is record
      --  Read-only. Second units in BCD format.
      SU             : TSTR_SU_Field;
      --  Read-only. Second tens in BCD format.
      ST             : TSTR_ST_Field;
      --  unspecified
      Reserved_7_7   : HAL.Bit;
      --  Read-only. Minute units in BCD format.
      MNU            : TSTR_MNU_Field;
      --  Read-only. Minute tens in BCD format.
      MNT            : TSTR_MNT_Field;
      --  unspecified
      Reserved_15_15 : HAL.Bit;
      --  Read-only. Hour units in BCD format.
      HU             : TSTR_HU_Field;
      --  Read-only. Hour tens in BCD format.
      HT             : TSTR_HT_Field;
      --  Read-only. AM/PM notation
      PM             : Boolean;
      --  unspecified
      Reserved_23_31 : HAL.UInt9;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSTR_Register use record
      SU             at 0 range 0 .. 3;
      ST             at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MNU            at 0 range 8 .. 11;
      MNT            at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      HU             at 0 range 16 .. 19;
      HT             at 0 range 20 .. 21;
      PM             at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype TSDR_DU_Field is HAL.UInt4;
   subtype TSDR_DT_Field is HAL.UInt2;
   subtype TSDR_MU_Field is HAL.UInt4;
   subtype TSDR_WDU_Field is HAL.UInt3;

   --  The content of this register is valid only when TSF is set to 1 in
   --  RTC_ISR. It is cleared when TSF bit is reset.
   type TSDR_Register is record
      --  Read-only. Date units in BCD format
      DU             : TSDR_DU_Field;
      --  Read-only. Date tens in BCD format
      DT             : TSDR_DT_Field;
      --  unspecified
      Reserved_6_7   : HAL.UInt2;
      --  Read-only. Month units in BCD format
      MU             : TSDR_MU_Field;
      --  Read-only. Month tens in BCD format
      MT             : Boolean;
      --  Read-only. Week day units
      WDU            : TSDR_WDU_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSDR_Register use record
      DU             at 0 range 0 .. 3;
      DT             at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MU             at 0 range 8 .. 11;
      MT             at 0 range 12 .. 12;
      WDU            at 0 range 13 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TSSSR_SS_Field is HAL.UInt16;

   --  The content of this register is valid only when RTC_ISR/TSF is set. It
   --  is cleared when the RTC_ISR/TSF bit is reset.
   type TSSSR_Register is record
      --  Read-only. Sub second value SS[15:0] is the value of the synchronous
      --  prescaler counter when the timestamp event occurred.
      SS             : TSSSR_SS_Field;
      --  unspecified
      Reserved_16_31 : HAL.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSSSR_Register use record
      SS             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CALR_CALM_Field is HAL.UInt9;

   --  This register is write protected. The write access procedure is
   --  described in RTC register write protection on page9.
   type CALR_Register is record
      --  Calibration minus The frequency of the calendar is reduced by masking
      --  CALM out of 220 RTCCLK pulses (32 seconds if the input frequency is
      --  32768 Hz). This decreases the frequency of the calendar with a
      --  resolution of 0.9537 ppm. To increase the frequency of the calendar,
      --  this feature should be used in conjunction with CALP. See
      --  Section24.3.12: RTC smooth digital calibration on page13.
      CALM           : CALR_CALM_Field := 16#0#;
      --  unspecified
      Reserved_9_12  : HAL.UInt4 := 16#0#;
      --  Use a 16-second calibration cycle period When CALW16 is set to 1, the
      --  16-second calibration cycle period is selected.This bit must not be
      --  set to 1 if CALW8=1. Note: CALM[0] is stuck at 0 when CALW16= 1.
      --  Refer to Section24.3.12: RTC smooth digital calibration.
      CALW16         : Boolean := False;
      --  Use an 8-second calibration cycle period When CALW8 is set to 1, the
      --  8-second calibration cycle period is selected. Note: CALM[1:0] are
      --  stuck at 00; when CALW8= 1. Refer to Section24.3.12: RTC smooth
      --  digital calibration.
      CALW8          : Boolean := False;
      --  Increase frequency of RTC by 488.5 ppm This feature is intended to be
      --  used in conjunction with CALM, which lowers the frequency of the
      --  calendar with a fine resolution. if the input frequency is 32768 Hz,
      --  the number of RTCCLK pulses added during a 32-second window is
      --  calculated as follows: (512 * CALP) - CALM. Refer to Section24.3.12:
      --  RTC smooth digital calibration.
      CALP           : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CALR_Register use record
      CALM           at 0 range 0 .. 8;
      Reserved_9_12  at 0 range 9 .. 12;
      CALW16         at 0 range 13 .. 13;
      CALW8          at 0 range 14 .. 14;
      CALP           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TAMPCR_TAMPFREQ_Field is HAL.UInt3;
   subtype TAMPCR_TAMPFLT_Field is HAL.UInt2;
   subtype TAMPCR_TAMPPRCH_Field is HAL.UInt2;

   --  RTC tamper and alternate function configuration register
   type TAMPCR_Register is record
      --  RTC_TAMP1 input detection enable
      TAMP1E         : Boolean := False;
      --  Active level for RTC_TAMP1 input If TAMPFLT != 00 if TAMPFLT = 00:
      TAMP1TRG       : Boolean := False;
      --  Tamper interrupt enable
      TAMPIE         : Boolean := False;
      --  RTC_TAMP2 input detection enable
      TAMP2E         : Boolean := False;
      --  Active level for RTC_TAMP2 input if TAMPFLT != 00: if TAMPFLT = 00:
      TAMP2TRG       : Boolean := False;
      --  RTC_TAMP3 detection enable
      TAMP3E         : Boolean := False;
      --  Active level for RTC_TAMP3 input if TAMPFLT != 00: if TAMPFLT = 00:
      TAMP3TRG       : Boolean := False;
      --  Activate timestamp on tamper detection event TAMPTS is valid even if
      --  TSE=0 in the RTC_CR register.
      TAMPTS         : Boolean := False;
      --  Tamper sampling frequency Determines the frequency at which each of
      --  the RTC_TAMPx inputs are sampled.
      TAMPFREQ       : TAMPCR_TAMPFREQ_Field := 16#0#;
      --  RTC_TAMPx filter count These bits determines the number of
      --  consecutive samples at the specified level (TAMP*TRG) needed to
      --  activate a Tamper event. TAMPFLT is valid for each of the RTC_TAMPx
      --  inputs.
      TAMPFLT        : TAMPCR_TAMPFLT_Field := 16#0#;
      --  RTC_TAMPx precharge duration These bit determines the duration of
      --  time during which the pull-up/is activated before each sample.
      --  TAMPPRCH is valid for each of the RTC_TAMPx inputs.
      TAMPPRCH       : TAMPCR_TAMPPRCH_Field := 16#0#;
      --  RTC_TAMPx pull-up disable This bit determines if each of the
      --  RTC_TAMPx pins are pre-charged before each sample.
      TAMPPUDIS      : Boolean := False;
      --  Tamper 1 interrupt enable
      TAMP1IE        : Boolean := False;
      --  Tamper 1 no erase
      TAMP1NOERASE   : Boolean := False;
      --  Tamper 1 mask flag
      TAMP1MF        : Boolean := False;
      --  Tamper 2 interrupt enable
      TAMP2IE        : Boolean := False;
      --  Tamper 2 no erase
      TAMP2NOERASE   : Boolean := False;
      --  Tamper 2 mask flag
      TAMP2MF        : Boolean := False;
      --  Tamper 3 interrupt enable
      TAMP3IE        : Boolean := False;
      --  Tamper 3 no erase
      TAMP3NOERASE   : Boolean := False;
      --  Tamper 3 mask flag
      TAMP3MF        : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TAMPCR_Register use record
      TAMP1E         at 0 range 0 .. 0;
      TAMP1TRG       at 0 range 1 .. 1;
      TAMPIE         at 0 range 2 .. 2;
      TAMP2E         at 0 range 3 .. 3;
      TAMP2TRG       at 0 range 4 .. 4;
      TAMP3E         at 0 range 5 .. 5;
      TAMP3TRG       at 0 range 6 .. 6;
      TAMPTS         at 0 range 7 .. 7;
      TAMPFREQ       at 0 range 8 .. 10;
      TAMPFLT        at 0 range 11 .. 12;
      TAMPPRCH       at 0 range 13 .. 14;
      TAMPPUDIS      at 0 range 15 .. 15;
      TAMP1IE        at 0 range 16 .. 16;
      TAMP1NOERASE   at 0 range 17 .. 17;
      TAMP1MF        at 0 range 18 .. 18;
      TAMP2IE        at 0 range 19 .. 19;
      TAMP2NOERASE   at 0 range 20 .. 20;
      TAMP2MF        at 0 range 21 .. 21;
      TAMP3IE        at 0 range 22 .. 22;
      TAMP3NOERASE   at 0 range 23 .. 23;
      TAMP3MF        at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype ALRMASSR_SS_Field is HAL.UInt15;
   subtype ALRMASSR_MASKSS_Field is HAL.UInt4;

   --  This register can be written only when ALRAE is reset in RTC_CR
   --  register, or in initialization mode.This register is write protected.
   --  The write access procedure is described in RTC register write protection
   --  on page9
   type ALRMASSR_Register is record
      --  Sub seconds value This value is compared with the contents of the
      --  synchronous prescaler counter to determine if Alarm A is to be
      --  activated. Only bits 0 up MASKSS-1 are compared.
      SS             : ALRMASSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_15_23 : HAL.UInt9 := 16#0#;
      --  Mask the most-significant bits starting at this bit ... The overflow
      --  bits of the synchronous counter (bits 15) is never compared. This bit
      --  can be different from 0 only after a shift operation.
      MASKSS         : ALRMASSR_MASKSS_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMASSR_Register use record
      SS             at 0 range 0 .. 14;
      Reserved_15_23 at 0 range 15 .. 23;
      MASKSS         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype ALRMBSSR_SS_Field is HAL.UInt15;
   subtype ALRMBSSR_MASKSS_Field is HAL.UInt4;

   --  This register can be written only when ALRBE is reset in RTC_CR
   --  register, or in initialization mode.This register is write protected.The
   --  write access procedure is described in Section: RTC register write
   --  protection.
   type ALRMBSSR_Register is record
      --  Sub seconds value This value is compared with the contents of the
      --  synchronous prescaler counter to determine if Alarm B is to be
      --  activated. Only bits 0 up to MASKSS-1 are compared.
      SS             : ALRMBSSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_15_23 : HAL.UInt9 := 16#0#;
      --  Mask the most-significant bits starting at this bit ... The overflow
      --  bits of the synchronous counter (bits 15) is never compared. This bit
      --  can be different from 0 only after a shift operation.
      MASKSS         : ALRMBSSR_MASKSS_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMBSSR_Register use record
      SS             at 0 range 0 .. 14;
      Reserved_15_23 at 0 range 15 .. 23;
      MASKSS         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  RTC option register
   type OR_Register is record
      --  RTC_ALARM output type on PC13
      RTC_ALARM_TYPE : Boolean := False;
      --  RTC_OUT remap
      RTC_OUT_RMP    : Boolean := False;
      --  unspecified
      Reserved_2_31  : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR_Register use record
      RTC_ALARM_TYPE at 0 range 0 .. 0;
      RTC_OUT_RMP    at 0 range 1 .. 1;
      Reserved_2_31  at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  RTC
   type RTC_Peripheral is record
      --  The RTC_TR is the calendar time shadow register. This register must
      --  be written in initialization mode only. Refer to Calendar
      --  initialization and configuration on page9 and Reading the calendar on
      --  page10.This register is write protected. The write access procedure
      --  is described in RTC register write protection on page9.
      TR       : aliased TR_Register;
      --  The RTC_DR is the calendar date shadow register. This register must
      --  be written in initialization mode only. Refer to Calendar
      --  initialization and configuration on page9 and Reading the calendar on
      --  page10.This register is write protected. The write access procedure
      --  is described in RTC register write protection on page9.
      DR       : aliased DR_Register;
      --  RTC control register
      CR       : aliased CR_Register;
      --  This register is write protected (except for RTC_ISR[13:8] bits). The
      --  write access procedure is described in RTC register write protection
      --  on page9.
      ISR      : aliased ISR_Register;
      --  This register must be written in initialization mode only. The
      --  initialization must be performed in two separate write accesses.
      --  Refer to Calendar initialization and configuration on page9.This
      --  register is write protected. The write access procedure is described
      --  in RTC register write protection on page9.
      PRER     : aliased PRER_Register;
      --  This register can be written only when WUTWF is set to 1 in
      --  RTC_ISR.This register is write protected. The write access procedure
      --  is described in RTC register write protection on page9.
      WUTR     : aliased WUTR_Register;
      --  This register can be written only when ALRAWF is set to 1 in RTC_ISR,
      --  or in initialization mode.This register is write protected. The write
      --  access procedure is described in RTC register write protection on
      --  page9.
      ALRMAR   : aliased ALRMAR_Register;
      --  This register can be written only when ALRBWF is set to 1 in RTC_ISR,
      --  or in initialization mode.This register is write protected. The write
      --  access procedure is described in RTC register write protection on
      --  page9.
      ALRMBR   : aliased ALRMBR_Register;
      --  RTC write protection register
      WPR      : aliased WPR_Register;
      --  RTC sub second register
      SSR      : aliased SSR_Register;
      --  This register is write protected. The write access procedure is
      --  described in RTC register write protection on page9.
      SHIFTR   : aliased SHIFTR_Register;
      --  The content of this register is valid only when TSF is set to 1 in
      --  RTC_ISR. It is cleared when TSF bit is reset.
      TSTR     : aliased TSTR_Register;
      --  The content of this register is valid only when TSF is set to 1 in
      --  RTC_ISR. It is cleared when TSF bit is reset.
      TSDR     : aliased TSDR_Register;
      --  The content of this register is valid only when RTC_ISR/TSF is set.
      --  It is cleared when the RTC_ISR/TSF bit is reset.
      TSSSR    : aliased TSSSR_Register;
      --  This register is write protected. The write access procedure is
      --  described in RTC register write protection on page9.
      CALR     : aliased CALR_Register;
      --  RTC tamper and alternate function configuration register
      TAMPCR   : aliased TAMPCR_Register;
      --  This register can be written only when ALRAE is reset in RTC_CR
      --  register, or in initialization mode.This register is write protected.
      --  The write access procedure is described in RTC register write
      --  protection on page9
      ALRMASSR : aliased ALRMASSR_Register;
      --  This register can be written only when ALRBE is reset in RTC_CR
      --  register, or in initialization mode.This register is write
      --  protected.The write access procedure is described in Section: RTC
      --  register write protection.
      ALRMBSSR : aliased ALRMBSSR_Register;
      --  RTC option register
      OR_k     : aliased OR_Register;
      --  RTC backup registers
      BKP0R    : aliased HAL.UInt32;
      --  RTC backup registers
      BKP1R    : aliased HAL.UInt32;
      --  RTC backup registers
      BKP2R    : aliased HAL.UInt32;
      --  RTC backup registers
      BKP3R    : aliased HAL.UInt32;
      --  RTC backup registers
      BKP4R    : aliased HAL.UInt32;
      --  RTC backup registers
      BKP5R    : aliased HAL.UInt32;
      --  RTC backup registers
      BKP6R    : aliased HAL.UInt32;
      --  RTC backup registers
      BKP7R    : aliased HAL.UInt32;
      --  RTC backup registers
      RBKP8R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP9R    : aliased HAL.UInt32;
      --  RTC backup registers
      BKP10R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP11R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP12R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP13R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP14R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP15R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP16R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP17R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP18R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP19R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP20R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP21R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP22R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP23R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP24R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP25R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP26R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP27R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP28R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP29R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP30R   : aliased HAL.UInt32;
      --  RTC backup registers
      BKP31R   : aliased HAL.UInt32;
   end record
     with Volatile;

   for RTC_Peripheral use record
      TR       at 16#0# range 0 .. 31;
      DR       at 16#4# range 0 .. 31;
      CR       at 16#8# range 0 .. 31;
      ISR      at 16#C# range 0 .. 31;
      PRER     at 16#10# range 0 .. 31;
      WUTR     at 16#14# range 0 .. 31;
      ALRMAR   at 16#1C# range 0 .. 31;
      ALRMBR   at 16#20# range 0 .. 31;
      WPR      at 16#24# range 0 .. 31;
      SSR      at 16#28# range 0 .. 31;
      SHIFTR   at 16#2C# range 0 .. 31;
      TSTR     at 16#30# range 0 .. 31;
      TSDR     at 16#34# range 0 .. 31;
      TSSSR    at 16#38# range 0 .. 31;
      CALR     at 16#3C# range 0 .. 31;
      TAMPCR   at 16#40# range 0 .. 31;
      ALRMASSR at 16#44# range 0 .. 31;
      ALRMBSSR at 16#48# range 0 .. 31;
      OR_k     at 16#4C# range 0 .. 31;
      BKP0R    at 16#50# range 0 .. 31;
      BKP1R    at 16#54# range 0 .. 31;
      BKP2R    at 16#58# range 0 .. 31;
      BKP3R    at 16#5C# range 0 .. 31;
      BKP4R    at 16#60# range 0 .. 31;
      BKP5R    at 16#64# range 0 .. 31;
      BKP6R    at 16#68# range 0 .. 31;
      BKP7R    at 16#6C# range 0 .. 31;
      RBKP8R   at 16#70# range 0 .. 31;
      BKP9R    at 16#74# range 0 .. 31;
      BKP10R   at 16#78# range 0 .. 31;
      BKP11R   at 16#7C# range 0 .. 31;
      BKP12R   at 16#80# range 0 .. 31;
      BKP13R   at 16#84# range 0 .. 31;
      BKP14R   at 16#88# range 0 .. 31;
      BKP15R   at 16#8C# range 0 .. 31;
      BKP16R   at 16#90# range 0 .. 31;
      BKP17R   at 16#94# range 0 .. 31;
      BKP18R   at 16#98# range 0 .. 31;
      BKP19R   at 16#9C# range 0 .. 31;
      BKP20R   at 16#A0# range 0 .. 31;
      BKP21R   at 16#A4# range 0 .. 31;
      BKP22R   at 16#A8# range 0 .. 31;
      BKP23R   at 16#AC# range 0 .. 31;
      BKP24R   at 16#B0# range 0 .. 31;
      BKP25R   at 16#B4# range 0 .. 31;
      BKP26R   at 16#B8# range 0 .. 31;
      BKP27R   at 16#BC# range 0 .. 31;
      BKP28R   at 16#C0# range 0 .. 31;
      BKP29R   at 16#C4# range 0 .. 31;
      BKP30R   at 16#C8# range 0 .. 31;
      BKP31R   at 16#CC# range 0 .. 31;
   end record;

   --  RTC
   RTC_Periph : aliased RTC_Peripheral
     with Import, Address => RTC_Base;

end STM32_SVD.RTC;
