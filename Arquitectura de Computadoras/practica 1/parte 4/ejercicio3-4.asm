ORG 1000h
MENSAJE DB "Hola, QUE tal."
FIN DB ?
ORG 3000H
CONVERTIR:
MOV BX, OFFSET MENSAJE
MOV AL, OFFSET FIN - OFFSET MENSAJE
LOOP:
CMP BYTE PTR [BX], 64
JNS POSIBLE_MAYUS
JMP AVANZAR
POSIBLE_MAYUS:
CMP BYTE PTR [BX], 91
JS ES_MAYUS
JMP AVANZAR
ES_MAYUS:
ADD BYTE PTR [BX], 32
AVANZAR:
INC BX
DEC AL
JZ FINALIZAR
JMP LOOP
FINALIZAR:RET
ORG 2000H
CALL CONVERTIR
HLT
END

; Recibe la dirección de comienzo de un string en BX, su longitud en
; AL. Recorre el string, cambiando a minúscula las letras que sean 
; mayúsculas. No retorna nada, sino que modifica el string
; directamente en la memoria.
