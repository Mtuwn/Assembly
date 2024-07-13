inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h 
endm 

dseg segment   
    so dw ?
    msg1 db 'DEC: $'  
    msg2 db 10, 13, 'HEX: $'  
    msg3 db 10, 13, 'BIN: $'    
dseg ends 

cseg segment
    assume cs:cseg, ds:dseg  
begin: 
    mov ax, dseg
    mov ds, ax
    
    inchuoi msg1
    call dec_in 
    mov so, dx
    
    inchuoi msg2
    mov bx, so
    call hex_out
    
    xor bx, bx 
    
    inchuoi msg3
    mov bx, so
    call bin_out
     
dec_in proc 
    xor dx, dx
    mov bx, 10
    xor ax, ax
    
    nhap:
        mov ah, 01h
        int 21h 
        
        cmp al, 0Dh
        je exit
        
        sub al, 30h
        
   
        mov cl, al
        mov ax, dx
        mul bx
        add al, cl
        mov dx, ax          
        
        jmp nhap
    exit:  
        ret
dec_in endp 

hex_out proc
    mov cx, 4
    xor dx, dx
    xuat: 
        mov dx,bx
        shr dx, 12
        
        cmp dx, 09h
        ja kytu       
        
        add dx, 30h   
        jmp inra 
        
        kytu:
            add dl, 37h   
        
        inra:
            mov ah, 02h 
            int 21h
            shl bx, 4  
            loop xuat
    ret
hex_out endp 

bin_out proc
    mov cx, 16          
    xuat2:
        mov dx, 0
        shl bx, 1     
        rcl dx, 1       
                        
        add dx, 30h     
        
        mov ah, 02h
        int 21h
        loop xuat2
bin_out endp 

cseg ends
end begin