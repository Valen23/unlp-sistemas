ORG 1000h
MENSAJE DB "Eyyy muy buenas a todos guapisimos"
C DB 61h
ORG 3000H
CONTAR_CAR:
MOV BX, OFFSET MENSAJE
MOV AL, OFFSET C - OFFSET MENSAJE
MOV AH, C
MOV CL, 0
BUCLE: CMP AH, [BX]
JZ SUMAR
JMP AVANZAR
SUMAR: INC CL
JMP AVANZAR
AVANZAR: 
INC BX
DEC AL
JZ FIN
JMP BUCLE
FIN: RET
ORG 2000H
CALL CONTAR_CAR
HLT
END

; Recibe la dirección de comienzo de un string en BX, su longitud en AL, y el
; carácter a contar en AH. Retorna en CL la cantidad de veces que aparece el carácter.
