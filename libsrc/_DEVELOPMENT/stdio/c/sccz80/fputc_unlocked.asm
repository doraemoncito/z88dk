
; int fputc_unlocked(int c, FILE *stream)

SECTION seg_code_stdio

PUBLIC fputc_unlocked

EXTERN asm_fputc_unlocked

fputc_unlocked:

   pop af
   pop ix
   pop de
   
   push de
   push ix
   push af
   
   jp asm_fputc_unlocked
