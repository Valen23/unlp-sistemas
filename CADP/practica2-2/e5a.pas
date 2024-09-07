program e5a;
function doble(numA, numB: integer): boolean;
begin
    doble:=false;
    if (numA * 2 = numB) then
        begin
            doble:=true;
        end;
end;
var
    a, b: integer;
begin
    a:=15;
    b:=30;
    writeln(doble(a, b));
end.