dseg segment
    
     bai3       db      "Bai 3", 10,13, "$"
     
     kitu       db      ? 
     tbao       db      "Hay go 1 phim: $"   
     kitutrc    db      10,13,"Ki tu ke trc: $"
     kitusau    db      10,13, "Ki tu ke sau: $"
     
     
     
     bai4       db      10, 13,"Bai 4", 10,13, "$"
     xinchao    db      10, 13, "Xin chao $"
     ten        db      30 dup("$")
     

dseg ends

cseg segment
    assume cs:cseg, ds: dseg
start: 

    mov ax, dseg
    mov ds, ax   
    
    ; bai 3    
    
    mov ah, 09h
    lea dx, bai3
    int 21h
    
    mov ah, 09h
    lea dx, tbao
    int 21h
    
    mov ah, 01h
    int 21h
    
    mov kitu, al
    
    mov ah, 09h
    lea dx, kitutrc
    int 21h  
    
    mov ah, 02h
    mov dl, kitu
    sub dl, 1
    int 21h  
    
    mov ah, 09h
    lea dx, kitusau
    int 21h  
    
    mov ah, 02h
    mov dl, kitu
    add dl, 1
    int 21h  
    
    ; bai 4 
    
    mov ah, 09h
    lea dx, bai4
    int 21h   
    
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
  
    
    mov ah, 4ch
    int 21h
    
cseg ends

End start