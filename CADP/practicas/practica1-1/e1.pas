
Program e1;

Var 
    n1, n2 :   Integer;

Begin
    WriteLn('Escriba el valor del numero 1: ');
    Read(n1);
    WriteLn('Escriba el valor del numero 2: ');
    Read(n2);
    If (n1 > n2) Then
        Begin
            WriteLn('El numero 1 es mayor que el numero 2');
        End;
    If (n1 < n2) Then
        Begin
            WriteLn('El numero 2 es mayor que el numero 1');
        End;
    If (n1 = n2) Then
        Begin
            WriteLn('Los numeros son iguales.');
        End;
End.
