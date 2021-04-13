%include "function.asm"
section .text
global _start
_start:
mov eax ,1
add [x],eax
mov eax,[x]
call print_num
exit


section .data
x db 1