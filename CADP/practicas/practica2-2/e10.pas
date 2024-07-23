program e10;
function esVocal(): boolean;
var
    vocal: char;
begin
    esVocal:=false;
    write('ingrese una vocal: '); readln(vocal);
    if (vocal = 'a') or (vocal = 'e') or (vocal = 'i') or (vocal = 'o') or (vocal = 'u') then
        begin
            esVocal:=true;
        end;
    writeln(esVocal);
end;
function esPorcentaje(): boolean;
var
    caracterPorcentaje: char;
begin
    esPorcentaje:=false;
    writeln('porcentaje'); readln(caracterPorcentaje);
    if (caracterPorcentaje = '%') then
        begin
            esPorcentaje:=true;
        end;
end;
begin
    esVocal;
    esPorcentaje;
end.