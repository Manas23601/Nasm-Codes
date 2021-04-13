%macro exit 0               ;macro to terminate a program
    mov eax, 1
    mov ebx, 0
    int 0x80
%endmacro

%macro write_message 2     ;macro to write a message 
    mov ecx, %1
    mov edx, %2
    mov eax, 4
    mov ebx, 1
    int 0x80
%endmacro

%macro new_line 0          ;macro to print new line
    mov eax,4
    mov ebx,1
    mov ecx,n
    mov edx,1
    int 0x80
%endmacro

%macro start 0             ;macro to start program
    section .text
    global _start
    _start:
%endmacro

print_num:                 ;recursive function to print a number
    push edx               ;push to stack to print in correct order
    mov edx,0              ;set remainder to zero for next iteration
    cmp eax,0              ;check if num is 0
    je done
    mov ebx,10
    div ebx                ;divide by 10 to get least significant digit in edx register(remainder) and quotient in eax register
    call print_num
    add edx,'0'            ;convert to ascii
    mov [res],edx          ;print digit
    mov ecx,res
    mov edx,1
    mov eax,4
    mov ebx,1
    int 0x80
    done:
    pop edx                ;pop value from stack since it's no longer needed
    ret

sign:                      ;function to print '-'
    jns unsign             ;if sign bit is 1 print '-'
    mov eax,4
    mov ebx,1
    mov ecx,z
    mov edx,1
    int 0x80
    unsign:              ;return otherwise
    ret

rand_num:                  ;pseudo-random number generator (linear congruential algoritm)
    xor eax,eax            ;Xn+1  = 69069*Xn + 69069
    xor ebx,ebx
    xor edx,edx
    mov ebx,69069
    mov edx,69069
    mov eax,[rand]
    mul ebx
    add eax,ebx
    mov [rand],eax
    ret

section .data 
rand dd 1                  ;variable to store random number
z db '-'                   ;negative symbol
n db '',0xA                ;new line

section .bss
res resb 1