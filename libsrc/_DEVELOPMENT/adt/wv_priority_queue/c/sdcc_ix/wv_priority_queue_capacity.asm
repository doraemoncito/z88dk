
; size_t wv_priority_queue_capacity(wv_priority_queue_t *q)

XDEF wv_priority_queue_capacity

LIB wa_priority_queue_capacity

wv_priority_queue_capacity:

   jp wa_priority_queue_capacity

   INCLUDE "adt/wv_priority_queue/z80/asm_wv_priority_queue_capacity.asm"
