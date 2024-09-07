program e4;
const
    precioMinuto = 3.4;
    precioMB = 1.35;

function calcularTotalMB(var cantidadTotalMB: real; cantidadMB: real): real;
begin
    cantidadTotalMB:=cantidadTotalMB+cantidadMB;
    calcularTotalMB:=cantidadTotalMB;
end;

function precioTotalMB(cantidadTotalMB: real): real;
begin
    precioTotalMB:=cantidadTotalMB*precioMB;
end;

function precioTotalMinutos(cantidadTotalMinutos: real): real;
begin
    precioTotalMinutos:=cantidadTotalMinutos*precioMinuto;
end;

function calcularTotalMinutos(var cantidadTotalMinutos, cantidadMinutos, cantidadMB, precioMinutosTotal: real): real;
begin
    cantidadTotalMinutos:=cantidadTotalMinutos+cantidadMinutos;
    calcularTotalMinutos:=cantidadTotalMinutos;
end;

procedure datosLinea(cantidadLineas:integer; cantidadTotalMinutos, cantidadTotalMB, precioMBTotal, precioMinutosTotal: real; var cantidadMinutos, cantidadMB: real);
var
    numTelefono, i: integer;
begin
    for i:=1 to cantidadLineas do 
        begin
            writeln('=============== DATOS DE LA LINEA ===============');
            write('NUMERO DE TELEFONO: '); readln(numTelefono);
            write('CANTIDAD MINUTOS CONSUMIDOS: '); readln(cantidadMinutos);
            write('CANTIDAD DE MB: '); readln(cantidadMB);
            writeln('CANTIDAD TOTAL DE MINUTOS: ', calcularTotalMinutos(cantidadTotalMinutos, cantidadMinutos, cantidadMB, precioMinutosTotal):0:2, ' TOTAL A PAGAR: ', precioTotalMinutos(cantidadTotalMinutos):0:2);
            writeln('CANTIDAD TOTAL DE MB: ', calcularTotalMB(cantidadTotalMB, cantidadMB):0:2, ' TOTAL A PAGAR: ', precioTotalMB(cantidadTotalMB):0:2);
        end;
end;

procedure datosCliente(var codigoCliente, cantidadLineas: integer; cantidadTotalMinutos, cantidadTotalMB, cantidadMinutos, cantidadMB, precioMinutosTotal, precioMBTotal: real);
begin
    write('CODIGO DE CLIENTE: '); readln(codigoCliente);
    write('CANTIDAD DE LINEAS: '); readln(cantidadLineas);
    datosLinea(cantidadLineas, cantidadTotalMinutos, cantidadTotalMB, precioMBTotal, precioMinutosTotal, cantidadMinutos, cantidadMB);
end;

var
    codigoCliente, cantidadLineas: integer;
    cantidadMinutos, cantidadTotalMinutos, cantidadMB, cantidadTotalMB, precioMinutosTotal, precioMBTotal: real;
begin
    codigoCliente:=0; cantidadLineas:=0; cantidadTotalMinutos:=0; cantidadMB:=0; cantidadMinutos:=0; cantidadTotalMB:=0; precioMBTotal:=0; precioMinutosTotal:=0;
    datosCliente(codigoCliente, cantidadLineas, precioMinutosTotal, precioMBTotal, cantidadTotalMinutos, cantidadTotalMB, cantidadMinutos, cantidadMB);
end.