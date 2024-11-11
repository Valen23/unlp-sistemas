.data
numero: .word 0
miCadena: .asciiz "Debe ingresar un numero."
a: .word 3
b: .word 15
control: .word 0x10000
data: .word 0x10008

.code
daddi $sp, $0, 0x400
ld $s0, control($0) ; $s0 = direccion de control
ld $s1, data($0) ; $s1 = direccion de data

jal ingresarNumero

sd $a2, numero($0) ; guardo en memoria

halt

ingresarNumero:
; guardamos el return address
daddi $sp, $sp, -8
sd $ra, 0($sp)
; leemos el numero
daddi $t0, $0, 8 ; $t0 = 8
sd $t0, 0($s0) ; mando 8 a control
ld $a2, 0($s1) ; cargo el numero leido en $a2
; cargamos los parametros
ld $a0, a($0) ; $a0 = A
ld $a1, b($0) ; $a1 = B
; llamamos a subrutina
jal entre
; verificamos el resultado
bnez $v0, es_valido
; si no es valido:
daddi $t1, $0, miCadena ; $t1 = direccion de miCadena
sd $t1, 0($s1)
daddi $t0, $0, 4 ; $t0 = 4
sd $t0, 0($s0) ; mando 4 a control
daddi $a2, $0, 0
j fin2
; si es valido:
es_valido:
daddi $t0, $0, 1 ; $t0 = 1
sd $t0, 0($s0) ; mando 1 a control
fin2:
ld $ra, 0($sp)
daddi $sp, $sp, 8
jr $ra

entre:
; $a0 = A = 3, $a1 = B = 15
slt $t0, $a2, $a1 ; $a2 < $a1 ? = x < b ?
beqz $t0, fin
slt $t0, $a0, $a2 ; $a0 < $a2 ? = a < x ?
beqz $t0, fin
fin:
dadd $v0, $t0, $0
jr $ra