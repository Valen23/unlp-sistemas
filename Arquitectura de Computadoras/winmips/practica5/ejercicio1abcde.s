.data
msjB: .asciiz "Ingrese el valor de la base: "
msjE: .asciiz "Ingrese el valor del exponente: "
base: .word 0
exponente: .word 0
result: .word 0
control: .word 0x10000
data: .word 0x10008

.code
ld $s0, control($0)
ld $s1, data($0)

daddi $t2, $0, msjB ; guardo la dirección del mensaje en $t2
sd $t2, 0($s1) ; almaceno el puntero del mensaje en DATA
daddi $t2, $0, 4 ; almaceno 4 en $t2 para leer cadenas terminadas en 0
sd $t2, 0($s0) ; almaceno $t2 en CONTROL

daddi $t0, $0, 8 ; CONTROL = 8 para leer numeros enteros
sd $t0, 0($s0) ; guardo en CONTROL el numero 8
ld $t1, 0($s1) ; guardo en $t1 lo que quedó en DATA
sd $t1, base($0) ; guardo en base lo que quedó en $t1

daddi $t2, $0, msjE ; guardo la dirección del mensaje en $t2
sd $t2, 0($s1) ; almaceno el puntero del mensaje en DATA
daddi $t2, $0, 4 ; almaceno 4 en $t2 para leer cadenas terminadas en 0
sd $t2, 0($s0) ; almaceno $t2 en CONTROL

sd $t0, 0($s0) ; CONTROL = 8 para leer numeros enteros
ld $t1, 0($s1) ; guardo en $t1 lo que quedó en DATA
sd $t1, exponente($0) ; guardo en exponente lo que quedó en $t1

ld $a0, base($zero)
ld $a1, exponente($zero)
jal potencia
sd $v0, result($zero)

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

# A. ¿Qué hace el programa? ¿Cómo está estructurado el código del mismo?
# RTA: El programa eleva un numero a su n potencia.
# 1) Carga en $a0 la base y en $a1 el exponente antes de llamar a la subrutina
# 2) En $v0 carga el numero 1, que es usado como indice
# 3) En un loop, verifica al inicio si $a1 (que es el exponente) llega a 0
# 4) Si llega termina, si no, le resta 1 a $a1
# 5) Multiplica $v0 x la base y la guarda en $v0
# 6) Si $v0 = 0 termina la subrutina y vuelve con JR $RA

# B. ¿Qué acciones produce la instrucción jal? ¿Y la instrucción jr?
# RTA: JAL salta a la subrutina, JR vuelve de la subrutina

# C. ¿Qué valor se almacena en el registro $ra? ¿Qué función cumplen los registros $a0 y $a1? ¿Y el
# registro $v0? ¿Qué valores posibles puede recibir en $a0 y $a1 la subrutina potencia?}
# RTA: En $ra queda almacenada la dirección de retorno cuando se llama a una subrutina
# $a0 y $a1 son los parametros pasados a la subrutina, en este caso la base y la potencia
# En $v0 quedan guardados los valores de retorno

# D. Supongamos que el WinMIPS no posee la instrucción dmul ¿Qué sucede si
# la subrutina potencia necesita invocar a otra subrutina para realizar
# la multiplicación en lugar de usar la instrucción dmul?
# ¿Cómo sabe cada una de las subrutinas a que dirección de memoria debe retornar?
# RTA: Necesitamos guardar en la pila el valor de $ra (primero tenemos que
# ubicar el stack pointer)