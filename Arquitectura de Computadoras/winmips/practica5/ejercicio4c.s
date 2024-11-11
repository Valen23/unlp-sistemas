.data
base: .word 4   
exponente: .word 3
resultado: .word 0

.code
daddi $sp, $0, 0x400 ; inicializamos la pila

daddi $t0, $0, base ; base (offset)
daddi $t1, $0, exponente ; exponente (offset)

daddi $sp, $sp, -16 ; subimos 16 bytes en $sp para guardar 2 datos

; push
sd $t0, 0($sp) ; stackeamos $t0 en $sp + 0
sd $t1, 8($sp) ; stackeamos $t1 en $sp + 8

jal potencia ; llamado a la subrutina

sd $v0, resultado($0) ; cargamos el resultado de la subrutina($v0) en memoria

halt

potencia:
; pop
ld $t0, 0($sp) ; cargamos el contenido de la direccion de la base
ld $t1, 8($sp) ; cargamos el contenido de la direccion del exponente
ld $a0, 0($t0)
ld $a1, 0($t1)
daddi $v0, $0, 1 ; inicializo el resultado en 1, ya que si el exponente es 0, el resultado es 1
loop:
beqz $a1, fin ; verifico si el exponente es 0
daddi $a1, $a1, -1 ; resto 1 al exponente
dmul $v0, $a0, $v0 ; multiplico el resultado(1) por la base(4) y lo guardo en resultado(4x1 = 4) -> (4x4 = 16)
j loop
fin:
jr $ra ; vuelvo al return adress (ra)