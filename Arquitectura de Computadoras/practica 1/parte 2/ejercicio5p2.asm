; no está terminado

ORG 1000H
PASSWORD    DB ?
            DB ?
            DB ?
            DB ?
SERVER_PASS DB "1234"
CORRECT DB "ACCESO PERMITIDO"
INCORRECT DB "ACCESO DENEGADO"
DIGITS DB 4
TRYS DB 5

ORG 2000H
MOV BX, OFFSET PASSWORD
MOV DL, DIGITS

PASSWORD_INPUT:
INT 6
INC BX
DEC DL
JNZ PASSWORD_INPUT
MOV DH, 4

VERIFICATION:
MOV BX, OFFSET PASSWORD
MOV CH, [BX]
MOV BX, OFFSET SERVER_PASS
MOV CL, [BX]
CMP CH, CL

MOV AH, TRYS
DEC AH
JZ DENEGATED_ACCESS
JMP PASSWORD_INPUT

DENEGATED_ACCESS:
MOV BX, OFFSET INCORRECT
MOV AL, 9

INT 3
HLT
END

; ----------------------------------------------------------------------------------------------------------------------
; | Escribir un programa que solicite el ingreso de una contraseña de 4                                                |
; | caracteres por teclado, sin visualizarla en pantalla. En caso de coincidir con una clave predefinida (y            |
; | guardada en memoria) que muestre el mensaje "Acceso permitido"; caso contrario mostrar el mensaje                  | 
; | "Acceso denegado", y volver a pedir que se ingrese una contraseña. Al 5to intento fallido, debe mostrarse el       |
; | mensaje “Acceso BLOQUEADO” y terminar el programa.                                                                 |
; ----------------------------------------------------------------------------------------------------------------------
