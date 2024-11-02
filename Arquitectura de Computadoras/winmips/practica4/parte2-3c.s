.data
CONTROL: .word 0x10000
DATA: .word 0x10008
RESULTADO: .word 0

.code
lw $s0, CONTROL($zero)      # configuramos s0 y s1
lw $s1, DATA($zero)

daddi $t0, $zero, 8         # guardo 8 en la direccion de control
sd $t0, 0($s0)              # para leer numeros

ld $t1, 0($s1)              # cargo en t1 el numero leido

loop:
daddi $t0, $zero, 9         # guardo 9 en la direccion de control
sd $t0, 0($s0)              # para leer un caracter

lbu $t3, 0($s1)             # cargo en t3 el caracter leido

daddi $t0, $zero, 8         # guardamos 8 en la direccion de control
sd $t0, 0($s0)              # para leer numeros

ld $t2, 0($s1)              # cargo en t2 el segundo numero leido

# suma
daddi $t4, $zero, 43
beq $t3, $t4, suma

# resta
daddi $t4, $zero, 45
beq $t3, $t4, resta

# multiplicacion
daddi $t4, $zero, 42
beq $t3, $t4, multiplicacion

# division
daddi $t4, $zero, 47
beq $t3, $t4, division

j fin

suma:
dadd $t1, $t1, $t2
j imprimir

resta:
dsub $t1, $t1, $t2
j imprimir

multiplicacion:
dmul $t1, $t1, $t2
j imprimir

division:
ddiv $t1, $t1, $t2
j imprimir

imprimir:
sd $t1, RESULTADO($zero)

daddi $t0, $zero, 7         # limpio la pantalla
sd $t0, 0($s0)

daddi $t0, $zero, 2         # imprimo el resultado
sd $t0, 0($s1)

j loop

fin:
halt