program e3;
type
    datos = record
            numeroViaje, codigoAuto:integer;
            direccionOrigen, direccionDestino:string[50];
            kmRecorridos:real;
        end;

    lista = ^nodo;

    nodo = record
            elemento:datos;
            nodoSig:lista;
        end;
begin
end.