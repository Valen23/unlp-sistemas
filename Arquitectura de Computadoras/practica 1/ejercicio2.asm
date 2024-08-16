ORG 1000H
C DB "z"
RES DB ?
ORG 2000H
MOV AL, C
MOV CL, 90
MOV BX, OFFSET RES
CMP CL, AL
JS ES_MINUSCULA
JNS ES_MAYUSCULA
ES_MINUSCULA:
MOV BYTE PTR [BX], 00
JMP FIN
ES_MAYUSCULA: 
MOV BYTE PTR [BX], 0FFh
JMP FIN
FIN: HLT
END

; --------------------------------------------------------------------------------------------------------------
; | Escribir un programa que determine si un carácter (un string de longitud 1) es una                         |
; | letra mayúscula. El carácter está almacenado en la variable C, y el resultado se guarda en la variable     |
; | RES de 8 bits. Si C es mayúscula, debe almacenarse el valor 0FFh en RES; de lo contrario, debe             |
; | almacenarse 0. Pista: Los códigos de las mayúsculas son todos consecutivos. Buscar en la tabla ASCII       |
; | los caracteres mayúscula, y observar qué valores ASCII tienen la ‘A’ y la ‘Z’.                             |
; --------------------------------------------------------------------------------------------------------------
