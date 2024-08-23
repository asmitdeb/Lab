.model small
.stack 100h
.data
.code
main proc
mov cx,19
mov bx,0
mov bl,2
loop1:
mov ax,cx
div bl
cmp ah,0
je isnotprime
inc bl
cmp bx,cx
jge isprime
jmp loop1
isnotprime:
mov dx,'N'
mov ah,2
int 21h
jmp endprog
isprime:
mov dx,'Y'
mov ah,2
int 21h
endprog:
mov ah,4ch
int 21h
main endp
