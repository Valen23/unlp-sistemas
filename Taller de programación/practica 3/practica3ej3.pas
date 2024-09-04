program practica3ej3;
type

	formatoFecha = record
		dia:integer;
		mes:integer;
		ano:integer;
	end;

	datosFinal = record
		nota:real;
		fecha:formatoFecha;
		codigo:integer;
	end;
	
	datos = record
		legajo:integer;
		infoFinales:datosFinal;
	end;

	lista = ^nodo;
	nodo = record
		dato:datos;
		nodoSig:lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato:lista;
		hi:arbol;
		hd:arbol;
	end;
	
procedure agregarAdelante(var l:lista; d:datosFinal);
var
	aux:lista;
begin
	new(aux);
	aux^.dato.infoFinales:=d;
	aux^.nodoSig:=l;
	l:=aux;
end;
	
procedure leerLista(var l:lista);
begin
	l^.dato.legajo:=random(100);
	l^.dato.infoFinales.codigo:=random(50);
	l^.dato.infoFinales.fecha.dia:=random(31)+1;
	l^.dato.infoFinales.fecha.mes:=random(12)+1;
	l^.dato.infoFinales.fecha.ano:=random(5)+2020;
	l^.dato.infoFinales.nota:=random(10)*10;
end;

procedure agregar(var a:arbol; l:lista);
begin
	if (a = nil) then
	begin
		new(a);
		a^.dato:=l; a^.hi:=nil; a^.hd:=nil;
	end
	else
	begin
		if (l^.dato.legajo = a^.dato^.dato.legajo) then agregarAdelante(l, l^.dato.infoFinales)
			else if (l^.dato.legajo < a^.dato^.dato.legajo) then agregar(a^.hi, l)
				else (agregar(a^.hd, l));
	end;
end;

procedure cargarArbol(var a:arbol; l:lista);
begin
	leerLista(l);
	if (l^.dato.legajo <> 0) then
		begin
			cargarArbol(a, l);
			leerLista(l);
		end;
end;

procedure imprimirArbol(a:arbol; l:lista);
begin
	if (a <> nil) then
		begin
			if (a^.hi <> nil) then imprimirArbol(a^.hi, l);
			writeln('Codigo: ', a^.dato^.dato.legajo);
			while (l <> nil) do
				begin
					write(l^.dato.infoFinales.nota);
					l:=l^.nodoSig;
				end;
		end;
end;

var
	a:arbol; l:lista;
begin
	l:=nil;
	cargarArbol(a, l);
	imprimirArbol(a, l);
end.