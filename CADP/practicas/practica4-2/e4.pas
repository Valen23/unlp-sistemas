program e4;
const
    dimF = 5;
type
    alumno = record
        numero:integer;
        apellido, nombre: string;
        asistencias: integer;
    end;

    vector = array[1..dimF] of alumno;
    
procedure cargarVector(var v:vector; var dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimF do
        begin
            write('INGRESE EL NUMERO DE ALUMNO: '); readln(v[i].numero);
            // write('INGRESE EL NOMBRE: '); readln(v[i].nombre);
            // write('INGRESE EL APELLIDO: '); readln(v[i].apellido);
            write('INGRESE LAS ASISTENCIAS: '); readln(v[i].asistencias);
        end;
    dimL:=i;
end;

procedure ordenarVector(var v:vector);
var
    i, j, aux:integer;

begin
    for i:=1 to dimF-1 do
        begin
            for j:=i+1 to dimF do
                begin
                    if (v[i].numero > v[j].numero) then
                        begin
                            aux:=v[i].numero;
                            v[i].numero:=v[j].numero;
                            v[j].numero:=aux;
                        end;
                end;
        end;
end;

procedure imprimirVector(v:vector; dimL:integer);
var
    i:integer;
begin
    writeln('====================');
    for i:=1 to dimL do
        begin
            writeln('NUMERO DE ALUMNO: ', v[i].numero);
            writeln('ASISTENCIAS: ', v[i].asistencias)
        end;
    writeln('====================');
    dimL:=i;
end;

function buscarAlumno(v:vector; numBuscar:integer):integer;
var
    i:integer;
begin
    for i:=1 to dimF do
        begin
            if (v[i].numero = numBuscar) then
                begin
                    buscarAlumno:=i;
                end;
        end;
end;

procedure insertarElemento(var v:vector; pos:integer);
begin
    write('NUMERO DEL ALUMNO A INSERTAR: '); readln(v[pos].numero);
    write('NOMBRE DEL ALUMNO A INSERTAR: '); readln(v[pos].nombre);
    write('APELLIDO DEL ALUMNO A INSERTAR: '); readln(v[pos].apellido);
    write('ASISTENCIAS DEL ALUMNO A INSERTAR: '); readln(v[pos].asistencias);
end;

procedure eliminarElemento(var v:vector; pos:integer);
var
    i:integer;
begin
    for i:=pos to dimF do
        begin
            v[i].numero:=v[i+1].numero;
        end;
end;

procedure eliminarAlumno(var v:vector; numeroAlumnoBuscar:integer);
var
    i, pos:integer;
begin
    for i:=1 to dimF do
        begin
            if (numeroAlumnoBuscar = v[i].numero) then 
                begin
                    pos:=i;
                end;
        end;
    for i:=pos to dimF do
        begin
            v[i].numero:=v[i+1].numero;
        end;
end;

procedure eliminarAlumnoAsistencias(var v:vector; dimL:integer);
var
    i, j:integer;
begin
    for i:=1 to dimL do
        begin
            j:=i;
        if (v[j].asistencias = 0) then
            begin
                for j:=i to dimL do
                    begin
                        v[j].numero:=v[j+1].numero;
                        v[j].asistencias:=v[j+1].asistencias;
                        dimL:=dimL-1;
                    end;
            end;
        end;
end;

var
    dimL, numBuscar, numInsertar, numEliminar, numAlumnoEliminar:integer;
    v:vector;

begin
    cargarVector(v, dimL);
    ordenarVector(v);
    // write('INGRESE EL NUMERO DEL ALUMNO A BUSCAR: '); readln(numBuscar);
    // write('INGRESE LA POSICION DEL ALUMNO A INSERTAR: '); readln(numInsertar);
    // write('INGRESE EL NUMERO DE LA POSICION A ELIMINAR: ); readln(numEliminar);
    // write('INGRESE EL NUMERO DEL ALUMNO A ELIMINAR: '); readln(numAlumnoEliminar);
    // writeln('EL ALUMNO ESTA EN LA POSICION: ', buscarAlumno(v, numBuscar));
    // insertarElemento(v, numInsertar);
    // eliminarElemento(v, numEliminar);
    // eliminarAlumno(v, numAlumnoEliminar);
    eliminarAlumnoAsistencias(v, dimL);
    imprimirVector(v, dimL);
end.