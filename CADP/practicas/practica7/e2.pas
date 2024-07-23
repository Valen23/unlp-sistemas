program e2;
const
    montosAdicionales: array[1..6] of integer = (100, 200, 300, 400, 500, 600);

type

    datos = record
            codigoCliente, dni, montoAbonado:integer;
            nombre, apellido:string;
            codigoPoliza:1..6;
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
            write('CODIGO DE CLIENTE:'); readln(codigoCliente);
            write('NOMBRE:'); readln(nombre);
            write('APELLIDO:'); readln(apellido);
            write('DNI:'); readln(dni);
            write('CODIGO DE POLIZA [1..6]:'); readln(codigoPoliza);
            write('MONTO ABONADO:'); readln(montoAbonado);
        end;
end;

procedure agregarAdelante(var l:lista; d:datos);
var
    nuevoNodo:lista;
begin
    new(nuevoNodo); nuevoNodo^.elemento:=d; nuevoNodo^.nodoSig:=nil; // CREAMOS EL NODO NUEVO, LE ASIGNAMOS EL ELEMENTO, Y A DONDE APUNTA EL SIGUIENTE.

    if (l = nil) then // SI L ES NIL
        begin
            l:=nuevoNodo; // SE CREA EL NUEVO NODO
        end
            else // DE LO CONTRARIO 
                begin
                    nuevoNodo^.nodoSig:=l; // EL NODO SIGUIENTE DEL NUEVO NODO ES L
                    l:=nuevoNodo; // L ES EL NUEVO NODO
                end;
end;

procedure crearLista(var l:lista);
var
    d:datos;
begin
    repeat
        leerDatos(d);
        agregarAdelante(l, d);
    until(d.codigoCliente = 1122);
end;

procedure imprimirDatos(l:lista);
var
    montoTotal:integer;
begin
    writeln('==================== DATOS DEL USUARIO ====================');
    montoTotal:=l^.elemento.montoAbonado + montosAdicionales[l^.elemento.codigoPoliza];
    writeln('DNI: ', l^.elemento.dni);
    writeln('NOMBRE: ', l^.elemento.nombre);
    writeln('APELLIDO: ', l^.elemento.apellido);
    writeln('MONTO TOTAL: ', montoTotal, ', ', l^.elemento.montoAbonado, ' ', montosAdicionales[l^.elemento.codigoPoliza]);
    writeln('===========================================================');
end;

procedure eliminarUsuario(var pi:lista; id:integer);
var
    actual, anterior:lista;
begin
    actual:=pi;

    while (actual <> nil) and (actual^.elemento.codigoCliente <> id) do
        begin
            anterior:=actual;
            actual:=actual^.nodoSig;
        end;

    if (actual <> nil) then
        begin
            if (actual = pi) then
                begin
                    pi:=pi^.nodoSig;
                end
                    else
                        begin
                            anterior^.nodoSig:=actual^.nodoSig;
                        end;
            dispose(actual);
        end;
end;

procedure recorrerLista(l:lista);
begin
    while (l <> nil) do
        begin
            imprimirDatos(l);
            eliminarUsuario(l, 4);
            l:=l^.nodoSig;
        end;
end;

var
    l:lista;
    d:datos;

begin
    l:=nil;
    crearLista(l);
    recorrerLista(l);
end.