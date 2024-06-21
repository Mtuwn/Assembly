.model small
.stack 100h
.data
    tbao    db  'Nhap vao 1 ky tu: $'   
    kiTu    db  ?

.code
main proc
    mov ax, @data
    mov ds, ax    
    
    mov ah, 09h
    lea dx, tbao
    int 21h
    
    mov ah, 07h   
    int 21h   
    mov kiTu, al
    
    mov ah, 02h
    mov dl, kiTu
    int 21h
    
    