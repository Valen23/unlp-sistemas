PA EQU 30H
CA EQU 32H
ORG 1000H
SI DB "OCUPADA"
NO DB "LIBRE"
ORG 2000H
MOV AL, 0FDh ;-- CONFIGURAMOS STROBE EN 0 (SALIDA) Y BUSY EN 1 (ENTRADA)
OUT CA, AL
LOOP: IN AL, PA
AND AL, 1
JNZ LOOP
MOV BX, OFFSET NO ;-- MANDO EL MENSAJE
MOV AL, 5
INT 7
INT 0
END

; El siguiente programa tiene como objetivo verificar el bit de busy a
; través del PIO e imprimir “Ocupada” si la impresora está ocupada y “Libre” de
; lo contrario.