%include "function.asm" ;to get access to print_num,sign function

section .text

global _start         ;must be declared for linker (ld)

_start:
    mov eax,4         ;sys_write
    mov ebx,1         ;file descriptor
    mov ecx,msg       ;msg to be printed
    mov edx,len       ;msg length
    int 0x80          ;interupt

    xor dx,dx         ;clear dx to zero
    mov ax,[x]        ;store operand 1 in register 1
    mov bx,[y]        ;store operand 2 in register 2
    div bx            ;perform division
    
    pushad            ;to preserve all register values
    call print_num    ;number in eax register
    popad             ;restore register values 

    pushad
    mov eax,4         ;for new line
    mov ebx,1
    mov ecx,n
    mov edx,1
    int 0x80
    popad
    
    pushad           ;msg for remainder
    mov eax,4
    mov ebx,1
    mov edx,len2
    mov ecx,msg2
    int 0x80
    popad

    mov ax,dx        ;print remainder
    pushad
    call print_num
    popad
    
    mov eax,4         ;for new line
    mov ebx,1
    mov ecx,n
    mov edx,1
    int 0x80

    mov     eax,1     ;sys_exit
    mov     ebx,0
    int     0x80      ;interupt
 
section .data
    x dw 900        ;operand 1
    y dw 400         ;operand 2  
    n db '',0xA
    z db '-' 
    msg db 'The Quotient is:'
    len equ $-msg
    msg2 db 'The remainder is:'
    len2 equ $-msg2

section .bss
res resb 1             ;result variable
