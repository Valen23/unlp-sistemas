.data
base: .word 5
exponente: .word 4
result: .word 0

.code
ld $a0, base($zero)
ld $a1, exponente($zero)
jal potencia
sd $v0, result($zero)
halt

potencia:
daddi $v0, $zero, 1
lazo:
bnez $a1, terminar
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