.model small
.stack 100h
.data
    string  db  'TraN^Minh&Tuan$'
.code
main proc
    mov ax, @data
    mov ds, ax     
    
    mov cx, 14
    
    lea si, string
    
    lap:    

        cmp [si], 'A'
        jb  continue   
        
        cmp [si], 'Z'
        ja continue
        
        add [si], 32
        
        continue:
            mov ah, 2
            mov dl, [si]
            int 21h
        
        inc si
        loop lap
    
    mov ah, 4ch
    int 21h

main endp
end main