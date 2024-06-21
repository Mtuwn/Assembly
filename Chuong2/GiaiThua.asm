.model small
.stack 100h
.data
    msg db 1, 13, "Nhap n: $"
    n   db  10,13, "n!= $"
    so10 dw 10
.code
Main proc
     mov ax, @data
    mov ds, ax
    
    nhapN:
        mov ah, 09h
        lea dx, msg
        int 21h
        
        mov ah,01h  ; 01h doc ki tu nhap vao tu ban phim
        int 21h
        
        cmp al, '_' ; so sanh xem trong thanh ghi al co ki tu _ hay khong
        je nhapN    ; neu co thi goi toi nhapN
        sub al, 30h 
                                                             
         
        mov cx, 0
        mov cl, al    
        
        mov ah, 09h
        lea dx, n
        int 21h
        
    mov ax, 1
    mov bx, 1
    
    gt: 
        mul bx  ; ax = ax*bx         
        inc bx  ; bx += 1
        cmp bx, cx    ; t - p if > 0: cf = 0 , zf = 10 elif  < 0 : cf = 1, zf = 0 else  = 0 : CF = 0, ZF = 1
        jbe gt ; bx <= cx: tiep tuc
    
    mov cx , 0
    
    pushStack:
        mov dx, 0
        div so10  ; phan nguyen o ax, phan du o dx
        add dx, 30h      ; chuyen no thanh ki tu
        push dx          ; day dx vao stack
        inc cx 
        cmp ax, 0
        jne pushStack
     
     popStack: 
        pop dx
        mov ah,02h
        int 21h
        loop popStack

    
    mov ah, 4ch
    int 21h
main endp
end main