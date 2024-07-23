program e5;
var
    x, max, min, total: integer;
begin
    max := -999;
    min := 999;
    x := 0;
    total := 0;
    repeat
        Write('Ingrese un numero: ');
        ReadLn(x);
        if (x > max) then
            begin
                max := x;
            end;
        if (x < min) then
            begin
                min := x;
            end;
        total := total + x;
        WriteLn('MAXIMO: ', max, ' MINIMO: ', min, ' SUMA TOTAL: ', total);
    until (x = 100);
end.