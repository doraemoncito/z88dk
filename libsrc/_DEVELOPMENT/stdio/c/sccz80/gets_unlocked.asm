
; char *gets_unlocked(char *s)

SECTION seg_code_stdio

PUBLIC gets_unlocked

gets_unlocked:

   INCLUDE "stdio/z80/asm_gets_unlocked.asm"
