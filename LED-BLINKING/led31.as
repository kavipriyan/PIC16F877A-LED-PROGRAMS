opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 3 "C:\Users\kaVi_aBi\Desktop\New folder\embedded c\led999.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "C:\Users\kaVi_aBi\Desktop\New folder\embedded c\led999.c"
	dw 0xFFFE & 0xFFFB & 0xFFFF & 0xFFFF & 0xFF7F ;#
	FNCALL	_main,_delay
	FNROOT	_main
	global	main@F1093
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\kaVi_aBi\Desktop\New folder\embedded c\led999.c"
	line	16

;initializer for main@F1093
	retlw	0FCh
	retlw	060h
	retlw	0DAh
	retlw	0F2h
	retlw	066h
	retlw	0B6h
	retlw	0BEh
	retlw	0E0h
	retlw	0FEh
	retlw	0E6h
	global	_PORTD
_PORTD	set	8
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_TRISD
_TRISD	set	136
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISC1
_TRISC1	set	1081
	global	_TRISC2
_TRISC2	set	1082
	file	"led31.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\kaVi_aBi\Desktop\New folder\embedded c\led999.c"
main@F1093:
       ds      10

global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+10)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_delay
??_delay:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	delay@j
delay@j:	; 2 bytes @ 0x0
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@a
main@a:	; 10 bytes @ 0x0
	ds	10
	global	main@l
main@l:	; 2 bytes @ 0xA
	ds	2
	global	main@i
main@i:	; 2 bytes @ 0xC
	ds	2
	global	main@j
main@j:	; 2 bytes @ 0xE
	ds	2
	global	main@k
main@k:	; 2 bytes @ 0x10
	ds	2
