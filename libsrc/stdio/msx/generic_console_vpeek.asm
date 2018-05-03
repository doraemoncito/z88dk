

	MODULE	generic_console_vpeek
	SECTION	code_lib
	PUBLIC	generic_console_vpeek

	EXTERN	__msx_font32
	EXTERN	screendollar
	EXTERN	msxbios

IF FORmsx
        INCLUDE "target/msx/def/msxbios.def"
ENDIF
IF FORsvi
        INCLUDE "target/svi/def/svibios.def"
ENDIF
IF FORm5
        INCLUDE "target/m5/def/m5bios.def"
ENDIF
IF FORmtx
	EXTERN	LDIRMV
ENDIF


generic_console_vpeek:
	push	ix
        ld      a,c
        add     a
        add     a
        add     a
        ld      e,a	
        ld      d,b
	ld	hl,-8
	add	hl,sp
	ld	sp,hl
	push	hl		;save buffer
	; de = VDP address
	; hl = buffer
	ex	de,hl
	ld	ix,LDIRMV
	ld	bc,8
	call	msxbios
	pop	de		;buffer
	ld	hl,(__msx_font32)
	call	screendollar
	ex	af,af
	ld	hl,8
	add	hl,sp
	ld	sp,hl
	ex	af,af
        pop     ix
        ret
