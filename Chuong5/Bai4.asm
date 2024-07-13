inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

dseg segment
    max db 250           ;so ky tu toi da   
    len db ?             ;chieu dai chuoi da nhap   
    tenfile db 250 dup(?)    
    
    max1 db 250           ;so ky tu toi da   
    len1 db ?  
    tenfile1 db 250 dup(?)   
    
    max2 db 250           ;so ky tu toi da   
    len2 db ?  
    tenfile2 db 250 dup(?)
    
        
    xuongdong db 10,13,'$'      
    msg1 db 'Nhap duong dan thu nhat: $'   
    msg2  db 'Nhap duong dan thu 2: $' 
    msg3  db 'Nhap duong dan de luu: $'  
    
    thefile dw ?           
    thefile1 dw ?     
    thefile2 dw ?
    
    buffer_len dw ? 
    buffer1_len dw ?
    buffer db 250 dup ('$')     
    buffer1 db 250 dup ('$')
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
    
    ; doc file thu Hai va luu noi dung vao bien buffer1 do dai luu vao bien  buffer1_len
    inchuoi msg2
    mov ah, 0ah
    lea dx, max1
    int 21h 
    inchuoi xuongdong 
    
    xor cx, cx     
    mov cl, len1
    lea bx, tenfile1         ;con tro o dau chuoi
    add bx, cx              ;+cx de con tro ve cuoi chuoi
    mov byte ptr [bx], 0    ;them 0 vao cuoi chuoi  
      
    
    mov ah, 3dh ; mo tap tin da co
    lea dx, tenfile1
    mov al, 2 ; thuoc tinh tap tin
    int 21h  
    
    mov thefile1, ax ; cat the file
    
    mov ah, 3fh ; doc noi dung file vao vung dem
    mov bx, thefile1
    lea dx, buffer1
    mov cx, 250 ; so byte can doc tu file da mo
    int 21h     
    mov buffer1_len, ax ; luu so byte thuc su doc vao 
    mov ah, 3eh ; dong tap tin
    
    ; Luu noi dung cua buffer va buffer1 vao file moi
    inchuoi xuongdong
    inchuoi msg3  
    
    mov ah, 0ah
    lea dx, max2
    int 21h 
    
    inchuoi xuongdong
    
    xor cx, cx     
    mov cl, len2
    lea bx, tenfile2         ;con tro o dau chuoi
    add bx, cx              ;+cx de con tro ve cuoi chuoi
    mov byte ptr [bx], 0    ;them 0 vao cuoi chuoi  
                    

    mov ah, 3ch                         
    lea dx, tenfile2
    mov cx, 2  
    int 21h
    mov thefile2, ax                     
    ; Mo file ghi vao dau file 
    mov ah, 42h  
    mov al, 0                      
    xor cx, cx
    xor dx, dx
    mov bx, thefile2
    int 21h 


    mov ah, 40h                         
    mov bx, thefile2
    mov cx,  buffer_len                      
    lea dx, buffer
    int 21h 
    
    ;Mo file ghi vao cuoi file
    mov ah, 42h  
    mov al, 2                      
    xor cx, cx
    xor dx, dx
    mov bx, thefile2
    int 21h 
    mov ah, 40h                         
    mov bx, thefile2    
    mov cx, buffer1_len                   
    lea dx, buffer1
    int 21h

    mov ah, 3eh                         
    mov bx, thefile2
    int 21h     

    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin





