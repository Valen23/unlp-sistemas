# A) Se utiliza $t0 y $t1 como parametros de entrada, en su lugar se deberian de utilizar los registros $a0, y $a1.
# Para los valores de salida, en este caso $t2, se deben utilizar los registros $v.

# B) Se utiliza el registro $a0 el cual está preservado para los parametros de entradas de la subrutina, y este es utilizado despues de invocarla.

# C) Idem B

# D) Se usa $t0, $t1, y $t2 como registros en un loop y estos pueden ser modificados por la subrutina, por lo que deberían usarse los registros $s