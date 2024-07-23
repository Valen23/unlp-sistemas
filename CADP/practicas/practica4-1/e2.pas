program e2;

const
    cant_datos = 5;

type
    vdatos = array[1..cant_datos] of real;

procedure cargarVector(var v:vdatos; var dimL: integer);
var
    i: integer;
begin
    i:=0;
    v[1]:=1;
    while (i < cant_datos) do
        begin
            i:=i+1;
            write('escriba un valor: '); readln(v[i]);
        end;
    dimL:=i;
end;

procedure modificarVectorySumar(var v:vdatos; dimL: integer; n: real; var suma: real);
var
    i: integer;
begin
    for i:=1 to dimL do
        begin
            v[i]:=v[i]+n;
        end;

    for i:=1 to dimL do
        begin
            suma:=suma+v[i];
        end;
end;

var
    datos: vdatos;
    i, dim: integer;
    num, suma: real;

begin
    dim := 0;
    suma:= 0;
    cargarVector(datos, dim);
    writeln('Ingrese un valor a sumar: ');
    readln(num);
    modificarVectorySumar(datos, dim, num, suma);
    writeln('La suma de valores es: ', suma:0:2);
    writeln('Se procesaron ', dim, ' numeros');
end.