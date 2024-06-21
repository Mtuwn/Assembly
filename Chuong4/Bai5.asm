inchuoi MACRO chuoi      
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM  

dseg segment
    coso dw 10
    xdong db 10,13,'$' 
    tb1 db 'Nhap n thoa man 0<n<=8: $' 
dseg ends

cseg segment
    assume: ds:dseg, cs:cseg
start:
    mov ax, dseg
    mov ds, ax   
    
    inchuoi tb1
    
    mov ah, 1
    int 21h  
    
    sub al, 30h
    mov cl, al
    
    inchuoi xdong
           
    mov ax, 1
    mov bx, 1
    
    giaithua:
        mul bx     
        inc bx
        cmp bx, cx 
        jbe giaithua   
    
    xor cx, cx      
    lappush:
        xor dx, dx
        div coso
        add dx, 30h
        push dx
        inc cx
        cmp ax, 0
        jne lappush
    
    print:
        pop dx
        mov ah, 2
        int 21h
        loop print  
               
    mov ah, 4Ch
    int 21h   

cseg ends
end start