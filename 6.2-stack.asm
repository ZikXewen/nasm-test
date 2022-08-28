[org 0x7c00]
mov bp, 0x8000
mov sp, bp
input:
    mov ah, 0
    int 0x16
    cmp al, 0x0d
    push ax
    jne input
mov ah, 0x0e
print:
    sub bp, 2
    mov al, [bp]
    int 0x10
    dec bx
    cmp sp, bp
    jne print

jmp $
times 510-($-$$) db 0
db 0x55, 0xaa