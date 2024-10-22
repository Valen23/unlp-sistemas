.data
A: .word 7
B: .word 3
C: .word 0

.code
LD R1, A (R0)
LD R2, B (R0)
BNEZ R1, no_es_cero     # verifica si R1 no es cero
J finalizar

no_es_cero:
SLT R3, R2, R1          # verifica si R1 es mayor a R2 (o R2 es menor que R1), si lo es, guarda 1 en R3
BNEZ R3, a_es_mayor
DADD R3, R2, R0
SD R3, C (R0)
J finalizar

a_es_mayor:
DADDI R4, R0, 2         # R4 = 0 + 2
DMUL R3, R1, R4         # R3 = R1 * R4 = A * 2
SD R3, C (R0)           # guardamos R3 en A

finalizar:
HALT