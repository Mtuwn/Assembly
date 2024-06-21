inchuoi MACRO chuoi
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM      

DSEG SEGMENT
    msg1 DB "Hay nhap 1 ky tu: $"
    msg2 DB "Ma ASCII o dang Hex: $"
    xdong DB 10, 13, "$"
    kytu DB ?
DSEG ENDS
CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG   
begin: 
    MOV AX, DSEG
    MOV DS, AX 
    
    inchuoi msg1
    MOV AH, 01h
    INT 21h   
    
    MOV kytu, AL 
    inchuoi xdong
    inchuoi msg2  
    
    MOV BH, kytu 
    CALL hex_out 
    
    MOV AH, 02 
    MOV DL, "h"
    INT 21h   
    
    MOV AH, 01
    INT 21h    
    
    MOV AH, 4Ch 
    INT 21h
                  
    hex_out PROC
        MOV CX, 2 
        
        xuat:
            PUSH CX
            MOV CL, 4
            MOV DL, BH
            SHR DL, CL
            CMP DL, 09h
            JA nhan
            ADD DL, 30h 
            JMP inra  
            
        nhan:
            ADD DL, 37h 
            
        inra:
            MOV AH, 02h 
            INT 21h                                         
            SHL BX, CL 
            POP CX
            LOOP xuat
        RET 
        
    hex_out ENDP
CSEG ENDS
END begin

