.data
A: .word 2
RES: .word 0
.code
daddi $t1, $0, 0
daddi $t2, $0, 0
loop:
ld $t3, A($t1)
daddi $t1, $t1, 8
dadd $t2, $t2, $t3
bnez $t3, loop
sd $t2, RES($0)
halt