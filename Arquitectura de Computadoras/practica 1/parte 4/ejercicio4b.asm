ORG 1000h
A DB 4
B DB 4
RES DW ?
ORG 3000H
MUL:
MOV CH, 0
MOV CL, [BX]
LOOP:
ADD CH, [BX]
DEC CL
JZ FIN
JMP LOOP
FIN:RET
ORG 2000H
MOV AX, OFFSET A
MOV BX, OFFSET B
CALL MUL
HLT
END

; Pasando los parámetros por referencia desde el programa principal
; a través de registros, y devolviendo el resultado a través de
; un registro por valor.
