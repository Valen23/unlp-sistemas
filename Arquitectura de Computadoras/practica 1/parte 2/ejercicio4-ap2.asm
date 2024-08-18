ORG 1000H
LETRA DB ?
ORG 2000H
MOV AL, 1
MOV BX, OFFSET LETRA
MOV AH, 64 ; uno mas que 'A'
LOOP: CMP AH, 90 ; verificamos si llegamos a 'Z'
JZ FIN ; si llegamos, finaliza
INC AH ; cambia a la siguiente letra (en la primer iteración cambia a la 'A')
MOV [BX], AH ; ingresa en memoria la letra que está en AH
INT 7 ; imprime lo que está en BX y la longitud de AL
JMP LOOP
FIN:HLT
END
