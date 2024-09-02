program practica3ej2;
type
	formatoFecha = record
		dia:1..31;
		mes:1..12;
		ano:integer;
	end;

	venta = record
		codigoProducto:integer;
		fecha:formatoFecha;
		cantidadUnidadesVendidas:integer;
	end;
	
	infoVenta = record
		fecha:formatoFecha;
		cantidad:integer;
	end;
	
	listaInfo = ^nodoLista;
	nodoLista = record
		dato:infoVenta;
		nodoSig:listaInfo;
	end;
	
	datoVenta = record
		codigo:integer;
		info:listaInfo;
	end;
	
	arbolInfo = ^nodoArbolInfo;
	nodoArbolInfo = record
		dato:datoVenta;
		hi:arbolInfo;
		hd:arbolInfo;
	end;
	
	arbolVentas = ^nodoArbolVentas;
	nodoArbolVentas = record
		dato:venta;
		hi:arbolVentas;
		hd:arbolVentas;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato:venta;
		hi:arbol;
		hd:arbol;
	end;
	
procedure leerVentas(var v:venta);
begin
	v.codigoProducto:=random(1000);
	v.fecha.dia:=random(31)+1;
	v.fecha.mes:=random(12)+1;
	v.fecha.ano:=random(4)+2020;
	v.cantidadUnidadesVendidas:=random(1000);
end;

procedure agregarAdelante(var l:listaInfo; v:venta);
var
	aux:listaInfo;
begin
	new(aux);
	aux^.dato.fecha.dia:=v.fecha.dia;
	aux^.dato.fecha.mes:=v.fecha.mes;
	aux^.dato.fecha.ano:=v.fecha.ano;
	aux^.dato.cantidad:=v.cantidadUnidadesVendidas;
	aux^.nodoSig:=l;
	l:=aux;
end;
	
procedure agregar(var a:arbol; v:venta);
begin
	if (a = nil) then
		begin
			new(a);
			a^.dato:=v;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
		begin
			if (v.codigoProducto < a^.dato.codigoProducto) then
				begin
					agregar(a^.hi, v);
				end
				else
				begin
					agregar(a^.hd, v);
				end;
		end;
end;

procedure agregarTotal(var av:arbolVentas; v:venta);
begin
	if (av = nil) then
		begin
			new(av);
			av^.dato.codigoProducto:=v.codigoProducto;
			av^.dato.cantidadUnidadesVendidas:=v.cantidadUnidadesVendidas;
			av^.hi:=nil;
			av^.hd:=nil;
		end
		else if (v.codigoProducto < av^.dato.codigoProducto) then agregarTotal(av^.hi, v)
			else if (v.codigoProducto > av^.dato.codigoProducto) then agregarTotal(av^.hd, v)
				else av^.dato.cantidadUnidadesVendidas:=v.cantidadUnidadesVendidas + av^.dato.cantidadUnidadesVendidas;
end;

procedure agregarInfoVenta(var ai:arbolInfo; var v:venta);
begin
	if (ai = nil) then
		begin
			new(ai);
			ai^.dato.codigo:=v.codigoProducto;
			agregarAdelante(ai^.dato.info, v);
			ai^.hi:=nil; ai^.hd:=nil;
		end
		else
		begin
			if (ai^.dato.codigo = v.codigoProducto) then 
				begin
					agregarAdelante(ai^.dato.info, v);
				end;
			if (v.codigoProducto < ai^.dato.codigo) then agregarInfoVenta(ai^.hi, v) else agregarInfoVenta(ai^.hd, v);
		end;
end;

procedure cargarArbol(var a:arbol; var av:arbolVentas; var ai:arbolInfo);
var
	v:venta;
begin	
	leerVentas(v);
	while (v.codigoProducto <> 0) do
		begin
			agregar(a, v);
			agregarTotal(av, v);
			agregarInfoVenta(ai, v);
			leerVentas(v);
		end;
end;

