PB EQU 31h
CB EQU 33h
ORG 2000H
mov AL, 0h ; mando a AL 0 para configurar como salida
out CB, al
mov al, 0Fh ; mando a AL 0F para indicar encender las 4 luces
out PB, al  ; de la derecha (00001111).
int 0
end

; configuramos CB en 0 ya que indicamos que las luces (PB) se
; comportan como salidas.
;
; para encender las luces, debemos enviar a PB los bits.