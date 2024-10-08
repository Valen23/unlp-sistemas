PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H
ORG 1000H
MSJ DB "Hola buenas tardes."
FIN DB ?
ORG 3000H
INI_PIO:
MOV AL, 0FDH ; 11111101 STROBE EN 0 Y BUSY EN 1
OUT CA, AL
MOV AL, 0 ; TODO EL DATA EN SALIDA
OUT CB, AL
RET

POLL:
IN AL, PA ; LEEMOS PARA VER EL ESTADO DEL BUSSY
AND AL, 1 ; VEMOS EL ESTADO DEL BUSY
JNZ POLL ; SI EL BUSSY ESTÁ EN 1, HACE LA CONSULTA DE ESTADO OTRA VEZ
RET ; LA IMPRESORA SE LIBERÓ

FLANCO_ASCENDENTE:
IN AL, PA ; TOMO EL ESTADO DEL STROBE
OR AL, 2 ; FUERZO EL STROBE A 1
OUT PA, AL ; MANDO EL STROBE FORZADO
IN AL, PA ; TOMO EL ESTADO DEL STROBE
AND AL, 0FDH ; FUERZO EL STROBE A 0
OUT PA, AL ; MANDO EL STROBE FORZADO
RET

ORG 2000H
CALL INI_PIO ; CONFIGURO EL PIO

MOV BX, OFFSET MSJ ; MUEVO EL MENSAJE A ESCRIBIR

LOOP:
CALL POLL ; LLAMAMOS A LA SUBRUTINA DE CONSULTA DE ESTADO

MOV AL, [BX] ; MANDAMOS EL CARACTER DESEADO A AL PARA PODER ENVIARLO A E/S
OUT PB, AL ; MANDAMOS EL CARACTER AL DATA

CALL FLANCO_ASCENDENTE

INC BX
CMP BX, OFFSET FIN
JNZ LOOP
INT 0
END

; El envío de la señal de strobe se puede modularizar en una subrutina para ser
; reutilizado en distintas ocasiones. Implementar una subrutina flanco_ascendente
; que envía el flanco ascendente (un 0 y luego un 1) a través del strobe.
; Asumir que el PIO ya está configurado correctamente para comunicarse con la
; impresora.