.model small
.stack 100h
.data 
    soKiTu  db  13,10, 'So ki tu vua nhap la: $'
    String  db  dup 50  ('$')
.code
Main proc
        mov ax, @data
        mov ds, ax
        
        mov cx, 0
        
        lea si, String
        
        lap:
            mov ah, 1
            int 21h
            
            cmp al, 13
                                   
            je nhapXong
            
            inc cx  
            mov [si], al
            inc si
            jmp lap ; nhay khong dieu kien
         
         nhapXong:
            mov ah, 9
            lea dx, soKiTu
            int 21h
            
            mov dl, cl
            add dl, '0'       
            
            mov ah, 2
            int 21h
            
            mov ah, 4ch
            int 21h
main endp
end main