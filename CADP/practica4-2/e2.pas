program e2;
const
    dimF = 5;

type
    registro = record
        nombre: string;
    end;

    vector = array[1..dimF] of registro;

procedure cargarVector(var v: vector; var dimL: integer);
begin
    dimL := 0;
    write('Ingrese el nombre del alumno (ingrese "ZZZ" para terminar): '); 
    readln(v[dimL + 1].nombre);
    while (dimL < dimF) and (v[dimL + 1].nombre <> 'ZZZ') do
    begin
        dimL := dimL + 1;
        if (dimL < dimF) then
        begin
        write('Ingrese el nombre del alumno (ingrese "ZZZ" para terminar): '); 
        readln(v[dimL + 1].nombre);
        end;
    end;
end;

procedure imprimirVector(v:vector; dimL:integer);
var
    i: integer;
begin
    for i:=1 to dimL do
        begin
            writeln('[', i, ']: ', v[i].nombre);
        end;
end;

procedure eliminarOcurrencia(var v:vector; var dimL:integer; nombreABuscar: string);
var
    i, posicionOcurrencia: integer;
begin
    // BUSCA LA POSICION DEL NOMBRE
    posicionOcurrencia:=0;
    for i:=1 to dimL do
        begin
            if (v[i].nombre = nombreABuscar) then
                begin
                    posicionOcurrencia:=i;
                end;
        end;
    
    if (posicionOcurrencia > 0) then
        begin
            for i:=posicionOcurrencia to dimL-1 do
                begin
                    v[i].nombre:=v[i+1].nombre;
                end;
        dimL:=dimL-1;
        end;
end;

procedure insertarElemento(var v:vector; posicion:integer);
var
    nombre: string;
begin
    write('nombre a insertar en la posicion ', posicion, ':'); readln(nombre);
    v[posicion].nombre:=nombre;
end;

procedure agregarElemento(var v:vector; dimL:integer);
var
    nombre: string;
begin
    if (dimL < dimF) then
        begin
            write('ingrese el nombre a agregar: '); readln(nombre);
            v[dimL+1].nombre:=nombre;
        end
        else
            begin
                writeln('SE ALCANZO EL MAXIMO DE LA DIMENSION FISICA.');
            end;
end;

var
    v:vector;
    dimL: integer;
    nombreABuscar: string;

begin
    nombreABuscar:='juan';
    cargarVector(v, dimL);
    eliminarOcurrencia(v, dimL, nombreABuscar);
    insertarElemento(v, 4);
    agregarElemento(v, dimL);
    imprimirVector(v, dimL);
end.