program e1;
type
    lista = ^nodo;
    nodo = record
        num: integer;
        sig: lista;
    end;

procedure armarNodo(var L:lista; v:integer);
var
    aux:lista;
begin
    new(aux); // SE INICIALIZA EL PUNTERO AUX QUE ES DE TIPO LISTA, Y LISTA ES UN PUNTERO
    aux^.num:=v; // SE LE ASIGNA EL VALOR 'v' A EL PUNTERO 'aux' A LA VARIABLE 'num' 
    aux^.sig:=L; // SE LE ASIGNA EL VALOR 'L' A EL PUNTERO 'aux' A LA VARIABLE 'sig'
    L:=aux; // L TOMA COMO VALOR LA VARIABLE AUX, QUE ES DE TIPO 'lista' Y 'lista' ES DE TIPO PUNTERO;
end;

procedure imprimirLista(L:lista); // LE PASAMOS COMO VALOR LA LISTA
begin
    while (L <> nil) do // MIENTRAS NO SEA EL FINAL DE LA LISTA
        begin
            writeln(L^.num); // ESCRIBE EL CONTENIDO DE EL NODO DE LA LISTA
            L:=L^.sig; // PASA AL SIGUIENTE
        end;
end;

procedure incrementarValor(L:lista; v:integer);
begin
    while (L <> nil) do
        begin
            L^.num:=L^.num + v;
            L:=L^.sig;
        end;
end;

var
    pri:lista;
    valor:integer;

begin
    pri:=nil; // INICIALIZA EL PUNTERO SIN VALORES DENTRO
    writeln('INGRESE UN NUMERO'); 
    read(valor); // SE LEE EL VALOR DE 'valor'
    while (valor <> 0) do // MIENTRAS VALOR SEA DIFERENTE DE 0
        begin
            armarNodo(pri, valor); // SE EJECUTA EL PROCEDURE
            writeln('Ingrese un numero'); // SE PIDE UN NUMERO
            read(valor); // SE LEE EL VALOR DE 'valor'
        end;
    imprimirLista(pri);
    writeln('----- LISTA INCREMENTADA -----');
    incrementarValor(pri, 1);
    imprimirLista(pri);
end.

// b. 48 -> 13 -> 21 -> 10
// c.
// d.