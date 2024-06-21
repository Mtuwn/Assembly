dseg segment
     xinchao    db  10, 13, "Xin chao $"
     ten    db  30 dup("$")

dseg ends
cseg segment
    assume cs: cseg, ds: dseg
start:
    mov ax,dseg
    mov ds, ax
    
    mov ah, 0AH
    lea dx, ten
    int 21h
              
    mov ah, 09h
    lea dx, xinchao
    int 21h 
   
    mov ah, 09h  
    lea dx, ten + 2
    int 21h 
    
    mov ah, 4ch
    int 21h
    
cseg ends

    end start