program e5;

Type
    coche = record
        marca, modelo: string;
        precio: real;
        end;

procedure masValuado(c:coche; var precioMasCaro:real; var marcaMasCara, modeloMasCaro: string);
begin
    if (c.precio > precioMasCaro) then
        begin
            precioMasCaro:=c.precio;
            marcaMasCara:=c.marca;
            modeloMasCaro:=c.modelo;
        end;
end;

function precioPromedioMarca(c:coche; contadorMarca:integer; precioTotal:real): real;
begin
    precioPromedioMarca:=(precioTotal / contadorMarca);
end;

procedure leerDatos(var c:coche);
begin
    write('MARCA: '); readln(c.marca);
    write('MODELO: '); readln(c.modelo);
    write('PRECIO: '); readln(c.precio);
end;

var
    marcaMasCara, modeloMasCaro, marcaActual: string;
    contadorMarca: integer;
    precioMasCaro, precioTotal: real;
    auto: coche;

begin
    precioTotal:=0;
    contadorMarca:=0;
    leerDatos(auto);
    while (auto.marca <> 'zzz') do
        begin
            marcaActual:=auto.marca;
            while (auto.marca = marcaActual) do
                begin
                    masValuado(auto, precioMasCaro, marcaMasCara, modeloMasCaro);
                    precioTotal:=precioTotal+auto.precio;
                    contadorMarca:=contadorMarca+1;
                    leerDatos(auto);
                end;
            writeln('precio promedio de la marca ', marcaActual, ' : ', precioPromedioMarca(auto, contadorMarca, precioTotal):0:2);
        end;
    contadorMarca:=0;
    precioTotal:=0;
    writeln('el coche mas caro es el: ', marcaMasCara, ' ', modeloMasCaro, ' $', precioMasCaro:0:2);
end.