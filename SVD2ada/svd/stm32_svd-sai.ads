pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32H743x.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.SAI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype GCR_SYNCIN_Field is HAL.UInt2;
   subtype GCR_SYNCOUT_Field is HAL.UInt2;

   --  Global configuration register
   type GCR_Register is record
      --  Synchronization inputs
      SYNCIN        : GCR_SYNCIN_Field := 16#0#;
      --  unspecified
      Reserved_2_3  : HAL.UInt2 := 16#0#;
      --  Synchronization outputs These bits are set and cleared by software.
      SYNCOUT       : GCR_SYNCOUT_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GCR_Register use record
      SYNCIN        at 0 range 0 .. 1;
      Reserved_2_3  at 0 range 2 .. 3;
      SYNCOUT       at 0 range 4 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype ACR1_MODE_Field is HAL.UInt2;
   subtype ACR1_PRTCFG_Field is HAL.UInt2;
   subtype ACR1_DS_Field is HAL.UInt3;
   subtype ACR1_SYNCEN_Field is HAL.UInt2;
   subtype ACR1_MCKDIV_Field is HAL.UInt6;

   --  Configuration register 1
   type ACR1_Register is record
      --  SAIx audio block mode immediately
      MODE           : ACR1_MODE_Field := 16#0#;
      --  Protocol configuration. These bits are set and cleared by software.
      --  These bits have to be configured when the audio block is disabled.
      PRTCFG         : ACR1_PRTCFG_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : HAL.Bit := 16#0#;
      --  Data size. These bits are set and cleared by software. These bits are
      --  ignored when the SPDIF protocols are selected (bit PRTCFG[1:0]),
      --  because the frame and the data size are fixed in such case. When the
      --  companding mode is selected through COMP[1:0] bits, DS[1:0] are
      --  ignored since the data size is fixed to 8 bits by the algorithm.
      --  These bits must be configured when the audio block is disabled.
      DS             : ACR1_DS_Field := 16#2#;
      --  Least significant bit first. This bit is set and cleared by software.
      --  It must be configured when the audio block is disabled. This bit has
      --  no meaning in AC97 audio protocol since AC97 data are always
      --  transferred with the MSB first. This bit has no meaning in SPDIF
      --  audio protocol since in SPDIF data are always transferred with LSB
      --  first.
      LSBFIRST       : Boolean := False;
      --  Clock strobing edge. This bit is set and cleared by software. It must
      --  be configured when the audio block is disabled. This bit has no
      --  meaning in SPDIF audio protocol.
      CKSTR          : Boolean := False;
      --  Synchronization enable. These bits are set and cleared by software.
      --  They must be configured when the audio sub-block is disabled. Note:
      --  The audio sub-block should be configured as asynchronous when SPDIF
      --  mode is enabled.
      SYNCEN         : ACR1_SYNCEN_Field := 16#0#;
      --  Mono mode. This bit is set and cleared by software. It is meaningful
      --  only when the number of slots is equal to 2. When the mono mode is
      --  selected, slot 0 data are duplicated on slot 1 when the audio block
      --  operates as a transmitter. In reception mode, the slot1 is discarded
      --  and only the data received from slot 0 are stored. Refer to Section:
      --  Mono/stereo mode for more details.
      MONO           : Boolean := False;
      --  Output drive. This bit is set and cleared by software. Note: This bit
      --  has to be set before enabling the audio block and after the audio
      --  block configuration.
      OUTDRIV        : Boolean := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      --  Audio block enable where x is A or B. This bit is set by software. To
      --  switch off the audio block, the application software must program
      --  this bit to 0 and poll the bit till it reads back 0, meaning that the
      --  block is completely disabled. Before setting this bit to 1, check
      --  that it is set to 0, otherwise the enable command will not be taken
      --  into account. This bit allows to control the state of SAIx audio
      --  block. If it is disabled when an audio frame transfer is ongoing, the
      --  ongoing transfer completes and the cell is fully disabled at the end
      --  of this audio frame transfer. Note: When SAIx block is configured in
      --  master mode, the clock must be present on the input of SAIx before
      --  setting SAIXEN bit.
      SAIEN          : Boolean := False;
      --  DMA enable. This bit is set and cleared by software. Note: Since the
      --  audio block defaults to operate as a transmitter after reset, the
      --  MODE[1:0] bits must be configured before setting DMAEN to avoid a DMA
      --  request in receiver mode.
      DMAEN          : Boolean := False;
      --  unspecified
      Reserved_18_18 : HAL.Bit := 16#0#;
      --  No divider
      NOMCK          : Boolean := False;
      --  Master clock divider. These bits are set and cleared by software.
      --  These bits are meaningless when the audio block operates in slave
      --  mode. They have to be configured when the audio block is disabled.
      --  Others: the master clock frequency is calculated accordingly to the
      --  following formula:
      MCKDIV         : ACR1_MCKDIV_Field := 16#0#;
      --  Oversampling ratio for master clock
      OSR            : Boolean := False;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ACR1_Register use record
      MODE           at 0 range 0 .. 1;
      PRTCFG         at 0 range 2 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      DS             at 0 range 5 .. 7;
      LSBFIRST       at 0 range 8 .. 8;
      CKSTR          at 0 range 9 .. 9;
      SYNCEN         at 0 range 10 .. 11;
      MONO           at 0 range 12 .. 12;
      OUTDRIV        at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      SAIEN          at 0 range 16 .. 16;
      DMAEN          at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      NOMCK          at 0 range 19 .. 19;
      MCKDIV         at 0 range 20 .. 25;
      OSR            at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype ACR2_FTH_Field is HAL.UInt3;
   subtype ACR2_MUTECNT_Field is HAL.UInt6;
   subtype ACR2_COMP_Field is HAL.UInt2;

   --  Configuration register 2
   type ACR2_Register is record
      --  FIFO threshold. This bit is set and cleared by software.
      FTH            : ACR2_FTH_Field := 16#0#;
      --  Write-only. FIFO flush. This bit is set by software. It is always
      --  read as 0. This bit should be configured when the SAI is disabled.
      FFLUSH         : Boolean := False;
      --  Tristate management on data line. This bit is set and cleared by
      --  software. It is meaningful only if the audio block is configured as a
      --  transmitter. This bit is not used when the audio block is configured
      --  in SPDIF mode. It should be configured when SAI is disabled. Refer to
      --  Section: Output data line management on an inactive slot for more
      --  details.
      TRIS           : Boolean := False;
      --  Mute. This bit is set and cleared by software. It is meaningful only
      --  when the audio block operates as a transmitter. The MUTE value is
      --  linked to value of MUTEVAL if the number of slots is lower or equal
      --  to 2, or equal to 0 if it is greater than 2. Refer to Section: Mute
      --  mode for more details. Note: This bit is meaningless and should not
      --  be used for SPDIF audio blocks.
      MUTE           : Boolean := False;
      --  Mute value. This bit is set and cleared by software.It must be
      --  written before enabling the audio block: SAIXEN. This bit is
      --  meaningful only when the audio block operates as a transmitter, the
      --  number of slots is lower or equal to 2 and the MUTE bit is set. If
      --  more slots are declared, the bit value sent during the transmission
      --  in mute mode is equal to 0, whatever the value of MUTEVAL. if the
      --  number of slot is lower or equal to 2 and MUTEVAL = 1, the MUTE value
      --  transmitted for each slot is the one sent during the previous frame.
      --  Refer to Section: Mute mode for more details. Note: This bit is
      --  meaningless and should not be used for SPDIF audio blocks.
      MUTEVAL        : Boolean := False;
      --  Mute counter. These bits are set and cleared by software. They are
      --  used only in reception mode. The value set in these bits is compared
      --  to the number of consecutive mute frames detected in reception. When
      --  the number of mute frames is equal to this value, the flag MUTEDET
      --  will be set and an interrupt will be generated if bit MUTEDETIE is
      --  set. Refer to Section: Mute mode for more details.
      MUTECNT        : ACR2_MUTECNT_Field := 16#0#;
      --  Complement bit. This bit is set and cleared by software. It defines
      --  the type of complement to be used for companding mode Note: This bit
      --  has effect only when the companding mode is -Law algorithm or A-Law
      --  algorithm.
      CPL            : Boolean := False;
      --  Companding mode. These bits are set and cleared by software. The -Law
      --  and the A-Law log are a part of the CCITT G.711 recommendation, the
      --  type of complement that will be used depends on CPL bit. The data
      --  expansion or data compression are determined by the state of bit
      --  MODE[0]. The data compression is applied if the audio block is
      --  configured as a transmitter. The data expansion is automatically
      --  applied when the audio block is configured as a receiver. Refer to
      --  Section: Companding mode for more details. Note: Companding mode is
      --  applicable only when TDM is selected.
      COMP           : ACR2_COMP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ACR2_Register use record
      FTH            at 0 range 0 .. 2;
      FFLUSH         at 0 range 3 .. 3;
      TRIS           at 0 range 4 .. 4;
      MUTE           at 0 range 5 .. 5;
      MUTEVAL        at 0 range 6 .. 6;
      MUTECNT        at 0 range 7 .. 12;
      CPL            at 0 range 13 .. 13;
      COMP           at 0 range 14 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype AFRCR_FRL_Field is HAL.UInt8;
   subtype AFRCR_FSALL_Field is HAL.UInt7;

   --  This register has no meaning in AC97 and SPDIF audio protocol
   type AFRCR_Register is record
      --  Frame length. These bits are set and cleared by software. They define
      --  the audio frame length expressed in number of SCK clock cycles: the
      --  number of bits in the frame is equal to FRL[7:0] + 1. The minimum
      --  number of bits to transfer in an audio frame must be equal to 8,
      --  otherwise the audio block will behaves in an unexpected way. This is
      --  the case when the data size is 8 bits and only one slot 0 is defined
      --  in NBSLOT[4:0] of SAI_xSLOTR register (NBSLOT[3:0] = 0000). In master
      --  mode, if the master clock (available on MCLK_x pin) is used, the
      --  frame length should be aligned with a number equal to a power of 2,
      --  ranging from 8 to 256. When the master clock is not used (NODIV = 1),
      --  it is recommended to program the frame length to an value ranging
      --  from 8 to 256. These bits are meaningless and are not used in AC97 or
      --  SPDIF audio block configuration.
      FRL            : AFRCR_FRL_Field := 16#7#;
      --  Frame synchronization active level length. These bits are set and
      --  cleared by software. They specify the length in number of bit clock
      --  (SCK) + 1 (FSALL[6:0] + 1) of the active level of the FS signal in
      --  the audio frame These bits are meaningless and are not used in AC97
      --  or SPDIF audio block configuration. They must be configured when the
      --  audio block is disabled.
      FSALL          : AFRCR_FSALL_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      --  Read-only. Frame synchronization definition. This bit is set and
      --  cleared by software. When the bit is set, the number of slots defined
      --  in the SAI_xSLOTR register has to be even. It means that half of this
      --  number of slots will be dedicated to the left channel and the other
      --  slots for the right channel (e.g: this bit has to be set for I2S or
      --  MSB/LSB-justified protocols...). This bit is meaningless and is not
      --  used in AC97 or SPDIF audio block configuration. It must be
      --  configured when the audio block is disabled.
      FSDEF          : Boolean := False;
      --  Frame synchronization polarity. This bit is set and cleared by
      --  software. It is used to configure the level of the start of frame on
      --  the FS signal. It is meaningless and is not used in AC97 or SPDIF
      --  audio block configuration. This bit must be configured when the audio
      --  block is disabled.
      FSPOL          : Boolean := False;
      --  Frame synchronization offset. This bit is set and cleared by
      --  software. It is meaningless and is not used in AC97 or SPDIF audio
      --  block configuration. This bit must be configured when the audio block
      --  is disabled.
      FSOFF          : Boolean := False;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AFRCR_Register use record
      FRL            at 0 range 0 .. 7;
      FSALL          at 0 range 8 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      FSDEF          at 0 range 16 .. 16;
      FSPOL          at 0 range 17 .. 17;
      FSOFF          at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype ASLOTR_FBOFF_Field is HAL.UInt5;
   subtype ASLOTR_SLOTSZ_Field is HAL.UInt2;
   subtype ASLOTR_NBSLOT_Field is HAL.UInt4;
   subtype ASLOTR_SLOTEN_Field is HAL.UInt16;

   --  This register has no meaning in AC97 and SPDIF audio protocol
   type ASLOTR_Register is record
      --  First bit offset These bits are set and cleared by software. The
      --  value set in this bitfield defines the position of the first data
      --  transfer bit in the slot. It represents an offset value. In
      --  transmission mode, the bits outside the data field are forced to 0.
      --  In reception mode, the extra received bits are discarded. These bits
      --  must be set when the audio block is disabled. They are ignored in
      --  AC97 or SPDIF mode.
      FBOFF          : ASLOTR_FBOFF_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      --  Slot size This bits is set and cleared by software. The slot size
      --  must be higher or equal to the data size. If this condition is not
      --  respected, the behavior of the SAI will be undetermined. Refer to
      --  Section: Output data line management on an inactive slot for
      --  information on how to drive SD line. These bits must be set when the
      --  audio block is disabled. They are ignored in AC97 or SPDIF mode.
      SLOTSZ         : ASLOTR_SLOTSZ_Field := 16#0#;
      --  Number of slots in an audio frame. These bits are set and cleared by
      --  software. The value set in this bitfield represents the number of
      --  slots + 1 in the audio frame (including the number of inactive
      --  slots). The maximum number of slots is 16. The number of slots should
      --  be even if FSDEF bit in the SAI_xFRCR register is set. The number of
      --  slots must be configured when the audio block is disabled. They are
      --  ignored in AC97 or SPDIF mode.
      NBSLOT         : ASLOTR_NBSLOT_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Slot enable. These bits are set and cleared by software. Each SLOTEN
      --  bit corresponds to a slot position from 0 to 15 (maximum 16 slots).
      --  The slot must be enabled when the audio block is disabled. They are
      --  ignored in AC97 or SPDIF mode.
      SLOTEN         : ASLOTR_SLOTEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ASLOTR_Register use record
      FBOFF          at 0 range 0 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      SLOTSZ         at 0 range 6 .. 7;
      NBSLOT         at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      SLOTEN         at 0 range 16 .. 31;
   end record;

   --  Interrupt mask register 2
   type AIM_Register is record
      --  Overrun/underrun interrupt enable. This bit is set and cleared by
      --  software. When this bit is set, an interrupt is generated if the
      --  OVRUDR bit in the SAI_xSR register is set.
      OVRUDRIE      : Boolean := False;
      --  Mute detection interrupt enable. This bit is set and cleared by
      --  software. When this bit is set, an interrupt is generated if the
      --  MUTEDET bit in the SAI_xSR register is set. This bit has a meaning
      --  only if the audio block is configured in receiver mode.
      MUTEDETIE     : Boolean := False;
      --  Wrong clock configuration interrupt enable. This bit is set and
      --  cleared by software. This bit is taken into account only if the audio
      --  block is configured as a master (MODE[1] = 0) and NODIV = 0. It
      --  generates an interrupt if the WCKCFG flag in the SAI_xSR register is
      --  set. Note: This bit is used only in TDM mode and is meaningless in
      --  other modes.
      WCKCFGIE      : Boolean := False;
      --  FIFO request interrupt enable. This bit is set and cleared by
      --  software. When this bit is set, an interrupt is generated if the FREQ
      --  bit in the SAI_xSR register is set. Since the audio block defaults to
      --  operate as a transmitter after reset, the MODE bit must be configured
      --  before setting FREQIE to avoid a parasitic interruption in receiver
      --  mode,
      FREQIE        : Boolean := False;
      --  Codec not ready interrupt enable (AC97). This bit is set and cleared
      --  by software. When the interrupt is enabled, the audio block detects
      --  in the slot 0 (tag0) of the AC97 frame if the Codec connected to this
      --  line is ready or not. If it is not ready, the CNRDY flag in the
      --  SAI_xSR register is set and an interruption i generated. This bit has
      --  a meaning only if the AC97 mode is selected through PRTCFG[1:0] bits
      --  and the audio block is operates as a receiver.
      CNRDYIE       : Boolean := False;
      --  Anticipated frame synchronization detection interrupt enable. This
      --  bit is set and cleared by software. When this bit is set, an
      --  interrupt will be generated if the AFSDET bit in the SAI_xSR register
      --  is set. This bit is meaningless in AC97, SPDIF mode or when the audio
      --  block operates as a master.
      AFSDETIE      : Boolean := False;
      --  Late frame synchronization detection interrupt enable. This bit is
      --  set and cleared by software. When this bit is set, an interrupt will
      --  be generated if the LFSDET bit is set in the SAI_xSR register. This
      --  bit is meaningless in AC97, SPDIF mode or when the audio block
      --  operates as a master.
      LFSDETIE      : Boolean := False;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AIM_Register use record
      OVRUDRIE      at 0 range 0 .. 0;
      MUTEDETIE     at 0 range 1 .. 1;
      WCKCFGIE      at 0 range 2 .. 2;
      FREQIE        at 0 range 3 .. 3;
      CNRDYIE       at 0 range 4 .. 4;
      AFSDETIE      at 0 range 5 .. 5;
      LFSDETIE      at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype ASR_FLVL_Field is HAL.UInt3;

   --  Status register
   type ASR_Register is record
      --  Read-only. Overrun / underrun. This bit is read only. The overrun and
      --  underrun conditions can occur only when the audio block is configured
      --  as a receiver and a transmitter, respectively. It can generate an
      --  interrupt if OVRUDRIE bit is set in SAI_xIM register. This flag is
      --  cleared when the software sets COVRUDR bit in SAI_xCLRFR register.
      OVRUDR         : Boolean;
      --  Read-only. Mute detection. This bit is read only. This flag is set if
      --  consecutive 0 values are received in each slot of a given audio frame
      --  and for a consecutive number of audio frames (set in the MUTECNT bit
      --  in the SAI_xCR2 register). It can generate an interrupt if MUTEDETIE
      --  bit is set in SAI_xIM register. This flag is cleared when the
      --  software sets bit CMUTEDET in the SAI_xCLRFR register.
      MUTEDET        : Boolean;
      --  Read-only. Wrong clock configuration flag. This bit is read only.
      --  This bit is used only when the audio block operates in master mode
      --  (MODE[1] = 0) and NODIV = 0. It can generate an interrupt if WCKCFGIE
      --  bit is set in SAI_xIM register. This flag is cleared when the
      --  software sets CWCKCFG bit in SAI_xCLRFR register.
      WCKCFG         : Boolean;
      --  Read-only. FIFO request. This bit is read only. The request depends
      --  on the audio block configuration: If the block is configured in
      --  transmission mode, the FIFO request is related to a write request
      --  operation in the SAI_xDR. If the block configured in reception, the
      --  FIFO request related to a read request operation from the SAI_xDR.
      --  This flag can generate an interrupt if FREQIE bit is set in SAI_xIM
      --  register.
      FREQ           : Boolean;
      --  Read-only. Codec not ready. This bit is read only. This bit is used
      --  only when the AC97 audio protocol is selected in the SAI_xCR1
      --  register and configured in receiver mode. It can generate an
      --  interrupt if CNRDYIE bit is set in SAI_xIM register. This flag is
      --  cleared when the software sets CCNRDY bit in SAI_xCLRFR register.
      CNRDY          : Boolean;
      --  Read-only. Anticipated frame synchronization detection. This bit is
      --  read only. This flag can be set only if the audio block is configured
      --  in slave mode. It is not used in AC97or SPDIF mode. It can generate
      --  an interrupt if AFSDETIE bit is set in SAI_xIM register. This flag is
      --  cleared when the software sets CAFSDET bit in SAI_xCLRFR register.
      AFSDET         : Boolean;
      --  Read-only. Late frame synchronization detection. This bit is read
      --  only. This flag can be set only if the audio block is configured in
      --  slave mode. It is not used in AC97 or SPDIF mode. It can generate an
      --  interrupt if LFSDETIE bit is set in the SAI_xIM register. This flag
      --  is cleared when the software sets bit CLFSDET in SAI_xCLRFR register
      LFSDET         : Boolean;
      --  unspecified
      Reserved_7_15  : HAL.UInt9;
      --  Read-only. FIFO level threshold. This bit is read only. The FIFO
      --  level threshold flag is managed only by hardware and its setting
      --  depends on SAI block configuration (transmitter or receiver mode). If
      --  the SAI block is configured as transmitter: If SAI block is
      --  configured as receiver:
      FLVL           : ASR_FLVL_Field;
      --  unspecified
      Reserved_19_31 : HAL.UInt13;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ASR_Register use record
      OVRUDR         at 0 range 0 .. 0;
      MUTEDET        at 0 range 1 .. 1;
      WCKCFG         at 0 range 2 .. 2;
      FREQ           at 0 range 3 .. 3;
      CNRDY          at 0 range 4 .. 4;
      AFSDET         at 0 range 5 .. 5;
      LFSDET         at 0 range 6 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      FLVL           at 0 range 16 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   --  Clear flag register
   type ACLRFR_Register is record
      --  Write-only. Clear overrun / underrun. This bit is write only.
      --  Programming this bit to 1 clears the OVRUDR flag in the SAI_xSR
      --  register. Reading this bit always returns the value 0.
      COVRUDR       : Boolean := False;
      --  Write-only. Mute detection flag. This bit is write only. Programming
      --  this bit to 1 clears the MUTEDET flag in the SAI_xSR register.
      --  Reading this bit always returns the value 0.
      CMUTEDET      : Boolean := False;
      --  Write-only. Clear wrong clock configuration flag. This bit is write
      --  only. Programming this bit to 1 clears the WCKCFG flag in the SAI_xSR
      --  register. This bit is used only when the audio block is set as master
      --  (MODE[1] = 0) and NODIV = 0 in the SAI_xCR1 register. Reading this
      --  bit always returns the value 0.
      CWCKCFG       : Boolean := False;
      --  unspecified
      Reserved_3_3  : HAL.Bit := 16#0#;
      --  Write-only. Clear Codec not ready flag. This bit is write only.
      --  Programming this bit to 1 clears the CNRDY flag in the SAI_xSR
      --  register. This bit is used only when the AC97 audio protocol is
      --  selected in the SAI_xCR1 register. Reading this bit always returns
      --  the value 0.
      CCNRDY        : Boolean := False;
      --  Write-only. Clear anticipated frame synchronization detection flag.
      --  This bit is write only. Programming this bit to 1 clears the AFSDET
      --  flag in the SAI_xSR register. It is not used in AC97or SPDIF mode.
      --  Reading this bit always returns the value 0.
      CAFSDET       : Boolean := False;
      --  Write-only. Clear late frame synchronization detection flag. This bit
      --  is write only. Programming this bit to 1 clears the LFSDET flag in
      --  the SAI_xSR register. This bit is not used in AC97or SPDIF mode
      --  Reading this bit always returns the value 0.
      CLFSDET       : Boolean := False;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ACLRFR_Register use record
      COVRUDR       at 0 range 0 .. 0;
      CMUTEDET      at 0 range 1 .. 1;
      CWCKCFG       at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      CCNRDY        at 0 range 4 .. 4;
      CAFSDET       at 0 range 5 .. 5;
      CLFSDET       at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype BCR1_MODE_Field is HAL.UInt2;
   subtype BCR1_PRTCFG_Field is HAL.UInt2;
   subtype BCR1_DS_Field is HAL.UInt3;
   subtype BCR1_SYNCEN_Field is HAL.UInt2;
   subtype BCR1_MCKDIV_Field is HAL.UInt6;

   --  Configuration register 1
   type BCR1_Register is record
      --  SAIx audio block mode immediately
      MODE           : BCR1_MODE_Field := 16#0#;
      --  Protocol configuration. These bits are set and cleared by software.
      --  These bits have to be configured when the audio block is disabled.
      PRTCFG         : BCR1_PRTCFG_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : HAL.Bit := 16#0#;
      --  Data size. These bits are set and cleared by software. These bits are
      --  ignored when the SPDIF protocols are selected (bit PRTCFG[1:0]),
      --  because the frame and the data size are fixed in such case. When the
      --  companding mode is selected through COMP[1:0] bits, DS[1:0] are
      --  ignored since the data size is fixed to 8 bits by the algorithm.
      --  These bits must be configured when the audio block is disabled.
      DS             : BCR1_DS_Field := 16#2#;
      --  Least significant bit first. This bit is set and cleared by software.
      --  It must be configured when the audio block is disabled. This bit has
      --  no meaning in AC97 audio protocol since AC97 data are always
      --  transferred with the MSB first. This bit has no meaning in SPDIF
      --  audio protocol since in SPDIF data are always transferred with LSB
      --  first.
      LSBFIRST       : Boolean := False;
      --  Clock strobing edge. This bit is set and cleared by software. It must
      --  be configured when the audio block is disabled. This bit has no
      --  meaning in SPDIF audio protocol.
      CKSTR          : Boolean := False;
      --  Synchronization enable. These bits are set and cleared by software.
      --  They must be configured when the audio sub-block is disabled. Note:
      --  The audio sub-block should be configured as asynchronous when SPDIF
      --  mode is enabled.
      SYNCEN         : BCR1_SYNCEN_Field := 16#0#;
      --  Mono mode. This bit is set and cleared by software. It is meaningful
      --  only when the number of slots is equal to 2. When the mono mode is
      --  selected, slot 0 data are duplicated on slot 1 when the audio block
      --  operates as a transmitter. In reception mode, the slot1 is discarded
      --  and only the data received from slot 0 are stored. Refer to Section:
      --  Mono/stereo mode for more details.
      MONO           : Boolean := False;
      --  Output drive. This bit is set and cleared by software. Note: This bit
      --  has to be set before enabling the audio block and after the audio
      --  block configuration.
      OUTDRIV        : Boolean := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      --  Audio block enable where x is A or B. This bit is set by software. To
      --  switch off the audio block, the application software must program
      --  this bit to 0 and poll the bit till it reads back 0, meaning that the
      --  block is completely disabled. Before setting this bit to 1, check
      --  that it is set to 0, otherwise the enable command will not be taken
      --  into account. This bit allows to control the state of SAIx audio
      --  block. If it is disabled when an audio frame transfer is ongoing, the
      --  ongoing transfer completes and the cell is fully disabled at the end
      --  of this audio frame transfer. Note: When SAIx block is configured in
      --  master mode, the clock must be present on the input of SAIx before
      --  setting SAIXEN bit.
      SAIEN          : Boolean := False;
      --  DMA enable. This bit is set and cleared by software. Note: Since the
      --  audio block defaults to operate as a transmitter after reset, the
      --  MODE[1:0] bits must be configured before setting DMAEN to avoid a DMA
      --  request in receiver mode.
      DMAEN          : Boolean := False;
      --  unspecified
      Reserved_18_18 : HAL.Bit := 16#0#;
      --  No divider
      NOMCK          : Boolean := False;
      --  Master clock divider. These bits are set and cleared by software.
      --  These bits are meaningless when the audio block operates in slave
      --  mode. They have to be configured when the audio block is disabled.
      --  Others: the master clock frequency is calculated accordingly to the
      --  following formula:
      MCKDIV         : BCR1_MCKDIV_Field := 16#0#;
      --  Oversampling ratio for master clock
      OSR            : Boolean := False;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BCR1_Register use record
      MODE           at 0 range 0 .. 1;
      PRTCFG         at 0 range 2 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      DS             at 0 range 5 .. 7;
      LSBFIRST       at 0 range 8 .. 8;
      CKSTR          at 0 range 9 .. 9;
      SYNCEN         at 0 range 10 .. 11;
      MONO           at 0 range 12 .. 12;
      OUTDRIV        at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      SAIEN          at 0 range 16 .. 16;
      DMAEN          at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      NOMCK          at 0 range 19 .. 19;
      MCKDIV         at 0 range 20 .. 25;
      OSR            at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype BCR2_FTH_Field is HAL.UInt3;
   subtype BCR2_MUTECNT_Field is HAL.UInt6;
   subtype BCR2_COMP_Field is HAL.UInt2;

   --  Configuration register 2
   type BCR2_Register is record
      --  FIFO threshold. This bit is set and cleared by software.
      FTH            : BCR2_FTH_Field := 16#0#;
      --  Write-only. FIFO flush. This bit is set by software. It is always
      --  read as 0. This bit should be configured when the SAI is disabled.
      FFLUSH         : Boolean := False;
      --  Tristate management on data line. This bit is set and cleared by
      --  software. It is meaningful only if the audio block is configured as a
      --  transmitter. This bit is not used when the audio block is configured
      --  in SPDIF mode. It should be configured when SAI is disabled. Refer to
      --  Section: Output data line management on an inactive slot for more
      --  details.
      TRIS           : Boolean := False;
      --  Mute. This bit is set and cleared by software. It is meaningful only
      --  when the audio block operates as a transmitter. The MUTE value is
      --  linked to value of MUTEVAL if the number of slots is lower or equal
      --  to 2, or equal to 0 if it is greater than 2. Refer to Section: Mute
      --  mode for more details. Note: This bit is meaningless and should not
      --  be used for SPDIF audio blocks.
      MUTE           : Boolean := False;
      --  Mute value. This bit is set and cleared by software.It must be
      --  written before enabling the audio block: SAIXEN. This bit is
      --  meaningful only when the audio block operates as a transmitter, the
      --  number of slots is lower or equal to 2 and the MUTE bit is set. If
      --  more slots are declared, the bit value sent during the transmission
      --  in mute mode is equal to 0, whatever the value of MUTEVAL. if the
      --  number of slot is lower or equal to 2 and MUTEVAL = 1, the MUTE value
      --  transmitted for each slot is the one sent during the previous frame.
      --  Refer to Section: Mute mode for more details. Note: This bit is
      --  meaningless and should not be used for SPDIF audio blocks.
      MUTEVAL        : Boolean := False;
      --  Mute counter. These bits are set and cleared by software. They are
      --  used only in reception mode. The value set in these bits is compared
      --  to the number of consecutive mute frames detected in reception. When
      --  the number of mute frames is equal to this value, the flag MUTEDET
      --  will be set and an interrupt will be generated if bit MUTEDETIE is
      --  set. Refer to Section: Mute mode for more details.
      MUTECNT        : BCR2_MUTECNT_Field := 16#0#;
      --  Complement bit. This bit is set and cleared by software. It defines
      --  the type of complement to be used for companding mode Note: This bit
      --  has effect only when the companding mode is -Law algorithm or A-Law
      --  algorithm.
      CPL            : Boolean := False;
      --  Companding mode. These bits are set and cleared by software. The -Law
      --  and the A-Law log are a part of the CCITT G.711 recommendation, the
      --  type of complement that will be used depends on CPL bit. The data
      --  expansion or data compression are determined by the state of bit
      --  MODE[0]. The data compression is applied if the audio block is
      --  configured as a transmitter. The data expansion is automatically
      --  applied when the audio block is configured as a receiver. Refer to
      --  Section: Companding mode for more details. Note: Companding mode is
      --  applicable only when TDM is selected.
      COMP           : BCR2_COMP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BCR2_Register use record
      FTH            at 0 range 0 .. 2;
      FFLUSH         at 0 range 3 .. 3;
      TRIS           at 0 range 4 .. 4;
      MUTE           at 0 range 5 .. 5;
      MUTEVAL        at 0 range 6 .. 6;
      MUTECNT        at 0 range 7 .. 12;
      CPL            at 0 range 13 .. 13;
      COMP           at 0 range 14 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BFRCR_FRL_Field is HAL.UInt8;
   subtype BFRCR_FSALL_Field is HAL.UInt7;

   --  This register has no meaning in AC97 and SPDIF audio protocol
   type BFRCR_Register is record
      --  Frame length. These bits are set and cleared by software. They define
      --  the audio frame length expressed in number of SCK clock cycles: the
      --  number of bits in the frame is equal to FRL[7:0] + 1. The minimum
      --  number of bits to transfer in an audio frame must be equal to 8,
      --  otherwise the audio block will behaves in an unexpected way. This is
      --  the case when the data size is 8 bits and only one slot 0 is defined
      --  in NBSLOT[4:0] of SAI_xSLOTR register (NBSLOT[3:0] = 0000). In master
      --  mode, if the master clock (available on MCLK_x pin) is used, the
      --  frame length should be aligned with a number equal to a power of 2,
      --  ranging from 8 to 256. When the master clock is not used (NODIV = 1),
      --  it is recommended to program the frame length to an value ranging
      --  from 8 to 256. These bits are meaningless and are not used in AC97 or
      --  SPDIF audio block configuration.
      FRL            : BFRCR_FRL_Field := 16#7#;
      --  Frame synchronization active level length. These bits are set and
      --  cleared by software. They specify the length in number of bit clock
      --  (SCK) + 1 (FSALL[6:0] + 1) of the active level of the FS signal in
      --  the audio frame These bits are meaningless and are not used in AC97
      --  or SPDIF audio block configuration. They must be configured when the
      --  audio block is disabled.
      FSALL          : BFRCR_FSALL_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      --  Read-only. Frame synchronization definition. This bit is set and
      --  cleared by software. When the bit is set, the number of slots defined
      --  in the SAI_xSLOTR register has to be even. It means that half of this
      --  number of slots will be dedicated to the left channel and the other
      --  slots for the right channel (e.g: this bit has to be set for I2S or
      --  MSB/LSB-justified protocols...). This bit is meaningless and is not
      --  used in AC97 or SPDIF audio block configuration. It must be
      --  configured when the audio block is disabled.
      FSDEF          : Boolean := False;
      --  Frame synchronization polarity. This bit is set and cleared by
      --  software. It is used to configure the level of the start of frame on
      --  the FS signal. It is meaningless and is not used in AC97 or SPDIF
      --  audio block configuration. This bit must be configured when the audio
      --  block is disabled.
      FSPOL          : Boolean := False;
      --  Frame synchronization offset. This bit is set and cleared by
      --  software. It is meaningless and is not used in AC97 or SPDIF audio
      --  block configuration. This bit must be configured when the audio block
      --  is disabled.
      FSOFF          : Boolean := False;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BFRCR_Register use record
      FRL            at 0 range 0 .. 7;
      FSALL          at 0 range 8 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      FSDEF          at 0 range 16 .. 16;
      FSPOL          at 0 range 17 .. 17;
      FSOFF          at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype BSLOTR_FBOFF_Field is HAL.UInt5;
   subtype BSLOTR_SLOTSZ_Field is HAL.UInt2;
   subtype BSLOTR_NBSLOT_Field is HAL.UInt4;
   subtype BSLOTR_SLOTEN_Field is HAL.UInt16;

   --  This register has no meaning in AC97 and SPDIF audio protocol
   type BSLOTR_Register is record
      --  First bit offset These bits are set and cleared by software. The
      --  value set in this bitfield defines the position of the first data
      --  transfer bit in the slot. It represents an offset value. In
      --  transmission mode, the bits outside the data field are forced to 0.
      --  In reception mode, the extra received bits are discarded. These bits
      --  must be set when the audio block is disabled. They are ignored in
      --  AC97 or SPDIF mode.
      FBOFF          : BSLOTR_FBOFF_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      --  Slot size This bits is set and cleared by software. The slot size
      --  must be higher or equal to the data size. If this condition is not
      --  respected, the behavior of the SAI will be undetermined. Refer to
      --  Section: Output data line management on an inactive slot for
      --  information on how to drive SD line. These bits must be set when the
      --  audio block is disabled. They are ignored in AC97 or SPDIF mode.
      SLOTSZ         : BSLOTR_SLOTSZ_Field := 16#0#;
      --  Number of slots in an audio frame. These bits are set and cleared by
      --  software. The value set in this bitfield represents the number of
      --  slots + 1 in the audio frame (including the number of inactive
      --  slots). The maximum number of slots is 16. The number of slots should
      --  be even if FSDEF bit in the SAI_xFRCR register is set. The number of
      --  slots must be configured when the audio block is disabled. They are
      --  ignored in AC97 or SPDIF mode.
      NBSLOT         : BSLOTR_NBSLOT_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  Slot enable. These bits are set and cleared by software. Each SLOTEN
      --  bit corresponds to a slot position from 0 to 15 (maximum 16 slots).
      --  The slot must be enabled when the audio block is disabled. They are
      --  ignored in AC97 or SPDIF mode.
      SLOTEN         : BSLOTR_SLOTEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BSLOTR_Register use record
      FBOFF          at 0 range 0 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      SLOTSZ         at 0 range 6 .. 7;
      NBSLOT         at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      SLOTEN         at 0 range 16 .. 31;
   end record;

   --  Interrupt mask register 2
   type BIM_Register is record
      --  Overrun/underrun interrupt enable. This bit is set and cleared by
      --  software. When this bit is set, an interrupt is generated if the
      --  OVRUDR bit in the SAI_xSR register is set.
      OVRUDRIE      : Boolean := False;
      --  Mute detection interrupt enable. This bit is set and cleared by
      --  software. When this bit is set, an interrupt is generated if the
      --  MUTEDET bit in the SAI_xSR register is set. This bit has a meaning
      --  only if the audio block is configured in receiver mode.
      MUTEDETIE     : Boolean := False;
      --  Wrong clock configuration interrupt enable. This bit is set and
      --  cleared by software. This bit is taken into account only if the audio
      --  block is configured as a master (MODE[1] = 0) and NODIV = 0. It
      --  generates an interrupt if the WCKCFG flag in the SAI_xSR register is
      --  set. Note: This bit is used only in TDM mode and is meaningless in
      --  other modes.
      WCKCFGIE      : Boolean := False;
      --  FIFO request interrupt enable. This bit is set and cleared by
      --  software. When this bit is set, an interrupt is generated if the FREQ
      --  bit in the SAI_xSR register is set. Since the audio block defaults to
      --  operate as a transmitter after reset, the MODE bit must be configured
      --  before setting FREQIE to avoid a parasitic interruption in receiver
      --  mode,
      FREQIE        : Boolean := False;
      --  Codec not ready interrupt enable (AC97). This bit is set and cleared
      --  by software. When the interrupt is enabled, the audio block detects
      --  in the slot 0 (tag0) of the AC97 frame if the Codec connected to this
      --  line is ready or not. If it is not ready, the CNRDY flag in the
      --  SAI_xSR register is set and an interruption i generated. This bit has
      --  a meaning only if the AC97 mode is selected through PRTCFG[1:0] bits
      --  and the audio block is operates as a receiver.
      CNRDYIE       : Boolean := False;
      --  Anticipated frame synchronization detection interrupt enable. This
      --  bit is set and cleared by software. When this bit is set, an
      --  interrupt will be generated if the AFSDET bit in the SAI_xSR register
      --  is set. This bit is meaningless in AC97, SPDIF mode or when the audio
      --  block operates as a master.
      AFSDETIE      : Boolean := False;
      --  Late frame synchronization detection interrupt enable. This bit is
      --  set and cleared by software. When this bit is set, an interrupt will
      --  be generated if the LFSDET bit is set in the SAI_xSR register. This
      --  bit is meaningless in AC97, SPDIF mode or when the audio block
      --  operates as a master.
      LFSDETIE      : Boolean := False;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BIM_Register use record
      OVRUDRIE      at 0 range 0 .. 0;
      MUTEDETIE     at 0 range 1 .. 1;
      WCKCFGIE      at 0 range 2 .. 2;
      FREQIE        at 0 range 3 .. 3;
      CNRDYIE       at 0 range 4 .. 4;
      AFSDETIE      at 0 range 5 .. 5;
      LFSDETIE      at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype BSR_FLVL_Field is HAL.UInt3;

   --  Status register
   type BSR_Register is record
      --  Read-only. Overrun / underrun. This bit is read only. The overrun and
      --  underrun conditions can occur only when the audio block is configured
      --  as a receiver and a transmitter, respectively. It can generate an
      --  interrupt if OVRUDRIE bit is set in SAI_xIM register. This flag is
      --  cleared when the software sets COVRUDR bit in SAI_xCLRFR register.
      OVRUDR         : Boolean;
      --  Read-only. Mute detection. This bit is read only. This flag is set if
      --  consecutive 0 values are received in each slot of a given audio frame
      --  and for a consecutive number of audio frames (set in the MUTECNT bit
      --  in the SAI_xCR2 register). It can generate an interrupt if MUTEDETIE
      --  bit is set in SAI_xIM register. This flag is cleared when the
      --  software sets bit CMUTEDET in the SAI_xCLRFR register.
      MUTEDET        : Boolean;
      --  Read-only. Wrong clock configuration flag. This bit is read only.
      --  This bit is used only when the audio block operates in master mode
      --  (MODE[1] = 0) and NODIV = 0. It can generate an interrupt if WCKCFGIE
      --  bit is set in SAI_xIM register. This flag is cleared when the
      --  software sets CWCKCFG bit in SAI_xCLRFR register.
      WCKCFG         : Boolean;
      --  Read-only. FIFO request. This bit is read only. The request depends
      --  on the audio block configuration: If the block is configured in
      --  transmission mode, the FIFO request is related to a write request
      --  operation in the SAI_xDR. If the block configured in reception, the
      --  FIFO request related to a read request operation from the SAI_xDR.
      --  This flag can generate an interrupt if FREQIE bit is set in SAI_xIM
      --  register.
      FREQ           : Boolean;
      --  Read-only. Codec not ready. This bit is read only. This bit is used
      --  only when the AC97 audio protocol is selected in the SAI_xCR1
      --  register and configured in receiver mode. It can generate an
      --  interrupt if CNRDYIE bit is set in SAI_xIM register. This flag is
      --  cleared when the software sets CCNRDY bit in SAI_xCLRFR register.
      CNRDY          : Boolean;
      --  Read-only. Anticipated frame synchronization detection. This bit is
      --  read only. This flag can be set only if the audio block is configured
      --  in slave mode. It is not used in AC97or SPDIF mode. It can generate
      --  an interrupt if AFSDETIE bit is set in SAI_xIM register. This flag is
      --  cleared when the software sets CAFSDET bit in SAI_xCLRFR register.
      AFSDET         : Boolean;
      --  Read-only. Late frame synchronization detection. This bit is read
      --  only. This flag can be set only if the audio block is configured in
      --  slave mode. It is not used in AC97 or SPDIF mode. It can generate an
      --  interrupt if LFSDETIE bit is set in the SAI_xIM register. This flag
      --  is cleared when the software sets bit CLFSDET in SAI_xCLRFR register
      LFSDET         : Boolean;
      --  unspecified
      Reserved_7_15  : HAL.UInt9;
      --  Read-only. FIFO level threshold. This bit is read only. The FIFO
      --  level threshold flag is managed only by hardware and its setting
      --  depends on SAI block configuration (transmitter or receiver mode). If
      --  the SAI block is configured as transmitter: If SAI block is
      --  configured as receiver:
      FLVL           : BSR_FLVL_Field;
      --  unspecified
      Reserved_19_31 : HAL.UInt13;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BSR_Register use record
      OVRUDR         at 0 range 0 .. 0;
      MUTEDET        at 0 range 1 .. 1;
      WCKCFG         at 0 range 2 .. 2;
      FREQ           at 0 range 3 .. 3;
      CNRDY          at 0 range 4 .. 4;
      AFSDET         at 0 range 5 .. 5;
      LFSDET         at 0 range 6 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      FLVL           at 0 range 16 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   --  Clear flag register
   type BCLRFR_Register is record
      --  Write-only. Clear overrun / underrun. This bit is write only.
      --  Programming this bit to 1 clears the OVRUDR flag in the SAI_xSR
      --  register. Reading this bit always returns the value 0.
      COVRUDR       : Boolean := False;
      --  Write-only. Mute detection flag. This bit is write only. Programming
      --  this bit to 1 clears the MUTEDET flag in the SAI_xSR register.
      --  Reading this bit always returns the value 0.
      CMUTEDET      : Boolean := False;
      --  Write-only. Clear wrong clock configuration flag. This bit is write
      --  only. Programming this bit to 1 clears the WCKCFG flag in the SAI_xSR
      --  register. This bit is used only when the audio block is set as master
      --  (MODE[1] = 0) and NODIV = 0 in the SAI_xCR1 register. Reading this
      --  bit always returns the value 0.
      CWCKCFG       : Boolean := False;
      --  unspecified
      Reserved_3_3  : HAL.Bit := 16#0#;
      --  Write-only. Clear Codec not ready flag. This bit is write only.
      --  Programming this bit to 1 clears the CNRDY flag in the SAI_xSR
      --  register. This bit is used only when the AC97 audio protocol is
      --  selected in the SAI_xCR1 register. Reading this bit always returns
      --  the value 0.
      CCNRDY        : Boolean := False;
      --  Write-only. Clear anticipated frame synchronization detection flag.
      --  This bit is write only. Programming this bit to 1 clears the AFSDET
      --  flag in the SAI_xSR register. It is not used in AC97or SPDIF mode.
      --  Reading this bit always returns the value 0.
      CAFSDET       : Boolean := False;
      --  Write-only. Clear late frame synchronization detection flag. This bit
      --  is write only. Programming this bit to 1 clears the LFSDET flag in
      --  the SAI_xSR register. This bit is not used in AC97or SPDIF mode
      --  Reading this bit always returns the value 0.
      CLFSDET       : Boolean := False;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BCLRFR_Register use record
      COVRUDR       at 0 range 0 .. 0;
      CMUTEDET      at 0 range 1 .. 1;
      CWCKCFG       at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      CCNRDY        at 0 range 4 .. 4;
      CAFSDET       at 0 range 5 .. 5;
      CLFSDET       at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype PDMCR_MICNBR_Field is HAL.UInt2;

   --  PDMCR_CKEN array
   type PDMCR_CKEN_Field_Array is array (1 .. 4) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for PDMCR_CKEN
   type PDMCR_CKEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CKEN as a value
            Val : HAL.UInt4;
         when True =>
            --  CKEN as an array
            Arr : PDMCR_CKEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for PDMCR_CKEN_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  PDM control register
   type PDMCR_Register is record
      --  PDM enable
      PDMEN          : Boolean := False;
      --  unspecified
      Reserved_1_3   : HAL.UInt3 := 16#0#;
      --  Number of microphones
      MICNBR         : PDMCR_MICNBR_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      --  Clock enable of bitstream clock number 1
      CKEN           : PDMCR_CKEN_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDMCR_Register use record
      PDMEN          at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      MICNBR         at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CKEN           at 0 range 8 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype PDMDLY_DLYM1L_Field is HAL.UInt3;
   subtype PDMDLY_DLYM1R_Field is HAL.UInt3;
   subtype PDMDLY_DLYM2L_Field is HAL.UInt3;
   subtype PDMDLY_DLYM2R_Field is HAL.UInt3;
   subtype PDMDLY_DLYM3L_Field is HAL.UInt3;
   subtype PDMDLY_DLYM3R_Field is HAL.UInt3;
   subtype PDMDLY_DLYM4L_Field is HAL.UInt3;
   subtype PDMDLY_DLYM4R_Field is HAL.UInt3;

   --  PDM delay register
   type PDMDLY_Register is record
      --  Delay line adjust for first microphone of pair 1
      DLYM1L         : PDMDLY_DLYM1L_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  Delay line adjust for second microphone of pair 1
      DLYM1R         : PDMDLY_DLYM1R_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Delay line for first microphone of pair 2
      DLYM2L         : PDMDLY_DLYM2L_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      --  Delay line for second microphone of pair 2
      DLYM2R         : PDMDLY_DLYM2R_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      --  Delay line for first microphone of pair 3
      DLYM3L         : PDMDLY_DLYM3L_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : HAL.Bit := 16#0#;
      --  Delay line for second microphone of pair 3
      DLYM3R         : PDMDLY_DLYM3R_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      --  Delay line for first microphone of pair 4
      DLYM4L         : PDMDLY_DLYM4L_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : HAL.Bit := 16#0#;
      --  Delay line for second microphone of pair 4
      DLYM4R         : PDMDLY_DLYM4R_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDMDLY_Register use record
      DLYM1L         at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      DLYM1R         at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      DLYM2L         at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      DLYM2R         at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      DLYM3L         at 0 range 16 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      DLYM3R         at 0 range 20 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      DLYM4L         at 0 range 24 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      DLYM4R         at 0 range 28 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  SAI
   type SAI_Peripheral is record
      --  Global configuration register
      GCR    : aliased GCR_Register;
      --  Configuration register 1
      ACR1   : aliased ACR1_Register;
      --  Configuration register 2
      ACR2   : aliased ACR2_Register;
      --  This register has no meaning in AC97 and SPDIF audio protocol
      AFRCR  : aliased AFRCR_Register;
      --  This register has no meaning in AC97 and SPDIF audio protocol
      ASLOTR : aliased ASLOTR_Register;
      --  Interrupt mask register 2
      AIM    : aliased AIM_Register;
      --  Status register
      ASR    : aliased ASR_Register;
      --  Clear flag register
      ACLRFR : aliased ACLRFR_Register;
      --  Data register
      ADR    : aliased HAL.UInt32;
      --  Configuration register 1
      BCR1   : aliased BCR1_Register;
      --  Configuration register 2
      BCR2   : aliased BCR2_Register;
      --  This register has no meaning in AC97 and SPDIF audio protocol
      BFRCR  : aliased BFRCR_Register;
      --  This register has no meaning in AC97 and SPDIF audio protocol
      BSLOTR : aliased BSLOTR_Register;
      --  Interrupt mask register 2
      BIM    : aliased BIM_Register;
      --  Status register
      BSR    : aliased BSR_Register;
      --  Clear flag register
      BCLRFR : aliased BCLRFR_Register;
      --  Data register
      BDR    : aliased HAL.UInt32;
      --  PDM control register
      PDMCR  : aliased PDMCR_Register;
      --  PDM delay register
      PDMDLY : aliased PDMDLY_Register;
   end record
     with Volatile;

   for SAI_Peripheral use record
      GCR    at 16#0# range 0 .. 31;
      ACR1   at 16#4# range 0 .. 31;
      ACR2   at 16#8# range 0 .. 31;
      AFRCR  at 16#C# range 0 .. 31;
      ASLOTR at 16#10# range 0 .. 31;
      AIM    at 16#14# range 0 .. 31;
      ASR    at 16#18# range 0 .. 31;
      ACLRFR at 16#1C# range 0 .. 31;
      ADR    at 16#20# range 0 .. 31;
      BCR1   at 16#24# range 0 .. 31;
      BCR2   at 16#28# range 0 .. 31;
      BFRCR  at 16#2C# range 0 .. 31;
      BSLOTR at 16#30# range 0 .. 31;
      BIM    at 16#34# range 0 .. 31;
      BSR    at 16#38# range 0 .. 31;
      BCLRFR at 16#3C# range 0 .. 31;
      BDR    at 16#40# range 0 .. 31;
      PDMCR  at 16#44# range 0 .. 31;
      PDMDLY at 16#48# range 0 .. 31;
   end record;

   --  SAI
   SAI1_Periph : aliased SAI_Peripheral
     with Import, Address => SAI1_Base;

   --  SAI
   SAI2_Periph : aliased SAI_Peripheral
     with Import, Address => SAI2_Base;

   --  SAI
   SAI3_Periph : aliased SAI_Peripheral
     with Import, Address => SAI3_Base;

   --  SAI
   SAI4_Periph : aliased SAI_Peripheral
     with Import, Address => SAI4_Base;

end STM32_SVD.SAI;
