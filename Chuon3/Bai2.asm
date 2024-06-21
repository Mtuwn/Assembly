dseg segment
     kiTuKhac    db  10,13 ,"La Ki Tu Khac$"
     InHoa    db  10,13, "La Ki Tu in hoa$"
     InThuong    db  10,13, "la Ki Tu Thuong$"
     kiTu       db  ?
dseg ends
cseg segment
assume cs: cseg, ds: dseg  
start:
    mov ax, dseg
    mov ds, ax
    
    mov ah, 01h
    int 21h
    
    mov kiTu, al
    
    cmp kiTu, 'A' 
    JB xuatKiTuKhac   
    
    cmp kiTu, 'z'
    ja  xuatKiTuKhac
    
    cmp kiTu, 'a'
    jnb xuatKiTuThuong 
    
    jmp xuatKiTuInHoa
    
    
    xuatKiTuKhac:
        mov ah, 09h
        lea dx, kiTuKhac
        int 21h
        jmp EndProgram
    
    xuatKiTuInHoa:
        mov ah, 09h
        lea dx, InHoa
        int 21h
        jmp EndProgram
     
    xuatKiTuThuong:
        mov ah, 09h
        lea dx, InThuong
        int 21h
        jmp EndProgram
    
     EndProgram:
        mov ah, 04ch
        int 21h  
        

    

cseg ends
end start