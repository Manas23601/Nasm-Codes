%include "function.asm"
start
	mov eax,[num]        ;the number which should be checked if it's armstrong or not
	push eax             
	mov ecx,10           
	mov esi,0            ;num of digits

	
get_digit:              ;TO GET THE NUMBER OF DIGITS IN THE NUMBER
    xor edx,edx         
    div ecx             ;divide the number by 10 to get least significant digit in edx
    push edx            
    inc esi             
    cmp eax,0           
    jne get_digit       ;till number becomes zero

    mov edi,esi         ;edi has the value of number of digits in the number

jump:
   pop edx          
   mov eax,1            ;Initializing eax to 1
   mov ecx,esi
   mov ebx,edx          ;ecx had the number of digits in the number

mult:                   ;TO MULTIPLY THE DIGIT WITH ITSELF FOR AS MANY TIMES AS THE NUMBER OF DIGITS
   mul ebx              
   loop mult

   add [count],eax      ;add that value to count variable
   dec edi
   cmp edi,0            ;check if all digits are done with multiplication with number of digits
   jne jump        
   
   pop eax              ;TO CHECK IF THE NUMBER IS ARMSTRONG NUMBER OR NOT
   cmp eax,[count]         
   je yes      
          
write_message msg2,len2
exit
yes:
write_message msg1,len1
exit  

section .data
msg1 db "Given Number is an Armstrong Number"
len1 equ $ - msg1
msg2 db "Given Number is not an Armstrong Number"
len2 equ $ - msg2
num dw 20
count db 0