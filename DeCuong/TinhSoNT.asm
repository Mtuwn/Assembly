inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

dseg segment
 msg1   db "nhap chuoi: (VD: 2 3 5) $"
 msg2   db  "Tong so nguyen to: $"    
 xuongdong  db 10,13, "$"
 str    db 100 dup("$")
 snt    dw  0   
 so10   dw  10  
 x      dw  0
dseg ends
CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG
begin:
     mov ax, dseg
     mov ds, ax
     
     inchuoi msg1   
     call nhapchuoi 
     inchuoi xuongdong    
     inchuoi msg2
     call xuatkq
    
        
     mov ah, 4ch
     int 21h
     
nhapchuoi PROC
     xor dx, dx    
     xor cx, cx
     nhap:
        mov ah, 01h
        int 21h
        
        cmp al, 32
        je  kiemtra
       
        cmp al, 0Dh
        je  ketthuc
        
        sub al, 30h
        
        mov cl, al 
        mov ax, dx
        mov bx, so10
        mul bx
        
        add al, cl
        mov dx, ax  
        
        jmp nhap 
        
        ketthuc:  
            mov ch, al 
        
        
        kiemtra: 
             mov x, dx
             cmp x, 2
             je lasnt   
             
             cmp x, 1  
             je exitxuly  
             
             mov bx, 2
             xor dx, dx
         lapchia:  
            
                mov ax, x
                div bx  
                
                cmp bx, x
                je lasnt 
                
                cmp dx, 0
                je exitxuly  
                xor dx, dx
                inc bx  
                jmp lapchia
        
     
     
          lasnt:
                inc snt 
            
          exitxuly:    
          
                 cmp ch, 0DH
                 je exit
                 
                 xor dx, dx
                 jmp nhap
        
     
     exit: 
     
        ret
nhapchuoi ENDP   


xuatkq proc  
     xor cx, cx
     mov bx, so10 
     mov ax, snt
     xuat: 
        xor dx, dx 
        div bx
        push dx
        inc cx
        cmp ax, 0
        jnz xuat
     inra:
        mov ah, 2
        pop dx
        add dl, 30h
        int 21h
        loop inra
    
    
xuatkq endp




cseg ends
end begin