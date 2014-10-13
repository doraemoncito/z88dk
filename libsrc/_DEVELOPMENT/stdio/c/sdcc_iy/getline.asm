
; size_t getline(char **lineptr, size_t *n, FILE *stream)

INCLUDE "clib_cfg.asm"

SECTION seg_code_stdio

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF __CLIB_OPT_MULTITHREAD & $02
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _getline

_getline:

   pop af
   pop hl
   pop de
   pop ix
   
   push ix
   push de
   push hl
   push af
   
   INCLUDE "stdio/z80/asm_getline.asm"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ELSE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _getline

EXTERN _getline_unlocked

defc _getline = _getline_unlocked
   
INCLUDE "stdio/z80/asm_getline.asm"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ENDIF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
