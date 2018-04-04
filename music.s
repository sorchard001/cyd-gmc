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

	_settp	4

	_setpatch	9
	fcb	silence,n1*2
	_call	lead_2b
	_call	lead_2
	_call	lead_2b
	_call	lead_2
	;_jump 1b
2
	_setpatch	1
	_setport	12

	_call 	bass_2dly
	_call 	bass_2
	_call 	bass_2
	_call 	bass_2

1
	_loop	4
	_call 	bass_1
	_next

	_loop	4
	_call 	bass_2
	_next

	_jump 1b



bass_1
	fcb	a2,n1*2
	fcb	a2,n1
	fcb	a2,n1
	fcb	a2,n1*2
	fcb	a2,n1*2
	fcb	a2,n1
	fcb	a2,n1
	fcb	a2,n1*2
	fcb	g2,n1*2
	fcb	a2,n1*2

	fcb	a2,n1*2
	fcb	a2,n1
	fcb	a2,n1
	fcb	a2,n1*2
	fcb	a2,n1*2
	fcb	c3,n1*2
	fcb	b2,n1*2
	fcb	g2,n1
	fcb	a2,n1
	fcb	a2,n1*2

	_return

bass_2
	fcb	a2,n1*2
bass_2dly
	fcb	g2,n1
	fcb	a2,n1*2
	fcb	a2,n1*1
	fcb	e3,n1*2
	fcb	g2,n1
	fcb	a2,n1
	fcb	a2,n1*2
	fcb	e3,n1*2
	fcb	g2,n1*2

	fcb	a2,n1*2
	fcb	g2,n1
	fcb	a2,n1*2
	fcb	a2,n1*1
	fcb	g2,n1*2
	fcb	c3,n1*2
	fcb	b2,n1*2
	fcb	a2,n1
	fcb	g2,n1
	fcb	a2,n1*2

	_return


tune0_c2

1	;fcb	silence,n1*16
	;_jump 1b

	_settp	4
	_setpatch 8
	_call	lead_2b
	_call	lead_2
	_call	lead_2b
	_call	lead_2

	_setpatch 3
	_loop	4
	_call	bass_2
	_next

1
	_setpatch 2
	_loop	4
	_call	lead_main
	_next

	_setpatch 3
	_loop	4
	_call	lead_drone
	_next

	_setpatch 2
	_settp	4-12
	_loop	4
	_call	lead_main
	_next

	_settp	4

	_setpatch 3
	_loop	4
	_call	lead_drone
	_next

	_setpatch 8
	_call	lead_2b
	_call	lead_2
	_call	lead_2b
	_call	lead_2

	_setpatch 7
	_loop	4
	_call	lead_arp
	_next
	_clrarp

	_jump 1b


lead_main
	fcb	a4,n1*3
	fcb	a4,n1*3
	fcb	a4,n1*3
	fcb	a4,n1*3
	fcb	g4,n1*2
	fcb	a4,n1*2

	fcb	e4,n1*2
	fcb	e4,n1
	fcb	e4,n1
	fcb	e4,n1*2
	fcb	g4,n1*2
	fcb	c5,n1
	fcb	g4,n1
	fcb	c5,n1*2
	fcb	e4,n1*2
	fcb	g4,n1*2

	_return


arp1	fcb	3,7,0
arp2	fcb	2,7,0
arp3	fcb	5,7,0
arp4	fcb	4,9,0
arp5	fcb	5,9,0

lead_arp
	_setarp		1,arp1
	fcb		a4,n1*2
	_setarp		2,arp2
	fcb		a4,n1*1
	_setarp		1,arp1
	fcb		a4,n1*2
	fcb		a4,n1*1

	fcb		a4,n1*2
	_setarp		2,arp3
	fcb		a4,n1*1
	fcb		a4,n1*3

	_setarp		2,arp2
	fcb		a4,n1*1
	fcb		a4,n1*3


	_setarp		1,arp4
	fcb		g4,n1*2
	fcb		g4,n1*1
	fcb		g4,n1*2
	fcb		g4,n1*1

	_setarp		2,arp5
	fcb		g4,n1*2
	fcb		g4,n1*1
	fcb		g4,n1*3

	_setarp		2,arp2
	fcb		a4,n1*1
	fcb		a4,n1*3

	_return



