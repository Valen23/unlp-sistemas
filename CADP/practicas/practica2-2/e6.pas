program e6;

procedure pantalonMasCaro(var codigoPantalonMasCaro, precioPantalonMasCaro: integer; precio, codigo, codigoMasBarato1, codigoMasBarato2, precioMasBarato1, precioMasBarato2: integer; tipo: string);
begin
    if (tipo = 'pantalon') and (precio > precioPantalonMasCaro) then
        begin
            precioPantalonMasCaro:=precio;
            codigoPantalonMasCaro:=codigo;
        end;
end;

procedure masBaratos(precio, codigo: integer; tipo: string; var codigoMasBarato1, codigoMasBarato2, precioMasBarato1, precioMasBarato2: integer);
begin
    if (precio < precioMasBarato1) then
        begin
            codigoMasBarato2:=codigoMasBarato1;
            codigoMasBarato1:=codigo;
            precioMasBarato2:=precioMasBarato1;
            precioMasBarato1:=precio;
        end
        else if (precio < precioMasBarato2) then
            begin
                codigoMasBarato2:=codigo;
                precioMasBarato2:=precio;
            end;
end;

procedure leer(var precio, codigo: integer; var tipo: string; codigoMasBarato1, codigoMasBarato2, precioMasBarato1, precioMasBarato2, codigoPantalonMasCaro, precioPantalonMasCaro: integer);
var
    i: integer;
begin
    for i:=1 to 5 do
        begin
            write('precio: '); readln(precio);
            write('codigo: '); readln(codigo);
            write('tipo: '); readln(tipo);
            masBaratos(precio, codigo, tipo, codigoMasBarato1, codigoMasBarato2, precioMasBarato1, precioMasBarato2);
            pantalonMasCaro(codigoPantalonMasCaro, precioPantalonMasCaro, precio, codigo, codigoMasBarato1, codigoMasBarato2, precioMasBarato1, precioMasBarato2, tipo);
        end;
    writeln('codigos mas baratos: ', codigoMasBarato1, ' - ', codigoMasBarato2);
    writeln('codigo del pantalon mas caro: ', codigoPantalonMasCaro);
end;

var
    precio, codigo, codigoMasBarato1, codigoMasBarato2, precioMasBarato1, precioMasBarato2, precioPantalonMasCaro, codigoPantalonMasCaro, cantidadProductos: integer;
    precioPromedio: real;
    tipo: string;

begin
    precioMasBarato1:=999; precioMasBarato2:=999; precioPantalonMasCaro:=0;
    codigoMasBarato1:=0; codigoMasBarato2:=0; codigoPantalonMasCaro:=0;
    precio:=0; codigo:=0; tipo:=' ';
    leer(precio, codigo, tipo, codigoMasBarato1, codigoMasBarato2, precioMasBarato1, precioMasBarato2, codigoPantalonMasCaro, precioPantalonMasCaro);
end.