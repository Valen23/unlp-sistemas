program e5;
var
    x, xDoble, i, aux : integer;
begin
    Write('Escriba un numero: ');
    ReadLn(x);
    
    xDoble := x * 2;
    i := 0;

    repeat
        Write('Escriba un intento: ');
        ReadLn(aux);
        i := i+1;
        if (i = 10) then
            begin
                WriteLn('No se ha ingresado el doble de ', x);
            end;
    until (i = 10) or (aux = xDoble); // Se repite el proceso y luego se verifica la condición, osea que se procesa la última acción.
end.