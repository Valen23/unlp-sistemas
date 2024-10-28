.data
X: .byte 0
Y: .byte 0
color: .byte 255, 255, 0, 0
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.code
lwu $s0, CONTROL($zero) # configura CONTROL
lwu $s1, DATA($zero) # configura DATA

lwu $t0, color($zero) # carga en $t0 COLOR
sw $t0, 0($s1) # manda a DATA $t0, (COLOR)

lbu $t1, Y($zero) # carga en $t1 la coordenada Y _____________________
lbu $t2, X($zero) # carga en $t2 la coordenada X
daddi $t4, $zero, 50 # se usa para comparar el fin
daddi $t5, $zero, 50 # se usa para comparar el fin
loop:
sb $t0, 1($s1) # manda a DATA $t0, (COLOR)
sb $t1, 4($s1) # almaceno lo que hay en $t1 en DATA(Y)
sb $t2, 5($s1) # almaceno lo que hay en $t2 en DATA(X) __________________
daddi $t3, $zero, 5 # funcion 5
sd $t3, 0($s0) # mando a control 5
daddi $t2, $t2, 1 # a la coordenada X le suma 1
bne $t4, $t2, loop # si no $t2 != 50 salta
daddi $t2, $zero, 0 # hago que vuelva a la coordenada X = 0 __________________
daddi $t0, $t0, -5
daddi $t1, $t1, 1 # sumo 1 a la coordenada Y
bne $t5, $t1, loop
halt