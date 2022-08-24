[org 0x7c00]

mov ah, 0
mov bx, string
mov cx, 0
input:
    cmp cx, 10
    je end_input
    
    int 0x16
    mov [bx], al
    inc cx
    inc bx
    jmp input
end_input:

mov ah, 0x0e
mov bx, string
print:
    mov al, [bx]
    cmp al, 0
    je end_print

    int 0x10
    inc bx
    jmp print
end_print:

string:
    times 11 db 0

jmp $
times 510-($-$$) db 0
db 0x55, 0xaa