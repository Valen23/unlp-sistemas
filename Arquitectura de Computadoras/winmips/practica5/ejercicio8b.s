.data
vector: .word 11, 17, 14, 33, 5
diml: .word 5
resultado: .word 0

.code
daddi $sp, $0, 0x400 ; inicializamos la pila
daddi $a0, $0, vector ; cargamos la direccion del vector
ld $a1, diml($0)

jal positivos

sd $v1, resultado($0)

halt

positivos:
daddi $sp, $sp, -8
sd $ra, 0($sp) ; almacenamos el return address en la pila
dadd $v1, $0, $0 ; inicializamos $v1 para el resultado de la segunda subrutina
dadd $t0, $a0, $0 ; copiamos la direccion de $a0 en $t0
loop:
beqz $a1, fin ; si el indice llega a 0 entonces finaliza
ld $a0, 0($t0) 
jal positivo
daddi $t0, $t0, 8 ; aumentamos el indice
daddi $a1, $a1, -1 ; decrementamos el contador
dadd $v1, $v1, $v0 ; sumamos a la cantidad de positivos
j loop
fin:
ld $ra, 0($sp) ; cargamos
daddi $sp, $sp, 8 ; decrementamos de posicion el puntero
jr $ra

positivo:
slt $v0, $0, $a0
jr $ra