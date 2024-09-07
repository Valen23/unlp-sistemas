PA EQU 30h ; declaramos la constante para PA ya que existe CA
CA EQU 32h
ORG 1000h
msj db "Apagadas"
ORG 2000H
mov al, 0FFh
out CA, AL ; configuramos CA para que sean entradas
in al, PA
cmp al, 0
jnz fin
mov al, 8
mov bx , offset msj
int 7
fin: int 0
end

; ni idea que hace