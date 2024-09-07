program e1;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc:puntero_cadena;
begin
    writeln(sizeof(pc), ' bytes'); // ESCRIBE EL PESO DE LA VARIABLE PUNTERO, QUE ES 4
    new(pc);
    writeln(sizeof(pc), ' bytes'); // ESCRIBE EL PESO DE LA VARIABLE PUNTERO, QUE ES 4
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc), ' bytes'); // ESCRIBE EL PESO DE LA VARIABLE PUNTERO, QUE ES 4
    writeln(sizeof(pc^), ' bytes'); // ESCRIBE EL PESO DEL CONTENIDO DE LA VARIABLE PUNTERO, QUE ES 51 (50 + 1)
    pc^:= 'otro nuevo nombre distinto al anterior';
    writeln(sizeof(pc^), ' bytes'); // ESCRIBE EL PESO DEL CONTENIDO DE LA VARIABLE PUNTERO, QUE ES 51 (50 + 1)
end.