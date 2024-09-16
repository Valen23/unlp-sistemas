program parcialF;
type
	
	rangoMaterial = 1..8;

	artesania = record
		numID:integer;
		DNI:integer;
		material:rangoMaterial;
	end;
	
	registroArbolA = record
			DNI:integer;
			cantidad:integer;
		end;
	
	arbolA = ^nodoArbolA;
	nodoArbolA = record
		dato:registroArbolA;
		hi:arbolA;
		hd:arbolA;
	end;

	registroVector = record
		codigo:integer;
		cantidad:integer;
	end;

	vectorMateriales = array[rangoMaterial] of registroVector;

procedure leerArtesania(var a:artesania); {dado en el parcial}
begin
	a.DNI:=random(10000);
	if (a.DNI <> 0) then
		begin
			a.numID:=random(100)+2000;
			a.material:=random(8)+1;
		end;
end;

procedure agregarArbol(a:arbolA; art:artesania);
begin
	if (a = nil) then {caso en el que el arbol esté vacío (primer caso)}
		begin
			new(a);
			a^.dato.DNI:=art.dni;
			a^.dato.cantidad:=1;
			a^.hi:=nil; a^.hd:=nil;
		end
		else
		begin
			if (art.DNI = a^.dato.DNI) then a^.dato.cantidad:=a^.dato.cantidad+1 {en el caso que se ingrese un arte repetido, se suma uno al nodo actual (el nodo repetido)}
				else if (art.DNI < a^.dato.DNI) then agregarArbol(a^.hi, art) {si no está repetido, se ingresa por izquierda o por derecha}
					else agregarArbol(a^.hd, art);
		end;
end;

procedure inicVector(var vec:vectorMateriales);
var
	i:integer;
begin
	for i:=1 to 8 do
		begin
			vec[i].codigo:=i;
			vec[i].cantidad:=0;
		end;
end;

procedure cargarVector(var vec:vectorMateriales; art:artesania);
begin
	vec[art.material].cantidad:=vec[art.material].cantidad+1;
end;

procedure cargarArbol(var a:arbolA; vec:vectorMateriales);
var
	art:artesania;
begin
	leerArtesania(art);
	if (art.dni <> 0) then
		begin
			agregarArbol(a, art);
			cargarVector(vec, art);
			leerArtesania(art);
		end;
end;

procedure contarArtesanos(a:arbolA; var contador:integer; numero:integer);
begin
	if (a <> nil) then
		begin
			if (a^.dato.DNI < numero) then
				begin
					contador:=contador+1;
					contarArtesanos(a^.hi, contador, numero);
					contarArtesanos(a^.hd, contador, numero);
				end
				else
				begin
					contarArtesanos(a^.hi, contador, numero)
				end;
		end;
end;

procedure ordenarSeleccion(var vec:vectorMateriales);
var
	vec2:array[rangoMaterial] of string = ('madera', 'yeso', 'porcelana', 'lana', 'acero', 'vidrio', 'carton', 'ceramica');
	i, j, pos:integer; item:registroVector;
	codigoMayor:integer;
begin
	for i:=1 to 8-1 do
		begin
			pos:=i;
			for j:=i+1 to 8 do
				if (vec[j].cantidad > vec[i].cantidad) then
					begin
						pos:=j;
						codigoMayor:=j;
					end;
				item:=vec[pos];
				vec[pos]:=vec[i];
				vec[i]:=item;
		end;
	writeln('El material con mayor cantidad es: ', vec2[codigoMayor]);
end;

var
	a:arbolA; vec:vectorMateriales; contador:integer; x:integer;
begin
	contador:=0;
	inicVector(vec);
	cargarArbol(a, vec);
	writeln('Ingrese el DNI a buscar: '); readln(x);
	contarArtesanos(a, contador, x);
end.
