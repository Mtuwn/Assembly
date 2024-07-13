inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm 

dseg segment 
    max db 255
    len db ?
    string db 255 dup (?)
    msg1 db 'Nhap 1 chuoi: $'
    msg2 db 10, 13, 'Chuoi chua ky tu can tim $'
    msg3 db 10, 13, 'Chuoi khong chua ky tu can tim $' 
dseg ends  

cseg segment
assume cs:cseg, ds:dseg, es: dseg
begin: 
    mov ax, dseg
    mov ds, ax
    mov es, ax 
    
    inchuoi msg1
    mov ah, 0Ah
    lea dx, max
    int 21h
   
    xor cx,cx                
    mov cl, len         
    mov al, 'a'         
    lea di, string     
    
    repne scasb         
    jne khong_chua     
    inchuoi msg2 
    jmp thoat   
    
    khong_chua: 
    inchuoi msg3
    
    thoat: 
    mov ah, 4ch 
    int 21h
cseg ends
end begin