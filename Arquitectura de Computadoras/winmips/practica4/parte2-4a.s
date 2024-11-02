.data
coorX: .byte 24 ; coordenada X de un punto
coorY: .byte 24 ; coordenada Y de un punto
color: .byte 255, 0, 255, 0 ; color: máximo rojo + máximo azul => magenta
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
ld $t0, CONTROL($zero) ; $t0 = dirección de CONTROL
ld $t1, DATA($zero) ; $t1 = dirección de DATA

lwu $t2, color($zero) ; $t2 = valor de color a pintar (4 bytes)
sw $t2, 0($t1) ; DATA recibe el valor del color a pintar

daddi $t5, $zero, 8 ; funcion 8
sd $t5, 0($t0) ; mando 8 a CONTROL
lbu $t3, 0($t1) ; guardo en $t3 lo que quedo en DATA

sb $t3, 5($t1) ; DATA+5 recibe el valor de coordenada X

sd $t5, 0($t0) ; mando 8 a CONTROL
lbu $t4, 0($t1) ; guardo en $4 lo que quedo en DATA

sb $t4, 4($t1) ; DATA+4 recibe el valor de coordenada Y

daddi $t2, $zero, 5 ; $t2 = 5 -> función 5: salida gráfica
sd $t2, 0($t0) ; CONTROL recibe 5 y produce el dibujo del punto

halt