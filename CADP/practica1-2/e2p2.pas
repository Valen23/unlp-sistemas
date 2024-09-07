program e2p2;
var
    i, x, mayor, posicion: integer;
begin
    x := 0;
    posicion := 0;
    mayor := -9999;
    for i:=1 to 10 do
        begin
            Write('Escriba un numero: ');
            ReadLn(x);
            if (x > mayor) then
                begin
                    mayor := x;
                    posicion := i;
                end;
        end;
    WriteLn('El mayor fue: ', mayor, ' en la posicion ', posicion);
end.