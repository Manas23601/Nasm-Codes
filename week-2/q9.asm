%include "function.asm" ;to get access to print_num,sign function

section .text

global _start         ;must be declared for linker (ld)

_start:
    mov eax,4         ;sys_write
    mov ebx,1         ;file descriptor
    mov ecx,msg       ;msg to be printed
    mov edx,len       ;msg length
    int 0x80          ;interupt

    mov ax,[x]        ;store operand 1 in register 1
    mov bx,[y]        ;store operand 2 in register 2
    xor ax,bx         ;perform Logical-Xor
    
    pushad            ;to preserve all register values
    call print_num    ;number in eax register
    popad             ;restore register values 
    
    mov eax,4         ;for new line
    mov ebx,1
    mov ecx,n
    mov edx,1
    int 0x80

    mov     eax, 1    ;sys_exit
    int     0x80      ;interupt
 
section .data
    x dw 640           ;operand 1
    y dw 766            ;operand 2  
    n db '',0xA
    z db '-' 
    msg db 'The Result after Logical-Xor is:'
    len equ $-msg

section .bss
res resb 1             ;result variable
