program e3;
type
    numeros = array[1..10000] of integer;

    puntero_numeros = ^numeros;

var
    n: puntero_numeros;
    num: numeros;
    i:integer;

begin
    writeln(sizeof(n), ' bytes'); // VA A IMPRIMIR EL PESO DE LA VARIABLE PUNTERO, 4
    writeln(sizeof(num), ' bytes'); // VA A IMPRIMIR EL PESO DE LA VARIABLE DE TIPO NUMEROS, QUE ES UN ARRAY DE ENTEROS, 
    new(n); // INICIALIZA EL PUNTERO
    writeln(sizeof(n^), ' bytes'); // IMPRIME EL VALOR DEL CONTENIDO DEL PUNTERO N, QUE ES: PESO DEL INTIGER * DIMENSION FISICA
    for i:= 1 to 5000 do // A LA MITAD DEL ARRAY NUMEROS LE ASIGNA UN VALOR
        n^[i]:= i;
    writeln(sizeof(n^), ' bytes'); // IMPRIME EL VALOR DEL CONTENIDO DEL PUNTERO, QUE ES 2 * 10000
end.
