DSEG SEGMENT
    chuoi db "89$" ,0
DSEG ENDS

CSEG SEGMENT
ASSUME CS: CSEG
start:  
        mov ax, DSEG
        mov ds, ax
        mov ah, 02h
        mov dl, 'D' 
        int 21h
        mov ah, 08h 
        int 21h  
        
        
        mov ah, 07h   
        int 21h   
        mov dl, al
        
        mov ah, 02h
        int 21h
        
        lea dx, chuoi
        mov ah, 09h
        int 21h  
      
        mov ah, 4Ch 
        int 21h
CSEG ENDS
END start     



    
