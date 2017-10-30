    org 100h
    mov dx,msg
    mov ah,9
    int 21h
    mov ah,4Ch
    int 21h
    msg db 'Hello world',0Dh,0Ah,'$'
