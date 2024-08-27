ORG 1000h
A DB 3
B DB 4
RES DW ?
ORG 3000H
MUL:
MOV AH, AL
MOV DL, 0
LOOP:
ADD DL, CL
DEC AH
JZ FIN
JMP LOOP
FIN:
MOV BX, OFFSET RES
MOV [BX], DL
RET
ORG 2000H
MOV DX, 0
MOV AL, A
MOV CL, B
CALL MUL
HLT
END

; Pasando los parámetros por valor desde el programa principal
; a través de registros, y devolviendo el resultado a través de
; un registro por referencia.
