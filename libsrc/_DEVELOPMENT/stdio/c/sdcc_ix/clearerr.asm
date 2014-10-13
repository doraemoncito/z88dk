
; void clearerr(FILE *stream)

INCLUDE "clib_cfg.asm"

SECTION seg_code_stdio

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF __CLIB_OPT_MULTITHREAD & $02
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _clearerr

_clearerr:

   pop af
   pop bc
   
   push bc
   push af

   push ix
   
   ld ixl,c
   ld ixh,b
   
   call asm_clearerr
   
   pop ix
   ret

   INCLUDE "stdio/z80/asm_clearerr.asm"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ELSE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _clearerr

EXTERN _clearerr_unlocked

defc _clearerr = _clearerr_unlocked

INCLUDE "stdio/z80/asm_clearerr.asm"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ENDIF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
