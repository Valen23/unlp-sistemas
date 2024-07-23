program e2;
Type
    casamiento = record
        dia: 1..31;
        mes: 1..12;
        anno: integer;
    end;

function cantidadPrimeros(c: casamiento; var contadorPrimeros: integer): integer;
begin
    if (c.dia >= 1) and (c.dia <= 10) then
        begin
            contadorPrimeros:=contadorPrimeros+1;
        end;
    cantidadPrimeros:=contadorPrimeros;
end;

function cantidadVerano(c:casamiento; var contadorVerano:integer): integer;
begin
    if (c.anno <= 3) and (c.anno >= 1) then
        begin
            contadorVerano:=contadorVerano+1;
        end;
    cantidadVerano:=contadorVerano;
end;

procedure leerCasamiento(var c:casamiento; var contadorVerano, contadorPrimeros:integer);
begin
    contadorPrimeros:=0;
    contadorVerano:=0;
    while (c.anno <> 2020) do
        begin
            write('dia: '); readln(c.dia);
            write('mes: '); readln(c.mes);
            write('año: '); readln(c.anno);
            writeln('cantidad de casamientos en verano: ', cantidadVerano(c, contadorVerano));
            writeln('cantidad de casamientos los primeros 10 dias: ', cantidadPrimeros(c, contadorPrimeros))
        end;
end;
var
    cas: casamiento;
    contadorVerano, contadorPrimeros: integer;
begin
    cas.dia:=1; cas.mes:=1; cas.anno:=1;
    leerCasamiento(cas, contadorVerano, contadorPrimeros);
end.