lead_2
	fcb		g4,n1*2
	_portamento	g4,f_g4,f_a4,n1*3

	_setnote	a4,n1*1 ;5
	_setport	-20
	_rest		n1
	_setport	40
	_rest		n1
	_setport	-40
	_rest		n1
	_setport	20
	_rest		n1
	_setport	0

	fcb		a4,n1*2
	fcb		c5,n1*1
	fcb		a4,n1*1
	fcb		d4,n1*2

	fcb		e4,n1*2
	fcb		d4,n1*1
	fcb		c5,n1*1
	fcb		a4,n1*1
	fcb		c5,n1*1
	fcb		e4,n1*1
	fcb		d4,n1*1
	_portamento	e4,f_e4,f_e3,n1*2

	fcb		b3,n1*2
	fcb		e4,n1*2
	fcb		g4,n1*2

	_return

lead_2b
	fcb		g4,n1*2
	_portamento	g4,f_g4,f_a4,n1*3
	_setnote	a4,n1*1 ;5
	_setport	-20
	_rest		n1
	_setport	40
	_rest		n1
	_setport	-40
	_rest		n1
	_setport	20
	_rest		n1
	_setport	0

	fcb		a4,n1*2
	fcb		c5,n1*2
	fcb		d4,n1*2

	fcb		e4,n1*1 ;4
	_setport	-15
	_rest		n1
	_setport	30
	_rest		n1
	_setport	-15
	_rest		n1
	_setport	0


	_portamento	b4,f_b4,f_c5,n1*4
	fcb		g4,n1*2
	_setnote	b3,n1*2
	fcb		e4,n1*2
	fcb		g4,n1*2

	_return



lead_drone
	fcb	a1,n1*16
	fcb	a1,n1*16
	_return



m_kick	macro
	_setpatch	4
	_setport	1600
	fcb		a7,\1
	endm

m_snare	macro
	_setpatch	5
	_setport	200 ;128
	fcb		c8,5
    if (\1>5)
	_setport	16 ;32
	_setnote	c7,\1-5
    endif
	endm

m_hhat	macro
	_setpatch	6
	_setport	-100
	fcb		c9,\1
	endm



tune0_c3

	_silence	n1*16
	_silence	n1*16
	_silence	n1*16
	_call	drum_0
1
	;_silence	n1*16
	;_jump 1b

	_call	drum_1
	_call	drum_1
	_call	drum_1
	_call	drum_3

	_call	drum_1
	_call	drum_1
	_call	drum_1
	_call	drum_2

	_jump 1b


drum_0
	m_snare	n1*3
	m_snare	n1*3
	m_snare	n1*4
	m_snare	n1*2
	m_snare	n1*1
	m_snare	n1*2
	m_snare	n1*1

	_return


drum_1
	m_kick	n1*2
	m_hhat	n1
	m_hhat	n1
	m_snare	n1*2
	m_hhat	n1
	m_hhat	n1

	m_kick	n1*2
	m_kick	n1
	m_hhat	n1
	m_snare	n1*2
	m_hhat	n1
	m_hhat	n1

	_return

drum_2
	m_kick	n1*2
	m_hhat	n1
	m_hhat	n1
	m_snare	n1*2
	m_hhat	n1
	m_hhat	n1

	m_kick	n1*2
	m_snare	n1*1
	m_hhat	n1
	m_snare	n1*1
	m_snare	n1*2
	m_snare	n1*1

	_return

drum_3
	m_kick	n1*2
	m_hhat	n1
	m_hhat	n1
	m_snare	n1*2
	m_hhat	n1
	m_hhat	n1

	m_kick	n1*2
	m_snare	n1*1
	m_snare	n1*1
	m_snare	n1*2
	m_snare	n1*1
	m_snare	n1*1

	_return

