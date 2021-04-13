section .text

global _start

_start:

mov eax,4              ;sys_write
mov ebx,1              ;file descriptor
mov ecx,msg            ;msg to be printed
mov edx,len            ;msg length
int 0x80               ;interupt

mov ecx,3              ;loop counter
mov esi,2              ;offset address

increment:             ;function to decrement by 1
    mov al,[num+esi]
    dec al
    cmp al,48          ;jump to end if no borrow
    jge end
    mov al,'9'
    mov [num+esi],al
    dec esi
    loop increment
    
end:

mov [num+esi],al       ;print num
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

mov eax,1         ;sys_exit
int 0x80          ;interupt

section .data
num db '500'
msg db 'after decrement:'
len equ $-msg
n db '',0xA
