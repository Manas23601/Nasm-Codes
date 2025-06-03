%include "function.asm"
start
    write_message msg,len ; print message
    mov ax,[a]   ;move number 1
    mov bx,[b]   ;move number 2
    cmp ax,bx

    jg ac        ;num1>num2? 
    mov ax,bx    ;num2 was bigger so move it ax
    ac:          ;else num1 was greater so discard num2

    mov bx,[c]   ;move number 3
    cmp ax,bx

    jg ad        ;check if number 3 is the largest of the three 
    mov ax,bx    
    ad:

    mov bx,[d]   ;move number 4
    cmp ax,bx

    jg ae        ;check if number 4 is the largest of all
    mov ax,bx
    ae:

    mov bx,[e]   ;move number 5
    cmp ax,bx

    jg result    ;check if number 5 is the largest of all
    mov ax,bx
    result:

    call print_num  ;print the greatest of the 5 numbers
    new_line        ;print new line
exit                ;exit the program
  
section .data
msg db 'The highest number is:'
len equ $-msg
a dw -100
b dw -990
c dw -680
d dw -800
e dw -801
