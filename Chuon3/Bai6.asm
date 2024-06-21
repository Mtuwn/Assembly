dseg segment
     crlf   db  10,13,'$'
     A    db  30 dup('$')    
     B    db  30 dup('$')   
     temp db   ?   
     so1  dw    0   
     so2  dw    0
dseg ends
cseg segment
    assume cs: cseg, ds: dseg
start:
        mov ax, dseg
        mov ds, ax
        
        mov ah, 0Ah
        lea dx, A
        int 21h    
        
        lea si, A+2 
        mov cl, A+1  
        mov temp, cl  
            
            
        Tinh1:  
           xor ax, ax
           xor bx, bx  
           xor cx, cx 
           
           mov cl, temp 
           sub cl, 1
           mov al, 1 
           cmp cl, 0
           JE TiepTuc1
           quaylui1: 
               mov bl, 10
               mul bl 
               loop quaylui1
               
           mov bl, [si]
           sub bl, 30h
           mul bx
           add so1, ax
           dec temp
           inc si
           cmp temp, 0 
           JA Tinh1 
         
         TiepTuc1:  ; Tinh not so o hang don vi 
           mov bl, [si]
           sub bl, 30h
           mul bx
           add so1, ax     
        
        
        mov ah, 09h
        lea dx, crlf
        int 21h 
           
        mov ah, 0Ah
        lea dx, B
        int 21h    
        
        lea si, B+2 
        mov cl, B+1  
        mov temp, cl  
        
        ; Quy doi String-> int  
        Tinh2:  
           xor ax, ax
           xor bx, bx  
           xor cx, cx 
           
           mov cl, temp 
           sub cl, 1
           mov al, 1 
           cmp cl, 0
           JE TiepTuc2
           quaylui2: 
               mov bl, 10
               mul bl 
               loop quaylui2  
               
           mov bl, [si]
           sub bl, 30h
           mul bx
           add so2, ax
           dec temp
           inc si
           cmp temp, 0 
           JA Tinh2 
         
         TiepTuc2:  ; Tinh not so o hang don vi 
           mov bl, [si]
           sub bl, 30h
           mul bx
           add so2, ax    
                          
         mov ah, 09h
         lea dx, crlf
         int 21h
         
         mov ax, so1
         add ax, so2
         xor cx, cx 
         
         
        
         Lapchia: 
                
             xor dx,dx

             mov bx, 10   
             div bx
             add dx, 30h
             push dx
             inc cx
             cmp ax,0
             jne Lapchia
         
         Hienthi:
            pop dx
            mov ah,2 
            int 21h
            loop Hienthi
         
           
       
cseg ends
end start