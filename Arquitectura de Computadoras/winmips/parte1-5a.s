.data
A: .word 3
B: .word 7
S: .word 0
P: .word 0
D: .word 0

.code
LD $at, A ($zero)          # cargamos A en R1
LD $v0, B ($zero)          # cargamos B en R2
DADD $v1, $at, $v0      # suma: R3 = R1 + R2
SD $v1, S ($zero)          # almacenamos R3 en S
DMUL $v1, $at, $v0      # multiplicamos: R3 = R1 * R2
DADDI $v1, $v1, 2       # sumamos con valor inmediato: R3 = R3 + 2
SD $v1, P ($zero)          # almacenamos R3 en P
DMUL $v1, $at, $at      # multiplicamos: R3 = R1 * R1
DDIV $v1, $v1, $v0      # dividimos: R3 = R3 / R2
SD $v1, D ($zero)          # almacenamos R3 en D
HALT