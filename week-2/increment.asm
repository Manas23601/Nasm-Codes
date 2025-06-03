section .text

global _start

_start:

mov eax,4       ;sys_write
mov ebx,1       ;file descriptor
mov ecx,msg     ;msg to be printed
mov edx,len     ;msg length
int 0x80        ;interupt

mov ecx,3       ;loop counter
mov esi,2       ;offset address

increment:      ;function to increment 1
    mov al,[num+esi]
    inc al
    cmp al,57
    jle end      ;jump if no carry else repeat procedure for next lsd
    mov al,'0'
    mov [num+esi],al
    dec esi
    loop increment

end:

mov [num+esi],al   ;print number
mov eax,4
mov ebx,1
mov ecx,num
mov edx,3
int 0x80

mov eax,4         ;new line
mov ebx,1
mov ecx,n
mov edx,1
int 0x80


mov eax,1          ;sys_exit
int 0x80           ;interupt

section .data
num db '100'       ;operand
msg db 'after increment:'
len equ $-msg
n db '',0xA
