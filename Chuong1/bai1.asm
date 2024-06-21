                       
.model small
.stack 100h
.data
.code
main:
    mov ax, @data
    mov ds, ax
    
    mov ax, 10       
    add ax, 8086  
    sub ax, 100h    
    add ax, 350      
    add ax, 0FAh     
    
    mov ax, 4C00h    
    int 21h          

end main
