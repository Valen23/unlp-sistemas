ORG 1000H
A DB "ARQ"
B DB ?
ORG 2000H
mov al, 3
mov bx, offset A
int 7
hlt
END

; agregamos hlt al final
