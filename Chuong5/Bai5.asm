inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

dseg segment
    max db 250           ;so ky tu toi da   
    len db ?             ;chieu dai chuoi da nhap   
    tenfile db 250 dup(?)      
    xuongdong db 10,13,'$'      
    msg1 db 'Nhap duong dan: $'          
    thefile dw ?              
    buffer_len dw ? 
    buffer db 250 dup ('$')     

dseg ends   

cseg segment
assume cs:cseg, ds:dseg
begin: 
    mov ax, dseg
    mov ds, ax  
    ; doc file thu nhat va luu noi dung vao bien buffer do dai luu vao bien  buffer_len
    inchuoi msg1
    mov ah, 0ah
    lea dx, max
    int 21h 
    inchuoi xuongdong 
    
    xor cx, cx     
    mov cl, len
    lea bx, tenfile         ;con tro o dau chuoi
    add bx, cx              ;+cx de con tro ve cuoi chuoi
    mov byte ptr [bx], 0    ;them 0 vao cuoi chuoi  
      
    
    mov ah, 3dh ; mo tap tin da co
    lea dx, tenfile
    mov al, 2 ; thuoc tinh tap tin  (read/write)
    int 21h  
    
    mov thefile, ax ; cat the file
    
    mov ah, 3fh ; doc noi dung file vao vung dem
    mov bx, thefile
    lea dx, buffer
    mov cx, 250 ; so byte can doc tu file da mo
    int 21h 
    mov buffer_len, ax ; luu so byte thuc su doc vao    
    
    mov ah, 3eh ; dong tap tin
    
    ;xu ly
    
    mov cx, buffer_len 
    lea si, buffer
    
    xuly:
       xor ax, ax   
       mov al, [si]    
       cmp al, 'A'
       jb next_char
       cmp al, 'Z'
       ja next_char
       add al, 20h   
     
    next_char: 
        mov [si], al
        inc si
        loop xuly  
        
    mov ah, 09h
    lea dx, buffer
    int 21h 
    
    mov ah, 3ch                         
    lea dx, tenfile
    mov cx, 2  
    int 21h   
    
    
    mov ah, 42h  
    mov al, 0                      
    xor cx, cx
    xor dx, dx
    mov bx, thefile
    int 21h 
    mov ah, 40h                         
    mov bx, thefile    
    mov cx, buffer_len                   
    lea dx, buffer
    int 21h

    mov ah, 3eh                         
    mov bx, thefile
    int 21h  

    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin





