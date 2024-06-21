.model small
.stack 100h
.data
    a_high dw 003Ah    
    a_low  dw 0B45Eh  
    b      dw 0A1h    

.code
main proc
    mov ax, @data
    mov ds, ax

  
    mov dx, a_high
    mov ax, a_low

    mov bx, b
    div bx     ; ket qua luu ax, du luu o Dx


    mov ah, 4ch
    int 21h
main endp

