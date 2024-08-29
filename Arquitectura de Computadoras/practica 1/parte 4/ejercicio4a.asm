ORG 1000h
A DB 6
B DB 6
RES DW ?
ORG 3000H
MUL:
DEC AH
LOOP:
ADD AL, A
DEC AH
JZ FIN
JMP LOOP
FIN:RET
ORG 2000H
MOV AL, A
MOV AH, B
CALL MUL
HLT
END

; Pasando los parámetros por valor desde el programa principal
; a través de los registros AL y AH, y devolviendo el resultado
; a través del registro AX por valor.
