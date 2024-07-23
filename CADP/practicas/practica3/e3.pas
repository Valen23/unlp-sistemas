program e3;
Type
    escuela = record
        cue, cantDocentes, cantAlumnos: integer;
        nombreEstablecimiento, localidad: string;
    end;

function relacionDocAlu(e:escuela): real;
begin
    relacionDocAlu:=(e.cantAlumnos / e.cantDocentes);
end;

function contadorRelacionDocAlu(e:escuela; relacionDocAlu: real; var contadorRatio: integer): integer;
begin
    if (relacionDocAlu >= 23.435) and (e.localidad = 'La Plata') then
        begin
            contadorRatio:=contadorRatio+1;
        end;
    contadorRelacionDocAlu:=contadorRatio;
end;

procedure mejoresRatios(e:escuela; contadorRelacionDocAlu: integer; var nombreEscuelaMayor1, nombreEscuelaMayor2: string; var mejorRelacion1, mejorRelacion2: real; var cueMayor1, cueMayor2: integer);
begin
    if (contadorRelacionDocAlu > mejorRelacion1) then
        begin
            mejorRelacion2:=mejorRelacion1;
            mejorRelacion1:=contadorRelacionDocAlu;
            nombreEscuelaMayor2:=nombreEscuelaMayor1;
            nombreEscuelaMayor1:=e.nombreEstablecimiento;
            cueMayor2:=cueMayor1;
            cueMayor1:=e.cue;
        end
        else if (contadorRelacionDocAlu > mejorRelacion2) then
            begin
                mejorRelacion2:=contadorRelacionDocAlu;
                nombreEscuelaMayor2:=e.nombreEstablecimiento;
                cueMayor2:=e.cue;
            end;
end;

procedure leerEscuela(var e:escuela; contadorRatio: integer; nombreEscuelaMayor1, nombreEscuelaMayor2: string; mejorRelacion1, mejorRelacion2: real; cueMayor1, cueMayor2: integer);
var
    i: integer;
begin
    for i:=1 to 5 do
        begin
            write('CUE: '); readln(e.cue);
            write('cantidad de docentes: '); readln(e.cantDocentes);
            write('cantidad de alumnos: '); readln(e.cantAlumnos);
            write('nombre de la escuela: '); readln(e.nombreEstablecimiento);
            write('localidad: '); readln(e.localidad);
            writeln(relacionDocAlu(e):0:2);
            writeln('cantidad de escuelas de LA PLATA que cumplen con la UNESCO: ', contadorRelacionDocAlu(e, relacionDocAlu(e), contadorRatio));
            mejoresRatios(e, contadorRelacionDocAlu(e, relacionDocAlu(e), contadorRatio), nombreEscuelaMayor1, nombreEscuelaMayor2, mejorRelacion1, mejorRelacion2, cueMayor1, cueMayor2);
        end;
end;

var
    esc: escuela;
    contadorRatio, cueMayor1, cueMayor2: integer;
    nombreEscuelaMayor1, nombreEscuelaMayor2: string;
    mejorRelacion1, mejorRelacion2: real;

begin
    cueMayor1:=0; cueMayor2:=0; mejorRelacion1:=0; mejorRelacion2:=0;
    nombreEscuelaMayor1:=''; nombreEscuelaMayor2:='';
    contadorRatio:=0;
    leerEscuela(esc, contadorRatio, nombreEscuelaMayor1, nombreEscuelaMayor2, mejorRelacion1, mejorRelacion2, cueMayor1, cueMayor2);
end.