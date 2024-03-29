;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1170 (Feb 16 2022) (MSVC)
; This file was generated Thu Mar 07 15:27:24 2024
;--------------------------------------------------------
$name lab5v3
$optc51 --model-small
$printf_float
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _InitPinADC_PARM_2
	public _main
	public _getsn
	public _Get_ADC
	public _Volts_at_Pin
	public _ADC_at_Pin
	public _InitPinADC
	public _TIMER0_Init
	public _LCDprint
	public _LCD_4BIT
	public _WriteCommand
	public _WriteData
	public _LCD_byte
	public _LCD_pulse
	public _waitms
	public _Timer3us
	public _InitADC
	public __c51_external_startup
	public _LCDprint_PARM_3
	public _getsn_PARM_2
	public _LCDprint_PARM_2
	public _flag2
	public _flag1
	public _attempt
	public _passcode
	public _overflow_count
	public _state
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_ADC0ASAH       DATA 0xb6
_ADC0ASAL       DATA 0xb5
_ADC0ASCF       DATA 0xa1
_ADC0ASCT       DATA 0xc7
_ADC0CF0        DATA 0xbc
_ADC0CF1        DATA 0xb9
_ADC0CF2        DATA 0xdf
_ADC0CN0        DATA 0xe8
_ADC0CN1        DATA 0xb2
_ADC0CN2        DATA 0xb3
_ADC0GTH        DATA 0xc4
_ADC0GTL        DATA 0xc3
_ADC0H          DATA 0xbe
_ADC0L          DATA 0xbd
_ADC0LTH        DATA 0xc6
_ADC0LTL        DATA 0xc5
_ADC0MX         DATA 0xbb
_B              DATA 0xf0
_CKCON0         DATA 0x8e
_CKCON1         DATA 0xa6
_CLEN0          DATA 0xc6
_CLIE0          DATA 0xc7
_CLIF0          DATA 0xe8
_CLKSEL         DATA 0xa9
_CLOUT0         DATA 0xd1
_CLU0CF         DATA 0xb1
_CLU0FN         DATA 0xaf
_CLU0MX         DATA 0x84
_CLU1CF         DATA 0xb3
_CLU1FN         DATA 0xb2
_CLU1MX         DATA 0x85
_CLU2CF         DATA 0xb6
_CLU2FN         DATA 0xb5
_CLU2MX         DATA 0x91
_CLU3CF         DATA 0xbf
_CLU3FN         DATA 0xbe
_CLU3MX         DATA 0xae
_CMP0CN0        DATA 0x9b
_CMP0CN1        DATA 0x99
_CMP0MD         DATA 0x9d
_CMP0MX         DATA 0x9f
_CMP1CN0        DATA 0xbf
_CMP1CN1        DATA 0xac
_CMP1MD         DATA 0xab
_CMP1MX         DATA 0xaa
_CRC0CN0        DATA 0xce
_CRC0CN1        DATA 0x86
_CRC0CNT        DATA 0xd3
_CRC0DAT        DATA 0xcb
_CRC0FLIP       DATA 0xcf
_CRC0IN         DATA 0xca
_CRC0ST         DATA 0xd2
_DAC0CF0        DATA 0x91
_DAC0CF1        DATA 0x92
_DAC0H          DATA 0x85
_DAC0L          DATA 0x84
_DAC1CF0        DATA 0x93
_DAC1CF1        DATA 0x94
_DAC1H          DATA 0x8a
_DAC1L          DATA 0x89
_DAC2CF0        DATA 0x95
_DAC2CF1        DATA 0x96
_DAC2H          DATA 0x8c
_DAC2L          DATA 0x8b
_DAC3CF0        DATA 0x9a
_DAC3CF1        DATA 0x9c
_DAC3H          DATA 0x8e
_DAC3L          DATA 0x8d
_DACGCF0        DATA 0x88
_DACGCF1        DATA 0x98
_DACGCF2        DATA 0xa2
_DERIVID        DATA 0xad
_DEVICEID       DATA 0xb5
_DPH            DATA 0x83
_DPL            DATA 0x82
_EIE1           DATA 0xe6
_EIE2           DATA 0xf3
_EIP1           DATA 0xbb
_EIP1H          DATA 0xee
_EIP2           DATA 0xed
_EIP2H          DATA 0xf6
_EMI0CN         DATA 0xe7
_FLKEY          DATA 0xb7
_HFO0CAL        DATA 0xc7
_HFO1CAL        DATA 0xd6
_HFOCN          DATA 0xef
_I2C0ADM        DATA 0xff
_I2C0CN0        DATA 0xba
_I2C0DIN        DATA 0xbc
_I2C0DOUT       DATA 0xbb
_I2C0FCN0       DATA 0xad
_I2C0FCN1       DATA 0xab
_I2C0FCT        DATA 0xf5
_I2C0SLAD       DATA 0xbd
_I2C0STAT       DATA 0xb9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xf2
_IT01CF         DATA 0xe4
_LFO0CN         DATA 0xb1
_P0             DATA 0x80
_P0MASK         DATA 0xfe
_P0MAT          DATA 0xfd
_P0MDIN         DATA 0xf1
_P0MDOUT        DATA 0xa4
_P0SKIP         DATA 0xd4
_P1             DATA 0x90
_P1MASK         DATA 0xee
_P1MAT          DATA 0xed
_P1MDIN         DATA 0xf2
_P1MDOUT        DATA 0xa5
_P1SKIP         DATA 0xd5
_P2             DATA 0xa0
_P2MASK         DATA 0xfc
_P2MAT          DATA 0xfb
_P2MDIN         DATA 0xf3
_P2MDOUT        DATA 0xa6
_P2SKIP         DATA 0xcc
_P3             DATA 0xb0
_P3MDIN         DATA 0xf4
_P3MDOUT        DATA 0x9c
_PCA0CENT       DATA 0x9e
_PCA0CLR        DATA 0x9c
_PCA0CN0        DATA 0xd8
_PCA0CPH0       DATA 0xfc
_PCA0CPH1       DATA 0xea
_PCA0CPH2       DATA 0xec
_PCA0CPH3       DATA 0xf5
_PCA0CPH4       DATA 0x85
_PCA0CPH5       DATA 0xde
_PCA0CPL0       DATA 0xfb
_PCA0CPL1       DATA 0xe9
_PCA0CPL2       DATA 0xeb
_PCA0CPL3       DATA 0xf4
_PCA0CPL4       DATA 0x84
_PCA0CPL5       DATA 0xdd
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xae
_PCA0CPM4       DATA 0xaf
_PCA0CPM5       DATA 0xcc
_PCA0H          DATA 0xfa
_PCA0L          DATA 0xf9
_PCA0MD         DATA 0xd9
_PCA0POL        DATA 0x96
_PCA0PWM        DATA 0xf7
_PCON0          DATA 0x87
_PCON1          DATA 0xcd
_PFE0CN         DATA 0xc1
_PRTDRV         DATA 0xf6
_PSCTL          DATA 0x8f
_PSTAT0         DATA 0xaa
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_REG0CN         DATA 0xc9
_REVID          DATA 0xb6
_RSTSRC         DATA 0xef
_SBCON1         DATA 0x94
_SBRLH1         DATA 0x96
_SBRLL1         DATA 0x95
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_SBUF1          DATA 0x92
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SCON1          DATA 0xc8
_SFRPAGE        DATA 0xa7
_SFRPGCN        DATA 0xbc
_SFRSTACK       DATA 0xd7
_SMB0ADM        DATA 0xd6
_SMB0ADR        DATA 0xd7
_SMB0CF         DATA 0xc1
_SMB0CN0        DATA 0xc0
_SMB0DAT        DATA 0xc2
_SMB0FCN0       DATA 0xc3
_SMB0FCN1       DATA 0xc4
_SMB0FCT        DATA 0xef
_SMB0RXLN       DATA 0xc5
_SMB0TC         DATA 0xac
_SMOD1          DATA 0x93
_SP             DATA 0x81
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0CN0        DATA 0xf8
_SPI0DAT        DATA 0xa3
_SPI0FCN0       DATA 0x9a
_SPI0FCN1       DATA 0x9b
_SPI0FCT        DATA 0xf7
_SPI0PCF        DATA 0xdf
_TCON           DATA 0x88
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TMOD           DATA 0x89
_TMR2CN0        DATA 0xc8
_TMR2CN1        DATA 0xfd
_TMR2H          DATA 0xcf
_TMR2L          DATA 0xce
_TMR2RLH        DATA 0xcb
_TMR2RLL        DATA 0xca
_TMR3CN0        DATA 0x91
_TMR3CN1        DATA 0xfe
_TMR3H          DATA 0x95
_TMR3L          DATA 0x94
_TMR3RLH        DATA 0x93
_TMR3RLL        DATA 0x92
_TMR4CN0        DATA 0x98
_TMR4CN1        DATA 0xff
_TMR4H          DATA 0xa5
_TMR4L          DATA 0xa4
_TMR4RLH        DATA 0xa3
_TMR4RLL        DATA 0xa2
_TMR5CN0        DATA 0xc0
_TMR5CN1        DATA 0xf1
_TMR5H          DATA 0xd5
_TMR5L          DATA 0xd4
_TMR5RLH        DATA 0xd3
_TMR5RLL        DATA 0xd2
_UART0PCF       DATA 0xd9
_UART1FCN0      DATA 0x9d
_UART1FCN1      DATA 0xd8
_UART1FCT       DATA 0xfa
_UART1LIN       DATA 0x9e
_UART1PCF       DATA 0xda
_VDM0CN         DATA 0xff
_WDTCN          DATA 0x97
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_XOSC0CN        DATA 0x86
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0xa3a2
_TMR5RL         DATA 0xd3d2
_TMR0           DATA 0x8c8a
_TMR1           DATA 0x8d8b
_TMR2           DATA 0xcfce
_TMR3           DATA 0x9594
_TMR4           DATA 0xa5a4
_TMR5           DATA 0xd5d4
_SBRL1          DATA 0x9695
_PCA0           DATA 0xfaf9
_PCA0CP0        DATA 0xfcfb
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xf5f4
_PCA0CP4        DATA 0x8584
_PCA0CP5        DATA 0xdedd
_ADC0ASA        DATA 0xb6b5
_ADC0GT         DATA 0xc4c3
_ADC0           DATA 0xbebd
_ADC0LT         DATA 0xc6c5
_DAC0           DATA 0x8584
_DAC1           DATA 0x8a89
_DAC2           DATA 0x8c8b
_DAC3           DATA 0x8e8d
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_TEMPE          BIT 0xe8
_ADGN0          BIT 0xe9
_ADGN1          BIT 0xea
_ADWINT         BIT 0xeb
_ADBUSY         BIT 0xec
_ADINT          BIT 0xed
_IPOEN          BIT 0xee
_ADEN           BIT 0xef
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_C0FIF          BIT 0xe8
_C0RIF          BIT 0xe9
_C1FIF          BIT 0xea
_C1RIF          BIT 0xeb
_C2FIF          BIT 0xec
_C2RIF          BIT 0xed
_C3FIF          BIT 0xee
_C3RIF          BIT 0xef
_D1SRC0         BIT 0x88
_D1SRC1         BIT 0x89
_D1AMEN         BIT 0x8a
_D01REFSL       BIT 0x8b
_D3SRC0         BIT 0x8c
_D3SRC1         BIT 0x8d
_D3AMEN         BIT 0x8e
_D23REFSL       BIT 0x8f
_D0UDIS         BIT 0x98
_D1UDIS         BIT 0x99
_D2UDIS         BIT 0x9a
_D3UDIS         BIT 0x9b
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES0            BIT 0xac
_ET2            BIT 0xad
_ESPI0          BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS0            BIT 0xbc
_PT2            BIT 0xbd
_PSPI0          BIT 0xbe
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_7           BIT 0xb7
_CCF0           BIT 0xd8
_CCF1           BIT 0xd9
_CCF2           BIT 0xda
_CCF3           BIT 0xdb
_CCF4           BIT 0xdc
_CCF5           BIT 0xdd
_CR             BIT 0xde
_CF             BIT 0xdf
_PARITY         BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_CE             BIT 0x9d
_SMODE          BIT 0x9e
_RI1            BIT 0xc8
_TI1            BIT 0xc9
_RBX1           BIT 0xca
_TBX1           BIT 0xcb
_REN1           BIT 0xcc
_PERR1          BIT 0xcd
_OVR1           BIT 0xce
_SI             BIT 0xc0
_ACK            BIT 0xc1
_ARBLOST        BIT 0xc2
_ACKRQ          BIT 0xc3
_STO            BIT 0xc4
_STA            BIT 0xc5
_TXMODE         BIT 0xc6
_MASTER         BIT 0xc7
_SPIEN          BIT 0xf8
_TXNF           BIT 0xf9
_NSSMD0         BIT 0xfa
_NSSMD1         BIT 0xfb
_RXOVRN         BIT 0xfc
_MODF           BIT 0xfd
_WCOL           BIT 0xfe
_SPIF           BIT 0xff
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_T2XCLK0        BIT 0xc8
_T2XCLK1        BIT 0xc9
_TR2            BIT 0xca
_T2SPLIT        BIT 0xcb
_TF2CEN         BIT 0xcc
_TF2LEN         BIT 0xcd
_TF2L           BIT 0xce
_TF2H           BIT 0xcf
_T4XCLK0        BIT 0x98
_T4XCLK1        BIT 0x99
_TR4            BIT 0x9a
_T4SPLIT        BIT 0x9b
_TF4CEN         BIT 0x9c
_TF4LEN         BIT 0x9d
_TF4L           BIT 0x9e
_TF4H           BIT 0x9f
_T5XCLK0        BIT 0xc0
_T5XCLK1        BIT 0xc1
_TR5            BIT 0xc2
_T5SPLIT        BIT 0xc3
_TF5CEN         BIT 0xc4
_TF5LEN         BIT 0xc5
_TF5L           BIT 0xc6
_TF5H           BIT 0xc7
_RIE            BIT 0xd8
_RXTO0          BIT 0xd9
_RXTO1          BIT 0xda
_RFRQ           BIT 0xdb
_TIE            BIT 0xdc
_TXHOLD         BIT 0xdd
_TXNF1          BIT 0xde
_TFRQ           BIT 0xdf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_state:
	ds 2
