inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

dseg segment
    old_max db 250
    old_len db ? 
    oldfile 250 dup (?) 
     
    new_max db 250
    new_len db ?   
    newfile 250 dup (?)      
    
    tbao1 db "Nhap ten file cu: $" 
    tbao2 db 10, 13, "Nhap ten file moi: $"  
dseg ends

cseg segment
assume: cs:cseg, ds:dseg
begin:   
    mov ax, dseg
    mov ds, ax   
    
    inchuoi tbao1
    mov ah, 0Ah
    lea dx, old_max
    int 21h
           
    xor cx, cx
    mov cl, old_len
    lea bx, oldfile         
    add bx, cx             
    mov [bx], 0    
    
    inchuoi tbao2
    mov ah, 0Ah
    lea dx, new_max
    int 21h
    
    xor cx, cx
    mov cl, new_len
    lea bx, newfile         
    add bx, cx              
    mov byte ptr [bx], 0    
    
    mov ah, 56h             
    lea dx, oldfile
    lea di, newfile
    int 21h 
    
    mov ah, 4ch
    int 21h
cseg ends
end begin