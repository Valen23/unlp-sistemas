ORG 1000H
LETRA DB ?
ORG 2000H
MOV AL, 1
MOV BX, OFFSET LETRA
MOV AH, 47 ; cambiamos el caracter inicial
LOOP: CMP AH, 57 ; cambiamos el final
JZ FIN 
INC AH 
MOV [BX], AH 
INT 7 
JMP LOOP
FIN:HLT
END