_overflow_count:
	ds 1
_passcode:
	ds 2
_attempt:
	ds 2
_flag1:
	ds 2
_flag2:
	ds 2
_LCDprint_PARM_2:
	ds 1
_getsn_PARM_2:
	ds 2
_getsn_buff_1_96:
	ds 3
_getsn_sloc0_1_0:
	ds 2
_main_num1_1_102:
	ds 2
_main_num2_1_102:
	ds 2
_main_mst_1_102:
	ds 4
_main_i_1_102:
	ds 2
_main_vmax1_1_102:
	ds 4
_main_vmax2_1_102:
	ds 4
_main_degrees_1_102:
	ds 4
_main_p_n_1_102:
	ds 4
_main_sloc0_1_0:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
_InitPinADC_PARM_2:
	ds 1
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
_main_v_1_102:
	ds 8
_main_buff1_1_102:
	ds 17
_main_buff2_1_102:
	ds 17
_main_buff0_1_102:
	ds 17
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_LCDprint_PARM_3:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	D:\clone\LAB5\lab5v3.c:29: unsigned int state=0;
	clr	a
	mov	_state,a
	mov	(_state + 1),a
;	D:\clone\LAB5\lab5v3.c:31: unsigned int passcode=292,attempt=0,flag1=0,flag2=0;
	mov	_passcode,#0x24
	mov	(_passcode + 1),#0x01
