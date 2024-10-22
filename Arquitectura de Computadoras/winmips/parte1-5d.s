.data
L: .word 0
N: .word 20

.code
LD R2, L ($zero)        # cargo L
LD R3, N ($zero)        # cargo N
DADDI R4, R4, 2         # pongo R4 en 2

while:
SLT R1, R3, $zero       # verifico si N es < a 0
BNE R1, $zero, fin      # verifico si R1 se puso en 1 por la condicion anterior
DDIV R3, R3, R4         # divido N
DADDI R2, R2, 1         # a L le sumo 1
J while

fin:
SD R3, L ($zero)
HALT