; demo tune arranged for CyD-based SN76489 player


	; music data helper macros
	include	"cyd_macros.s"



envelope_1	fcb 12,16,0
envelope_1b	fcb 15,14,13,12,0

envelope_2	fcb 14,0
envelope_2b	equ *-1

envelope_3	fcb 16,0
envelope_3b	fcb 15,14,13,12,1,0
envelope_3c	fcb 15,14,13,12,11,0

envelope_4	fcb 12,0
envelope_4b	fcb 11,10,1,0

envelope_0	equ *-2

envelope_5	fcb 12,13,14,15,0
envelope_5b	fcb 14,12,10,9,0

envelope_6	fcb 13,0

patch_table

patch_0
	fcb	1
	fdb	envelope_0,envelope_0
patch_1
	fcb	6
	fdb	envelope_1,envelope_1b
patch_2
	fcb	10
	fdb	envelope_1,envelope_1b
patch_3
	fcb	4
	fdb	envelope_2,envelope_2b

; kick
patch_4
	fcb	6
	fdb	envelope_3,envelope_3b
; snare
patch_5
	fcb	6
	fdb	envelope_3,envelope_3c
; hhat
patch_6
	fcb	2
	fdb	envelope_4,envelope_4b

patch_7
	fcb	6
	fdb	envelope_5,envelope_5b
patch_8
	fcb	3
	fdb	envelope_1,envelope_2
patch_9
	fcb	6
	fdb	envelope_5,envelope_6

; basic note length
n1	equ	6	; PAL
;n1	equ	7	; NTSC


tune0_c1

1	;fcb	silence,n1*16
	;_jump 1b

	_setpatch	1

1	fcb	b2,n1*8

	_jump 1b


tune0_c2

1	fcb	silence,n1*16
	_jump 1b




tune0_c3

1	_silence	n1*16
	_jump 1b

