EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H
F10ID EQU 16
ORG 64
F10IP DW SUBRF10
ORG 1000H
MSJ DB "VIVAN LAS INTERRUPCIONES!"
FIN DB ?
ORG 2000H
CLI
MOV DH, 5
MOV AL, 0FEH
OUT IMR, AL
MOV AL, F10ID
OUT INT0, AL
STI
LOOP: JMP LOOP
ORG 3000H
SUBRF10:
DEC DH
CMP DH, 0
JNZ SALTO
MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN - OFFSET MSJ
INT 7
MOV AL, 0FFH
OUT IMR, AL
SALTO:
MOV AL, EOI
OUT EOI, AL
IRET
END