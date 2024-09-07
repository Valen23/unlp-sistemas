program e6;
type

    vector = array[1..7] of integer;

    sonda = record
        nombre:string;
        rangoEspectro:1..7;
        duracion:integer;
        costoConstruccion, costoMantenimiento:real;
    end;

    lista = ^nodo;

    nodo = record
        elemento:sonda;
        nodoSig:lista;
    end;

procedure leerSonda(var s:sonda);
begin
    with s do
        begin
            write('NOMBRE: '); readln(nombre);
            write('DURACION: '); readln(duracion);
            write('COSTO DE CONSTRUCCION: '); readln(costoConstruccion);
            write('COSTO DE MANTENIMIENTO: '); readln(costoMantenimiento);
            write('RANGO ELECTROMAGNETICO: '); readln(rangoEspectro);
        end;
end;

procedure agregarAdelante(var l:lista; s:sonda);
var
    nuevoNodo:lista;
begin
    new(nuevoNodo); nuevoNodo^.elemento:=s; nuevoNodo^.nodoSig:=nil;
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

procedure crearLista(var l:lista);
var
    s:sonda;
begin
    repeat
        leerSonda(s);
        agregarAdelante(l, s);
    until (s.nombre = 'GAIA'); 
end;

function sondaMasCostosa(l:lista; s:sonda; var sondaCostosa:real):string;
begin
    while (l <> nil) do
        begin
            if ((L^.elemento.costoConstruccion+L^.elemento.costoMantenimiento) > sondaCostosa) then
                begin
                    sondaCostosa:=(s.costoConstruccion+s.costoMantenimiento);
                    sondaMasCostosa:=l^.elemento.nombre;
                end;
            l:=l^.nodoSig;
        end;
end;

procedure imprimirLista(l:lista; s:sonda);
begin
    while (l <> nil) do
        begin
            writeln(L^.elemento.nombre);
            l:=l^.nodoSig;
        end;
end;

procedure contadorSondas(l:lista; var cantS:vector; var contadorTotal:integer);
var
    i:integer;
begin
    while (l <> nil) do
        begin
            cantS[l^.elemento.rangoEspectro]:=cantS[l^.elemento.rangoEspectro]+1;
            contadorTotal:=contadorTotal+1;
            l:=l^.nodoSig;
        end;

    for i:=1 to 7 do
        begin
            writeln('CANTIDAD DE SONDAS CON EL ESPECTRO ', i, ' SON: ', cantS[i], ' Y LA CANTIDAD TOTAL DE SONDAS SON: ', contadorTotal);
        end;
end;

function duracionPromedio(l:lista; var duracionTotal:real; contadorTotal:integer):real;
begin
    while (l <> nil) do
        begin
            duracionTotal:=duracionTotal+l^.elemento.duracion;
            l:=l^.nodoSig;
        end;
    duracionPromedio:=(duracionTotal/contadorTotal);
end;

function cantidadSondasMayor(l:lista; duracionPromedio:real):integer;
var
    contador:integer;
begin
    contador:=0;
    while (l <> nil) do
        begin
            if (l^.elemento.duracion > duracionPromedio) then
                begin
                    contador:=contador+1;
                    cantidadSondasMayor:=contador;
                end;
            l:=l^.nodoSig;
        end;
end;

function costoPromedio(l:lista; s:sonda; contadorTotal:integer):real;
var
    contadorCostoTotal:real;
begin
    while (l <> nil) do
        begin
            contadorCostoTotal:=contadorCostoTotal+(l^.elemento.costoConstruccion+l^.elemento.costoConstruccion);
            costoPromedio:=(contadorCostoTotal/contadorTotal);
            l:=l^.nodoSig;
        end;
end;

procedure nombreSondaCostosa(l:lista; costoPromedio:real);
begin
    while (l <> nil) do
        begin
            if ((l^.elemento.costoConstruccion+l^.elemento.costoMantenimiento) > costoPromedio) then
                begin
                    writeln('SONDA QUE SUPERA EL PRECIO PROMEDIO: ', l^.elemento.nombre);
                end;
            l:=l^.nodoSig;
        end;
end;

var
    s:sonda;
    v:vector;
    l:lista;
    sondaCostosa:real;
    contadorTotal: integer;
    duracionTotal: real;

begin
    contadorTotal:=0;
    sondaCostosa:=0;
    duracionTotal:=0;
    l:=nil;
    crearLista(l);
    contadorSondas(l, v, contadorTotal);
    writeln('LA CANTIDAD DE SONDAS CON UNA DURACION MAYOR AL PROMEDIO SON: ', cantidadSondasMayor(l, duracionPromedio(l, duracionTotal, contadorTotal)));
    writeln('LA SONDA MAS COSTOSA ES: ', sondaMasCostosa(l, s, sondaCostosa));
    nombreSondaCostosa(l, costoPromedio(l, s, contadorTotal));
end.