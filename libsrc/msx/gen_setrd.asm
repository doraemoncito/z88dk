;
; z88dk library: Generic VDP support code
;
; $Id: gen_setrd.asm,v 1.3 2016-06-16 19:30:25 dom Exp $
;

        SECTION code_clib
	PUBLIC	SETRD
	PUBLIC	_SETRD

	INCLUDE	"msx/vdp.inc"

;==============================================================
; VRAM to HL
;==============================================================
; Sets VRAM read address to hl
;
; CORRUPTS bc
;==============================================================
.SETRD
._SETRD
	di
	ld      a,l
IF VDP_CMD < 0
	ld	(-VDP_CMD),a
ELSE
	ld	bc,VDP_CMD
	out	(c),a
ENDIF
	ld      a,h
	and     $3F
IF VDP_CMD < 0
	ld	(-VDP_CMD),a
ELSE
	out	(c),a
ENDIF
	ei
	ret
