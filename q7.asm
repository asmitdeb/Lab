.model small
.stack 100h

.data
    msg1 db 'Enter first number: $'
    msg2 db 'Enter second number: $'
    msg3 db 'After swapping: $'
    num1 db ?
    num2 db ?
    newline db 0Dh, 0Ah, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg1
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'         
    mov num1, al      

    mov ah, 09h
    lea dx, msg2
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'         
    mov num2, al       

    mov al, num1
    mov bl, num2

    push ax             
    push bx             

    pop ax              
    pop bx              

    mov num1, al        
    mov num2, bl

    
    mov ah, 09h
    lea dx, msg3
    int 21h

    
    mov al, num1
    add al, '0'        
    mov dl, al
    mov ah, 02h
    int 21h

    
    mov ah, 09h
    lea dx, newline
    int 21h

    
    mov al, num2
    add al, '0'         
    mov dl, al
    mov ah, 02h
    int 21h

    
    mov ah, 4Ch
    int 21h

main endp
end main
