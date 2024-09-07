program e9;

function porcentajeAlumnos(var numInsPar, cantAlumnos, numIns: integer): real;
begin
    if (numIns mod 2 = 0) then
        begin
            cantAlumnos:=cantAlumnos+1;
            numInsPar:=numInsPar+1;
            porcentajeAlumnos:=(numInsPar / cantAlumnos) * 100;
        end
            else
                begin
                    cantAlumnos:=cantAlumnos+1;
                end;
end;

procedure apellidoMenor(var numIns, numInsMenor1, numInsMenor2, numInsMayor1, numInsMayor2: integer; var nombre, apellido, apellidoMenor1, apellidoMenor2, nombreMayor1, nombreMayor2: string);
begin
    if (numIns < numInsMenor1) then
            begin
                numInsMenor2:=numInsMenor1;
                numInsMenor1:=numIns;
                apellidoMenor2:=apellidoMenor1;
                apellidoMenor1:=apellido;
            end
            else if (numInsMenor2 < numIns) then
                begin
                    numInsMenor2:=numIns;
                end;
end;

procedure nombreMayor(var numIns, numInsMenor1, numInsMenor2, numInsMayor1, numInsMayor2: integer; var nombre, apellido, apellidoMenor1, apellidoMenor2, nombreMayor1, nombreMayor2: string);
begin
    if (numIns > numInsMayor1) then
        begin
            numInsMayor2:=numInsMayor2;
            numInsMayor1:=numIns;
            nombreMayor2:=nombreMayor1;
            nombreMayor1:=nombre;
        end
        else if (numInsMayor2 > numIns) then
            begin
                numInsMayor2:=numIns;
                nombreMayor2:=nombre;
            end; 
end;

procedure leerDatos(var numIns, numInsPar, numInsMenor1, numInsMenor2, numInsMayor1, numInsMayor2, cantAlumnos: integer; var nombre, apellido, apellidoMenor1, apellidoMenor2, nombreMayor1, nombreMayor2: string);
begin
    repeat
        write('numero de inscripcion: '); readln(numIns);
        write('nombre: '); readln(nombre);
        write('apellido: '); readln(apellido);
        apellidoMenor(numIns, numInsMenor1, numInsMenor2, numInsMayor1, numInsMayor2, nombre, apellido, apellidoMenor1, apellidoMenor2, nombreMayor1, nombreMayor2);
        nombreMayor(numIns, numInsMenor1, numInsMenor2, numInsMayor1, numInsMayor2, nombre, apellido, apellidoMenor1, apellidoMenor2, nombreMayor1, nombreMayor2);
        writeln(apellidoMenor1, ' - ', apellidoMenor2);
        writeln(nombreMayor1, ' - ', nombreMayor2);
        writeln(porcentajeAlumnos(numInsPar, cantAlumnos, numIns):0:2, '%');
    until (numIns = 1200);
end;
var
    numIns, numInsPar, numInsMenor1, numInsMenor2, numInsMayor1, numInsMayor2, cantAlumnos: integer;
    nombre, apellido, apellidoMenor1, apellidoMenor2, nombreMayor1, nombreMayor2: string;
begin
    numInsMenor1:=9999;
    numInsMenor2:=9999;
    numInsMayor1:=0;
    numInsMayor2:=0;
    cantAlumnos:=0;
    numInsPar:=0;
    leerDatos(numIns, numInsPar, numInsMenor1, numInsMenor2, numInsMayor1, numInsMayor2, cantAlumnos, nombre, apellido, apellidoMenor1, apellidoMenor2, nombreMayor1, nombreMayor2);
end.