.code
daddi $t0, $0, 4 ; base
daddi $t1, $0, 3 ; exponente
daddi $t2, $0, 0 ; inicializo el registro que va a ser de exponente

dadd $a0, $t0, $0 ; cargo la base en un registro $a
dadd $a1, $t1, $0 ; cargo el exponente en un registro $a

jal potencia ; llamado a la subrutina

dadd $t2, $0, $v0 ; cargo en $t2 el resultado($v0)
halt

potencia:
daddi $v0, $0, 1 ; inicializo el resultado en 1, ya que si el exponente es 0, el resultado es 1
loop:
beqz $a1, fin ; verifico si el exponente es 0
daddi $a1, $a1, -1 ; resto 1 al exponente
dmul $v0, $a0, $v0 ; multiplico el resultado(1) por la base(4) y lo guardo en resultado(4x1 = 4) -> (4x4 = 16)
j loop
fin:
jr $ra ; vuelvo al return adress (ra)