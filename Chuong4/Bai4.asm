inchuoi MACRO chuoi      ;tuong tu ham
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM  

DSEG SEGMENT
    msg1 DB "Nhap so A (dec): $"
    msg2 DB "Nhap so B (dec): $"
    msg3 DB "A + B = $" 
    msg4 DB "A - B = $"
    msg5 DB "A and B = $"
    msg6 DB "A or B =  $"
    xdong DB 10, 13, '$'
    so1 dw ? 
    so2 dw ?
    so10 dw 10 

DSEG ENDS 

CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG
begin: 
    MOV ax, DSEG
    MOV DS, ax  
    
    inchuoi msg1
    call dec_in    
    MOV so1, DX 
    inchuoi xdong 
    
    inchuoi msg2
    call dec_in    
    MOV so2, DX 
    inchuoi xdong
    
    mov ax, so1
    add ax, so2
    mov bx, ax 
    inchuoi msg3
    MOV ax, BX 
    CALL dec_out
    inchuoi xdong 
    
    mov ax, so1
    sub ax, so2
    mov bx, ax 
    inchuoi msg4
    MOV ax, BX 
    CALL dec_out
    inchuoi xdong  
    
    mov ax, so1
    and ax, so2
    mov bx, ax 
    inchuoi msg5
    MOV AX, BX 
    CALL dec_out
    inchuoi xdong 
    
    mov ax, so1
    or ax, so2
    mov bx, ax 
    inchuoi msg6
    MOV AX, BX 
    CALL dec_out
    inchuoi xdong 
    
    MOV AH, 4Ch 
    INT 21h 

dec_in PROC 
    xor dx, dx
    
    nhap:
        mov ah, 1
        int 21h 
        cmp al, 0DH
        jz exit
        sub al, 30h
        
        mov cl, al
        mov ax, dx
        mov bx, so10
        mul bx  
        
        add al, cl
        mov dx, ax        
         
        jmp nhap
    exit:  
        RET
dec_in ENDP 

dec_out PROC
    XOR CX, CX 
    MOV BX, so10
    chia10: 
        XOR DX, DX    
        DIV BX         
        PUSH DX         
        
        INC CX
        CMP AX, 0
        JNZ chia10 
    inra: 
        MOV AH, 2 
        POP DX 
        ADD DL, 30h 
        INT 21h
        LOOP inra
    RET
dec_out ENDP 

CSEG ENDS
END begin