program e3;
var
    nombre: string;
    nota, contador8, contador7: integer;

begin
    contador8 := 0;
    contador7 := 0;
    repeat
        Write('Nombre del alumno: ');
        ReadLn(nombre);
        Write('Nota en EPA: ');
        ReadLn(nota);
        if (nota > 8) then
            contador8 := contador8 + 1;
        if (nota = 7) then
            contador7 := contador7 + 1;
        WriteLn('8 O MAS: ', contador8, ' JUSTO 7: ', contador7);
    until nombre = 'Zidane Zinedine'
end.