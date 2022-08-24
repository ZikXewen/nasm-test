mov ah, 0x0e
mov al, 'a'

odd:
    int 0x10
    sub al, 31
    cmp al, 'Z' + 1
    je end
    jmp even
even:
    int 0x10
    add al, 33
    cmp al, 'z' + 1
    je end
    jmp odd

end:
jmp $
times 510-($-$$) db 0 
db 0x55, 0xaa