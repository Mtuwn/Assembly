inchuoi MACRO chuoi
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM  

DSEG SEGMENT
    msg1 DB "Hay nhap so nhi phan 16 bit: $"
    msg2 DB "So nhi phan da nhap la: $"
    xdong DB 10, 13, '$'
    sobin Dw ?
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
    MOV AH, 01 
    
    INT 21h
    MOV AH, 4Ch 
    INT 21h
    
    bin_in PROC
        MOV Bx, 0 
        MOV CX, 16
        nhap:
            MOV AH, 01h
            INT 21h
            CMP Al, 0Dh 
            JZ exit 
            SHL Bx, 1 
            SUB Al, 30h 
            ADD Bl, Al 
        LOOP nhap
        exit:
            RET  
    
    bin_in ENDP   
    
    bin_out PROC
    MOV CX, 16 
        xuat:
            MOV Dl, 0
            SHL Bx, 1 
            RCL Dl, 1 
            ADD Dl, 30h 
            MOV AH, 02h 
            INT 21h
        LOOP xuat
    RET
    bin_out ENDP
CSEG ENDS
END begin