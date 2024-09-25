PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
MSJ DB "HOLA"
FIN DB ?

ORG 2000H
MOV AL, 0FDH ; configuro el strobe de salida, el busy de entrada
OUT CA, AL
MOV AL, 0 ; todos salida
OUT CB, AL
MOV BX, OFFSET MSJ
LOOP:
IN AL, PA ; leemos el estado
AND AL, 1 ; verificamos si el busy esta en 1 o en 0
JNZ LOOP ; sigo consultando hasta que el busy este desocupado

MOV AL, [BX] ; mandamos el dato a pb
OUT PB, AL
IN AL, PA ; leemos el estado
OR AL, 2 ; forzamos el strobe a 1
OUT PA, AL ; lo enviamos
IN AL, PA ; leemos el estado
AND AL, 0FDH ; forzamos el strobe a 0
OUT PA, AL ; lo enviamos
INC BX ; pasamos de char
CMP BX, OFFSET FIN
JNZ LOOP
INT 0
END