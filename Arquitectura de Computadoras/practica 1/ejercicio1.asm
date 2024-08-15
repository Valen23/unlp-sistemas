ORG 1000H
MENSAJE DB "Ey muy buenas a todos guapisimos"
CANT DB 0
ORG 2000H
MOV BX, OFFSET MENSAJE ; pasamos la direccion del mensaje
MOV CH, OFFSET CANT - OFFSET MENSAJE ; obtenemos la cantidad de letras
MOV CL, CANT ; contador en 0
LOOP: MOV DL, [BX] ; pasamos la primer letra
CMP BX, OFFSET CANT ; verificamos si llegamos al final
JZ FIN ; finaliza si llegamos al final de 'MENSAJE'
INC BX ; aumentamos la direccion
CMP DL, 61h ; comparo letra con la 'a'
JZ ENCONTRO_LETRA ; si encuentra la letra, salta a la etiqueta
JMP LOOP ; vuelve al inicio
ENCONTRO_LETRA: INC CL ; incrementa el contador
JMP LOOP
FIN:HLT ; finaliza
END


; Escribir un programa que dado un string llamado MENSAJE, almacenado en la
memoria de datos, cuente la cantidad de veces que la letra ‘a’ (minúscula) aparece en MENSAJE y lo
almacene en la variable CANT. Por ejemplo, si MENSAJE contiene “Hola, Buenas Tardes”, entonces
CANT debe valer 3
