program e1;
var
    i, x, suma : integer;
begin
    suma := 0;
    for i:=1 to 10 do
        begin
            Write('Escriba un numero: ');
            ReadLn(x);
            suma := suma + x;
        end;
    WriteLn('Suma total: ', suma);
end.