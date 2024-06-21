dseg segment
     StringA    db  10,13 ,"Good morning$"
     StringB    db  10,13, "Good Afternoon!$"
     StringC    db  10,13, "Good everning!$"
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
    
    cmp kiTu, 'S'
    JE  XuatStringA  
    cmp kiTu, 's'
    JE  XuatStringA
    
    cmp kiTu, 'T'
    JE  XuatStringB  
    cmp kiTu, 't'
    JE  XuatStringB
    
    cmp kiTu, 'C'
    JE  XuatStringC  
    cmp kiTu, 'c'
    JE  XuatStringC
    
    XuatStringC:
        mov ah, 09h
        lea dx, StringC
        int 21h 
        jmp EndProgram 
        
    XuatStringB:
        mov ah, 09h
        lea dx, StringB
        int 21h 
        jmp EndProgram 
        
    XuatStringA:
        mov ah, 09h
        lea dx, StringA
        int 21h 
        jmp EndProgram
     
    EndProgram:
        mov ah, 04ch
        int 21h  
        
    
    
    

cseg ends
end start