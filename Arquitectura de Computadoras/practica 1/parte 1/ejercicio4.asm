ORG 1000H
MENSAJE DB "Hola, Buenas Tardes"
FIN DB ?
ORG 2000H
MOV DX, OFFSET FIN - OFFSET MENSAJE ; obtenemos la longitud
MOV BX, OFFSET MENSAJE ; buscamos la dirección del mansaje
LOOP: MOV CL, [BX] ; movemos a CL, el valor del caracter
CMP CL, 65 ; ¿está en el rango de mayusculas?
JNS COMPARA ; + posible mayus. - no es mayus
JMP AUMENTADOR ; salta a otro caracter si está fuera de rango
COMPARA: CMP CL, 96 ; verifica si finalmente está dentro del rango
JS ES_MAYUSCULA ; si es negativo, es mayus, si no, no
JMP AUMENTADOR ; si no es mayuscula, cambia de caracter
ES_MAYUSCULA: ADD CL, 32 ; la etiqueta cambia de mayus a minuscula
MOV [BX], CL ; lo carga en memoria
DEC DX ; decrementa la longitud
JZ FINALIZAR ; si la longitud llegó a 0, finaliza
AUMENTADOR: INC BX ; la etiqueta aumentador cambia al siguiente caracter
DEC DX ; decrementa la longitud
JZ FINALIZAR ; si la longitud es 0, finaliza
JMP LOOP ; si no, salta a loop
FINALIZAR: ; finalizar imprime y termina el programa
MOV BX, 1000h
MOV AL, 19
INT 7
HLT
END

; ---------------------------------------------------------------------------------------------------------
; | Escribir un programa que convierta todos los carácteres de un string                                  |
; | MENSAJE a minúscula. Por ejemplo, si MENSAJE contiene “Hola, Buenas Tardes”, luego de ejecutar el     |
; | programa debe contener “hola, buenas tardes”.                                                         |
; ---------------------------------------------------------------------------------------------------------
