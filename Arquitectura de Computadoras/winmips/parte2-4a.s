.data
coorX: .byte 0 ; coordenada X de un punto
coorY: .byte 0 ; coordenada Y de un punto
color: .byte 255, 0, 255, 0 ; color: máximo rojo + máximo azul => magenta
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
ld $s0, CONTROL($zero) ; $t0 = dirección de CONTROL
ld $s1, DATA($zero) ; $t1 = dirección de DATA

lwu $t2, color($zero) ; $t2 = valor de color a pintar (4 bytes)
sw $t2, 0($s1) ; DATA recibe el valor del color a pintar

daddi $t3, $zero, 8 ; funcion 8
sb $t3, 0($s0) ; mando 8 a CONTROL
lbu $t3, 0($s1) ; guardo en $t3 lo que quedo en DATA

sb $t3, 5($s1) ; DATA+5 recibe el valor de coordenada X

daddi $t3, $zero, 8 ; funcion 8
sb $t3, 0($s0) ; mando 8 a CONTROL
lbu $t3, 0($s1) ; guardo en $t3 lo que quedo en DATA

sb $t3, 4($s1) ; DATA+4 recibe el valor de coordenada Y

daddi $t2, $zero, 5 ; $t2 = 5 -> función 5: salida gráfica
sd $t2, 0($s0) ; CONTROL recibe 5 y produce el dibujo del punto
halt
