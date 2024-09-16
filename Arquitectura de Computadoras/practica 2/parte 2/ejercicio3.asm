PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H
ORG 3000H
FLANCO_ASCENDENTE:
MOV AL, PA ; TOMO EL REGISTRO
AND AL, 11111101B ; FUERZO EL STROBE A 0 (FLANCO DESCENDENTE)
OUT PA, AL ; ENVIO EL REGISTRO FORZADO
MOV AL, PA ; LO TOMO NUEVAMENTE
OR AL, 00000010B ; FUERZO EL STROBE A 1 (FLANCO ASCENDENTE)
OUT PA, AL ; ENVIO EL REGISTRO FORZADO
IRET
END

; El envío de la señal de strobe se puede modularizar en una subrutina para ser
; reutilizado en distintas ocasiones. Implementar una subrutina flanco_ascendente
; que envía el flanco ascendente (un 0 y luego un 1) a través del strobe.
; Asumir que el PIO ya está configurado correctamente para comunicarse con la
; impresora.