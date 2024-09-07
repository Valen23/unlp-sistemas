program e1p2;
var
    i, x, suma, cantidad : integer;
begin
    cantidad := 0;
    suma := 0;
    for i:=1 to 10 do
        begin
            Write('Escriba un numero: ');
            ReadLn(x);
            suma := suma + x;
            if x > 5 then
                begin
                    cantidad := cantidad + 1;
                end;
        end;
    WriteLn('Suma total: ', suma);
    WriteLn('La cantidad de numeros mayores a 5 es: ', cantidad);
end.