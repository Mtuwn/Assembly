inchuoi MACRO chuoi
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM

DSEG SEGMENT
    msg1 DB 'Nhap so thu nhat (hex): $'
    msg2 DB 'Nhap so thu hai (hex): $'
    msg3 DB 'Tong 2 so la (hex): $' 
    xdong DB 10, 13, '$'
    so1 DW ?
    so2 DW ?
DSEG ENDS

CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG  
begin: 
    MOV AX, DSEG
    MOV DS, AX 
    
    inchuoi msg1
    CALL hex_in
    MOV so1, BX     
    inchuoi xdong 
        
    inchuoi msg2
    CALL hex_in
    MOV so2, BX 
    inchuoi xdong  
    
    mov ax, so1
    add ax, so2
    MOV BX, AX   
    
    inchuoi msg3
    CALL hex_out 
    
    MOV AH, 02     
    MOV DL, 'h'
    INT 21h
    MOV AH, 4Ch 
    INT 21h 
    
hex_in PROC
    MOV BX, 0     
    nhap:
        MOV AH, 01h     
        INT 21h    
        
        cmp al, 0DH
        je exit
        cmp al, '9'
        jbe convert_so
        ja convert_chu
        
        convert_so:
            sub al, 30h
            jmp done
        
        convert_chu:
            sub al, 37h    
        
        done:
        SHL BX, 4       
        add BL, aL      

        jmp nhap
    exit:
        RET
hex_in ENDP   
    
hex_out PROC

    xuat:
        MOV DX, BX
        SHR Dx, 12 
        
        CMP DL, 09h
        JA kytu   
        
        ADD DL, 30h     
        JMP inra 
        
        kytu:
            ADD DL, 37h
        
        inra:
            MOV AH, 02h 
            INT 21h
            SHL BX, 4 
            cmp  BX, 0
            
            jne xuat
            
       
    RET
hex_out ENDP  

CSEG ENDS
END begin