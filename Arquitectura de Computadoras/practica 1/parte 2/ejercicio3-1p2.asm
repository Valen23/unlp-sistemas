ORG 1000H
A DB "HO LA"
B DB ?
ORG 2000H
mov bx, offset A
mov al, 5
int 7
hlt
END

; se arregla cambiando la linea 6,
; cambiamos el 4 por 5 o podemos hacer
; MOV AL, OFFSET B - OFFSET A
