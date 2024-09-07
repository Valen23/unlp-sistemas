program e5b;
procedure doble(var cantDobles: integer; numA, numB: integer);
begin
    if (numA * 2 = numB) then
        begin
            cantDobles:=cantDobles+1;
        end;
end;
function pares(var cantDobles: integer; numA, numB: integer): integer;
begin
    pares:=0;
    while (numA <> 0) and (numB <> 0) do
        begin
            write('A: '); readln(numA);
            write('B: '); readln(numB);
            if (numA <> 0) and (numB <> 0) then
                begin
                    pares:=pares+1;
                end;
            writeln('cantidad de pares: ', pares);
            doble(cantDobles, numA, numB);
            writeln('cantidad de dobles: ', cantDobles);
        end;
end;
var
    a, b, cantDobles: integer;
begin
    a:=-1; b:=-1;
    pares(cantDobles, a, b);
end.