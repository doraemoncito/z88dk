
; void *p_list_pop_front(p_list_t *list)

SECTION code_clib
SECTION code_adt_p_list

PUBLIC p_list_pop_front

EXTERN asm_p_list_pop_front

defc p_list_pop_front = asm_p_list_pop_front

; SDCC bridge for Classic
IF __CLASSIC
PUBLIC _p_list_pop_front
defc _p_list_pop_front = p_list_pop_front
ENDIF

