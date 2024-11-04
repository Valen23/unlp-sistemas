.code
; inicializa la pila
daddi $sp, $0, 0x400

; numeros cualquiera
daddi $t0, $0, 5
daddi $t1, $0, 8

; push
daddi $sp, $sp, -16 ; usamos 16 ya que reservamos 2 espacio en memoria (2 x 8 = 16 bytes)
sd $t0, 0($sp) ; guardamos lo que hay en $t0 en $sp + 0
sd $t1, 8($sp) ; guardamos lo que hay en $t1 en $sp + 8 (osea, una celda mas arriba que la anterior)

; cambiamos los valores de $t0 y $t1 para probar si se desapilan correctamente los registros apilados
daddi $t0, $0, 7
daddi $t1, $0, 7

; pop
ld $t0, 0($sp) ; cargamos lo que esta apuntando $sp
daddi $sp, $sp, 8 ; sumamos 8 al $sp
ld $t1, 0($sp) ; cargamos lo que estaba apuntando $sp + 8

halt