.model small
.stack 100h
.data
str db 'I love cat $'

.code
main proc
    ; 1 -> single key input
    ; 2 -> single character output 
    ; 9 -> character string output
    
    mov ax, @data
    mov ds, ax
    
    ;String output
    mov ah, 9
    lea dx, str
    int 21h
     
    ;Single input
    mov ah,1
    int 21h
    mov bl, al
    
    ;Single output
    mov ah,2
    mov dl, bl  
    int 21h
    
    
    
