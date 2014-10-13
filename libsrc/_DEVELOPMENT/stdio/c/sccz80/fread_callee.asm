
; size_t fread(void *ptr, size_t size, size_t nmemb, FILE *stream)

INCLUDE "clib_cfg.asm"

SECTION seg_code_stdio

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF __CLIB_OPT_MULTITHREAD & $02
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC fread_callee

fread_callee:

   pop af
   pop ix
   pop hl
   pop bc
   pop de
   push af
   
   INCLUDE "stdio/z80/asm_fread.asm"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ELSE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC fread_callee

EXTERN fread_unlocked_callee

defc fread_callee = fread_unlocked_callee
   
INCLUDE "stdio/z80/asm_fread.asm"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
