
; FILE *fopen_unlocked(const char *filename, const char *mode)

SECTION seg_code_stdio

PUBLIC fopen_unlocked_callee

fopen_unlocked_callee:

   pop hl
   pop de
   ex (sp),hl
   
   INCLUDE "stdio/z80/asm_fopen_unlocked.asm"
