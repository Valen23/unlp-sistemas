ORG 1000H
MSJ DB "ARQUITECTURA DE COMPUTADORAS-"
DB "FACULTAD DE INFORMATICA-"
DB 55H
DB 4EH
DB 4CH
DB 50H
FIN DB ?
ORG 2000H
MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN - OFFSET MSJ
INT 7
INT 0
END

; ------------------------------------------------------------------------------------------
; | a) Ejecutar en el simulador ¿qué imprime?                                              |
; | b) ¿Por qué imprime “UNLP” al final?                                                   |
; | c) Con referencia a la interrupción INT 7, ¿qué se almacena en los registros BX y AL?  |
; ------------------------------------------------------------------------------------------

; a) imprime "ARQUITECTURA DE COMPUTADORAS-FACULTAD DE INFORMATICA-UNLP"
; b) imprime UNLP ya que estan dentro de la longitud indicada y además estan sus valores hexadecimal reservados en memoria
; c) BX indica la posicion en memoria de la variable MSJ y AL la longitud del texto a imprimir