;;Data sizes: Strings 0, constant 0, data 10, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6       6
;; BANK0           80     18      28
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_delay
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                22    22      0     366
;;                                              2 COMMON     4     4      0
;;                                              0 BANK0     18    18      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                2     2      0      46
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      23      12        0.0%
;;ABS                  0      0      22       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50     12      1C       5       35.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      6       6       1       42.9%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 10 in file "C:\Users\kaVi_aBi\Desktop\New folder\embedded c\led999.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a              10    0[BANK0 ] unsigned char [10]
;;  k               2   16[BANK0 ] int 
;;  j               2   14[BANK0 ] int 
;;  i               2   12[BANK0 ] int 
;;  l               2   10[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  2  686[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      18       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4      18       0       0       0
;;Total ram usage:       22 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\kaVi_aBi\Desktop\New folder\embedded c\led999.c"
	line	10
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	11
	
l1932:	
;led999.c: 11: TRISD=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	12
	
l1934:	
;led999.c: 12: TRISC0=0;
	bcf	(1080/8)^080h,(1080)&7
	line	13
	
l1936:	
;led999.c: 13: TRISC1=0;
	bcf	(1081/8)^080h,(1081)&7
	line	14
	
l1938:	
;led999.c: 14: TRISC2=0;
	bcf	(1082/8)^080h,(1082)&7
	line	16
	
l1940:	
;led999.c: 15: int i,j,k,l;
;led999.c: 16: char a[] = {0XFC,0X60,0XDA,0XF2,0X66,0XB6,0XBE,0XE0,0XFE,0XE6};
	movlw	(main@a)&0ffh
	movwf	fsr0
	movlw	low(main@F1093)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	10
	movwf	((??_main+0)+0+2)
u2270:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2270
	goto	l1942
	line	17
;led999.c: 17: while(1)
	
l689:	
	line	19
	
l1942:	
;led999.c: 18: {
;led999.c: 19: for(i=0; i<10;i++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@i)
	clrf	(main@i+1)
	
l1944:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2285
	movlw	low(0Ah)
	subwf	(main@i),w
u2285:

	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l1948
u2280:
	goto	l1942
	
l1946:	
	goto	l1942
	line	20
	
l690:	
	
l1948:	
;led999.c: 20: for(j=0; j<10; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@j)
	clrf	(main@j+1)
	
l1950:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2295
	movlw	low(0Ah)
	subwf	(main@j),w
u2295:

	skipc
	goto	u2291
	goto	u2290
u2291:
	goto	l1954
u2290:
	goto	l2000
	
l1952:	
	goto	l2000
	line	21
	
l692:	
	
l1954:	
;led999.c: 21: for(k=0; k<=10; k++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@k)
	clrf	(main@k+1)
	
l1956:	
	movf	(main@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Bh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2305
	movlw	low(0Bh)
	subwf	(main@k),w
u2305:

	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l1960
u2300:
	goto	l1996
	
l1958:	
	goto	l1996
	line	22
	
l694:	
	
l1960:	
;led999.c: 22: for(l=0; l<10; l++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@l)
	clrf	(main@l+1)
	
l1962:	
	movf	(main@l+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2315
	movlw	low(0Ah)
	subwf	(main@l),w
u2315:

	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l696
u2310:
	goto	l1992
	
l1964:	
	goto	l1992
	line	23
	
l696:	
	line	24
;led999.c: 23: {
;led999.c: 24: RC0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	25
;led999.c: 25: RC1=0;
	bcf	(57/8),(57)&7
	line	26
;led999.c: 26: RC2=0;
	bcf	(58/8),(58)&7
	line	27
	
l1966:	
;led999.c: 27: PORTD=a[k];
	movf	(main@k),w
	addlw	main@a&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	line	28
	
l1968:	
;led999.c: 28: delay();
	fcall	_delay
	line	29
	
l1970:	
;led999.c: 29: RC0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	30
	
l1972:	
;led999.c: 30: RC1=1;
	bsf	(57/8),(57)&7
	line	31
	
l1974:	
;led999.c: 31: RC2=0;
	bcf	(58/8),(58)&7
	line	32
	
l1976:	
;led999.c: 32: PORTD=a[j];
	movf	(main@j),w
	addlw	main@a&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	line	33
;led999.c: 33: delay();
	fcall	_delay
	line	34
	
l1978:	
;led999.c: 34: RC0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	35
	
l1980:	
;led999.c: 35: RC1=0;
	bcf	(57/8),(57)&7
	line	36
	
l1982:	
;led999.c: 36: RC2=1;
	bsf	(58/8),(58)&7
	line	37
	
l1984:	
;led999.c: 37: PORTD=a[i];
	movf	(main@i),w
	addlw	main@a&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	line	38
	
l1986:	
;led999.c: 38: delay();
	fcall	_delay
	line	22
	
l1988:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@l),f
	skipnc
	incf	(main@l+1),f
	movlw	high(01h)
	addwf	(main@l+1),f
	
l1990:	
	movf	(main@l+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2325
	movlw	low(0Ah)
	subwf	(main@l),w
u2325:

	skipc
	goto	u2321
	goto	u2320
u2321:
	goto	l696
u2320:
	goto	l1992
	
l697:	
	line	21
	
l1992:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@k),f
	skipnc
	incf	(main@k+1),f
	movlw	high(01h)
	addwf	(main@k+1),f
	
l1994:	
	movf	(main@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Bh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2335
	movlw	low(0Bh)
	subwf	(main@k),w
u2335:

	skipc
	goto	u2331
	goto	u2330
u2331:
	goto	l1960
u2330:
	goto	l1996
	
l695:	
	line	20
	
l1996:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l1998:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2345
	movlw	low(0Ah)
	subwf	(main@j),w
u2345:

	skipc
	goto	u2341
	goto	u2340
u2341:
	goto	l1954
u2340:
	goto	l2000
	
l693:	
	line	19
	
l2000:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2002:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2355
	movlw	low(0Ah)
	subwf	(main@i),w
u2355:

	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l1948
u2350:
	goto	l1942
	
l691:	
	goto	l1942
	line	40
	
l698:	
	line	17
	goto	l1942
	
l699:	
	line	41
	
l700:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_delay
psect	text73,local,class=CODE,delta=2
global __ptext73
__ptext73:

;; *************** function _delay *****************
;; Defined at:
;;		line 43 in file "C:\Users\kaVi_aBi\Desktop\New folder\embedded c\led999.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               2    0[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text73
	file	"C:\Users\kaVi_aBi\Desktop\New folder\embedded c\led999.c"
	line	43
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg+btemp+1]
	line	44
	
l1922:	
;led999.c: 44: for(int j=-1000; j<1000; j++);
	movlw	low(-1000)
	movwf	(delay@j)
	movlw	high(-1000)
	movwf	((delay@j))+1
	
l1924:	
	movf	(delay@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03E8h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2255
	movlw	low(03E8h)
	subwf	(delay@j),w
u2255:

	skipc
	goto	u2251
	goto	u2250
u2251:
	goto	l1928
u2250:
	goto	l705
	
l1926:	
	goto	l705
	
l703:	
	
l1928:	
	movlw	low(01h)
	addwf	(delay@j),f
	skipnc
	incf	(delay@j+1),f
	movlw	high(01h)
	addwf	(delay@j+1),f
	
l1930:	
	movf	(delay@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03E8h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2265
	movlw	low(03E8h)
	subwf	(delay@j),w
u2265:

	skipc
	goto	u2261
	goto	u2260
u2261:
	goto	l1928
u2260:
	goto	l705
	
l704:	
	line	45
	
l705:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,88
psect	text74,local,class=CODE,delta=2
global __ptext74
__ptext74:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
