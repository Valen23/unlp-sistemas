.data
V: .word 5, 7, 13, -4, 31, -3, 6, -1, 1, 17
POS: .word 0
MAX: .word 0

.code
DADD $t1, $zero, $zero              # inicializamos y usamos t1 como indice
LW $t0, V($zero)                    # cargamos la direcc del vector
LW $t9, POS($zero)                  # usamos t9 para cargar el resultado de POS
DADDI $t4, $zero, 80                # indice * dimF, t4 almacena el fin del vector
# usamos t3 como resultado de op. logicas

loop:
LW $t0, V($t1)                  # cargamos el vector indicando el indice
SLT $t3, $zero, $t0             # 0 < $t0 ?
BNEQ $t3, $zero, positivo       # compara si la flag es correcta
J lazo

positivo:
daddi $t9, $t9, 1               # +1 a t9

lazo:
DADDI $t1, $t1, 8               # añadimos 8 al indice
BEQ $t1, $t4, fin               # verificamos si llegamos al final
J loop                          # si no llegamos saltamos al loop nuevamente

fin:
SW $t9, POS($zero)          # finalmente almacenamos los valores en memoria
HALT