%include "function.asm"
start
    write_message msg,len
    mov eax,1 
    mov ecx,[num]
    call fact       ;call function 
    call print_num  ;number in eax register
    new_line        ;print new line
exit

fact:
    cmp ecx,1 ;terminating condition
    je fin
    dec ecx   
    call fact ;recursively call function until ecx becomes 1
    inc ecx
    mov ebx,ecx 
    mul ebx   ;multiply next number
    fin:
ret

section .data
msg db 'Factorial is:'
len equ $-msg
num db 12
