dseg segment
     crlf   db  10,13,'$'
     kiTu    db  50,?, dup('$')
dseg ends
cseg segment
    assume cs: cseg, ds: dseg
start:
        mov ax, dseg
        mov ds, ax
        
        mov ah, 0Ah
        lea dx, kiTu
        int 21h
        
        mov ah, 09h
        lea dx, crlf
        int 21h
        lea si, kiTu+2  
        
        lapThuongThanhHoa:    
    
            cmp [si], 'a'
            jb  inhoa   
            cmp [si], 'z'
            ja inhoa
            
            sub [si], 32
            
            inhoa:
                mov ah, 2
                mov dl, [si]
                int 21h
            
            inc si     
            cmp [si], 0DH ; phim enter
            jne lapThuongThanhHoa 
            
        mov ah, 09h
        lea dx, crlf
        int 21h   
        lea si, kiTu+2  
        
        lapHoaThanhThuong:    
    
            cmp [si], 'A'
            jb  inthuong   
            cmp [si], 'Z'
            ja inthuong
            
            add [si], 32
            
            inthuong:
                mov ah, 2
                mov dl, [si]
                int 21h
            
            inc si     
            cmp [si], 0DH ; phim enter
            jne lapHoaThanhThuong
        
        mov ah, 4ch
        int 21h


       
cseg ends
end start