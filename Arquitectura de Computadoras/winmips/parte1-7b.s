.data
V: .word 0

.code
daddi $t0, $zero, 1                 # $t0 valor
dadd $t1, $zero, $zero              # $t1 indice
lw $t2, V($zero)                    # $t2 vector
daddi $t3, $zero, 10                # $t3 contador

loop:
sw $t0, V($t1)
daddi $t1, $t1, 8                   # aumento el indice
daddi $t3, $t3, -1                  # decremento el contador
daddi $t0, $t0, 2                   # aumento en 2 el valor
bne $t3, $zero, loop
halt