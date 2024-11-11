.data
m: .word 2 # asumir que N > M
n: .word 4
resultado: .word 0

.code
daddi $sp, $sp, 0x400

ld $a0, n($0) # cargamos en $a0 el parametro N
ld $a1, m($0) # cargamos en $a1 el parametro M

jal combinatoria

sd $v0, resultado($0)

halt

factorial:
daddi $v0, $0, 1 # nos aseguramos que si N = 0, entonces !N = 1
lazo:
beqz $a0, fin
dmul $v0, $a0, $v0
daddi $a0, $a0, -1
j lazo
fin:
jr $ra

combinatoria: # comb(m,n)= m! / (n!*(n-m)!)

dsub $t2, $a0, $a1 # $t2 = (N-M)

daddi $sp, $sp, -8 # subimos 8 el sp
sd $ra, 0($sp) # guardamos la direccion de retorno 
jal factorial # !N

dadd $t0, $v0, $0 # $t0 = N!
dadd $a0, $a1, $0 # $a0 = M

jal factorial # !M

dadd $t1, $v0, $0 # $t1 = M!
dadd $a0, $t2, $0 # $a0 = (N-M)

jal factorial # (N-M)!

dadd $t2, $v0, $0 # $t2 = (N-M)!

dmul $t0, $t0, $t2 # $t0 = (N! * (N-M)!)

ddiv $v0, $t1, $t0 # $v0 = M! / (N! * (N-M)!)

ld $ra, 0($sp)
daddi $sp, $sp, 8

jr $ra