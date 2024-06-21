inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm    

dseg segment
    msg1 DB "Hay nhap 1 ky tu: $"
    msg2 DB "Ma ASCII o dang Hex: $" 
    msg3 DB "Ma ASCII o dang Dec: $"
    msg4 DB "Ma ASCII o dang Bin: $"
    xdong DB 10, 13, '$'
    kytu DB ?
dseg ends

cseg segment
    assume cs: cseg, ds: dseg
begin:
    mov ax, dseg
    mov ds, ax
    
    inchuoi msg1
    
    mov ah, 01h
    int 21h
    mov kytu, al     
    
    inchuoi xdong
    inchuoi msg2
    mov bl, kytu
    call hex_out
    mov ah, 02h  
    mov dx, 'h'
    int 21h
    
    inchuoi xdong
    inchuoi msg3
    xor ax, ax
    mov al, kytu
    call dec_out   
    
    inchuoi xdong
    inchuoi msg4
    mov bl, kytu
    call bin_out
    mov ah, 02h  
    mov dx, 'b'
    int 21h
            
            
    
    mov ah, 04h
    int 21h
    

hex_out proc
    mov cx, 2
    xuat:
        mov dl, bl
        shr dl, 4  
        
        cmp dl, 09h
        ja convert_kitu
        
        add dl, 30h
        jmp print_hex
        
        
        convert_kitu: 
            add dl, 37h
        
        print_hex:
            mov ah, 02h
            int 21h
            shl bl, 4
            
         loop xuat
      ret
hex_out endp   

dec_out proc  
    xor cx, cx
    mov bx, 10
    chia10:
        xor dx, dx  
        div bx
        push dx
        inc cx  
        cmp ax, 0
        jnz chia10
    print_dec:
        MOV AH, 2 
        POP DX 
        ADD DL, 30h 
        INT 21h
        LOOP print_dec
    ret   

dec_out endp

bin_out proc  
    mov cx, 8
    
    print_bin:
        xor dx, dx
        shl bl, 1
        rcl dl, 1
        add dl, 30h
        mov ah, 02h
        int 21h
        loop print_bin
     
    ret
        

bin_out endp


cseg ends
end begin
        
    