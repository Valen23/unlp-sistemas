.data
a: .word 0
b: .word 0
c: .word 0

.code
ld $t1, a($t0)
ld $t2, b($t0)
beqz $t1, cero
slt $t4, $t1, $t2
bnez $t4, mult

cero:
andi $t3, $t3, 0
sd $t3, c($t0)
j fin

mult:
daddi $t5, $t5, 2
dmul $t3, $t1, $t5
sd $t5, c($t0)
j fin

sd $t2, c($t0)

fin:
halt