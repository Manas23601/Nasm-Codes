%include "function.asm"
start
xor edx,edx
mov eax,[num] 
mov ebx,[num]
cmp eax,1
je fin
dec bx
    is_prime:    ;divide from num to 2
    xor edx,edx
    push eax
    div ebx
    pop eax
    cmp edx,0
    je fin       ;if perfectly divisible print not prime
    dec ebx
    cmp ebx,1
    jne is_prime
write_message p,lenp
exit
fin:
write_message np,lennp
exit


section .data
p db 'The number is a prime',0xA
lenp equ $-p
np db 'The number is not prime',0xA
lennp equ $-np
num dd 1