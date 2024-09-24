DATO EQU 40H
ESTADO EQU 41H

ORG 1000H
MSJ DB "GABE NEWELL"
FIN DB ?

ORG 2000H
IN AL, ESTADO ; TOMO EL ESTADO
AND AL, 07FH ; AL ESTADO LE CAMBIO EL VALOR AL ESTADO
OUT ESTADO, AL
MOV BX, OFFSET MSJ
POLLING:
IN AL, ESTADO ; TOMO EL ESTADO ACTUAL
AND AL, 1 ; VERIFICO SI BUSY = 1
MOV AL, [BX]  ; MUEVO EL DATO A IMPRIMIR
OUT DATO, AL ; MANDO EL DATO
INC BX ; INCREMENTO LA POSICION DEL MENSAJE
CMP BX, OFFSET FIN ; VERIFICO SI LA POSICION ES EL FIN
JNZ POLLING
INT 0
END

; CASO 1: Con la velocidad de impresión en 100% y la de
; reloj al 25% el simulador alcanza a imprimir
; correctamente ya que el procesador es capaz de
; manejar esa cantidad de instrucciones.

; CASO 2: La impresora es incapaz de manejar esa cantidad
; de información por lo que el programa sigue y quedan
; letras en el buffer.