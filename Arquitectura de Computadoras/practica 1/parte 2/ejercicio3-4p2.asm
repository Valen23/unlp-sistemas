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
; modificamos la linea 4 a de 3 a 1 caracter
