inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

dseg segment
    msg1    db  "Nhap chuoi: $"
    xuongdong db  10,13, "$"  
    msg2    db  "so luong so am: $"
    msg3    db  "soluong so duong: $"
    str     db  100 dup("$") 
    soam    db  0 
    soduong db  0  
    tongso  db  1
dseg ends

cseg segment
    assume cs:cseg, ds:cseg 
    
begin: 
    mov ax, dseg
    mov ds, ax 
    
    inchuoi msg1 
    
    mov ah, 0AH
    lea dx, str
    int 21h  
             
    call xuly   
    
    xor ax,ax
    mov al, tongso
    sub al,soam
    mov soduong, al 
    
    
    inchuoi xuongdong 
    inchuoi msg2
    xor ax,ax 
    mov al, soam 
    call xuatketqua 
    
    inchuoi xuongdong 
    inchuoi msg3
    xor ax,ax 
    mov al, soduong 
    call xuatketqua  
     
    
    mov ah, 4ch
    int 21h
    
    
    

xuly proc
    lea si, str + 2
    kiemtra:
        mov dx, [si]
        cmp dl, "$"
        je exit   
        
        cmp  dl, '-'  
        je demsoam
        cmp dl, ',' 
        je demso
        inc si
        jmp kiemtra
        
        
        
    demsoam: 
        inc soam
        inc si
        jmp kiemtra 
        
    demso:    
        inc tongso
        inc si
        jmp kiemtra       
    
    exit:
        ret
    

xuly endp  


xuatketqua proc
    xor cx,cx
    mov bx, 10
    chia10:
        xor dx,dx
        div bx
        push dx
        inc cx
        cmp ax, 0
        jnz chia10
    inra:
        mov ah,2
        pop dx
        add dl,30h
        int 21h 
        loop inra     
    ret
       
xuatketqua endp   

cseg ends
end begin