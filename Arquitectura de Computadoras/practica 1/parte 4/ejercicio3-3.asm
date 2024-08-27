ORG 1000h
C DB "A"
ORG 3000H
CONVERTIR:
MOV AL, C
ADD AL, 32
RET
ORG 2000H
CALL CONVERTIR
MOV C, AL
HLT
END

; Recibe un carácter mayúscula en AL y lo devuelve como minúscula.
