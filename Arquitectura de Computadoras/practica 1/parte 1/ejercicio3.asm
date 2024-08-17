ORG 1000H
C DB "A"
ORG 2000H
MOV BX, OFFSET C
MOV CL, C
MOV CH, C
ADD CH, 32
MOV BYTE PTR [BX], CH
HLT
END

; ----------------------------------------------------------------------------------------------------------
; | Escribir un programa que convierta un carácter de mayúsculas a                                         |
; | minúsculas. El carácter está almacenado en la variable C. Asumir que el carácter es una mayúscula.     |
; | Pista: Las mayúsculas y las minúsculas están en el mismo orden en el ASCII, y por ende la distancia    |
; | entre, por ejemplo, la “A” y la “a” es la misma que la distancia entre la “Z” y la “z”.                |
; ----------------------------------------------------------------------------------------------------------
