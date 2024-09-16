PA EQU 30H
CA EQU 32H
ORG 1000H
SI DB "OCUPADA"
NO DB "LIBRE"
ORG 2000H
MOV AL, 0FEH ;-- CONFIGURAMOS STROBE EN 0 (SALIDA) Y BUSY EN 1 (ENTRADA)
OUT CA, AL
IN AL, PA
CMP AL, 0 ;-- COMPARO PA CON 0, SI ES 0 ESTÁ LIBRE, SI NO OCUPADA
JNZ OCUPADA
MOV BX, OFFSET NO ;-- MANDO EL MENSAJE
MOV AL, 5
INT 7
JMP FIN
OCUPADA: MOV BX, OFFSET SI
MOV AL, 7
INT 7;--
FIN: INT 0
END

; El siguiente programa tiene como objetivo verificar el bit de busy a
; través del PIO e imprimir “Ocupada” si la impresora está ocupada y “Libre” de
; lo contrario.