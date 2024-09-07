program e3;
var
    n1, n2, n3 : integer;

begin
    WriteLn('Escriba 3 numeros: ');

    ReadLn(n1);
    ReadLn(n2);
    ReadLn(n3);

    If (n1 > n2) and (n1 > n3) then // Verifica si N1 es el mas grande
        begin
            WriteLn('Primero: ', n1);
            if (n2 > n3) then // Verifica si N2 es el segundo mas grande
                begin
                    WriteLn('Segundo: ', n2);
                    WriteLn('Tercero: ', n3);
                end
                else
                begin
                    WriteLn('Segundo: ', n3);
                    WriteLn('Tercero: ', n2);
                end;
        end;

    If (n2 > n1) and (n2 > n3) then // Verifica si N2 es el mas grande
        begin
            WriteLn('Primero: ', n2);
            if (n1 > n3) then // Verifica si N1 es el segundo mas grande
                begin
                    WriteLn('Segundo: ', n1);
                    WriteLn('Tercero: ', n3);
                end
                else
                begin
                    WriteLn('Segundo: ', n3);
                    WriteLn('Tercero: ', n1);
                end;
        end;

    If (n3 > n1) and (n3 > n2) then // Verifica si N3 es el mas grande
        begin
            WriteLn('Primero: ', n3);
            if (n2 > n1) then
                begin
                    WriteLn('Segundo: ', n2);
                    WriteLn('Tercero: ', n1);
                end
                else
                begin
                    WriteLn('Segundo: ', n1);
                    WriteLn('Tercero: ', n2);
                end;
        end;
end.