.model small
.stack 100h

.data
    arr db 20 dup('$')
    msg db 'Enter a string : $'
    msgg db 'Length of the entered string = $'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg
    int 21h

    mov cx, 0
    mov si, offset arr

lp:
    mov ah, 01h
    int 21h
    cmp al, 13
    je progend
    mov [si], al
    inc cx
    inc si
    jmp lp

progend:
    mov byte ptr [si], '$'

    mov ah, 09h
    lea dx, msgg
    int 21h

    mov al, cl
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h

main endp
end main
