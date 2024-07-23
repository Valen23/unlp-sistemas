program e7a;
function digitos(): integer;
var
    numero: integer;
begin
    numero:=0;
    digitos:=1;
    write('escriba un numero: '); readln(numero);
    while ((numero div 10) >= 1) do
        begin
            digitos:=digitos+1;
            numero:=(numero div 10);
        end;
    writeln('la cantidad de digitos es: ', digitos);
end;
begin
    digitos();
end.