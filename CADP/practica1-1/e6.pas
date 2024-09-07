program e6;
var
    legajo, cantidadProm, cantidadAlumnos, : integer;
    promedio, cantidadDestacados, porcentajeDestacados : real;
begin
    cantidadAlumnos := 0;
    cantidadDestacados := 0;
    cantidadProm := 0;
    legajo := 0;

    while (legajo <> -1) do
        begin
            Write('Legajo: ');
            ReadLn(legajo);
            Write('Promedio: ');
            ReadLn(promedio);
            cantidadAlumnos := cantidadAlumnos+1;
            WriteLn('Cantidad alumnos: ', cantidadAlumnos);

            if (legajo <> -1) then 
                begin
                    cantidadAlumnos := cantidadAlumnos+1;
                    WriteLn('Cantidad alumnos: ', cantidadAlumnos);
                end;
            
            if (promedio > 6.5) then
                begin
                    cantidadProm := cantidadProm+1;
                    WriteLn('Cantidad promedio: ', cantidadProm);
                end;

            if (promedio > 8.5) and (legajo > 2500) then 
                begin
                    cantidadDestacados := cantidadDestacados+1;
                    porcentajeDestacados := (cantidadDestacados/cantidadAlumnos) * 100;
                    WriteLn('Porcentaje destacados: ', cantidadDestacados:1:2);
                end;

        end;
end.