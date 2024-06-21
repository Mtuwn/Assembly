dseg segment
    xuongdong   db  10,13, '$'  
    soKiTu  db  13,10, 'So ki tu vua nhap la: $'
    String  db  dup 50  ('$') 
dseg ends
CSEG SEGMENT
    ASSUME CS: CSEG ds: dseg
start:
    mov ax, dseg
    mov ds, ax  
    ; Bai4
    
    mov cx, 0
        
        lea si, String
        
        lap:
            mov ah, 1
            int 21h
            
            cmp al, 0DH
                                   
            je nhapXong
            
            inc cx  
            mov [si], al
            inc si
            jmp lap ; nhay khong dieu kien
         
         nhapXong:
            mov ah, 9
            lea dx, soKiTu
            int 21h
              
            mov ax, cx 
            xor cx, cx 
            jmp Lapchia
           
            
            
         Lapchia:         
             xor dx,dx

             mov bx, 10   
             div bx
             add dx, 30h
             push dx
             inc cx
             cmp ax,0
             jne Lapchia
         
         Hienthi:
            pop dx
            mov ah,2 
            int 21h
            loop Hienthi
            
    mov ah, 09h  
    lea dx, xuongdong
    int 21h       
    
    ;Bai 3
    mov ah, 01h
    int 21h

    mov cl, al  
    
    mov ah, 09h  
    lea dx, xuongdong
    int 21h
     
    nhan: 
        mov dl, cl
        mov ah, 02h 
        int 21h 
        
        cmp cl, 'z'
        jb daucach 

        
    sosanh:
        inc cl  
        cmp cl, 'z' 
        jna nhan 
        mov ah, 08h 
        int 21h
        jmp ketthuc
        
        
    daucach: 
        mov dl, ' '
        mov ah, 02h 
        int 21h
        jmp sosanh
 
        
    ketthuc:
        mov ah, 4Ch
        int 21h  
        
        
    
        
        
CSEG ENDS
END start  



