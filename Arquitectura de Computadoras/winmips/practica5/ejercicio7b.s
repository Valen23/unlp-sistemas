.data
miString: .asciiz "hola!"
caracter: .ascii "h"
resultado: .word 0

.code
dadd $t0, $0, $0 ; inicializo $t0 para indice
daddi $a0, $0, miString ; cargo en $a0 la direccion de memoria del string
ld $a1, caracter($0) ; cargo el caracter en $a1

jal contiene ; llamo a la subrutina

sd $v0, resultado($0) ; cargo el resultado en memoria
halt

contiene:
dadd $v0, $0, $0 ; inicializo $v0 en 0
loop:
lbu $t1, 0($a0) ; cargo un caracter en $t1 usando indice
beqz $t1, fin ; verifico si $t1(caracter actual) = 0
beq $t1, $a1, encontro ; verifico si $t1(caracter actual) = $a1(caracter a buscar)
daddi $a0, $a0, 1 ; aumento la direccion de memoria
j loop
encontro:
daddi $v0, $0, 1 ; $v0 = 1
fin:
jr $ra