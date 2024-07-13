inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

dseg segment
    msg1    db  "Nhap ma sv (x de thoat): $"
    str     db  100 dup("$")
    msv     db  "AT180249$"
    hoten   db  "Tran Minh Tuan$"
    msg2    db  "Ho ten: $"
    msg3   db  "Sai ma sinh vien $"
    xuongdong   db  10,13, "$" 

dseg ends

cseg segment 
    assume cs:cseg, ds:dseg , es:dseg
begin:
    mov ax, dseg
    mov ds, ax 
    mov es, ax     
    
    Nhap:
        inchuoi msg1
        mov ah, 0Ah
        lea dx, str
        int 21h
    
    inchuoi xuongdong  
    
    lea si, str+2    
    lea di, msv

    cmp [si], 'x'
    je exit
    
    xor cx, cx  
    mov cl,str+1
    cmp cl, 8
    jne saiKetQua
     
    repe cmpsb 
    je xuatkq 
     
    saiKetQua:
        inchuoi msg3   
        inchuoi xuongdong
        jmp Nhap
    
    
    xuatkq:
        inchuoi msg2
        inchuoi hoten 
    exit:
        mov ah, 4ch
        int 21h
        
    
    
cseg ends
end begin
    
