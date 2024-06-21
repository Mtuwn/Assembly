dseg segment
    xuongdong   db  10,13, '$'
dseg ends
CSEG SEGMENT
    ASSUME CS: CSEG ds: dseg
start:
    mov ax, dseg
    mov ds, ax      
    
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

