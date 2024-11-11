.data
base: .word 4
exponente: .word 3
resultado: .word 0

.code
daddi $a0, $0, base  ; cargo la direccion de base en un registro $a
daddi $a1, $0, exponente ; cargo la direccion de exponente en un registro $a

jal potencia ; llamado a la subrutina

sd $v0, resultado($0) ; cargo en $t2 el resultado($v0)
halt

potencia:
ld $t0, 0($a0) ; cargo el contenido de la direccion de memoria de $a0 (base)
ld $t1, 0($a1) ; cargo el contenido de la direccion de memoria de $a1 (exponente)
daddi $v0, $0, 1 ; inicializo el resultado en 1, ya que si el exponente es 0, el resultado es 1
loop:
beqz $t1, fin ; verifico si el exponente es 0
daddi $t1, $t1, -1 ; resto 1 al exponente
dmul $v0, $t0, $v0 ; multiplico el resultado(1) por la base(4) y lo guardo en resultado(4x1 = 4) -> (4x4 = 16)
j loop
fin:
jr $ra ; vuelvo al return adress (ra)