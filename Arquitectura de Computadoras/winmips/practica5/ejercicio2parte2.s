.data
posX: .byte 50
posY: .byte 49
colorRojo: .byte 255, 0, 0, 0
colorAzul: .byte 0, 0, 255, 0
control: .word 0x10000
data: .word 0x10008

.code
; cargamos la direccion de control y data
ld $s0, control($0)
ld $s1, data($0)
; incializamos los parametros
daddi $t0, $0, 5 ; cargamos 5 para usar en control
lb $a0, posY($0) ; coorY
lb $a1, posX($0) ; coorX
lb $a2, colorRojo($0)

loop:
beqz $a1, decrementarFila
daddi $a1, $a1, -1 ; decremento la coordenada X
jal fila_alternativa ; llamo a subrutina
andi $t1, $a1, 1 ; verifico si la coordenada actual es par o impar
beqz $t1, posImpar ; verifico la flag ($t1)
lb $a2, colorRojo($0) ; carga el color rojo
j loop
posImpar:
lb $a2, colorAzul($0) ; carga el color azul
j loop
decrementarFila:
daddi $a0, $a0, -1
daddi $a1, $0, 50
j loop

halt

fila_alternativa:
loop:
sb $a2, 0($s1) ; guardamos en data un color
sb $a0, 4($s1) ; cargamos la coordenada Y en data[4]
sb $a1, 5($s1) ; cargamos la coordenada X en data[5]
sd $t0, 0($s0) ; cargamos 5 en control
daddi $a1, $a1, -1
bnez $a1, loop 
jr $ra