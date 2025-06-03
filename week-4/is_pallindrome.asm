%include "function.asm"
start
   write_message x,len
   mov esi,len-1         ;index pointing to the rightmost end of the string
   mov edi,0             ;index pointing to leftmost index on the string
   xor edx,edx
   mov eax,len
   mov ebx,2
   div ebx
   mov ecx,edx
   xor eax,eax              ;Initiate eax to 0
   xor ebx,ebx              ;Initiate ebx to 0

palindrome:
   mov al,[x+esi]           ;moves the right most digit in 'al' register
   mov bl,[x+edi]           ;moves the left most digit in 'bl' register
   dec esi                  ;al register index moves left
   inc edi                  ;bl register index moves right
   cmp al,bl                ;compare that digit in symmetrical position
   jne finish               ;if not equal , jump to finish
loop palindrome

write_message msg1,len1     ;is pallindrome
new_line
exit
finish:
write_message msg2,len2     ;not pallindrome
new_line
exit

section .data
    x db '333'             
    len equ $-x
    msg1 db  " is Palindrome"
    len1 equ $ - msg1
    msg2 db " is not Palindrome",
    len2 db $ - msg2
