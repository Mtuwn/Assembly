inchuoi MACRO chuoi
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM  

DSEG SEGMENT
    msg1 DB "Hay nhap so nhi phan 8 bit: $"
    msg2 DB "So nhi phan da nhap la: $"
    xdong DB 10, 13, '$'
    sobin DB ?
DSEG ENDS   

CSEG SEGMENT
ASSUME CS:CSEG, DS:DSEG        
begin: 
    MOV AX, DSEG
    MOV DS, AX  
    
    inchuoi msg1
    CALL bin_in
    MOV sobin, BL 
    
    inchuoi xdong
    inchuoi msg2  
    
    MOV BL, sobin
    CALL bin_out
    MOV AH, 01 
    
    INT 21h
    MOV AH, 4Ch 
    INT 21h
    
    bin_in PROC
        MOV BL, 0 
        MOV CX, 8 
        nhap:
            MOV AH, 01h
            INT 21h
            CMP AL, 0Dh 
            JZ exit 
            SHL BL, 1 
            SUB AL, 30h 
            ADD BL, AL 
        LOOP nhap
    exit:RET  
    
    bin_in ENDP   
    
    bin_out PROC
    MOV CX, 8 
        xuat:
            MOV DL, 0
            SHL BL, 1 
            RCL DL, 1 
            ADD DL, 30h 
            MOV AH, 02h 
            INT 21h
        LOOP xuat
    RET
    bin_out ENDP
CSEG ENDS
END begin