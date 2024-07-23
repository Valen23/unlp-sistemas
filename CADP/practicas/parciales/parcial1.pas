program parcial1;
type
    
    
    // PRIMER LISTA

    datos = record
            codigo:integer;
            descripcion, marca:string;
            precio:real;
            rangoCategoria:1..4;
        end;

    vectorCategoria = array[rangoCategoria] of integer;

    lista = ^nodo;

    nodo = record
            elemento:datos;
            nodoSig:lista;
        end;
    
    // SEGUNDA LISTA
    infoMarca = record
            marca:string;
            cant:integer;
        end;

    listaMarca = ^nodoMarca;

    nodoMarca = record
            elemento:integer;
            nodoSig:listaMarca;
        end;

procedure cargarLista(var l:lista);
begin
end;

procedure inicializarCategorias(var v:vectorCategoria);
var
    i:integer;
begin
    for i:=1 to 12 do v[i]:=0;
end;

procedure procesarJuguetes(l:lista; var listaMarca:listaMarca; var v:vectorCategoria; var cat1, cat2:integer);
var
    marcaActual:string;
    contadorProductos:integer;
begin
    
    while (l <> nil) do
        begin
            marcaActual:=L^.elemento.marca;
            contadorProductos:=0;
            while (l <> nil) and (L^.elemento.marca = marcaActual) do
                begin
                    v[L^.elemento.rangoCategoria]:=v[L^.elemento.rangoCategoria]+1;
                    contadorProductos:=contadorProductos+1;
                    L:=L^.nodoSig;
                end;
        end;
end;

var
    l:lista;
    v:vectorCategoria;
    listaMarca:listaMarca;
begin
    l:=nil;
    cargarLista(l); // se dispone
end.
