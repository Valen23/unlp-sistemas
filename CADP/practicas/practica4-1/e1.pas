program e1;
type
    vnums = array [1..10] of integer;

var
    numeros: vnums;
    i: integer;

begin
    for i:= 1 to 10 do
        begin
            numeros[i]:=i;
        end;
    for i:=2 to 10 do
        begin
            numeros[i]:=numeros[i] + numeros[i-1];
        end;
    for i:=1 to 10 do
        writeln(numeros[i]);
end.

// a. el primer bloque for toma los valores de i: 1, 2, 3...
// b. [1]: 1, [2]: 2 + 1 = 3, [3]: 3 + 3 = 6, [4]: 4 + 6 = 10...
// c. 