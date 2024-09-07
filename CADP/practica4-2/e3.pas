program e3;
const
    dimF = 5;
type
    viaje = record
        dia:integer;
        dinero, distancia:real;
    end;

    vector = array[1..dimF] of viaje;
    contador = array[1..31] of integer;

function contadorDistancia(v:vector; i:integer; var distanciaTotal:real):real;
begin
    distanciaTotal:=distanciaTotal + v[i].distancia;
    contadorDistancia:=distanciaTotal;
end;

function contadorMontoPromedio(v:vector; dimL, i:integer; var contadorDinero, montoPromedio:real):real;
var
    k:integer; // VARIABLE AUXILIAR, USAMOS K PORQUE SI TENEMOS QUE HACER i-1 ES IMPOSIBLE
begin
    k:=i;
    contadorDinero:=contadorDinero + v[i].dinero;
    contadorMontoPromedio:=contadorDinero/k;
    if (v[i].distancia = 0) then // SI V[I].DISTANCIA = 0 ENTONCES SE RESTA ESE MODULO Y NO SE CUENTA EL DINERO
        begin
            contadorDinero:=contadorDinero - v[i].dinero;
            k:=k-1;
        end;
    montoPromedio:=contadorMontoPromedio;
end;

function diaMenosDinero(v:vector; i:integer; var diaMenor:integer; var dineroMenor:real):integer;
begin
    if ((v[i].dinero < dineroMenor) and (v[i].distancia <> 0)) then
        begin
            dineroMenor:=v[i].dinero;
            diaMenosDinero:=v[i].dia;
            diaMenor:=diaMenosDinero;
        end;
end;

procedure imprimirVector(v:vector; dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do
        begin
            writeln('=============== ', i, ' ===============');
            writeln(v[i].dia);
            writeln(v[i].dinero:0:2);
            writeln(v[i].distancia:0:2);
        end;
end;

procedure eliminarVector(var v:vector; var dimL:integer);
var
    i, j, k:integer;
begin
    for i:=1 to dimF do // BUSCAMOS EN CADA VECTOR
        begin
            j:=i; // GUARDAMOS EN UNA NUEVA VARIABLE LOCAL EL VALOR DE LA POSICION QUE ENCONTRAMOS LO QUE NECESITAMOS (DISTANCIA = 100)
            if (v[i].distancia = 100) then // SI V[I].DIST = 100 ENTONCES
                begin
                    for j:=i to dimL-1 do // DESDE LA POSICION ENCONTRADA HASTA DIML-1 (DIML-1 YA QUE SABEMOS QUE ELIMINAMOS UNO)
                        begin
                            v[j].distancia:=v[j+1].distancia; // AL VECTOR DE LA POSICION LE PONEMOS COMO VALOR EL SIGUIENTE (EN CADA POSICION)
                            v[j].dia:=v[j+1].dia;
                            v[j].dinero:=v[j+1].dinero;
                        end;
                    dimL:=dimL-1; // LE RESTAMOS 1 A DIML, YA QUE BORRAMOS UN VECTOR
                end;
        end;
end;

procedure cargarVector(var c:contador; var v:vector; var dimL, diaMenor:integer; contadorDinero:real; var montoPromedio, distanciaTotal, dineroMenor:real);
var
    i, h:integer;
begin
    dimL:=1;
    i:=1;
    h:=0;
    writeln('=============== VECTOR ', i, ' ===============');
    write('DIA: '); readln(v[i].dia);
    write('DINERO: '); readln(v[i].dinero);
    write('DISTANCIA: '); readln(v[i].distancia);

    contadorMontoPromedio(v, dimL, i, contadorDinero, montoPromedio);
    contadorDistancia(v, i, distanciaTotal);
    diaMenosDinero(v, i, diaMenor, dineroMenor);
    c[v[i].dia]:=h+1;

    while (v[i].distancia <> 0) and (i < dimF) do
        begin
            i:=i+1;
            writeln('=============== VECTOR ', i, ' ===============');
            write('DIA: '); readln(v[i].dia);
            write('DINERO: '); readln(v[i].dinero);
            write('DISTANCIA: '); readln(v[i].distancia);

            contadorMontoPromedio(v, dimL, i, contadorDinero, montoPromedio);
            contadorDistancia(v, i, distanciaTotal);
            diaMenosDinero(v, i, diaMenor, dineroMenor);
            c[v[i].dia]:=c[v[i].dia]+1;

            dimL:=dimL+1;
        end;

    if (v[i].distancia = 0) then // SI SE INGRESA V[I].DISTANCIA = 0, ENTONCES SE RESTA 1 AL DIML
        begin
            dimL:=dimL-1;
            writeln('VECTOR DESCONTADO!');
        end;
    
    for i:=1 to 31 do
        begin
            writeln('DIA ', i, ', CANT VIAJES: ', c[i]);
        end;
end;

var
    c:contador;
    v:vector;
    dimL, diaMenor:integer;
    contadorDinero, montoPromedio, distanciaTotal, dineroMenor:real;

begin
    distanciaTotal:=0;
    contadorDinero:=0;
    dineroMenor:=9999;
    cargarVector(c, v, dimL, diaMenor, contadorDinero, montoPromedio, distanciaTotal, dineroMenor);
    writeln('MONTO PROMEDIO: ', montoPromedio:0:2);
    writeln('DISTANCIA TOTAL: ', distanciaTotal:0:2);
    writeln('DIA MENOS RECAUDADO: ', diaMenor);
    eliminarVector(v, dimL);
    writeln('========== VECTORES ELIMINADOS ==========');
    imprimirVector(v, dimL);
end.