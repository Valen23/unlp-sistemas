PB EQU 31h
CB EQU 33h
ORG 1000H
MSJ0 DB "APAGADA"
MSJ1 DB "ENCENDIDA"
FINM DB ?
ORG 2000h
MOV AL, 0
OUT CB, AL
MOV AL, 10000001b ; encendemos la que queramos para probar
OUT PB, AL
IN AL, PB
MOV AH, 128
CMP AH, AL
JS ESTA_ON
JZ ESTA_ON
MOV BX, OFFSET MSJ0
MOV AL, OFFSET MSJ1 - OFFSET MSJ0
INT 7
JMP FIN
ESTA_ON:
MOV BX, OFFSET MSJ1
MOV AL, OFFSET FINM - OFFSET MSJ1
INT 7
FIN: INT 0
end

; Verificar Llave Escribir un programa que verifique si la llave de más
; a la izquierda está prendida. Si es así, mostrar en pantalla el
; mensaje “Llave prendida”, y de lo contrario mostrar “Llave apagada”.
; Solo importa el valor de la llave de más a la izquierda (bit más significativo).
; Recordar que las llaves se manejan con las teclas 0-7.
