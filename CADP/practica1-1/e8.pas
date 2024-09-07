program e8;
var
    char1, char2, char3: char;
    todosVocal, unoVocal: Boolean;

begin
    todosVocal := false;
    unoVocal := false;
    Write('Ingrese el primer caracter: ');
    ReadLn(char1);
    Write('Ingrese el segundo caracter: ');
    ReadLn(char2);
    Write('Ingrese el tercer caracter: ');
    ReadLn(char3);
    if (char1 = 'A') or (char1 = 'E') or (char1 = 'I') or (char1 = 'O') or (char1 = 'U') then
        begin
            unoVocal := true;
            if (char2 = 'A') or (char2 = 'E') or (char2 = 'I') or (char2 = 'O') or (char2 = 'U') then
                begin
                    unoVocal := true;
                    if (char3 = 'A') or (char3 = 'E') or (char3 = 'I') or (char3 = 'O') or (char3 = 'U') then
                        begin
                            todosVocal := true;
                            unoVocal := false;
                        end;
                end;
        end;
    if (todosVocal = true) then
        begin
            WriteLn('Todas son vocales.');
        end;
    if (unoVocal = true) then
        begin
            WriteLn('Hay al menos una vocal');
        end;
end.