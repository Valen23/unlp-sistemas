program e4;
const
    dimF = 5;

type
    vector = array[1..100] of integer;

procedure cargarVector(var v:vector);
var
    i: integer;
begin
    for i:=1 to dimF do
        begin
            write('n: '); readln(v[i]);
        end;
end;

function valorPosicion(v:vector; x:integer): integer;
begin
    if (x <= dimF) then
        begin
            valorPosicion:=v[x];
        end
        else
            begin
                valorPosicion:=-1;
            end;
end;

procedure cambiarValores(var v:vector; pos1, pos2: integer);
var
    i, y, z: integer;
begin
    y:=v[pos1];
    z:=v[pos2];
    v[pos1]:=z;
    v[pos2]:=y;
    for i:=1 to dimF do
        begin
            writeln(v[i]);
        end;
end;

function sumaValores(v:vector): integer;
var
    i: integer;
begin
    sumaValores:=0;
    for i:=1 to dimF do
        begin
            sumaValores:=sumaValores + v[i];
        end;
end;

var
    v:vector;
    x, pos1, pos2: integer;

begin
    cargarVector(v);
    write('escriba la posicion: '); readln(x);
    writeln('el valor de la posicion es: ', valorPosicion(v, x));
    write('escriba las posiciones a intercambiar: '); read(pos1); read(pos2); cambiarValores(v, pos1, pos2);
    writeln('la suma de los vectores es: ', sumaValores(v));
end.