# CyD for Game Master Cartridge

Music player for CoCo and Dragon computers targetting the SN76489 in the Game Master Cartridge.

Work in progress. Plays two tone channels plus a noise channel with frequency controlled by the third tone channel for percussion.

Derived from CyD (Copyright 2013-2015 Ciaran Anscomb)

https://github.com/sixxie/cyd


Modified for the SN76489 by Stewart Orchard 2018


## Quick Start

Needs: asm6809, bin2cas.pl, dzip, perl

```
git clone https://github.com/sorchard001/cyd-gmc
cd cyd-gmc
make
xroar -cart gmc -no-cart-autorun cyd_gmc.bin
```

Timing is derived from the video refresh rate, meaning the playback tempo will be different for PAL and NTSC machines. The demo tune is arranged for a PAL machine. Increase the note length in music.s from 6 to 7 to slow down the playback speed for NTSC:

```
; basic note length
n1	equ	6	; PAL
n1	equ	7	; NTSC
```

## Further Info

Game Master Cartridge design by John Linville:

http://www.vintageisthenewold.com/game-master-cartridge-enables-better-games-for-coco/


SN76489 information:

http://www.smspower.org/Development/SN76489

