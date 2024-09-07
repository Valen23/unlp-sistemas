program e1;
const
    dimF = 5;

type
    vector = array[1..dimF] of integer;

procedure cargarVector(var v:vector; var dimL: integer);
var
    i: integer;
begin
    randomize;
    dimL:=0;
    for i:=1 to dimF do
        begin
            v[i]:=random(500);
            dimL:=dimL+1;
        end;
end;

function hallarValor(v:vector; n, dimL:integer): boolean;
var
    i: integer;
begin
    hallarValor:=false;
    for i:=1 to dimL do
        begin
            if (n = v[i]) then
                begin
                    hallarValor:=true;
                end;
        end;
end;

procedure ordenarVector(var v:vector; dimL:integer);
var
    p, i, j, item: integer;
begin
    for i:=1 to dimL-1 do
    begin
        p:=i;
            for j:=i+1 to dimL do
                begin
                    if (v[j] < v[p]) then
                        begin
                            p:=j;
                        end; 
                end;
            item:=v[p];
            v[p]:=v[i];
            v[i]:=item;
        end;
end;

procedure imprimirVector(v:vector);
var
    i: integer;
begin
    for i:=1 to dimF do
        begin
            writeln('n: ', v[i]);
        end;
end;

var
    v: vector;
    dimL, n: integer;

begin
    cargarVector(v, dimL);
    write('hallar valor: '); readln(n);
    writeln(hallarValor(v, n, dimL));
    ordenarVector(v, dimL);
    imprimirVector(v);
end.