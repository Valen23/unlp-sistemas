ORG 1000h
C DB "Z"
ORG 3000H
MAYUS:
MOV AL, C
MOV CL, 5Bh
CMP CL, AL
JS NO_ES
JMP ES_MAYUS
ES_MAYUS: MOV AH, 00H
JMP FIN
NO_ES: MOV AH, 0FFH
FIN: RET
ORG 2000H
CALL MAYUS
HLT
END

; Recibe un carácter en el registro AL y retorna en AH el valor 0FFh si es
; mayúscula y 0 de lo contrario.
