.data
CONTROL: .word 0x10000
DATA: .word 0x10008
RESULTADO: .word 0

.code
lw $s0, CONTROL($zero)      # configuramos s0 y s1
lw $s1, DATA($zero)

daddi $t0, $zero, 8         # guardamos 8 en la direccion de control
sd $t0, 0($s0)              # para leer numeros

ld $t1, 0($s1)              # cargo en t1 el numero leido

daddi $t0, $zero, 8         # guardamos 8 en la direccion de control
sd $t0, 0($s0)              # para leer numeros

ld $t2, 0($s1)              # cargo en t2 el segundo numero leido

dadd $t1, $t1, $t2          # almaceno en t1 el resultado de t1 + t2
sd $t1, RESULTADO($zero)    # almaceno en variable

halt