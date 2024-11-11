.data
vector: .word 11, 17, 14, 33, 5
diml: .word 5
resultado: .word 0

.code
daddi $a0, $0, vector
ld $a1, diml($0)

jal suma

sd $v0, resultado($0)

halt

suma:
dadd $v0, $0, $0 ; inicializamos $v0
loop:
ld $t0, 0($a0) ; cargamos en $t0 la direccion de $a0
dadd $v0, $v0, $t0 ; sumamos a $v0 el valor de $t0
daddi $a1, $a1, -1 ; decrementamos el indice
daddi $a0, $a0, 8 ; sumamos 8 a la direccion de $a0
bnez $a1, loop
jr $ra