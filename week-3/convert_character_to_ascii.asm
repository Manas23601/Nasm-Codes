%include "function.asm"

section .text

global _start

_start:
mov al,1
mov esi, 1      ;size of the result
mov [fact], esi  ;stores the digits in reverse order
mov ecx,[num]
call factorial

dec esi
mov ebp,esi
xor edx,edx
 pushad
new_line
popad
pushad
mov eax,ebp
call print_num
new_line
popad
    
convert_ascii:
xor ecx,ecx
mov ecx,fact
add ecx,ebp
mov eax,[ecx]
add eax,48
mov [ecx],eax
pushad
    ;mov ecx,
    mov edx,1
    mov eax,4
    mov ebx, 1
    int 0x80
popad
dec ebp
cmp ebp,-1
jne convert_ascii
new_line



exit


factorial:
    cmp ecx,1
    je fin
    dec ecx
    call factorial
    
    inc ecx
    
    mov bl,cl
    mov ecx,esi
    mov ebp,0
    xor edx,edx
    xor eax,eax
    xor bh,bh

    digit_multiply:
    mov byte al,[fact + ebp]
    pushad
    call print_num
    new_line
    popad
    mul bl
    add al,bh
    ;xor ah,ah
    mov bh,bl
    mov bl,10
    div bl
    mov bl,bh
    ;add eax,edx
    ;xor edx,edx
    ;push ebx
    ;mov ebx,10
    ;div ebx
    ;pop ebx
    
    mov [fact +  ebp],ah

    ;mov edx,eax
    mov bh,al
    inc ebp
    loop digit_multiply

   
    mov cl,bl
    mov al,ah
    mov bl,10
    

    divide:
    cmp al,0
    je no_divide
    xor ah,ah
    div bl
    mov [fact+esi],ah
    inc esi
    pushad
    mov eax,esi
    call print_num
    new_line
    popad
    jmp divide
    no_divide: 
   

    fin:
    ret

section .data
num dd 5
msg db 'Factorial is '
len equ $-msg
fact times 4 db ' '


