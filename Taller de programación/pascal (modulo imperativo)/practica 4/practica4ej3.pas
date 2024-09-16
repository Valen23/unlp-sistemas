program practica4ej3;
type
  venta = record
    codigoVenta:integer;
    codigoProductoVendido:integer;
    cantidadUnidadesVendidas:integer;
    precioUnitario:real;
  end;
  
  producto = record
    codigoProducto:integer;
    cantidadTotalVendidos:integer;
    montoTotal:real;
  end;
  
  arbol = ^nodoArbol;
  nodoArbol = record
    dato:producto;
    hi:arbol;
    hd:arbol;
  end;
  
procedure leerProducto(var p:producto);
begin
  p.codigoProducto:=random(101)-1;
  p.cantidadTotalVendidos:=random(1001);
  p.montoTotal:=random(5001);
end;

procedure agregar(var a:arbol; p:producto);
begin
  if (a = nil) then
    begin
      new(a); a^.hi:=nil; a^.hd:=nil; a^.dato:=p;
    end
    else
    begin
		if (p.codigoProducto = a^.dato.codigoProducto) then
			begin
				a^.dato.montoTotal:=a^.dato.montoTotal + p.montoTotal;
				a^.dato.cantidadTotalVendidos:=a^.dato.cantidadTotalVendidos + p.cantidadTotalVendidos;
			end
			else if (p.codigoProducto < a^.dato.codigoProducto) then agregar(a^.hi, p)
				else agregar(a^.hd, p);
    end;
end;

procedure cargarArbol(var a:arbol);
var
  p:producto;
begin
  leerProducto(p);
  if (p.codigoProducto <> -1) then
    begin
      agregar(a, p);
      leerProducto(p);
      cargarArbol(a);
    end;
end;

procedure imprimir(p:producto);
begin
  writeln('==========================================================================');
  writeln('Codigo de producto: 			', p.codigoProducto);
  writeln('Cantidad total de productos vendidos: 	', p.cantidadTotalVendidos);
  writeln('Monto total: 				', p.montoTotal:0:2);
end;

procedure imprimirArbol(a:arbol);
begin
  if (a <> nil) then
    begin
      if (a^.hi <> nil) then imprimirArbol(a^.hi);
      imprimir(a^.dato);
      if (a^.hd <> nil) then imprimirArbol(a^.hd);
    end;
end;

procedure calcularMaximo(a:arbol; var codigoMax, cantidadMax:integer);
begin
	if (a <> nil) then
		begin
			if (a^.dato.cantidadTotalVendidos > cantidadMax) then
				begin
					codigoMax:=a^.dato.codigoProducto;
					cantidadMax:=a^.dato.cantidadTotalVendidos;
				end;
				if (a <> nil) then calcularMaximo(a^.hi, codigoMax, cantidadMax);
				if (a <> nil) then calcularMaximo(a^.hd, codigoMax, cantidadMax);
		end;
end;

function maximo(a:arbol):integer;
var
	codigoMax, cantidadMax:integer;
begin
	codigoMax:=0; cantidadMax:=0;
	calcularMaximo(a, codigoMax, cantidadMax);
	maximo:=codigoMax;
end;

procedure calcularMenor(a:arbol; valor:integer; var contador:integer);
begin
	if (a <> nil) then
		begin
			calcularMenor(a^.hi, valor, contador);
			if (a^.dato.codigoProducto < valor) then contador:=contador+1;
			calcularMenor(a^.hd, valor, contador);
		end;
end;

function menor(a:arbol; x:integer):integer;
var
	aux:integer;
begin
	aux:=0;
	calcularMenor(a, x, aux);
	menor:=aux;
end;

function calcularMontoRango(a:arbol; limiteInf, limiteSup:integer):real;
begin
	if (a = nil) then calcularMontoRango:=0
		else
		begin
			if (a^.dato.codigoProducto > limiteInf) then
				begin
					if (a^.dato.codigoProducto < limiteSup) then 
						calcularMontoRango:=a^.dato.montoTotal + calcularMontoRango(a^.hi, limiteInf, limiteSup) + calcularMontoRango(a^.hd, limiteInf, limiteSup)
					else
						calcularMontoRango:=calcularMontoRango(a^.hi, limiteInf, limiteSup);
			end
			else
				calcularMontoRango:=calcularMontoRango(a^.hd, limiteInf, limiteSup);
		end;
end;

var
	a:arbol;
begin
	a:=nil;
	cargarArbol(a);
	imprimirArbol(a);
	writeln('---------------------------------------------------------');
	writeln('El codigo con mayor cantidad de ventas es: ', maximo(a));
	writeln('La cantidad de codigos menores al indicado es: ', menor(a, 15));
	writeln('El monto total entre los rangos sugeridos es de: ', calcularMontoRango(a, 5, 10):0:2);
end.
