[org 0x7c00]
jmp main

print_dec:
    mov ax, bx
    mov bx, 10
    mov cx, 0
    convert:
        mov dx, 0
        div bx
        push dx
        inc cx
        cmp ax, 0
        jne convert
    print:
        pop ax
        add al, 0x30
        mov ah, 0x0e
        int 0x10
        dec cx
        cmp cx, 0
        jne print
    ret

main:
    mov bp, 0x8000
    mov sp, bp
    mov bx, 12345
    call print_dec

jmp $
times 510-($-$$) db 0
db 0x55, 0xaa