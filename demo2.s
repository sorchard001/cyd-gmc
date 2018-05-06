; demo tune arranged for CyD-based SN76489 player


	; music data helper macros
	include	"cyd_macros.s"


envelope_0	fcb 1,0

envelope_1	fcb 12,16,0
envelope_1b	fcb 15,14,13,12,0

envelope_2	fcb 10,11,12,13,14,0
envelope_2b	fcb 12,11,10,9,0

envelope_3	fcb 11,12,13,14,15,16,0
envelope_3b	equ *-1

envelope_4	fcb 16,0
envelope_4b	fcb 15,14,13,12,1,0
envelope_4c	fcb 15,14,13,12,11,0

envelope_5	fcb 13,0
envelope_5b	fcb 12,11,10,1,0


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

; kick
patch_4
	fcb	6
	fdb	envelope_4,envelope_4b
; snare
patch_5
	fcb	8
	fdb	envelope_4,envelope_4c
; hhat
patch_6
	fcb	2
	fdb	envelope_5,envelope_5b


; basic note length
n1	equ	6	; PAL
;n1	equ	7	; NTSC


tune0_c1

	fcb	setsoftwave,1

1	;fcb	silence,n1*16
	;_jump 1b

	_setpatch	1
1
	;fcb	setsofttp,-12
	;_call	p0
	;fcb	setsofttp,12
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

	_settp	0
	fcb	setsofttp,-12
	_call	p1
	_call	p2
	_call	p1
	_call	p3
	_call	p0
	fcb	setsofttp,12
	_call	p0
	fcb	setsofttp,0
	_call	p1
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

	_loop	8
	_silence	n1*16
	_next
1
	_loop	4
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
	_next

	_loop	8
	_silence	n1*16
	_next

	_jump 1b



m_kick	macro
	_setpatch	4
	_setport	1600
	fcb		a7,\1
	endm

m_snare	macro
	_setpatch	5
	_setport	200 ;128
	fcb		e8,5
    if (\1>5)
	_setport	16 ;32
	_setnote	e6,\1-5
    endif
	endm

m_hhat	macro
	_setpatch	6
	_setport	-100
	fcb		c9,\1
	endm



tune0_c3

1	;_silence	n1*16
	;_jump 1b

	_call	drum_1
	_call	drum_1b
	_call	drum_1
	_call	drum_1b

	_call	drum_2
	_call	drum_2
	_call	drum_2
	_call	drum_2
1
	_call	drum_3
	_jump 1b

drum_1
	m_kick	n1*6
	m_kick	n1*10

	m_kick	n1*6
	m_kick	n1*6
	m_snare	n1*4

	_return


drum_1b
	m_kick	n1*6
	m_kick	n1*10

	m_kick	n1*4
	m_kick	n1*2
	m_kick	n1*6
	m_snare	n1*4

	_return

drum_2
	m_kick	n1*4
	m_kick	n1*2
	m_kick	n1*6
	m_snare	n1*4

	m_kick	n1*4
	m_kick	n1*2
	m_snare	n1*4
	m_kick	n1*2
	m_snare	n1*4

	_return

drum_3
	m_kick	n1*2
	m_hhat	n1*2
	m_kick	n1*2
	m_kick	n1*2
	m_hhat	n1*2
	m_hhat	n1*2
	m_snare	n1*2
	m_hhat	n1*2

	m_kick	n1*2
	m_hhat	n1*2
	m_kick	n1*2
	m_snare	n1*2
	m_hhat	n1*2
	m_kick	n1*2
	m_snare	n1*2
	m_hhat	n1*2

	_return

