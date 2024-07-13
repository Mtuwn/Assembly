inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

dseg segment 
    msg1 db 'Nhap 1 chuoi: $'
    msg2 db 10, 13, 'So ky tu trong chuoi la: $' 
    string db 255 dup(?)
    dem db 10 dup(?)
dseg ends

cseg segment
assume: cs:cseg, ds:dseg
begin:   
    mov ax, dseg
    mov ds, ax
              
    inchuoi msg1
    mov cx, 0        
    lea si, string    

input:
    mov ah, 01h        
    int 21h 
    
    cmp al, 0Dh        
    je dem_ki_tu
          
    mov [si], al    
    inc si 
    inc cx            
    jmp input    
    
dem_ki_tu: 
    inchuoi msg2
    
    mov ax, cx     
    xor cx, cx
    jmp convert

convert:          
    xor dx, dx
    mov bx, 10
    div bx         
    add dx, 30h     
    push dx
    inc cx
    
    cmp ax, 0
    jne convert
    
print:      
    pop dx
    mov ah, 02h       
    int 21h
    loop print     
   
    mov ah, 4Ch       
    int 21h
    
cseg ends
end begin