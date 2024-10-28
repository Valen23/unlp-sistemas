.data
coorX: .byte 24 ; coordenada X de un punto
coorY: .byte 24 ; coordenada Y de un punto
color: .byte 255, 0, 0, 0.9 ; color: máximo rojo + máximo azul 
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
daddi $t5, $zero, 255           # inicializamos en 255
dadd $t4, $zero, $zero          # usamos t4 como contador

ld $t0, CONTROL($zero)
ld $t1, DATA($zero)

lbu $t2, coorX($zero)
sb $t2, 5($t1)

lbu $t2, coorY($zero)
sb $t2, 4($t1)

loop:
lwu $t2, color($zero) ; carga el color en $t2
dadd $t2, $t4, $zero ; cargamos t4 en t2
daddi $t5, $t5, -1 ; decrementamos el comparador
sw $t2, 0($t1) ; se lo manda a data
daddi $t4, $t4, 1 ; incrementamos el color
daddi $t2, $zero, 5 
sd $t2, 0($t0) 
bnez $t5, loop 

halt