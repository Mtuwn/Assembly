dseg segment
    soKiTu  db  13,10, 'So ki tu vua nhap la: $'
    String  db  dup 50  ('$')  
dseg ends
cseg segment
    assume cs: cseg, ds: dseg
start:
        mov ax, dseg
        mov ds, ax
        
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
         
         mov ah, 4ch
         int 21h
cseg ends
end start