procedure imprimirArbol(a:arbolVentas);
begin
	if (a <> nil) then
		begin
			if (a^.hi <> nil) then imprimirArbol(a^.hi);
			write('Codigo: ', a^.dato.codigoProducto);
			write(', Fecha: ', a^.dato.fecha.dia, '/', a^.dato.fecha.mes, '/', a^.dato.fecha.ano);
			writeln(', Cantidad de ventas: ', a^.dato.cantidadUnidadesVendidas);
			writeln('-------------------------------------------------------------');
			if (a^.hd <> nil) then imprimirArbol(a^.hd);
		end;
end;

procedure imprimirArbolLista(a:arbolInfo; l:listaInfo);
var
	aux:listaInfo;
begin
	if (a <> nil) then 
		begin
			if (a^.hi <> nil) then imprimirArbolLista(a^.hi, l);
			writeln('Codigo: ', a^.dato.codigo);
			aux:=a^.dato.info;
			while (aux <> nil) do
				begin
					write('Fecha: ', aux^.dato.fecha.dia, '/'); write(aux^.dato.fecha.mes, '/'); write(aux^.dato.fecha.ano); writeln(', Cantidad: ', aux^.dato.cantidad);
					aux:=aux^.nodoSig;
				end;
			writeln('-------------------------------------------------------------');
			if (a^.hd <> nil) then imprimirArbolLista(a^.hd, l);
		end;
end;

function productosFecha(a:arbol; var contadorTotal:integer; dia, mes, ano:integer):integer;
begin
	if (a = nil) then
		begin
			productosFecha:=0;
		end
		else
		begin
			if (a^.dato.fecha.dia = dia) and (a^.dato.fecha.mes = mes) and (a^.dato.fecha.ano = ano) then
				begin
					productosFecha:=productosFecha + a^.dato.cantidadUnidadesVendidas;
				end
				else
				begin
					productosFecha:=0;
				end;
				productosFecha:=productosFecha + productosFecha(a^.hi, contadorTotal, dia, mes, ano) + productosFecha(a^.hd, contadorTotal, dia, mes, ano);
		end;
end;

procedure masVendido(av:arbolVentas; var codigoMasVendido, cantidadMasVendido:integer);
begin
	if (av <> nil) then
		begin
			if (av^.dato.cantidadUnidadesVendidas > cantidadMasVendido) then
			begin
				cantidadMasVendido:=av^.dato.cantidadUnidadesVendidas;
				codigoMasVendido:=av^.dato.codigoProducto;
			end;
			masVendido(av^.hi, codigoMasVendido, cantidadMasVendido);
			masVendido(av^.hd, codigoMasVendido, cantidadMasVendido);
		end;
end;

procedure masVendidoListas(a:arbolInfo; var codigoMasVendido, cantidadMasVendido:integer);
var
	actual:listaInfo;
	totalVentas:integer;
begin
	if (a <> nil) then
		begin
			totalVentas:=0;
			actual:=a^.dato.info;
			while (actual <> nil) do
				begin
					totalVentas:=totalVentas + actual^.dato.cantidad;
					actual:=actual^.nodoSig;
				end;
			if (totalVentas > cantidadMasVendido) then
				begin
					cantidadMasVendido:=totalVentas;
					codigoMasVendido:=a^.dato.codigo;
				end;
			masVendidoListas(a^.hi, codigoMasVendido, cantidadMasVendido);
			masVendidoListas(a^.hd, codigoMasVendido, cantidadMasVendido);
		end;
end;

var
	ai:arbolInfo;
	av:arbolVentas;
	a:arbol;
	l:listaInfo;
	contador:integer;
	codigoMV, cantidadMV:integer;
begin
	contador:=0; codigoMV:=0; cantidadMV:=0;
	l:=nil;
	a:=nil;
	av:=nil;
	ai:=nil;
	cargarArbol(a, av, ai);
	//imprimirArbol(av);
	//imprimirArbolLista(ai, l);
	masVendidoListas(ai, codigoMV, cantidadMV);
	writeln('El codigo con mas ventas es: ', codigoMV, ' con un total de ', cantidadMV);
	masVendido(av, codigoMV, cantidadMV);
	writeln('El codigo con mas ventas es: ', codigoMV, ' con un total de ', cantidadMV);
	//writeln('La cantidad de productos vendido en la fecha es: ', productosFecha(a, contador, 11, 2, 2023));
end.
