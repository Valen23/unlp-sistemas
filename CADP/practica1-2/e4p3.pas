program e4p3;
var
    x, min1, min2: integer;
begin
    min1:= 999;
    min2:= 999;
    x := 999;
    while (x <> 0) do
    begin
        if (x < min1) then
            begin
                min2:=min1;
                min1:=x;
            end
            else if (x < min2) then
                min2:=x;
        Write('Escriba un numero: ');
        ReadLn(x);
    end;
    WriteLn('El mas chico: ', min1, ' El segundo mas chico: ', min2);
end.