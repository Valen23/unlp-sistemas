program e1;
type

    vector = array[1..5] of integer;

    datos = record
            genero:1..5;
            dni, edad:integer;
            apellido, nombre:string;
        end;

    lista = ^nodo;

    nodo = record
            elemento:datos;
            nodoSig:lista;
        end;

procedure leerDatos(var d:datos);
begin
    with d do
        begin
            // write('NOMBRE: '); readln(nombre);
            // write('APELLIDO: '); readln(apellido);
            // write('EDAD: '); readln(edad);
            write('DNI: '); readln(dni);
            write('GENERO[1...5]: '); readln(genero);
        end;
end;

procedure agregarAdelante(var l:lista; d:datos);
var
    nuevoNodo:lista;
begin
    new(nuevoNodo); nuevoNodo^.elemento:=d; nuevoNodo^.nodoSig:=nil;

    if (l = nil) then
        begin
            l:=nuevoNodo;
        end
            else
                begin
                    nuevoNodo^.nodoSig:=l;
                    l:=nuevoNodo;
                end;
end;

procedure crearLista(var l:lista);
var
    d:datos;
begin
    repeat
        leerDatos(d);    
        agregarAdelante(l, d);
    until (d.dni = 334);
end;

function contadorDNI(l:lista):integer;
var
    contador, aux, par, impar:integer;
begin
    contador:=0; impar:=0; par:=0;
    while (l <> nil) do
        begin
            aux:=l^.elemento.dni;
            while (aux <> 0) do
                begin
                    if (aux mod 2 = 0) then
                        begin
                            par:=par+1;
                        end
                            else
                                begin
                                    impar:=impar+1;
                                end;
                    aux:=(aux div 10);
                end;

            if (par > impar) then
                begin
                    contador:=contador+1;
                end;

            contadorDNI:=contador;
            l:=l^.nodoSig;
        end;
end;

procedure generosMasElegidos(l:lista; v:vector; var codElegido1, codElegido2:integer);
var 
    i, contador1, contador2:integer;
begin
    contador1:=0;
    contador2:=0;

    while (l <> nil) do
        begin
            v[l^.elemento.genero]:=v[l^.elemento.genero] + 1;
            l:=l^.nodoSig;
        end;

    for i:=1 to 5 do
        begin
            if (v[i] > codElegido1) then
                begin
                    codElegido2:=codElegido1;
                    codElegido1:=i;
                end;

            if (v[i] > codElegido2) and (v[i] < codElegido1) then
                begin
                    codElegido2:=i;
                end;
        end;

    writeln('LOS CODIGOS DE GENERO MAS ELEGIDOS SON: ', codElegido1, ' y ', codElegido2);
end;

procedure eliminar(var pI:lista; valor:integer);
var
    actual, anterior:lista;
begin
    actual:=pI;

    while (actual <> nil) and (actual^.elemento.dni <> valor) do
        begin
            anterior:=actual;
            actual:=actual^.nodoSig;
        end; 

    if (actual <> nil) then
        begin
            if (actual = pI) then
                begin
                    pI:=pI^.nodoSig;
                end
                    else
                        begin
                            anterior^.nodoSig:=actual^.nodoSig;
                        end;
            dispose(actual);
        end;
end;

var
    v:vector;
    l:lista;
    d:datos;
    codElegido1, codElegido2:integer;

begin
    l:=nil; codElegido1:=0; codElegido2:=0;
    crearLista(l);
    writeln('CANTIDAD DE PERSONAS CON MAS DIGITOS PAR EN EL DNI: ', contadorDNI(l));
    generosMasElegidos(l, v, codElegido1, codElegido2);
    eliminar(l, 45);
end.