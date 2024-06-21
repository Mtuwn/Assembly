.model small
.stack 100h
.data
    a       db 15h 
    b       db 250         

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, a   
    mov bl, b  
    mul bl  ; ket qua luu o ax               

    MOV AH, 4CH
	INT 21H          

main endp
end main
