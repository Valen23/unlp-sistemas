.data
A: .word 3
B: .word 7
S: .word 0
P: .word 0
D: .word 0

.code
LD R1, A (R0)       # cargamos A en R1
LD R2, B (R0)       # cargamos B en R2
DADD R3, R1, R2     # suma: R3 = R1 + R2
SD R3, S (R0)       # almacenamos R3 en S
DMUL R3, R1, R2     # multiplicamos: R3 = R1 * R2
DADDI R3, R3, 2     # sumamos con valor inmediato: R3 = R3 + 2
SD R3, P (R0)       # almacenamos R3 en P
DMUL R3, R1, R1     # multiplicamos: R3 = R1 * R1
DDIV R3, R3, R2     # dividimos: R3 = R3 / R2
SD R3, D (R0)       # almacenamos R3 en D
HALT