program e5;
type
    producto = record
        stockMinimo, stockActual, codigo:integer;
        descripcion:string;
        precio:real;
    end;
    
    lista = ^nodo;

    nodo = record 
        elemento:producto;
        nodoSig:lista;
    end;

procedure agregarAdelante(var L:lista; p:producto);
var
    nuevoNodo:lista;
begin
    new(nuevoNodo); nuevoNodo^.elemento:=p; nuevoNodo^.nodoSig:=nil;
    if (L = nil) then
        begin
            L:=nuevoNodo;
        end
            else
                begin
                    nuevoNodo^.nodoSig:=L;
                    L:=nuevoNodo;
                end;
end;

procedure recorrerLista(pI:lista);
begin
    while (pI <> nil) do                        // MIENTRAS EL NODO NO SEA EL ULTIMO
        begin
            writeln(pI^.elemento.codigo);       // IMPRIME
            pI:=pI^.nodoSig                     // PASA AL NODO SIGUIENTE
        end;
end;

procedure leerProducto(var p:producto);
begin
    writeln('===== LEERPRODUCTO =====');
    write('CODIGO: '); readln(p.codigo);
    write('PRECIO: '); readln(p.precio);
    write('STOCK ACTUAL: '); readln(p.stockActual);
    write('STOCK MINIMO: '); readln(p.stockMinimo);
    write('DESCRIPCION: '); readln(p.descripcion);
end;

procedure cargarLista(var L:lista);
var
    p:producto;
begin
    leerProducto(p);
    while (p.codigo <> -1) do
        begin
            agregarAdelante(L, p);
            leerProducto(p);
        end;
end;

function buscarStock(L:lista; var stockCumple, contadorProductos:integer):real;
begin
    while (L <> nil) do
        begin
            if (L^.elemento.stockActual < L^.elemento.stockMinimo) then
                begin
                    stockCumple:=stockCumple+1;
                    contadorProductos:=contadorProductos+1;
                end
                    else
                        begin
                            contadorProductos:=contadorProductos+1;
                        end;
            L:=L^.nodoSig;
        end;
    buscarStock:=(stockCumple/contadorProductos)*100;
end;

function descomponerCodigo(L:lista):boolean;
var
    contadorDigitos, aux:integer;
begin
    while (L <> nil) do
        begin
        contadorDigitos:=0;
        aux:=L^.elemento.codigo;
        while (aux <> 0) and (aux <> -1) do
            begin
                if (aux mod 2 = 0) then
                    begin
                        contadorDigitos:=contadorDigitos+1;
                    end;
                aux:=aux div 10;
            end;
        descomponerCodigo:=(contadorDigitos >= 3);
        if (descomponerCodigo) then
            begin
                writeln(L^.elemento.descripcion);
            end;
        L:=L^.nodoSig;
        end;
end;

procedure masBaratos(L:lista; var precioBarato1, precioBarato2:real; var codigoBarato1, codigoBarato2:integer);
begin
    while (L <> nil) do
        begin
            if (L^.elemento.precio < precioBarato1) and (L^.elemento.codigo <> -1) then
                begin
                    precioBarato2:=precioBarato1;
                    precioBarato1:=L^.elemento.precio;
                    codigoBarato2:=codigoBarato1;
                    codigoBarato1:=L^.elemento.codigo;
                end;
            if (L^.elemento.precio < precioBarato2) and (L^.elemento.precio > precioBarato1) and (L^.elemento.codigo <> -1) then
                begin
                    precioBarato2:=L^.elemento.precio;
                    codigoBarato2:=L^.elemento.codigo;
                end;
            L:=L^.nodoSig;
        end;
    writeln('CODIGOS MAS BARATOS: ', codigoBarato1, ' y ', codigoBarato2);
end;

var
    p:producto;
    l:lista;
    stockCumple, contadorProductos, codigoBarato1, codigoBarato2:integer;
    precioBarato1, precioBarato2:real;

begin
    precioBarato1:=999; precioBarato2:=999;
    codigoBarato1:=0; codigoBarato2:=0;
    stockCumple:=0; contadorProductos:=0;
    
    l:=nil; // INICIALIZA LA LISTA EN NIL
    cargarLista(l);
    writeln('==============================');
    writeln(buscarStock(L, stockCumple, contadorProductos):0:2, '%');
    descomponerCodigo(L);
    masBaratos(L, precioBarato1, precioBarato2, codigoBarato1, codigoBarato2);
end.