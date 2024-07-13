inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h 
endm 

dseg segment
    string db 255, 0, 255 dup ('$')  
    msg1 db 'Nhap 1 chuoi: $'
    msg2 db 10, 13, 'Dao nguoc: $'
ends dseg    

cseg segment
    assume cs:cseg, ds:dseg  
begin: 
    mov ax, dseg
    mov ds, ax   
    
    inchuoi msg1
    mov ah, 0Ah
    lea dx, string
    int 21h 
    
    inchuoi msg2
    xor cx, cx 
    mov cl, [string + 1]
    lea si, string + 2
     
    reverse:
        push [si]
        inc si
        loop reverse
    
    mov cl, [string + 1]
    print:
        pop dx
        mov ah, 02h
        int 21h
        loop print           
    
    mov ah, 4ch
    int 21h
cseg ends
end begin