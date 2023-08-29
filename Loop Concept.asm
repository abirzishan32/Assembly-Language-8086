.model small
.stack 100h
.data

.code
main proc
    ;Count of loop is measured by cx register
    mov cx, 26
    mov ah,2
    mov dl, 'a'
    
    level:
    int 21h
    inc dl
    loop level
