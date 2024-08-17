ORG 1000H
MSJ DB "INGRESE UN NUMERO:"
FIN DB ?
ORG 1500H
NUM DB ?
ORG 2000H
MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN-OFFSET MSJ
INT 7
MOV BX, OFFSET NUM
INT 6
MOV AL, 1
INT 7
MOV CL, NUM
INT 0
END

;  ---------------------------------------------------------------------------------------------------
; | a) Con referencia a la interrupción INT 6, ¿qué se almacena en BX?                               |
; | b) En el programa anterior, ¿qué hace la segunda interrupción INT 7?                             |
; | c) ¿Qué valor queda almacenado en el registro CL? ¿Es el mismo que el valor numérico ingresado?  |
;  ---------------------------------------------------------------------------------------------------

; a) la dirección donde se va a guardar el caracter ingresado
; b) setea AL en 1 y BX en 1500h, y con esa información setea el numero ingresado previamente
; c) guarda el hexadecimal del valor ascii del caracter ingresado
