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
	FNROOT	_main
	global	main@F1084
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\kaVi_aBi\Desktop\New folder\embedded c\led5.c"
	line	5

;initializer for main@F1084
	retlw	01h
	retlw	02h
	retlw	04h
	retlw	08h
	retlw	010h
	retlw	020h
	retlw	040h
	retlw	080h
	global	_PORTB
_PORTB	set	6
	global	_TRISB
_TRISB	set	134
	file	"led24.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\kaVi_aBi\Desktop\New folder\embedded c\led5.c"
main@F1084:
       ds      8

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
	movlw low(__pdataBANK0+8)
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
	global	??_main
??_main:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@a
main@a:	; 8 bytes @ 0x0
	ds	8
	global	main@nu
main@nu:	; 2 bytes @ 0x8
	ds	2
	global	main@i
main@i:	; 2 bytes @ 0xA
	ds	2
	global	main@j
main@j:	; 2 bytes @ 0xC
	ds	2
;;Data sizes: Strings 0, constant 0, data 8, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4       4
;; BANK0           80     14      22
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
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
;; (0) _main                                                18    18      0     322
;;                                              0 COMMON     4     4      0
;;                                              0 BANK0     14    14      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
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
;;DATA                 0      0      1A      12        0.0%
;;ABS                  0      0      1A       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       0       2        0.0%
;;BANK0               50      E      16       5       27.5%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      4       4       1       28.6%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 3 in file "C:\Users\kaVi_aBi\Desktop\New folder\embedded c\led5.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               8    0[BANK0 ] unsigned char [8]
;;  j               2   12[BANK0 ] int 
;;  i               2   10[BANK0 ] int 
;;  nu              2    8[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  2  684[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      14       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4      14       0       0       0
;;Total ram usage:       18 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\kaVi_aBi\Desktop\New folder\embedded c\led5.c"
	line	3
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	4
	
l1889:	
;led5.c: 4: TRISB = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	5
	
l1891:	
;led5.c: 5: char a[] = {0X01,0X02,0X04,0X08,0X10,0X20,0X40,0X80};
	movlw	(main@a)&0ffh
	movwf	fsr0
	movlw	low(main@F1084)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	8
	movwf	((??_main+0)+0+2)
u2230:
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
	goto	u2230
	line	6
	
l1893:	
;led5.c: 6: int i,j,nu=0XFF;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@nu)
	movlw	high(0FFh)
	movwf	((main@nu))+1
	goto	l1895
	line	7
;led5.c: 7: while(1)
	
l687:	
	line	9
	
l1895:	
;led5.c: 8: {
;led5.c: 9: nu=0XFF;
	movlw	low(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@nu)
	movlw	high(0FFh)
	movwf	((main@nu))+1
	line	10
	
l1897:	
;led5.c: 10: PORTB = 0XFF;
	movlw	(0FFh)
	movwf	(6)	;volatile
	line	11
	
l1899:	
;led5.c: 11: for(j=-30000; j<=30000; j++);
	movlw	low(-30000)
	movwf	(main@j)
	movlw	high(-30000)
	movwf	((main@j))+1
	
l1901:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07531h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2245
	movlw	low(07531h)
	subwf	(main@j),w
u2245:

	skipc
	goto	u2241
	goto	u2240
u2241:
	goto	l1905
u2240:
	goto	l1909
	
l1903:	
	goto	l1909
	
l688:	
	
l1905:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l1907:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07531h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2255
	movlw	low(07531h)
	subwf	(main@j),w
u2255:

	skipc
	goto	u2251
	goto	u2250
u2251:
	goto	l1905
u2250:
	goto	l1909
	
l689:	
	line	12
	
l1909:	
;led5.c: 12: for(i=0; i<4; i++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@i)
	clrf	(main@i+1)
	
l1911:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2265
	movlw	low(04h)
	subwf	(main@i),w
u2265:

	skipc
	goto	u2261
	goto	u2260
u2261:
	goto	l1915
u2260:
	goto	l1933
	
l1913:	
	goto	l1933
	line	13
	
l690:	
	line	14
	
l1915:	
;led5.c: 13: {
;led5.c: 14: nu=nu-(a[i]+a[8-(i+1)]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	addlw	01h
	xorlw	0ffh
	addlw	1
	addlw	08h
	addlw	main@a&0ffh
	movwf	fsr
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_main+0)+0
	movf	(main@i),w
	addlw	main@a&0ffh
	movwf	fsr0
	movf	indf,w
	addwf	(??_main+0)+0,w
	movwf	(??_main+1)+0
	clrf	(??_main+1)+0+1
	rlf	1+(??_main+1)+0,f
	
	comf	(??_main+1)+0,f
	comf	(??_main+1)+1,f
	incf	(??_main+1)+0,f
	skipnz
	incf	(??_main+1)+1,f
	movf	(main@nu),w
	addwf	0+(??_main+1)+0,w
	movwf	(main@nu)
	movf	(main@nu+1),w
	skipnc
	incf	(main@nu+1),w
	addwf	1+(??_main+1)+0,w
	movwf	1+(main@nu)
	line	15
	
l1917:	
;led5.c: 15: PORTB = nu;
	movf	(main@nu),w
	movwf	(6)	;volatile
	line	16
	
l1919:	
;led5.c: 16: for(j=-30000; j<=30000; j++);
	movlw	low(-30000)
	movwf	(main@j)
	movlw	high(-30000)
	movwf	((main@j))+1
	
l1921:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07531h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2275
	movlw	low(07531h)
	subwf	(main@j),w
u2275:

	skipc
	goto	u2271
	goto	u2270
u2271:
	goto	l1925
u2270:
	goto	l1929
	
l1923:	
	goto	l1929
	
l692:	
	
l1925:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l1927:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07531h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2285
	movlw	low(07531h)
	subwf	(main@j),w
u2285:

	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l1925
u2280:
	goto	l1929
	
l693:	
	line	12
	
l1929:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1931:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(04h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2295
	movlw	low(04h)
	subwf	(main@i),w
u2295:

	skipc
	goto	u2291
	goto	u2290
u2291:
	goto	l1915
u2290:
	goto	l1933
	
l691:	
	line	18
	
l1933:	
;led5.c: 17: }
;led5.c: 18: PORTB=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	19
	
l1935:	
;led5.c: 19: for(j=-30000; j<=30000; j++);
	movlw	low(-30000)
	movwf	(main@j)
	movlw	high(-30000)
	movwf	((main@j))+1
	
l1937:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07531h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2305
	movlw	low(07531h)
	subwf	(main@j),w
u2305:

	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l1941
u2300:
	goto	l1895
	
l1939:	
	goto	l1895
	
l694:	
	
l1941:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l1943:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07531h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2315
	movlw	low(07531h)
	subwf	(main@j),w
u2315:

	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l1941
u2310:
	goto	l1895
	
l695:	
	goto	l1895
	line	20
	
l696:	
	line	7
	goto	l1895
	
l697:	
	line	21
	
l698:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
psect	maintext
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
