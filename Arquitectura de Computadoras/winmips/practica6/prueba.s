.data
VEC1: .word 5, 4, 1
VEC2: .word 0

.code
daddi $t1, $0, 3
daddi $t0, $0, 0
loop:
ld $t2, VEC1($t0)
daddi $t1, $t1, -1
sd $t2, VEC2($t0)
daddi $t0, $t0, 8
bnez $t1, loop
halt