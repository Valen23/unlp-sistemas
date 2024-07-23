program e7b;
function cantidadDigitos(): integer;
var
    numero, digitos: integer;
begin
    numero:=0;
    cantidadDigitos:=0;
    digitos:=1;

    repeat
        write('escriba un numero: '); readln(numero);
        digitos:=1;
        
        while (numero div 10 >= 1) do
            begin
                digitos:=digitos+1;
                numero:=(numero div 10);
            end;

        writeln('cantidad de digitos: ', digitos);
        cantidadDigitos:=cantidadDigitos+digitos;
    until (digitos = 4);

    writeln('la cantidad de digitos total es: ', cantidadDigitos);
end;
begin
    cantidadDigitos();
end.