program e6;
function numeros(var numMayor: integer):integer;
var
    num: integer;
begin
    num:=1;
    while (num > 0) do
        begin
            Write('Escriba un numero: ');
            ReadLn(num);
            if (num MOD 2 = 0) and (num > numMayor) then
                begin
                    numMayor:=num;
                end;
        end;
end;
var
    numMayor: integer;
begin
    numMayor:=0;
    numeros(numMayor);
    WriteLn('El numero par mas alto es: ', numMayor);
end.