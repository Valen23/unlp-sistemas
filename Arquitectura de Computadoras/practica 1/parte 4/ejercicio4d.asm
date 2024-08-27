ORG 1000h
A DB 4
B DB 4
RES DW ?
ORG 3000H
MUL:
MOV CX, 0
POP BX
POP AX
POP DX
PUSH BX
MOV AH, DL
LOOP: ADD CL, AL
DEC AH
JZ FIN
JMP LOOP
FIN:RET
ORG 2000H
MOV AX, 0
MOV AL, A
PUSH AX
MOV AL, B
PUSH AX
CALL MUL
HLT
END

; Pasando los parámetros por valor desde el programa principal
; a través de la pila, y devolviendo el resultado a través de
; un registro por valor
