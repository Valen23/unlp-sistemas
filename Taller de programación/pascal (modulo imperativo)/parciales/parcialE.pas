program parcialE;
type
	rangoGenero = 1..7;
	
	libro = record
		isbn:integer;
		codigoAutor:integer;
		codigoGenero:rangoGenero;
	end;
	
	registroArbol = record
		codigoAutor:integer;
		cantidad:integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato:registroArbol;
		hi:arbol;
		hd:arbol;
	end;

	registroVector = record
		codigoGenero:integer;
		cantidad:integer;
	end;
	
	vector = array[rangoGenero] of registroVector;
	
procedure leerLibro(var l:libro);
begin
	l.isbn:=random(101);
	l.codigoGenero:=random(7)+1;
	l.codigoAutor:=random(300);
end;

procedure inicVector(var v:vector);
var
	i:integer;
begin
	for i:=1 to 7 do v[i].cantidad:=0;
end;

procedure agregarArbol(var a:arbol; l:libro);
begin
	if (a = nil) then
		begin
			new(a);
			a^.dato.codigoAutor:=l.codigoAutor;
			a^.dato.cantidad:=1;
		end
		else
		begin
			if (l.codigoAutor = a^.dato.codigoAutor) then a^.dato.cantidad:=a^.dato.cantidad+1
				else if (l.codigoAutor < a^.dato.codigoAutor) then agregarArbol(a^.hi, l)
					else agregarArbol(a^.hd, l);
		end;
end;

procedure cargarVector(var v:vector; l:libro);
begin
	v[l.codigoGenero].cantidad:=v[l.codigoGenero].cantidad+1;
	v[l.codigoGenero].codigoGenero:=l.codigoGenero;
end;

procedure cargarArbol(var a:arbol; v:vector);
var
	l:libro;
begin
	leerLibro(l);
	if (l.isbn <> 0) then
		begin
			agregarArbol(a, l);
			cargarVector(v, l);
			cargarArbol(a, v);
			leerLibro(l);
		end;
end;

procedure ordenarVector(var v:vector);
var
	i, j, pos:integer; item:registroVector; cantMax, codMax:integer;
	vector2:array[rangoGenero] of string = ('literario', 'filosofia', 'biologia', 'arte', 'computacion', 'medicina', 'ingenieria');
begin
	cantMax:=0;
	for i:=1 to 7-1 do
		begin
			pos:=i;
			for j:=i+1 to 7 do
				if (v[j].cantidad < v[pos].cantidad) then 
					begin
						pos:=j;
						if (v[j].cantidad > cantMax) then
							begin
								cantMax:=v[j].cantidad;
								codMax:=j;
							end;
					end;
				item:=v[pos];
				v[pos]:=v[i];
				v[i]:=v[pos];
		end;
	writeln('El genero con mayor cantidad es: ', vector2[j]);
end;

procedure buscarRango(a:arbol; cod1, cod2:integer; var cantidad:integer);
begin
	if (a <> nil) then
		begin
			if (a^.dato.codigoAutor < cod2) and (a^.dato.codigoAutor > cod1)then
				begin
					cantidad:=cantidad+a^.dato.cantidad;
					buscarRango(a^.hi, cod1, cod2, cantidad);
					buscarRango(a^.hd, cod1, cod2, cantidad);
				end
				else
				begin
					if (a^.dato.codigoAutor >= cod2) then buscarRango(a^.hi, cod1, cod2, cantidad)
						else if (a^.dato.codigoAutor <= cod1) then buscarRango(a^.hd, cod1, cod2, cantidad);
				end;
		end;
end;

var
	a:arbol; v:vector; cantidad, cod1, cod2:integer;
begin
	cantidad:=0;
	inicVector(v);
	cargarArbol(a, v);
	readln(cod1); readln(cod2);
	buscarRango(a, cod1, cod2,cantidad);
end.
