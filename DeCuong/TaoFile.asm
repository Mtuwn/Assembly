inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
    
    mov ah, 02h
    mov dl, 0Ah
    int 21h 
    
    mov ah, 02h
    mov dl, 0Dh
    int 21h
endm

dseg segment
    max db 250 
    len db ?
    tenfile 250 dup (?)
    thefile dw ?
    msg1 db "Nhap ten file: $"   
    msg2 db 10, 13, "Nhap noi dung file: $" 
    string dw 251, ?, 250 dup ('$')
dseg ends

cseg segment
assume: cs:cseg, ds:dseg
begin:   
    mov ax, dseg
    mov ds, ax    
    
    inchuoi msg1
    mov ah, 0Ah
    lea dx, max
    int 21h
           
    xor cx, cx
    mov cl, len
    lea bx, tenfile         
    add bx, cx              
    mov byte ptr [bx], 0    
    
    mov ah, 3ch             
    lea dx, tenfile
    mov cx, 0
    int 21h
    mov thefile, ax
    
    inchuoi msg2
    mov ah, 0Ah
    lea dx, string
    int 21h   
    
    lea si, string + 1       
    mov al, [si]
    mov len, al
    
    mov ah, 40h              
    mov bx, thefile
    mov cl, len
    lea dx, string + 2
    int 21h
    
    mov bx, thefile
    mov ah, 3eh
    int 21h
    
    mov ah, 4ch
    int 21h
cseg ends
end begin