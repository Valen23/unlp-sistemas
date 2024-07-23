program e2;
var 
    i, x, mayor: integer;
begin
    x := 0;
    mayor := -9999;
    for i:=1 to 10 do
        begin
            Write('Escriba un numero: ');
            ReadLn(x);
            if (x > mayor) then
                begin
                    mayor := x;
                end;
        end;
    WriteLn('El mayor fue: ', mayor);
end.