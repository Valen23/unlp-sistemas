program e4;
var
    x, xDoble, i : integer;
begin
    Write('Escriba un numero: ');
    ReadLn(x);
    
    xDoble := x * 2;
    i := 0;

    // while (i <> xDoble) do // No se procesa la última acción porque se verifica antes la condición.
    //     begin
    //         WriteLn(i);
    //         i := i+1;
    //     end;

    repeat
        i := i+1;
        WriteLn(i);
    until (i = xDoble); // Se repite el proceso y luego se verifica la condición, osea que se procesa la última acción.
end.