;	D:\clone\LAB5\lab5v3.c:31: char _c51_external_startup (void)
	clr	a
	mov	_attempt,a
	mov	(_attempt + 1),a
;	D:\clone\LAB5\lab5v3.c:31: unsigned int passcode=292,attempt=0,flag1=0,flag2=0;
	clr	a
	mov	_flag1,a
	mov	(_flag1 + 1),a
;	D:\clone\LAB5\lab5v3.c:31: char _c51_external_startup (void)
	clr	a
	mov	_flag2,a
	mov	(_flag2 + 1),a
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:32: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	D:\clone\LAB5\lab5v3.c:35: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\clone\LAB5\lab5v3.c:36: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	D:\clone\LAB5\lab5v3.c:37: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	D:\clone\LAB5\lab5v3.c:39: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	D:\clone\LAB5\lab5v3.c:40: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	D:\clone\LAB5\lab5v3.c:47: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	D:\clone\LAB5\lab5v3.c:48: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	D:\clone\LAB5\lab5v3.c:49: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\clone\LAB5\lab5v3.c:70: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	D:\clone\LAB5\lab5v3.c:71: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	D:\clone\LAB5\lab5v3.c:72: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	D:\clone\LAB5\lab5v3.c:73: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	D:\clone\LAB5\lab5v3.c:74: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	D:\clone\LAB5\lab5v3.c:75: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	D:\clone\LAB5\lab5v3.c:80: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	D:\clone\LAB5\lab5v3.c:81: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	D:\clone\LAB5\lab5v3.c:82: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	D:\clone\LAB5\lab5v3.c:83: XBR2     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	D:\clone\LAB5\lab5v3.c:89: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	D:\clone\LAB5\lab5v3.c:90: CKCON0 |= 0b_0000_0000 ; // Timer 1 uses the system clock divided by 12.
	mov	_CKCON0,_CKCON0
;	D:\clone\LAB5\lab5v3.c:92: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	D:\clone\LAB5\lab5v3.c:93: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	D:\clone\LAB5\lab5v3.c:94: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	D:\clone\LAB5\lab5v3.c:95: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	D:\clone\LAB5\lab5v3.c:96: TR1 = 1; // START Timer1
	setb	_TR1
;	D:\clone\LAB5\lab5v3.c:97: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	D:\clone\LAB5\lab5v3.c:99: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:102: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	D:\clone\LAB5\lab5v3.c:104: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\clone\LAB5\lab5v3.c:105: ADEN=0; // Disable ADC
	clr	_ADEN
;	D:\clone\LAB5\lab5v3.c:110: (0x0 << 0) ; // Accumulate n conversions: 0x0: 1, 0x1:4, 0x2:8, 0x3:16, 0x4:32
	mov	_ADC0CN1,#0x80
;	D:\clone\LAB5\lab5v3.c:114: (0x0 << 2); // 0:SYSCLK ADCCLK = SYSCLK. 1:HFOSC0 ADCCLK = HFOSC0.
	mov	_ADC0CF0,#0x20
;	D:\clone\LAB5\lab5v3.c:118: (0x1E << 0); // Conversion Tracking Time. Tadtk = ADTK / (Fsarclk)
	mov	_ADC0CF1,#0x1E
;	D:\clone\LAB5\lab5v3.c:127: (0x0 << 0) ; // TEMPE. 0: Disable the Temperature Sensor. 1: Enable the Temperature Sensor.
	mov	_ADC0CN0,#0x00
;	D:\clone\LAB5\lab5v3.c:132: (0x1F << 0); // ADPWR. Power Up Delay Time. Tpwrtime = ((4 * (ADPWR + 1)) + 2) / (Fadcclk)
	mov	_ADC0CF2,#0x3F
;	D:\clone\LAB5\lab5v3.c:136: (0x0 << 0) ; // ADCM. 0x0: ADBUSY, 0x1: TIMER0, 0x2: TIMER2, 0x3: TIMER3, 0x4: CNVSTR, 0x5: CEX5, 0x6: TIMER4, 0x7: TIMER5, 0x8: CLU0, 0x9: CLU1, 0xA: CLU2, 0xB: CLU3
	mov	_ADC0CN2,#0x00
;	D:\clone\LAB5\lab5v3.c:138: ADEN=1; // Enable ADC
	setb	_ADEN
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:142: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	D:\clone\LAB5\lab5v3.c:147: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	D:\clone\LAB5\lab5v3.c:149: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	D:\clone\LAB5\lab5v3.c:150: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	D:\clone\LAB5\lab5v3.c:152: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	D:\clone\LAB5\lab5v3.c:153: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L004004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L004007?
;	D:\clone\LAB5\lab5v3.c:155: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L004001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L004001?
;	D:\clone\LAB5\lab5v3.c:156: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	D:\clone\LAB5\lab5v3.c:153: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L004004?
L004007?:
;	D:\clone\LAB5\lab5v3.c:158: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:161: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	D:\clone\LAB5\lab5v3.c:165: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L005005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L005009?
;	D:\clone\LAB5\lab5v3.c:166: for (k=0; k<4; k++) Timer3us(250);
	mov	r6,#0x00
L005001?:
	cjne	r6,#0x04,L005018?
L005018?:
	jnc	L005007?
	mov	dpl,#0xFA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Timer3us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r6
	sjmp	L005001?
L005007?:
;	D:\clone\LAB5\lab5v3.c:165: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L005005?
	inc	r5
	sjmp	L005005?
L005009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:169: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	D:\clone\LAB5\lab5v3.c:171: LCD_E=1;
	setb	_P2_0
;	D:\clone\LAB5\lab5v3.c:172: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
;	D:\clone\LAB5\lab5v3.c:173: LCD_E=0;
	clr	_P2_0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:176: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	D:\clone\LAB5\lab5v3.c:179: ACC=x; //Send high nible
	mov	_ACC,r2
