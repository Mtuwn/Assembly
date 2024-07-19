dseg segment
    max db 250              
    len db ?               
    tenfile db 250 dup(?)
dseg ends  

cseg segment
assume cs:cseg, ds:dseg
begin: 
    mov ax, dseg
    mov ds, ax  
    
    mov ah, 0ah
    lea dx, max
    int 21h
    
    xor cx, cx     
    mov cl, len
    lea bx, tenfile        
    add bx, cx              
    mov byte ptr [bx], 0   
    
    mov ah, 41h 
    lea dx, tenfile
    int 21h
    
    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin