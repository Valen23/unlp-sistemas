program practica1ej3abcd;
type
	rangoGenero = 1..8;

	pelicula = record
		codigoPelicula:integer;
		codigoGenero:rangoGenero;
		puntaje:integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato:pelicula;
		nodoSig:lista;
	end;
	
	mejorPelicula = record
		codigo, puntaje:integer;
	end;
	
	vector = array[rangoGenero] of mejorPelicula;
	

procedure agregarAtras(var l:lista; p:pelicula);
var
	nuevo, aux: lista;
begin
	new(nuevo); nuevo^.dato:=p; nuevo^.nodoSig:=nil;
	if (l = nil) then
		l:=nuevo
	else begin
		aux:=l;
		while (aux^.nodoSig <> nil) do
			aux:=aux^.nodoSig;
		aux^.nodoSig:=nuevo;
	end
end;

procedure leerPelicula(var p:pelicula);
begin
	//write(' > Codigo de pelicula: '); readln(p.codigoPelicula);
	//write(' > Codigo de genero: '); readln(p.codigoGenero);
	//write(' > Puntaje: '); readln(p.puntaje);
	p.codigoPelicula:=random(101)-1;
	p.codigoGenero:=random(8)+1;
	p.puntaje:=random(100)+1;
end;

procedure crearLista(var l:lista; p:pelicula);
begin
	while (p.codigoPelicula <> -1) do
		begin
			leerPelicula(p);
			if (p.codigoPelicula <> -1) then agregarAtras(l, p); // para que la pelicula con código -1 no se añada a la lista
		end;
end;

procedure imprimirLista(l:lista);
begin
	while (l <> nil) do
		begin
			writeln('==============================================');
			writeln('Codigo de pelicula: ', l^.dato.codigoPelicula);
			writeln('Codigo de genero: ', l^.dato.codigoGenero);
			writeln('Puntaje: ', l^.dato.puntaje);
			l:=l^.nodoSig;
		end;
	writeln('==============================================');
end;

procedure crearVector(l:lista; var v:vector);
var
	i, codigoMayor, puntajeMayor, codigoMenor, puntajeMenor:integer;
begin
	puntajeMayor:=0; puntajeMenor:=100;
	for i:=1 to 8 do v[i].puntaje:=0; // inicializa los vectores
	
	while (l <> nil) do
		begin
			if (l^.dato.puntaje > v[l^.dato.codigoGenero].puntaje) then
				begin
					v[l^.dato.codigoGenero].puntaje:=l^.dato.puntaje;
					v[l^.dato.codigoGenero].codigo:=l^.dato.codigoPelicula;
				end;
				
			if (l^.dato.puntaje > puntajeMayor) then
				begin
					puntajeMayor:=l^.dato.puntaje;
					codigoMayor:=l^.dato.codigoPelicula;
				end;
			if (l^.dato.puntaje < puntajeMenor) then
				begin
					puntajeMenor:=l^.dato.puntaje;
					codigoMenor:=l^.dato.codigoPelicula;
				end;

			l:=l^.nodoSig;
		end;
		
	writeln('La pelicula con mayor puntaje es la de codigo: ', codigoMayor);
	writeln('La pelicula con menor puntaje es la de codigo: ', codigoMenor);
end;

procedure imprimirVector(v:vector);
var
	i:integer;
begin
	for i:=1 to 8 do writeln(i, ':', v[i].codigo);
end;

procedure ordenarSeleccion(var v:vector);
var
	i, j, pos:integer; item:mejorpelicula;
begin
	for i:=1 to 8-1 do begin
		pos:=i;
		for j:=i+1 to 8 do
			if (v[j].puntaje > v[pos].puntaje) then
				pos:=j;
			item:=v[pos];
			v[pos]:=v[i];
			v[i]:=item;
	end;
end;

var
	p:pelicula;
	l:lista;
	v:vector;
begin
	randomize;
	crearLista(l, p);
	imprimirLista(l);
	crearVector(l, v);
	imprimirVector(v);
end.
