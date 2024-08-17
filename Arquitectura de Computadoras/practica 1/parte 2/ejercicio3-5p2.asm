ORG 1000H
A DB ?
ORG 2000H
mov al, 1
mov bx, offset A
int 6
int 7
hlt
END

; agregamos INT 7
; agregamos MOV AL, 1
