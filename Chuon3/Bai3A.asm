DSEG SEGMENT
    tbao1 DB 10,13, "Ky tu HOA $"
    tbao2 DB 10,13,"Ky tu thuong $"
DSEG ENDS
CSEG SEGMENT
ASSUME CS: CSEG, DS: DSEG
start:
    mov ax, DSEG
    mov ds, ax  
    
    mov ah, 01h 
    int 21h  
    
    mov cl, al
    
    cmp al,'Z'
    jna nhan   ; nhay neu lon hon
    
    jmp exit
    
    nhan: 
        mov ah, 09 
        lea dx, tbao2
        int 21h
        
        mov ah, 02h
        add cl, 32
        mov dl, cl 
        int 21h
        Mov ah,4Ch
        Int 21h
    
    exit:
    mov ah, 9
    lea dx, tbao1    
    int 21h
    
    mov ah, 02h
    sub cl, 32
    mov dl, cl 
    int 21h

    mov ah, 4Ch 
    int 21h
CSEG ENDS
END start
