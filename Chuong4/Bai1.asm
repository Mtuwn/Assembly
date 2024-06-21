inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm
dseg segment
    
   msg1         db  "Nhap so A(bin 16 bit): $"     
   msg2         db  "Nhap so B(bin 16 bit): $" 
   msg3         db  "A + B = $" 
   msg4         db  "A - B = $"
   msg5         DB  "A and B = $" 
   msg6         DB  "A or B =  $"
   xuongdong    db  10, 13, "$"
   A            dw  ?
   B            dw  ?
    
dseg ends

cseg segment
    assume cs:cseg, ds: dseg     
begin:
    
    mov ax,dseg
    mov ds, ax
    
    inchuoi msg1 
    call bin_in
    mov A, bx  
    
    inchuoi xuongdong   
    
    inchuoi msg2
    call bin_in
    mov B, bx        
    
    inchuoi xuongdong     
    inchuoi msg3
    
    mov ax, A
    add ax, B
    mov bx, ax

    jc overflow    ; if cf == 1: jump
    
    continue:
        call bin_out
    
    inchuoi xuongdong
    inchuoi msg4
    mov ax, A
    sub ax, B
    mov bx, ax
    call bin_out   
    
    inchuoi xuongdong
    inchuoi msg5
    mov ax, A
    and ax, B
    mov bx, ax
    call bin_out     
    
    inchuoi xuongdong
    inchuoi msg6
    mov ax, A
    or ax, B
    mov bx, ax
    call bin_out    
    
    mov ah, 4ch
    int 21h
    
    
    overflow: 
        mov dl, 1
        add dl, 30h
        mov ah, 02h
        int 21h
        jmp continue
    
    
    
    
bin_in proc
    mov cx, 16 
    xor bx, bx
    
    input:
        mov ah, 01h
        int 21h
        
        cmp al, 0DH
        jz exit
        shl bx, 1  
        sub al, 30h
        add bl, al
        loop input
     exit:
        ret
bin_in endp

bin_out proc
    mov cx, 16  
    
    output:
        xor dx, dx
        shl bx, 1
        rcl dl, 1
        
        add dl, 30h
        
        mov ah, 02h
        int 21h
        loop output
     ret
bin_out endp    
    
cseg ends
end begin
