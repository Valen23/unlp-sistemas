IMR EQU 21H
EOI EQU 20H     
INT1 EQU 25H
CONT EQU 10H
COMP EQU 11H
ID_TIMER EQU 10

ORG 40
IP_TIMER DW SUBR_CLOCK

ORG 1000H
MSJ DB "ANDRESITO "
FIN_MSJ DB ?

ORG 3000H
SUBR_CLOCK:
MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN_MSJ - OFFSET MSJ
INT 7
IN AL, COMP
CMP AL, 255
JZ TERMINAR
JMP LAZO
TERMINAR: INC AH
LAZO: INC AL
OUT COMP, AL
MOV AL, 0
OUT CONT, AL
MOV AL, EOI
OUT EOI, AL
IRET

ORG 2000H
CLI
MOV AH, 0
MOV AL, 0FDH
OUT IMR, AL
MOV AL, ID_TIMER
OUT INT1, AL
MOV AL, 1
OUT COMP, AL
MOV AL, 0
OUT CONT, AL
STI
LOOP:
CMP AH, 1
JZ FIN
JMP LOOP
FIN:INT 0
END