;	D:\clone\LAB5\lab5v3.c:180: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P1_0,c
;	D:\clone\LAB5\lab5v3.c:181: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P1_1,c
;	D:\clone\LAB5\lab5v3.c:182: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P1_2,c
;	D:\clone\LAB5\lab5v3.c:183: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P1_3,c
;	D:\clone\LAB5\lab5v3.c:184: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	D:\clone\LAB5\lab5v3.c:185: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
	pop	ar2
;	D:\clone\LAB5\lab5v3.c:186: ACC=x; //Send low nible
	mov	_ACC,r2
;	D:\clone\LAB5\lab5v3.c:187: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P1_0,c
;	D:\clone\LAB5\lab5v3.c:188: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P1_1,c
;	D:\clone\LAB5\lab5v3.c:189: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P1_2,c
;	D:\clone\LAB5\lab5v3.c:190: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P1_3,c
;	D:\clone\LAB5\lab5v3.c:191: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:194: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	D:\clone\LAB5\lab5v3.c:196: LCD_RS=1;
	setb	_P1_7
;	D:\clone\LAB5\lab5v3.c:197: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	D:\clone\LAB5\lab5v3.c:198: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:201: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	D:\clone\LAB5\lab5v3.c:203: LCD_RS=0;
	clr	_P1_7
;	D:\clone\LAB5\lab5v3.c:204: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	D:\clone\LAB5\lab5v3.c:205: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:208: void LCD_4BIT (void)
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
;	D:\clone\LAB5\lab5v3.c:210: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P2_0
;	D:\clone\LAB5\lab5v3.c:212: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	D:\clone\LAB5\lab5v3.c:214: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	D:\clone\LAB5\lab5v3.c:215: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	D:\clone\LAB5\lab5v3.c:216: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	D:\clone\LAB5\lab5v3.c:219: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	D:\clone\LAB5\lab5v3.c:220: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	D:\clone\LAB5\lab5v3.c:221: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	D:\clone\LAB5\lab5v3.c:222: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:225: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	D:\clone\LAB5\lab5v3.c:229: WriteCommand(line==2?0xc0:0x80);
	mov	a,#0x02
	cjne	a,_LCDprint_PARM_2,L011013?
	mov	r5,#0xC0
	sjmp	L011014?
L011013?:
	mov	r5,#0x80
L011014?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
;	D:\clone\LAB5\lab5v3.c:230: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	D:\clone\LAB5\lab5v3.c:231: for(j=0; string[j]!=0; j++) WriteData(string[j]);// Write the message
	mov	r5,#0x00
	mov	r6,#0x00
L011003?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	r7,a
	jz	L011006?
	mov	dpl,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_WriteData
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r5
	cjne	r5,#0x00,L011003?
	inc	r6
	sjmp	L011003?
L011006?:
;	D:\clone\LAB5\lab5v3.c:232: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_3,L011011?
	mov	ar2,r5
	mov	ar3,r6
L011007?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L011011?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L011007?
	inc	r3
	sjmp	L011007?
L011011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIMER0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:235: void TIMER0_Init(void)
;	-----------------------------------------
;	 function TIMER0_Init
;	-----------------------------------------
_TIMER0_Init:
;	D:\clone\LAB5\lab5v3.c:237: TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	anl	_TMOD,#0xF0
;	D:\clone\LAB5\lab5v3.c:238: TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
	orl	_TMOD,#0x01
;	D:\clone\LAB5\lab5v3.c:239: TR0=0; // Stop Timer/Counter 0
	clr	_TR0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pinno                     Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:244: void InitPinADC (unsigned char portno, unsigned char pinno)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	D:\clone\LAB5\lab5v3.c:248: mask=1<<pinno;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L013013?
L013011?:
	add	a,acc
L013013?:
	djnz	b,L013011?
	mov	r3,a
;	D:\clone\LAB5\lab5v3.c:250: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	D:\clone\LAB5\lab5v3.c:251: switch (portno)
	cjne	r2,#0x00,L013014?
	sjmp	L013001?
L013014?:
	cjne	r2,#0x01,L013015?
	sjmp	L013002?
L013015?:
;	D:\clone\LAB5\lab5v3.c:253: case 0:
	cjne	r2,#0x02,L013005?
	sjmp	L013003?
L013001?:
;	D:\clone\LAB5\lab5v3.c:254: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P0MDIN,a
;	D:\clone\LAB5\lab5v3.c:255: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	D:\clone\LAB5\lab5v3.c:256: break;
;	D:\clone\LAB5\lab5v3.c:257: case 1:
	sjmp	L013005?
L013002?:
;	D:\clone\LAB5\lab5v3.c:258: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P1MDIN,a
;	D:\clone\LAB5\lab5v3.c:259: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	D:\clone\LAB5\lab5v3.c:260: break;
;	D:\clone\LAB5\lab5v3.c:261: case 2:
	sjmp	L013005?
L013003?:
;	D:\clone\LAB5\lab5v3.c:262: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P2MDIN,a
;	D:\clone\LAB5\lab5v3.c:263: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	D:\clone\LAB5\lab5v3.c:267: }
L013005?:
;	D:\clone\LAB5\lab5v3.c:268: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:272: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_ADC0MX,dpl
;	D:\clone\LAB5\lab5v3.c:275: ADINT = 0;
	clr	_ADINT
;	D:\clone\LAB5\lab5v3.c:276: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	D:\clone\LAB5\lab5v3.c:277: while (!ADINT); // Wait for conversion to complete
L014001?:
	jnb	_ADINT,L014001?
;	D:\clone\LAB5\lab5v3.c:278: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:281: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	D:\clone\LAB5\lab5v3.c:283: return ((ADC_at_Pin(pin)*VDD)/0b_0011_1111_1111_1111);
	lcall	_ADC_at_Pin
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x923A
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xFC
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Get_ADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:286: unsigned int Get_ADC (void)
;	-----------------------------------------
;	 function Get_ADC
;	-----------------------------------------
_Get_ADC:
;	D:\clone\LAB5\lab5v3.c:288: ADINT = 0;
	clr	_ADINT
;	D:\clone\LAB5\lab5v3.c:289: ADBUSY = 1;
	setb	_ADBUSY
;	D:\clone\LAB5\lab5v3.c:290: while (!ADINT); // Wait for conversion to complete
L016001?:
	jnb	_ADINT,L016001?
;	D:\clone\LAB5\lab5v3.c:291: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getsn'
;------------------------------------------------------------
;len                       Allocated with name '_getsn_PARM_2'
;buff                      Allocated with name '_getsn_buff_1_96'
;j                         Allocated with name '_getsn_sloc0_1_0'
;c                         Allocated to registers r3 
;sloc0                     Allocated with name '_getsn_sloc0_1_0'
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:294: int getsn (char * buff, int len)
;	-----------------------------------------
;	 function getsn
;	-----------------------------------------
_getsn:
	mov	_getsn_buff_1_96,dpl
	mov	(_getsn_buff_1_96 + 1),dph
	mov	(_getsn_buff_1_96 + 2),b
