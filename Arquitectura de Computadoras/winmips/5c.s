.data
F: .word 1
I: .word 1
N: .word 4

.code
LD R1, I ($zero)            # cargo I en R1
LD R2, F ($zero)            # cargo F en R2
LD R3, N ($zero)            # cargo N en R3

for:
DMUL R2, R2, R1             # F = F * I
BEQ R1, R3, fin             # verifico si llegue al final
DADDI R1, R1, 1             # I = I + 1
J for

fin:
SD R2, F ($zero)            # guardo el registro del resultado en F