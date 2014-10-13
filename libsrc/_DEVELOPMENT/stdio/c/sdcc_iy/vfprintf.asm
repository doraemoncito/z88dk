
; int vfprintf(FILE *stream, const char *format, void *arg)

INCLUDE "clib_cfg.asm"

SECTION seg_code_stdio

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF __CLIB_OPT_MULTITHREAD & $02
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _vfprintf

_vfprintf:

   pop af
   pop ix
   pop de
   pop bc
   
   push bc
   push de
   push ix
   push af

   INCLUDE "stdio/z80/asm_vfprintf.asm"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ELSE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _vfprintf

EXTERN _vfprintf_unlocked

defc _vfprintf = _vfprintf_unlocked
   
INCLUDE "stdio/z80/asm_vfprintf.asm"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ENDIF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
