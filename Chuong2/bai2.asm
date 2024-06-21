data segment
    A dw 1000
    B dw 10  
    C dw 1Fh     
    D dw 30h     
    E dw 300Ah  
    KQUA dw 0    
ends

stack segment
    dw 128 dup(0) 
ends

code segment
start:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov ax, A      
    add ax, B      
    sub ax, C       
    add ax, D      
    add ax, E       
    mov KQUA, ax   

    mov ax, 4C00h   
    int 21h         

ends
end start  