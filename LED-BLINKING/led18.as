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
	global	main@F1087
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\kaVi_aBi\Desktop\New folder\embedded c\msbfix1.c"
	line	6

;initializer for main@F1087
	retlw	080h
	retlw	040h
	retlw	020h
	retlw	010h
	retlw	08h
	retlw	04h
	retlw	02h
	retlw	01h
	global	_PORTB
_PORTB	set	6
	global	_TRISB
_TRISB	set	134
	file	"led18.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\kaVi_aBi\Desktop\New folder\embedded c\msbfix1.c"
main@F1087:
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
	global	main@j
main@j:	; 2 bytes @ 0x8
	ds	2
	global	main@num
main@num:	; 2 bytes @ 0xA
	ds	2
	global	main@i
main@i:	; 2 bytes @ 0xC
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
;; (0) _main                                                18    18      0     184
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
;;		line 3 in file "C:\Users\kaVi_aBi\Desktop\New folder\embedded c\msbfix1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               8    0[BANK0 ] unsigned char [8]
;;  i               2   12[BANK0 ] int 
;;  num             2   10[BANK0 ] int 
;;  j               2    8[BANK0 ] int 
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
	file	"C:\Users\kaVi_aBi\Desktop\New folder\embedded c\msbfix1.c"
	line	3
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	4
	
l1859:	
;msbfix1.c: 4: int i,j,num=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@num)
	clrf	(main@num+1)
	line	5
;msbfix1.c: 5: TRISB = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	6
	
l1861:	
;msbfix1.c: 6: char a[] = {0X80,0X40,0X20,0X10,0X08,0X04,0X02,0X01};
	movlw	(main@a)&0ffh
	movwf	fsr0
	movlw	low(main@F1087)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	8
	movwf	((??_main+0)+0+2)
u2190:
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
	goto	u2190
	line	7
	
l1863:	
;msbfix1.c: 7: for(i=0; i<8; i++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@i)
	clrf	(main@i+1)
	
l1865:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2205
	movlw	low(08h)
	subwf	(main@i),w
u2205:

	skipc
	goto	u2201
	goto	u2200
u2201:
	goto	l1869
u2200:
	goto	l1887
	
l1867:	
	goto	l1887
	line	8
	
l687:	
	line	9
	
l1869:	
;msbfix1.c: 8: {
;msbfix1.c: 9: num=num+a[i];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	addlw	main@a&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	addwf	(main@num),w
	movwf	(main@num)
	movf	(main@num+1),w
	skipnc
	incf	(main@num+1),w
	movwf	((main@num))+1
	line	10
	
l1871:	
;msbfix1.c: 10: PORTB=num;
	movf	(main@num),w
	movwf	(6)	;volatile
	line	11
	
l1873:	
;msbfix1.c: 11: for(j=-30000; j<=30000; j++);
	movlw	low(-30000)
	movwf	(main@j)
	movlw	high(-30000)
	movwf	((main@j))+1
	
l1875:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07531h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2215
	movlw	low(07531h)
	subwf	(main@j),w
u2215:

	skipc
	goto	u2211
	goto	u2210
u2211:
	goto	l1879
u2210:
	goto	l1883
	
l1877:	
	goto	l1883
	
l689:	
	
l1879:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l1881:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07531h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2225
	movlw	low(07531h)
	subwf	(main@j),w
u2225:

	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l1879
u2220:
	goto	l1883
	
l690:	
	line	7
	
l1883:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1885:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2235
	movlw	low(08h)
	subwf	(main@i),w
u2235:

	skipc
	goto	u2231
	goto	u2230
u2231:
	goto	l1869
u2230:
	goto	l1887
	
l688:	
	line	13
	
l1887:	
;msbfix1.c: 12: }
;msbfix1.c: 13: PORTB=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	goto	l692
	line	14
;msbfix1.c: 14: while(1);
	
l691:	
	
l692:	
	goto	l692
	
l693:	
	line	15
	
l694:	
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
