ORG 1000h
A DB 5
B DB 3
RES DW ?
ORG 3000H
MUL:
MOV CL, 0
MOV CH, [BX]
MOV BX, AX
LOOP:
ADD CL, [BX]
DEC CH
JZ FIN
JMP LOOP
FIN:RET
ORG 2000H
MOV AX, OFFSET A
MOV BX, OFFSET B
CALL MUL
MOV RES, CX
HLT
END


; Pasando los parámetros por referencia desde el programa principal
; a través de registros, y devolviendo el resultado a través de
; un registro por valor.
