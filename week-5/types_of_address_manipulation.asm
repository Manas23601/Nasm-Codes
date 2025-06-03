%include "function.asm"
start
    write_message msg1,len1

    xor eax, eax            
    xor ebx, ebx
    xor ecx, ecx            
    xor edx, edx

    call direct_addr
    call print_num

    write_message msg2,len2
    
    xor eax, eax            
    xor ebx, ebx
    xor ecx, ecx            
    xor edx, edx

    call indirect_addr
    call print_num

    write_message msg3,len3
    
    xor eax, eax            ;clearing stack
    xor ebx, ebx
    xor ecx, ecx            
    xor edx, edx

    call immed_addr
    call print_num

    write_message msg8,len8
    
    xor eax, eax            ;clearing stack
    xor ebx, ebx
    xor ecx, ecx            
    xor edx, edx

    call reg_ind_addr
    call print_num

    write_message msg9,len9

    xor eax, eax            ;clearing stack
    xor ebx, ebx
    xor ecx, ecx            
    xor edx, edx

    call auto_inc
    call print_num

    write_message msg10,len10
    
    xor eax, eax            ;clearing stack
    xor ebx, ebx
    xor ecx, ecx            
    xor edx, edx

    call auto_dec
    call print_num
    new_line
exit

indirect_addr: 
    mov eax, [array_table]      ;2
    add eax, [array_table + 4]  ;4,5
    ret
direct_addr:
    mov ebx, 100                
    add eax, [num]              ;1
    add eax, ebx                ;7
    ret
immed_addr:
    mov eax, 100                
    add eax, 100                ;3
    ret
reg_ind_addr:
    mov esi, array_table        ;8
    mov eax, [esi]  
    add eax, [esi + 4]          ;6
    ret
auto_inc:                       ;9
    mov ebx, array_table
    add eax, [ebx]
    add ebx, 4
    add eax, [ebx]
    ret
auto_dec:
    mov ebx, array_table+4
    add eax, [ebx]
    sub ebx, 4
    add eax, [ebx]
    ret
        
section .data

    num dd 100
    array_table dd 100, 100, 100, 100

    msg1 db 0xA,"Direct and Register addressing                  : "
    len1 equ $ - msg1

    msg2 db 0xA,"InDirect, Direct Offset and relative addressing : "
    len2 equ $ - msg2

    msg3 db 0xA,"Immediate addressing                            : "
    len3 equ $ - msg3

    msg8 db 0xA,"Register and Indexed Indirect addressing        : "
    len8 equ $ - msg8

    msg9 db 0xA,"Auto-Increment addressing                       : "
    len9 equ $ - msg9

    msg10 db 0xA,"Auto-Decrement addressing                       : "
    len10 equ $ - msg10

    msgb db 0xA, 0xD
    lenb equ $ - msgb

section .bss                ; space reserved for storing values
    result resb 1