;	D:\clone\LAB5\lab5v3.c:299: for(j=0; j<(len-1); j++)
	clr	a
	mov	_getsn_sloc0_1_0,a
	mov	(_getsn_sloc0_1_0 + 1),a
	mov	a,_getsn_PARM_2
	add	a,#0xff
	mov	r7,a
	mov	a,(_getsn_PARM_2 + 1)
	addc	a,#0xff
	mov	r0,a
	mov	r1,#0x00
	mov	r2,#0x00
L017005?:
	clr	c
	mov	a,r1
	subb	a,r7
	mov	a,r2
	xrl	a,#0x80
	mov	b,r0
	xrl	b,#0x80
	subb	a,b
	jnc	L017008?
;	D:\clone\LAB5\lab5v3.c:301: c=getchar();
	push	ar2
	push	ar7
	push	ar0
	push	ar1
	lcall	_getchar
	mov	r3,dpl
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar2
;	D:\clone\LAB5\lab5v3.c:302: if ( (c=='\n') || (c=='\r') )
	cjne	r3,#0x0A,L017015?
	sjmp	L017001?
L017015?:
	cjne	r3,#0x0D,L017002?
L017001?:
;	D:\clone\LAB5\lab5v3.c:304: buff[j]=0;
	mov	a,_getsn_sloc0_1_0
	add	a,_getsn_buff_1_96
	mov	r4,a
	mov	a,(_getsn_sloc0_1_0 + 1)
	addc	a,(_getsn_buff_1_96 + 1)
	mov	r5,a
	mov	r6,(_getsn_buff_1_96 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	clr	a
	lcall	__gptrput
;	D:\clone\LAB5\lab5v3.c:305: return j;
	mov	dpl,_getsn_sloc0_1_0
	mov	dph,(_getsn_sloc0_1_0 + 1)
	ret
L017002?:
;	D:\clone\LAB5\lab5v3.c:309: buff[j]=c;
	mov	a,r1
	add	a,_getsn_buff_1_96
	mov	r4,a
	mov	a,r2
	addc	a,(_getsn_buff_1_96 + 1)
	mov	r5,a
	mov	r6,(_getsn_buff_1_96 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r3
	lcall	__gptrput
;	D:\clone\LAB5\lab5v3.c:299: for(j=0; j<(len-1); j++)
	inc	r1
	cjne	r1,#0x00,L017018?
	inc	r2
L017018?:
	mov	_getsn_sloc0_1_0,r1
	mov	(_getsn_sloc0_1_0 + 1),r2
	sjmp	L017005?
L017008?:
;	D:\clone\LAB5\lab5v3.c:312: buff[j]=0;
	mov	a,_getsn_sloc0_1_0
	add	a,_getsn_buff_1_96
	mov	r2,a
	mov	a,(_getsn_sloc0_1_0 + 1)
	addc	a,(_getsn_buff_1_96 + 1)
	mov	r3,a
	mov	r4,(_getsn_buff_1_96 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
;	D:\clone\LAB5\lab5v3.c:313: return len;
	mov	dpl,_getsn_PARM_2
	mov	dph,(_getsn_PARM_2 + 1)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;num                       Allocated to registers r6 r7 
;num0                      Allocated to registers 
;num1                      Allocated with name '_main_num1_1_102'
;num2                      Allocated with name '_main_num2_1_102'
;period                    Allocated to registers r2 r3 r4 r5 
;mst                       Allocated with name '_main_mst_1_102'
;i                         Allocated with name '_main_i_1_102'
;vmax1                     Allocated with name '_main_vmax1_1_102'
;vmax2                     Allocated with name '_main_vmax2_1_102'
;phase_diff                Allocated to registers r2 r3 r4 r5 
;degrees                   Allocated with name '_main_degrees_1_102'
;p_n                       Allocated with name '_main_p_n_1_102'
;sloc0                     Allocated with name '_main_sloc0_1_0'
;v                         Allocated with name '_main_v_1_102'
;buff1                     Allocated with name '_main_buff1_1_102'
;buff2                     Allocated with name '_main_buff2_1_102'
;buff0                     Allocated with name '_main_buff0_1_102'
;------------------------------------------------------------
;	D:\clone\LAB5\lab5v3.c:317: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	D:\clone\LAB5\lab5v3.c:330: float mst = 0.0;
	mov	_main_mst_1_102,#0x00
	mov	(_main_mst_1_102 + 1),#0x00
	mov	(_main_mst_1_102 + 2),#0x00
	mov	(_main_mst_1_102 + 3),#0x00
;	D:\clone\LAB5\lab5v3.c:332: float vmax1=0.0;
	mov	_main_vmax1_1_102,#0x00
	mov	(_main_vmax1_1_102 + 1),#0x00
	mov	(_main_vmax1_1_102 + 2),#0x00
	mov	(_main_vmax1_1_102 + 3),#0x00
;	D:\clone\LAB5\lab5v3.c:333: float vmax2=0.0;
	mov	_main_vmax2_1_102,#0x00
	mov	(_main_vmax2_1_102 + 1),#0x00
	mov	(_main_vmax2_1_102 + 2),#0x00
	mov	(_main_vmax2_1_102 + 3),#0x00
;	D:\clone\LAB5\lab5v3.c:338: TIMER0_Init();
	lcall	_TIMER0_Init
;	D:\clone\LAB5\lab5v3.c:339: LCD_4BIT();
	lcall	_LCD_4BIT
;	D:\clone\LAB5\lab5v3.c:341: LCDprint("Enter passcode: ", 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_0
	mov	b,#0x80
	lcall	_LCDprint
;	D:\clone\LAB5\lab5v3.c:342: LCDprint("                ", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_1
	mov	b,#0x80
	lcall	_LCDprint
;	D:\clone\LAB5\lab5v3.c:344: while(state==0)
L018007?:
	mov	a,_state
	orl	a,(_state + 1)
	jz	L018114?
	ljmp	L018009?
L018114?:
;	D:\clone\LAB5\lab5v3.c:346: waitms(500); // Give PuTTY a chance to start.
	mov	dptr,#0x01F4
	lcall	_waitms
;	D:\clone\LAB5\lab5v3.c:347: printf("Type what you want to display in line 2 (16 char max): ");
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	D:\clone\LAB5\lab5v3.c:348: getsn(buff0, sizeof(buff0));
	mov	_getsn_PARM_2,#0x11
	clr	a
	mov	(_getsn_PARM_2 + 1),a
	mov	dptr,#_main_buff0_1_102
	mov	b,#0x40
	lcall	_getsn
;	D:\clone\LAB5\lab5v3.c:349: printf("\n");
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	D:\clone\LAB5\lab5v3.c:350: LCDprint(buff0, 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#_main_buff0_1_102
	mov	b,#0x40
	lcall	_LCDprint
;	D:\clone\LAB5\lab5v3.c:351: waitms(500); // Give PuTTY a chance to start.
	mov	dptr,#0x01F4
	lcall	_waitms
;	D:\clone\LAB5\lab5v3.c:352: num0=buff0[0]-'0';
	mov	r0,#_main_buff0_1_102
	mov	a,@r0
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	a,r6
	add	a,#0xd0
	mov	__mulint_PARM_2,a
	mov	a,r7
	addc	a,#0xff
	mov	(__mulint_PARM_2 + 1),a
;	D:\clone\LAB5\lab5v3.c:353: num1=buff0[1]-'0';
	mov	r0,#(_main_buff0_1_102 + 0x0001)
	mov	a,@r0
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	a,r6
	add	a,#0xd0
	mov	_main_num1_1_102,a
	mov	a,r7
	addc	a,#0xff
	mov	(_main_num1_1_102 + 1),a
;	D:\clone\LAB5\lab5v3.c:354: num2=buff0[2]-'0';
	mov	r0,#(_main_buff0_1_102 + 0x0002)
	mov	a,@r0
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	a,r6
	add	a,#0xd0
	mov	_main_num2_1_102,a
	mov	a,r7
	addc	a,#0xff
	mov	(_main_num2_1_102 + 1),a
;	D:\clone\LAB5\lab5v3.c:355: num=num0*100+num1*10+num2*1;
	mov	dptr,#0x0064
	lcall	__mulint
	mov	r6,dpl
	mov	r7,dph
	mov	__mulint_PARM_2,_main_num1_1_102
	mov	(__mulint_PARM_2 + 1),(_main_num1_1_102 + 1)
	mov	dptr,#0x000A
	push	ar6
	push	ar7
	lcall	__mulint
	mov	r2,dpl
	mov	r3,dph
	pop	ar7
	pop	ar6
	mov	a,r2
	add	a,r6
	mov	r6,a
	mov	a,r3
	addc	a,r7
	mov	r7,a
	mov	a,_main_num2_1_102
	add	a,r6
	mov	r6,a
	mov	a,(_main_num2_1_102 + 1)
	addc	a,r7
	mov	r7,a
;	D:\clone\LAB5\lab5v3.c:356: if(num==passcode)
	mov	a,r6
	cjne	a,_passcode,L018005?
	mov	a,r7
	cjne	a,(_passcode + 1),L018005?
;	D:\clone\LAB5\lab5v3.c:358: state= UNLOCK;
	mov	_state,#0x01
	clr	a
	mov	(_state + 1),a
;	D:\clone\LAB5\lab5v3.c:359: flag1=1;
	mov	_flag1,#0x01
	clr	a
	mov	(_flag1 + 1),a
;	D:\clone\LAB5\lab5v3.c:360: attempt=0;
	clr	a
	mov	_attempt,a
	mov	(_attempt + 1),a
	ljmp	L018007?
L018005?:
;	D:\clone\LAB5\lab5v3.c:364: LCDprint("Wrong Passcode", 1, 1); 
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_4
	mov	b,#0x80
	lcall	_LCDprint
;	D:\clone\LAB5\lab5v3.c:365: state= LOCK;  
	clr	a
	mov	_state,a
	mov	(_state + 1),a
;	D:\clone\LAB5\lab5v3.c:366: attempt++;
	inc	_attempt
	clr	a
	cjne	a,_attempt,L018117?
	inc	(_attempt + 1)
L018117?:
;	D:\clone\LAB5\lab5v3.c:367: if(attempt==3)
	mov	a,#0x03
	cjne	a,_attempt,L018118?
	clr	a
	cjne	a,(_attempt + 1),L018118?
	sjmp	L018119?
L018118?:
	sjmp	L018002?
L018119?:
;	D:\clone\LAB5\lab5v3.c:369: LCDprint("Attempts Over ", 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_5
	mov	b,#0x80
	lcall	_LCDprint
;	D:\clone\LAB5\lab5v3.c:370: LCDprint("System Hang", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_6
	mov	b,#0x80
	lcall	_LCDprint
;	D:\clone\LAB5\lab5v3.c:371: flag2=1;
	mov	_flag2,#0x01
	clr	a
	mov	(_flag2 + 1),a
;	D:\clone\LAB5\lab5v3.c:372: state= UNLOCK;
	mov	_state,#0x01
	clr	a
	mov	(_state + 1),a
	ljmp	L018007?
L018002?:
;	D:\clone\LAB5\lab5v3.c:376: LCDprint("Try Again", 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_7
	mov	b,#0x80
	lcall	_LCDprint
	ljmp	L018007?
L018009?:
;	D:\clone\LAB5\lab5v3.c:381: if(flag2==1) goto infinit;
	mov	a,#0x01
	cjne	a,_flag2,L018120?
	clr	a
	cjne	a,(_flag2 + 1),L018120?
	ljmp	L018065?
L018120?:
;	D:\clone\LAB5\lab5v3.c:386: waitms(500); // Give PuTTy a chance to start before sending
	mov	dptr,#0x01F4
	lcall	_waitms
;	D:\clone\LAB5\lab5v3.c:387: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	D:\clone\LAB5\lab5v3.c:392: __FILE__, __DATE__, __TIME__);
;	D:\clone\LAB5\lab5v3.c:391: "Compiled: %s, %s\n\n",
	mov	a,#__str_12
	push	acc
	mov	a,#(__str_12 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_9
	push	acc
	mov	a,#(__str_9 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
;	D:\clone\LAB5\lab5v3.c:394: InitPinADC(1, 4); // Configure P1.6 as analog input
	mov	_InitPinADC_PARM_2,#0x04
	mov	dpl,#0x01
	lcall	_InitPinADC
;	D:\clone\LAB5\lab5v3.c:395: InitPinADC(1, 5); // Configure P1.7 as analog input
	mov	_InitPinADC_PARM_2,#0x05
	mov	dpl,#0x01
	lcall	_InitPinADC
;	D:\clone\LAB5\lab5v3.c:397: InitADC();
	lcall	_InitADC
;	D:\clone\LAB5\lab5v3.c:400: while(flag1){
L018060?:
	mov	a,_flag1
	orl	a,(_flag1 + 1)
	jnz	L018121?
	ljmp	L018065?
L018121?:
;	D:\clone\LAB5\lab5v3.c:401: for (i = 0; i < 10; i++){
	clr	a
	mov	_main_i_1_102,a
	mov	(_main_i_1_102 + 1),a
L018067?:
	clr	c
	mov	a,_main_i_1_102
	subb	a,#0x0A
	mov	a,(_main_i_1_102 + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jc	L018122?
	ljmp	L018070?
L018122?:
;	D:\clone\LAB5\lab5v3.c:403: TL0=0; 
	mov	_TL0,#0x00
;	D:\clone\LAB5\lab5v3.c:404: TH0=0;
	mov	_TH0,#0x00
;	D:\clone\LAB5\lab5v3.c:405: TF0=0;
	clr	_TF0
;	D:\clone\LAB5\lab5v3.c:406: overflow_count=0;
	mov	_overflow_count,#0x00
;	D:\clone\LAB5\lab5v3.c:407: while(P0_1!=0); // Wait for the signal to be zero
L018014?:
	jb	_P0_1,L018014?
;	D:\clone\LAB5\lab5v3.c:408: while(P0_1!=1); // Wait for the signal to be one
L018017?:
	jnb	_P0_1,L018017?
;	D:\clone\LAB5\lab5v3.c:409: TR0=1; // Start the timer
	setb	_TR0
;	D:\clone\LAB5\lab5v3.c:410: while(P0_1!=0) // Wait for the signal to be zero
L018022?:
	jnb	_P0_1,L018027?
;	D:\clone\LAB5\lab5v3.c:412: if(TF0==1) // Did the 16-bit timer overflow?
;	D:\clone\LAB5\lab5v3.c:414: TF0=0;
	jbc	_TF0,L018126?
	sjmp	L018022?
L018126?:
;	D:\clone\LAB5\lab5v3.c:415: overflow_count++;
	inc	_overflow_count
;	D:\clone\LAB5\lab5v3.c:418: while(P0_1!=1) // Wait for the signal to be one
	sjmp	L018022?
L018027?:
	jb	_P0_1,L018029?
;	D:\clone\LAB5\lab5v3.c:420: if(TF0==1) // Did the 16-bit timer overflow?
;	D:\clone\LAB5\lab5v3.c:422: TF0=0;
	jbc	_TF0,L018128?
	sjmp	L018027?
L018128?:
;	D:\clone\LAB5\lab5v3.c:423: overflow_count++;
	inc	_overflow_count
	sjmp	L018027?
L018029?:
;	D:\clone\LAB5\lab5v3.c:426: TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	clr	_TR0
;	D:\clone\LAB5\lab5v3.c:427: period=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
	mov	dpl,_overflow_count
	lcall	___uchar2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xF4FC
	mov	b,#0x32
	mov	a,#0x34
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	D:\clone\LAB5\lab5v3.c:428: if (period > mst){
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	_main_mst_1_102
	push	(_main_mst_1_102 + 1)
	push	(_main_mst_1_102 + 2)
	push	(_main_mst_1_102 + 3)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jz	L018031?
;	D:\clone\LAB5\lab5v3.c:429: mst = period;
	mov	_main_mst_1_102,r2
	mov	(_main_mst_1_102 + 1),r3
	mov	(_main_mst_1_102 + 2),r4
	mov	(_main_mst_1_102 + 3),r5
L018031?:
;	D:\clone\LAB5\lab5v3.c:431: waitms(1);
	mov	dptr,#0x0001
	lcall	_waitms
;	D:\clone\LAB5\lab5v3.c:401: for (i = 0; i < 10; i++){
	inc	_main_i_1_102
	clr	a
	cjne	a,_main_i_1_102,L018130?
	inc	(_main_i_1_102 + 1)
L018130?:
	ljmp	L018067?
L018070?:
;	D:\clone\LAB5\lab5v3.c:433: for(i=0;i<20;i++){
	mov	r2,#0x00
	mov	r3,#0x00
L018071?:
	clr	c
	mov	a,r2
	subb	a,#0x14
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jc	L018131?
	ljmp	L018074?
L018131?:
;	D:\clone\LAB5\lab5v3.c:435: v[0] = Volts_at_Pin(QFP32_MUX_P1_4);
	mov	dpl,#0x0A
	push	ar2
	push	ar3
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	r0,#_main_v_1_102
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	D:\clone\LAB5\lab5v3.c:436: v[1] = Volts_at_Pin(QFP32_MUX_P1_5);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	r0,#(_main_v_1_102 + 0x0004)
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
;	D:\clone\LAB5\lab5v3.c:438: if(vmax1<v[0]){
	mov	r0,#_main_v_1_102
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,_main_vmax1_1_102
	mov	dph,(_main_vmax1_1_102 + 1)
	mov	b,(_main_vmax1_1_102 + 2)
	mov	a,(_main_vmax1_1_102 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	a,r4
	jz	L018033?
;	D:\clone\LAB5\lab5v3.c:439: vmax1=v[0];
	mov	r0,#_main_v_1_102
	mov	_main_vmax1_1_102,@r0
	inc	r0
	mov	(_main_vmax1_1_102 + 1),@r0
	inc	r0
	mov	(_main_vmax1_1_102 + 2),@r0
	inc	r0
	mov	(_main_vmax1_1_102 + 3),@r0
L018033?:
;	D:\clone\LAB5\lab5v3.c:441: if(vmax2<v[1]){
	mov	r0,#(_main_v_1_102 + 0x0004)
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,_main_vmax2_1_102
	mov	dph,(_main_vmax2_1_102 + 1)
	mov	b,(_main_vmax2_1_102 + 2)
	mov	a,(_main_vmax2_1_102 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	a,r4
	jz	L018035?
;	D:\clone\LAB5\lab5v3.c:442: vmax2=v[1];
	mov	r0,#(_main_v_1_102 + 0x0004)
	mov	_main_vmax2_1_102,@r0
	inc	r0
	mov	(_main_vmax2_1_102 + 1),@r0
	inc	r0
	mov	(_main_vmax2_1_102 + 2),@r0
	inc	r0
	mov	(_main_vmax2_1_102 + 3),@r0
L018035?:
;	D:\clone\LAB5\lab5v3.c:444: waitms(1); 
	mov	dptr,#0x0001
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	D:\clone\LAB5\lab5v3.c:433: for(i=0;i<20;i++){
	inc	r2
	cjne	r2,#0x00,L018134?
	inc	r3
L018134?:
	ljmp	L018071?
L018074?:
;	D:\clone\LAB5\lab5v3.c:446: printf("\nperiod=%3.2f\r",mst*1000);
	push	_main_mst_1_102
	push	(_main_mst_1_102 + 1)
	push	(_main_mst_1_102 + 2)
	push	(_main_mst_1_102 + 3)
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_13
	push	acc
	mov	a,#(__str_13 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	D:\clone\LAB5\lab5v3.c:447: printf ("\nV@P1_4=%7.5fV, V@P1_5=%7.5fV\r",vmax1, vmax2);
	push	_main_vmax2_1_102
	push	(_main_vmax2_1_102 + 1)
	push	(_main_vmax2_1_102 + 2)
	push	(_main_vmax2_1_102 + 3)
	push	_main_vmax1_1_102
	push	(_main_vmax1_1_102 + 1)
	push	(_main_vmax1_1_102 + 2)
	push	(_main_vmax1_1_102 + 3)
	mov	a,#__str_14
	push	acc
	mov	a,#(__str_14 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf5
	mov	sp,a
;	D:\clone\LAB5\lab5v3.c:449: while(Volts_at_Pin(QFP32_MUX_P1_4)<0.02&&Volts_at_Pin(QFP32_MUX_P1_5<0.02));
L018037?:
	mov	dpl,#0x0A
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,#0x0A
	push	acc
	mov	a,#0xD7
	push	acc
	mov	a,#0xA3
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L018039?
	mov	dpl,#0x00
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,r2
	orl	a,r3
	orl	a,r4
	mov	b,r5
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jnz	L018037?
L018039?:
;	D:\clone\LAB5\lab5v3.c:450: if(Volts_at_Pin(QFP32_MUX_P1_5)>0.02){
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,#0x0A
	push	acc
	mov	a,#0xD7
	push	acc
	mov	a,#0xA3
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L018041?
;	D:\clone\LAB5\lab5v3.c:451: p_n=1;
	mov	_main_p_n_1_102,#0x00
	mov	(_main_p_n_1_102 + 1),#0x00
	mov	(_main_p_n_1_102 + 2),#0x80
	mov	(_main_p_n_1_102 + 3),#0x3F
	sjmp	L018042?
L018041?:
;	D:\clone\LAB5\lab5v3.c:454: p_n=-1;
	mov	_main_p_n_1_102,#0x00
	mov	(_main_p_n_1_102 + 1),#0x00
	mov	(_main_p_n_1_102 + 2),#0x80
	mov	(_main_p_n_1_102 + 3),#0xBF
L018042?:
;	D:\clone\LAB5\lab5v3.c:456: waitms(1);
	mov	dptr,#0x0001
	lcall	_waitms
;	D:\clone\LAB5\lab5v3.c:462: TL0=0; TH0=0; TF0=0;overflow_count=0;
	mov	_TL0,#0x00
	mov	_TH0,#0x00
	clr	_TF0
	mov	_overflow_count,#0x00
;	D:\clone\LAB5\lab5v3.c:463: while(P0_1==1);
L018043?:
	jb	_P0_1,L018043?
;	D:\clone\LAB5\lab5v3.c:464: while(P0_1==0);
L018046?:
	jnb	_P0_1,L018046?
;	D:\clone\LAB5\lab5v3.c:465: while(P0_1==1){
L018055?:
	jnb	_P0_1,L018057?
;	D:\clone\LAB5\lab5v3.c:466: while(P0_2==0&&P0_1==1){
L018052?:
	jb	_P0_2,L018054?
	jnb	_P0_1,L018054?
;	D:\clone\LAB5\lab5v3.c:467: TR0=1;
	setb	_TR0
;	D:\clone\LAB5\lab5v3.c:468: if(TF0==1) // Did the 16-bit timer overflow?
;	D:\clone\LAB5\lab5v3.c:470: TF0=0;
	jbc	_TF0,L018143?
	sjmp	L018052?
L018143?:
;	D:\clone\LAB5\lab5v3.c:471: overflow_count++;
	inc	_overflow_count
	sjmp	L018052?
L018054?:
;	D:\clone\LAB5\lab5v3.c:475: TR0=0; 
	clr	_TR0
	sjmp	L018055?
L018057?:
;	D:\clone\LAB5\lab5v3.c:477: phase_diff=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
	mov	dpl,_overflow_count
	lcall	___uchar2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	lcall	___uchar2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xF4FC
	mov	b,#0x32
	mov	a,#0x34
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	D:\clone\LAB5\lab5v3.c:479: degrees = p_n*phase_diff*360/mst ;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_p_n_1_102
	mov	dph,(_main_p_n_1_102 + 1)
	mov	b,(_main_p_n_1_102 + 2)
	mov	a,(_main_p_n_1_102 + 3)
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0xB4
	mov	a,#0x43
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_mst_1_102
	push	(_main_mst_1_102 + 1)
	push	(_main_mst_1_102 + 2)
	push	(_main_mst_1_102 + 3)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_degrees_1_102,dpl
	mov	(_main_degrees_1_102 + 1),dph
	mov	(_main_degrees_1_102 + 2),b
	mov	(_main_degrees_1_102 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	D:\clone\LAB5\lab5v3.c:481: printf("\r\ndegrees: %f", degrees);
	push	_main_degrees_1_102
	push	(_main_degrees_1_102 + 1)
	push	(_main_degrees_1_102 + 2)
	push	(_main_degrees_1_102 + 3)
	mov	a,#__str_15
	push	acc
	mov	a,#(__str_15 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	D:\clone\LAB5\lab5v3.c:487: if (P2_6==0) {
	jnb	_P2_6,L018144?
	ljmp	L018059?
L018144?:
;	D:\clone\LAB5\lab5v3.c:488: sprintf(buff1,"vr:%04.2f f:%04.1fHz", (float)vmax1/1.14121356237,(float)1/mst);
	push	_main_mst_1_102
	push	(_main_mst_1_102 + 1)
	push	(_main_mst_1_102 + 2)
	push	(_main_mst_1_102 + 3)
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x3F
	lcall	___fsdiv
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x49
	push	acc
	mov	a,#0x13
	push	acc
	mov	a,#0x92
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_vmax1_1_102
	mov	dph,(_main_vmax1_1_102 + 1)
	mov	b,(_main_vmax1_1_102 + 2)
	mov	a,(_main_vmax1_1_102 + 3)
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	a,#__str_16
	push	acc
	mov	a,#(__str_16 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_buff1_1_102
	push	acc
	mov	a,#(_main_buff1_1_102 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
;	D:\clone\LAB5\lab5v3.c:489: LCDprint(buff1, 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#_main_buff1_1_102
	mov	b,#0x40
	lcall	_LCDprint
;	D:\clone\LAB5\lab5v3.c:491: sprintf(buff2,"vt:%04.2f ph:%4.1f", (float)vmax2/1.14121356237,(float)degrees);
	mov	a,#0x49
	push	acc
	mov	a,#0x13
	push	acc
	mov	a,#0x92
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_vmax2_1_102
	mov	dph,(_main_vmax2_1_102 + 1)
	mov	b,(_main_vmax2_1_102 + 2)
	mov	a,(_main_vmax2_1_102 + 3)
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_degrees_1_102
	push	(_main_degrees_1_102 + 1)
	push	(_main_degrees_1_102 + 2)
	push	(_main_degrees_1_102 + 3)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_17
	push	acc
	mov	a,#(__str_17 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_buff2_1_102
	push	acc
	mov	a,#(_main_buff2_1_102 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf2
	mov	sp,a
;	D:\clone\LAB5\lab5v3.c:492: LCDprint(buff2, 2, 1);       
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#_main_buff2_1_102
	mov	b,#0x40
	lcall	_LCDprint
L018059?:
;	D:\clone\LAB5\lab5v3.c:494: waitms(500); 
	mov	dptr,#0x01F4
	lcall	_waitms
	ljmp	L018060?
;	D:\clone\LAB5\lab5v3.c:497: infinit:while(1); 
L018065?:
	sjmp	L018065?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'Enter passcode: '
	db 0x00
__str_1:
	db '                '
	db 0x00
__str_2:
	db 'Type what you want to display in line 2 (16 char max): '
	db 0x00
__str_3:
	db 0x0A
	db 0x00
__str_4:
	db 'Wrong Passcode'
	db 0x00
__str_5:
	db 'Attempts Over '
	db 0x00
__str_6:
	db 'System Hang'
	db 0x00
__str_7:
	db 'Try Again'
	db 0x00
__str_8:
	db 0x1B
	db '[2J'
	db 0x00
__str_9:
	db 'ADC test program'
	db 0x0A
	db 'File: %s'
	db 0x0A
	db 'Compiled: %s, %s'
	db 0x0A
	db 0x0A
	db 0x00
__str_10:
	db 'D:'
	db 0x5C
	db 'clone'
	db 0x5C
	db 'LAB5'
	db 0x5C
	db 'lab5v3.c'
	db 0x00
__str_11:
	db 'Mar  7 2024'
	db 0x00
__str_12:
	db '15:27:24'
	db 0x00
__str_13:
	db 0x0A
	db 'period=%3.2f'
	db 0x0D
	db 0x00
__str_14:
	db 0x0A
	db 'V@P1_4=%7.5fV, V@P1_5=%7.5fV'
	db 0x0D
	db 0x00
__str_15:
	db 0x0D
	db 0x0A
	db 'degrees: %f'
	db 0x00
__str_16:
	db 'vr:%04.2f f:%04.1fHz'
	db 0x00
__str_17:
	db 'vt:%04.2f ph:%4.1f'
	db 0x00

	CSEG

end
