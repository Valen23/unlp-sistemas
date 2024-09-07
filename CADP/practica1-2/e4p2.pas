program e4p2;
var
    x, i, min1, min2: integer;
begin
    min1:= 999;
    min2:= 999;
    x := 0;
    repeat
        Write('Escriba un numero: ');
        ReadLn(x);
        if (x < min1) then
            begin
                min2:=min1;
                min1:=x;
            end
            else if (x < min2) then
                min2:=x;
    until (x = 0);
    WriteLn('El mas chico: ', min1, ' El segundo mas chico: ', min2);
end.