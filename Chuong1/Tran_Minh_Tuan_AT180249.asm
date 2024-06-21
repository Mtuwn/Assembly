.model small
.stack 100h
.data
    a       db 15h 
    b       db 250  
    c       dw 16
    d       dw 0AF1h 
    e       dw 300   
    f       dw 400  
    g       dw 1000
    h       db 100 
    m       dw 1000
    n       dw 100h 
    q_high dw 003Ah    
    q_low  dw 0B45Eh  
    p      dw 0A1h     

.code
main proc
    mov ax, @data
    mov ds, ax
    ;cau a
    mov al, a   
    mov bl, b  
    mul bl         ; ket qua luu o ax 
    ;cau b      
    mov ax, c   
    mov bx, d  
    mul bx       ; ket qua luu o ax
    ;cau c
    mov ax, e    
    mov bx, f    
    mul bx        ; Ket qua Dx:Ax        
    ;cau d
    mov ax, g
    mov bl, h
    div bl     ; Du o ah  phan nguyen o  al    
    ;cau e 
    mov ax, m
    mov bx, n
    div bx        ; Nguyen o Ax    phan du o Dx
    ; cau f
    mov dx, q_high
    mov ax, q_low

    mov bx, p
    div bx     ; phan nguyen luu ax, du luu o Dx
    MOV AH, 4CH
	INT 21H          

main endp
end main         


                      

