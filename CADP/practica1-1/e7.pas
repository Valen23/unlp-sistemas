program e7;
var
    codigo: integer;
    precioActual, precioNuevo, difAbs, media, porcentaje: real;

begin
    codigo := 0;
    precioActual := 0;
    precioNuevo := 0;
    porcentaje := 0;
    repeat
        write('Ingrese el codigo: ');
        ReadLn(codigo);
        write('Ingrese el precio actual: ');
        ReadLn(precioActual);
        write('Ingrese el precio nuevo: ');
        ReadLn(precioNuevo);
        porcentaje := (((precioActual-precioNuevo)*-1)/precioActual) * 100;
        if (porcentaje > 10) then
            begin
                WriteLn('La diferencia es del ', porcentaje:0:2, '%, mayor al 10%');
            end
            else
            begin
                WriteLn('La diferencia es del ', porcentaje:0:2, '%, menor al 10%');
            end;
    until (codigo = 32767)
end.