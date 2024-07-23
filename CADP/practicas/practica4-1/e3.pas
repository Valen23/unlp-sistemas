program e3;
const
    dimF = 5;
type
    vector = array[1..dimF] of integer;

procedure cargarVector(var v:vector; var dimL: integer);
var
    i: integer;
begin
    for i:=1 to dimF do
        begin
            write('escriba un valor: '); readln(v[i]);
            dimL:=dimL+1;
        end;
end;

procedure imprimirVectorIzqDer(v: vector; dimL: integer);
var
    i: integer;
begin
    for i:=1 to dimL do
        begin
            writeln(v[i]);
        end;
    writeln('=================================');
end;

procedure imprimirVectorDerIzq(v: vector; dimL: integer);
var
    i: integer;
begin
    for i:=dimL downto 1 do
        begin
            writeln(v[i]);
        end;
    writeln('=================================');
end;

procedure imprimirVectorMitadAbajo(v: vector; dimL: integer);
var
    i: integer;
begin
    for i:=dimL div 2 downto 1 do
        begin
            writeln(v[i]);
        end;
    writeln('=================================');
end;

procedure imprimirVectorMitadArriba(v: vector; dimL: integer);
var
    i: integer;
begin
    for i:=(dimL div 2)+1 to dimL do
        begin
            writeln(v[i]);
        end;
    writeln('=================================');
end;

var
    v: vector;
    dimL: integer;

begin
    dimL:=0;
    cargarVector(v, dimL);
    imprimirVectorIzqDer(v, dimL);
    imprimirVectorDerIzq(v, dimL);
    imprimirVectorMitadAbajo(v, dimL);
    imprimirVectorMitadArriba(v, dimL);
end.