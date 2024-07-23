program e2;
var
    x, xAbs : integer;
begin
    Write('Escriba el valor de X: ');
    ReadLn(x);
    if (x >= 0) then
        begin
            WriteLn('El valor es: ', x);
        end
        else
            begin
              xAbs := x * (-1);
              WriteLn('El valor es: ', xAbs);
            end;
end.