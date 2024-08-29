org 1000h
A db 8
B db 5
C db 4
D db ?
org 3000h
CALC:
push bx
mov bx, sp
ADD bx, 8 ;__________
mov dl, [bx]
sub bx, 2
mov dl, [bx] ;__________
sub bx, 2
mov dl, [bx] ;__________
pop bx
ret ;__________
org 2000h
mov AL, A
push AX
mov AL, B ;__________
push AX
mov AL, C ;__________
push AX
call CALC
mov D, DL
POP BX ;______
POP BX ;______
POP BX ;______
hlt
end
