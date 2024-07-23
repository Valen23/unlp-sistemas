program e7;
var
    nombre, primeroNombre, segundoNombre, ultimoNombre, anteUltimoNombre: string;
    tiempo, tiempoPrimero, tiempoSegundo, tiempoUltimo, tiempoAnteUltimo: real;
    i: integer;

begin
    tiempo := 9999;
    tiempoPrimero := 9999;
    tiempoSegundo := 9999;
    tiempoUltimo := 0;
    tiempoAnteUltimo := 0;
    for i:=1 to 5 do
        begin
            Write('Nombre: ');
            ReadLn(nombre);
            Write('Tiempo: ');
            ReadLn(tiempo);
            if (tiempo > tiempoUltimo) then
                begin
                    tiempoAnteUltimo:=tiempoAnteUltimo;
                    tiempoUltimo:=tiempo;
                    ultimoNombre:=anteUltimoNombre;
                    nombre:=ultimoNombre;
                end
                else if (tiempo > tiempoAnteUltimo) then
                    begin
                        tiempoAnteUltimo:=tiempo;
                    end;
            if (tiempo < tiempoPrimero) then
                begin
                    segundoNombre:=primeroNombre;
                    primeroNombre:=nombre;
                    tiempoSegundo:=tiempoPrimero;
                    tiempoPrimero:=tiempo;
                end
                else if (tiempo < tiempoSegundo) then
                    begin
                        tiempoSegundo:=tiempo;
                    end;
            WriteLn('PRIMERO: ', primeroNombre, tiempoPrimero:0:2, 'SEGUNDO', segundoNombre, tiempoSegundo:0:2, 'ANTEULTIMO', anteUltimoNombre, tiempoAnteUltimo:0:2, 'ULTIMO', ultimoNombre, tiempoUltimo:0:2);
        end;
end.