program e6;
Type
    procesador = record
            marca, linea: string;
            nucleos, nanometros: integer;
            reloj: real;
        end;

function contadorMulticore(p:procesador; var contadorMulti:integer; marcaActual: string):integer;
    begin
        if (p.nucleos > 1) and (p.reloj > 2) and ((marcaActual = 'amd') or (marcaActual = 'intel')) then
            begin
                contadorMulti:=contadorMulti+1;
            end;
        contadorMulticore:=contadorMulti;
     end;

procedure contadorProcesadorTransistores(p:procesador; var contador:integer);
    begin
        if (p.nanometros <= 14) then
            begin
                contador:=contador+1;
            end;
    end;

procedure ProcesadoresTransistores(p:procesador; marcaActual: string; contador: integer; var contadorMarca1, contadorMarca2: integer; var nombreMarca1, nombreMarca2: string);
    begin
        if (p.nanometros <= 14) then
            begin
                if (contador > contadorMarca1) then
                    begin
                        contadorMarca2:=contadorMarca1;
                        contadorMarca1:=contador;
                        nombreMarca2:=nombreMarca1;
                        nombreMarca1:=marcaActual;
                    end
                    else if (contador > contadorMarca2) then
                        begin
                            contadorMarca2:=contador;
                            nombreMarca2:=marcaActual;
                        end;
            end;
        writeln('MARCA CON MAYOR CANTIDAD DE CPU CON TRANSISTORES DE 14NM O MAS: ', nombreMarca1);
        writeln('MARCA CON SEGUNDA MAYOR CANTIDAD DE CPU CON TRANSISTORES DE 14NM O MAS: ', nombreMarca2);
        // writeln(contador, ' ', contadorMarca1, ' ', contadorMarca2, ' ', nombreMarca1, ' ', nombreMarca2);
    end;

procedure leerDatos(var p:procesador);
    begin
        write('marca: '); readln(p.marca);
        // write('linea: '); readln(p.linea);
        write('nucleos: '); readln(p.nucleos);
        write('nanometros: '); readln(p.nanometros);
        write('reloj: '); readln(p.reloj);
    end;
var
    contadorProcesadores, contadorMarca1, contadorMarca2, contadorMulti: integer;
    cpu: procesador;
    marcaActual, nombreMarcaMayor1, nombreMarcaMayor2: string;

begin
    contadorProcesadores:=0;
    contadorMulti:=0;
    leerDatos(cpu);
    while (cpu.nucleos <> 0) do // MIENTRAS NO SEA LA CONDICION DE FIN EJECUTA EL BLOQUE
        begin
            marcaActual:=cpu.marca;
            while (cpu.marca = marcaActual) do // MIENTRAS SEA LA MISMA MARCA EJECUTA EL BLOQUE
                begin
                    writeln('CANTIDAD DE CPU MULTICORE: ', contadorMulticore(cpu, contadorMulti, marcaActual));
                    contadorProcesadorTransistores(cpu, contadorProcesadores);
                    leerDatos(cpu); // LEE LOS DATOS DEL SIGUIENTE PROCESADOR
                end;
            procesadoresTransistores(cpu, marcaActual, contadorProcesadores, contadorMarca1, contadorMarca2, nombreMarcaMayor1, nombreMarcaMayor2);
            contadorProcesadores:=0;
        end;
end.