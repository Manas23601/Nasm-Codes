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
    pop edx              ;pop value from stack since it's no longer needed
    ret

sign:                    ;function to print '-'
    jns unsign           ;if sign bit is 1 print '-'
    mov eax,4
    mov ebx,1
    mov ecx,z
    mov edx,1
    int 0x80
    unsign:              ;return otherwise
    ret
