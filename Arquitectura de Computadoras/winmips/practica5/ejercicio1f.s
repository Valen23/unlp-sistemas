.data
msjE: .asciiz "Ingrese el valor del exponente: "
base1: .word 2
base2: .word 3
exponente: .word 0
result: .word 0
control: .word 0x10000
data: .word 0x10008

.code
ld $s0, control($0)
ld $s1, data($0)

daddi $t2, $0, msjE ; guardo la dirección del mensaje en $t2
sd $t2, 0($s1) ; almaceno el puntero del mensaje en DATA
daddi $t2, $0, 4 ; almaceno 4 en $t2 para leer cadenas terminadas en 0
sd $t2, 0($s0) ; almaceno $t2 en CONTROL

daddi $t0, $0, 8 ; CONTROL = 8 para leer numeros enteros
sd $t0, 0($s0) ; CONTROL = 8 para leer numeros enteros
ld $t1, 0($s1) ; guardo en $t1 lo que quedó en DATA
sd $t1, exponente($0) ; guardo en exponente lo que quedó en $t1

ld $a0, base1($zero)
ld $a1, exponente($zero)
jal potencia

dadd $t5, $0, $v0

ld $a0, base2($zero)
ld $a1, exponente($zero)
jal potencia

dadd $t5, $t5, $v0
sd $t5, result($0)

ld $t0, result($0) ; cargamos en $t0 lo que hay en result
sd $t0, 0($s1) ; guardamos en DATA el numero a imprimir
daddi $t1, $0, 1 ; cargamos 1 en $t1
sd $t1, 0($s0) ; cargamos en CONTROL el numero 1
halt

potencia:
daddi $v0, $zero, 1
lazo:
beqz $a1, terminar
daddi $a1, $a1, -1
dmul $v0, $v0, $a0
j lazo
terminar:
jr $ra

# ¿Qué sucede cuando realiza una segunda llamada a potencia?
# 
# Se necesita cargar nuevamente el exponente