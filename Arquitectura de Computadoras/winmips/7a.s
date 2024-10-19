.data
V: .word 5, 7, 13, -4, 31, -3, 6, -1, 1, 17
POS: .word 0
MAX: .word 0

.code
dadd $t1, $zero, $zero          # inicializo el indice
dadd $t2, $zero, zero           # inicializo el resultado de POS
dadd $t3, $zero, $zero          # inicializo el resultado de MAX
daddi $t4, $zero, 80            # inicializo la condicion de fin
                                # usamos t5 para los resultados binarios
j lazo

inc_indice:
daddi $t1, $t1, 8

lazo:
lw $t0, V($t1)                      # cargo el vector
slt $t5, $t0, $zero                 # v[i] < zero ?, true = $t5, false = $t5
beq $t5, $zero, no_es_negativo      # comparamos si se cumplio la condicion
daddi $t2, $t2, 1                   # sumamos +1 al registro de POS

no_es_negativo:
slt $t5, $t3, $t0                   # $t3 < $t0?, true $t5, false = $t5
bne $t5, $zero, no_es_menor         # si la pos actual no es menor que el almacenado salta a la etiqueta
dadd $t3, $zero, $t0                # almaceno el valor en registro

no_es_menor:
dadd $t0, $t0, $t0                  # multiplico sin usar dmul
sw $t0, V($t1)                      # almaceno en memoria

bne $t1, $t4, inc_indice            # verifico si llegue al final

# almaceno los valores
sw $t2, POS($zero)
sw $t3, MAX($zero)

halt