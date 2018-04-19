; demo tune arranged for CyD-based SN76489 player


	; music data helper macros
	include	"cyd_macros.s"


envelope_0	fcb 1,0

envelope_1	fcb 12,16,0
envelope_1b	fcb 15,14,13,12,0

envelope_2	fcb 10,11,12,13,0
envelope_2b	fcb 12,11,10,9,0

envelope_3	fcb 11,12,13,14,15,16,0
envelope_3b	equ *-1

patch_table

patch_0
	fcb	1
	fdb	envelope_0,envelope_0
patch_1
	fcb	10
	fdb	envelope_1,envelope_1b
patch_2
	fcb	6
	fdb	envelope_2,envelope_2b
patch_3
	fcb	6
	fdb	envelope_3,envelope_3b

; basic note length
n1	equ	6	; PAL
;n1	equ	7	; NTSC


tune0_c1

1	;fcb	silence,n1*16
	;_jump 1b

	_setpatch	1
1
	;_call	p0
	;_call	p1
	;_jump	1b

	_settp	0
	fcb	setsofttp,-12
	_call	p1
	fcb	setsofttp,12
	_call	p2
	fcb	setsofttp,-12
	_call	p1
	fcb	setsofttp,0
	_call	p3

	_settp	12
	fcb	setsofttp,-12
	_call	p1
	fcb	setsofttp,12
	_call	p2
	fcb	setsofttp,-12
	_call	p1
	fcb	setsofttp,0
	_call	p3

	_jump 1b

p0
	fcb	e3,n1*4
	fcb	e3,n1*2
	fcb	e3,n1*2
	fcb	e3,n1*2
	fcb	e3,n1*2
	fcb	e4,n1*2
	fcb	e3,n1*2
	_return

p1
	fcb	b2,n1*4
	fcb	b2,n1*2
	fcb	b2,n1*2
	fcb	b2,n1*2
	fcb	b2,n1*2
	fcb	c3,n1*2
	fcb	b2,n1*2
	_return

p2
	fcb	b2,n1*4
	fcb	b2,n1*2
	fcb	b2,n1*2
	fcb	b2,n1*2
	fcb	c3,n1*2
	fcb	d3,n1*2
	fcb	b2,n1*2
	_return

p3
	fcb	b2,n1*4
	fcb	b2,n1*2
	fcb	b2,n1*2
	fcb	c3,n1*2
	fcb	b2,n1*2
	fcb	e3,n1*2
	fcb	b2,n1*2
	_return



tune0_c2

1	;fcb	silence,n1*16
	;_jump 1b

	_setpatch	2

1	;_call	p1
	;_jump	1b

	_loop	8
	_silence	n1*16
	_next
1
	fcb	e6,n1*2
	fcb	b5,n1*2
	fcb	b5,n1*2
	fcb	d6,n1*2
	fcb	b5,n1*2
	fcb	b5,n1*2
	fcb	c6,n1*2
	fcb	b5,n1*2

	fcb	e6,n1*2
	fcb	b5,n1*2
	fcb	b5,n1*2
	fcb	d6,n1*2
	fcb	b5,n1*2
	fcb	b5,n1*2
	fcb	a5,n1*2
	fcb	c6,n1*2

	fcb	e6,n1*2
	fcb	b5,n1*2
	fcb	b5,n1*2
	fcb	d6,n1*2
	fcb	b5,n1*2
	fcb	b5,n1*2
	fcb	c6,n1*2
	fcb	b5,n1*2

	fcb	e6,n1*2
	fcb	b5,n1*2
	fcb	b5,n1*2
	fcb	c6,n1*2
	fcb	b5,n1*2
	fcb	a5,n1*2
	fcb	b5,n1*2
	fcb	d6,n1*2


	_jump 1b



tune0_c3

1	_silence	n1*16
	_jump 1b

