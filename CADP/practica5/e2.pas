program e2;
type
    cadena = string[9];

    producto = record
        codigo: integer;
        descripcion: cadena;
        precio: real;
    end;

    puntero_producto = ^producto;
var
    p: puntero_producto;
    prod: producto;
begin
    writeln(sizeof(p), ' bytes'); // IMPRIME EL PESO DE LA VARIABLE PUNTERO, 4
    writeln(sizeof(prod), ' bytes'); // IMPRIME EL PESO DE LA SUMA DE LAS VARIABLES DEL REGISTRO, 6 + 10 + 8
    new(p);
    writeln(sizeof(p), ' bytes'); // IMPRIME EL PESO DE LA VARIABLE PUNTERO, 4
    writeln(sizeof(p^), ' bytes'); // IMPRIME LA SUMA DE LAS VARIABLES DEL PUNTERO
    writeln(sizeof(p^), ' bytes'); // IMPRIME LA SUMA DE LAS VARIABLES DEL PUNTERO
    writeln(sizeof(prod), ' bytes'); // IMPRIME LA SUMA DE LAS VARIABLES DEL REGISTRO, 6 + 10 + 8
end.
