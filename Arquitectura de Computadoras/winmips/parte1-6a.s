.data
V: .word 5, 2, 6
RES: .word 0

.code
LW $t1, RES($zero)
LW $t0, V($t1)          # cargo la direccion base
DADD $t4, $t0, $zero    # sumamos a t4 el valor del vector[0] = (5)
DADDI $t1, $t1, 8       # sumamos al indice t1 8 para movernos, 0 -> 8

LW $t0, V($t1)          # cargo el vector pero con 8 bytes desplazados
DADD $t4, $t4, $t0      # sumo a t4 el valor del vector[1] = (5 + 2)
DADDI $t1, $t1, 8       # 8 -> 16

LW $t0, V($t1)          # cargo el vector pero con 16 bytes desplazados
DADD $t4, $t4, $t0      # sumo a t4 el valor del vector[2] = (5 + 2 + 6)

SW $t4, RES($zero)      # guardo el resultado final
HALT