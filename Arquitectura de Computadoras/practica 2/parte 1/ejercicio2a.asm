PB EQU 31h
CB EQU 33h
ORG 2000h
MOV AL, 0
OUT CB, AL
MOV AL, 11000011b
OUT PB, AL
int 0
end

; Patrón de Luces Fijo Escribir un programa que encienda las luces con el
; patrón 11000011, o sea, solo las primeras y las últimas dos luces
; deben prenderse, y el resto deben apagarse