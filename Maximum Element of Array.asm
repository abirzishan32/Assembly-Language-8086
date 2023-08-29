.model small
.stack 100h
.data
    array_size dw 10             ; Maximum number of elements in the array
    array db 10 dup(0)          ; Integer array with a maximum of 10 elements
    max_element db ?             ; Variable to store the maximum element

.code
main proc
    mov ax, @data
    mov ds, ax

  

    ; Read the elements of the array
    mov si, 0                    ; Initialize index SI
input_loop:
    mov ah, 01h
    int 21h                      ; Read a character
    sub al, '0'                  ; Convert ASCII digit to binary
    mov [array + si], al         ; Store the element in the array
    inc si                       ; Increment the index
    cmp si, [array_size]         ; Compare SI with the maximum array size
    je found_max                 ; If SI has reached the maximum, exit loop
    cmp al, 13                   ; Check if Enter key was pressed
    je found_max                 ; If Enter key pressed, exit loop
    jmp input_loop               ; Repeat for the next element

found_max:
    ; Find the maximum element in the array
    mov si, 0                    ; Reset SI to 0
    mov al, [array]              ; Initialize AL with the first element
    mov dl, al                   ; Initialize DL with the maximum element
find_max_loop:
    inc si                       ; Move to the next element
    cmp si, [array_size]         ; Compare SI with the maximum array size
    je display_max               ; If SI has reached the maximum, display maximum
    mov al, [array + si]         ; Load the next element
    cmp al, dl                   ; Compare with the current maximum
    jle continue_loop            ; If not greater, continue loop
    mov dl, al                   ; Update maximum if greater
continue_loop:
    jmp find_max_loop            ; Repeat for the next element

display_max:
    ; Convert the maximum element back to ASCII
    add dl, '0'
    mov [max_element], dl

    ; Display the maximum element on the terminal
    
    mov ah, 02h
    mov dl, [max_element]
    int 21h

    ; Terminate the program
    mov ah, 4Ch
    int 21h

main endp



end main
