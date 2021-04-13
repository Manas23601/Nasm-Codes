%include "function.asm"

start
mov ecx,len5
mov esi,0

counting:
mov al,[msg5+esi]
inc esi
call vowel      ;check if character is a vowel or consonant
call wor        ;check for spaces
loop counting

write_message msg1,len1
mov al,[wcount]
call print_num
new_line
write_message msg2,len2
mov al,[vcount]
call print_num
new_line
write_message msg3,len3
mov al ,len5
call print_num
new_line 
write_message msg4,len4
mov al,[ccount]
sub al,[wcount]
inc al
call print_num
new_line
exit
 
wor:             ;if its 32 that means end of word
cmp al,32 
je incw
ret

vowel:           ;if its vowel increment vowel count and return else increment consonant count
cmp al,'a'
je incv
cmp al,'e'
je incv
cmp al,'i'
je incv
cmp al,'o'
je incv
cmp al,'u'
je incv
cmp al,'A'
je incv
cmp al,'E'
je incv
cmp al,'I'
je incv
cmp al,'O'
je incv
cmp al,'U'
je incv
inc byte [ccount]
end:
ret


incw:
inc byte [wcount]
jmp end

incv:
inc byte [vcount]
jmp end




section  .data
msg1 db 'Number of words:'
len1 equ $-msg1
msg2 db 'Number of vowels:'
len2 equ $-msg2
msg3 db 'Number of characters:'
len3 equ $-msg3
msg4 db 'Number of consonants:'
len4 equ $-msg4
msg5 db 'Hello IIITDM Kancheepuram'
len5 equ $-msg5

ccount dd 0
vcount db 0
wcount db 1
