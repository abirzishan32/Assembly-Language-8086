.model small
.stack 100h
.data
msg db 3
msg1 db ?

.code
main proc 
    mov ax, @data
    mov ds, ax
    ;For printing 3 from the variable msg whose size is 3
    mov ah,2 
    add msg,48
    mov dl, msg
    int 21h   
     
    ;Taking input of msg1
    mov ah, 1
    int 21h
    mov msg1, al
             
    ;Printing a new line
    mov ah,2
    mov dl,10
    int 21h
    mov dl, 13
    int 21h
    
    ;Printing msg1
    mov ah,2
    mov dl, msg1
    int 21h
    
    
    
