inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

dseg segment 
    max db 250           ;so ky tu toi da   
    len db ?             ;chieu dai chuoi da nhap   
    tenfile db 250 dup(?)
    string1 db 255, ?, 255 dup ('$')     
    thefile dw ?  
    xuongdong db 10,13,'$'      
    msg1 db 'Nhap duong dan: $'   
    msg2  db 'Nhap noi dung: $'            
dseg ends

cseg segment
assume cs:cseg, ds:dseg
begin:
    mov ax, dseg
    mov ds, ax 
    
    inchuoi msg1
    mov ah, 0ah
    lea dx, max
    int 21h 
    
    inchuoi xuongdong
    inchuoi msg2

    mov ah, 0Ah                         
    lea dx, string1
    int 21h   
    
    
    xor cx, cx     
    mov cl, len
    lea bx, tenfile         ;con tro o dau chuoi
    add bx, cx              ;+cx de con tro ve cuoi chuoi
    mov byte ptr [bx], 0    ;them 0 vao cuoi chuoi  

    mov si, offset string1 + 1
    mov al, [si]
    mov len, al                        

    mov ah, 3ch                         
    lea dx, tenfile
    mov cx, 0  
    int 21h
    mov thefile, ax                     
    
    mov ah, 42h  
    mov al, 2                      
    xor cx, cx
    xor dx, dx
    mov bx, thefile
    int 21h 

    mov ah, 40h                         
    mov bx, thefile
    mov cl, len                        
    lea dx, string1 + 2 
    int 21h

    mov ah, 3eh                         
    mov bx, thefile
    int 21h

    mov ah, 4ch                        
    int 21h
cseg ends

end begin
