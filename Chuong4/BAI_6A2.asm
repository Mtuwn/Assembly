inchuoi MACRO chuoi
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM  

DSEG SEGMENT
    msg1 DB "Nhap 1 ky tu: $"
    msg2 DB "Ma ascii cua ky tu o dang bin la: $"
    xdong DB 10, 13, '$'
    sobin dw ? 
DSEG ENDS   

CSEG SEGMENT
ASSUME CS:CSEG, DS:DSEG        
begin: 
    MOV AX, DSEG
    MOV DS, AX  
    

    inchuoi msg1
    CALL bin_in
    MOV sobin, Bx
    
    inchuoi xdong
    inchuoi msg2  
    
    MOV Bx, sobin
    CALL bin_out 
    
    MOV AH, 4Ch 
    INT 21h
    
    bin_in PROC
        mov ah, 1
        int 21h
        mov bl, al
        RET
    bin_in ENDP   
    
    bin_out PROC
    MOV CX, 8 
        xuat:
            MOV Dl, 0
            SHL Bl, 1 
            RCL Dl, 1 
            ADD Dl, 30h 
            MOV AH, 02h 
            INT 21h
        LOOP xuat
    RET
    bin_out ENDP
CSEG ENDS
END begin