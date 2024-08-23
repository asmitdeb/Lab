.model small
.stack 100h

.data
    arr db 20 dup('$')
    msg db 'Enter a string: $'
    newline db 0Dh, 0Ah, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg
    int 21h

    mov si, offset arr

read_loop:
    mov ah, 01h
    int 21h
    cmp al, 13
    je end_input
    mov [si], al
    inc si
    jmp read_loop

end_input:
    mov byte ptr [si], '$'

    mov ah, 09h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, arr
    int 21h

    mov ah, 4Ch
    int 21h

main endp
end main
