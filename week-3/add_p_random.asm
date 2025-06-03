%include "function.asm"
start
    mov ecx,[p]          ;number of integers
    xor ebx,ebx          ;ebx will store temporary sum

    l1:
        pushad
        call rand_num    ;get random number in rand variable
        popad
      
        push ebx         ;preserve ebx because of division in next step

        mov eax,[rand]   ;take mod by 100 to get a smaller sum
        mov ebx,100
        cmp eax,0
        je fpe
        div ebx
        fpe:

        pop ebx          ;retrieve ebx

        add ebx,edx      ;update sum

        pushad
        mov eax,edx      ;print current random number
        call print_num
        write_message s,1
        popad
    loop l1

    pushad               ;print the sum of the numbers
    new_line
    write_message msg,len
    popad
    mov eax,ebx
    call print_num
    new_line
exit

section .data
msg db 'The sum of the numbers is:'
len equ $-msg
s db 32
p db 8

    
