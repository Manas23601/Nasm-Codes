%include "function.asm"
start
    pushad
    call rand_num   ;get a random number in rand variable
    popad

    mov eax,[rand]
    mov ebx,101     ;taking mod to limit the number between 20 and 100
    cmp eax,0       ;dont divide if its zero
    je fpe          
    div ebx        
    fpe:

    cmp edx,20      ;add 20 to the number if after mod the result is below 20
    jg add_20      
    add edx,20
    add_20:

    pushad                 ;print the value of R
    write_message msg,len
    popad
    mov eax,edx           
    pushad
    call print_num
    new_line
    popad

    mov ecx,edx     ;loop R times and print from 1 to R
    mov eax,1
    
    toR:
        pushad      ;print number stored in eax register starts with 1
        call print_num
        new_line
        popad
        inc eax  
    loop toR
exit
    
section .data
msg db 'R='
len equ $-msg