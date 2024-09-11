program practica4ej4;
type
	
	datosPrestamoA = record
		isbn:integer;
		numSocio:integer;
		dia:integer;
		mes:integer;
		diasPrestados:integer;
	end;
	
	datosPrestamoB = record
		numSocio:integer;
		dia:integer;
		mes:integer;
		diasPrestados:integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato:datosPrestamoB;
		nodoSig:lista;
	end;
	
	registroArbolB = record
		isbn:integer;
		lista:lista;
	end;
	
	arbolA = ^nodoArbolA;
	nodoArbolA = record
		dato:datosPrestamoA;
		hi:arbolA;
		hd:arbolA;
	end;
	
	arbolB = ^nodoArbolB;
	nodoArbolB = record
		dato:registroArbolB;
		hi:arbolB;
		hd:arbolB;
	end;
	
procedure leerDatos(var d:datosPrestamoA);
begin
	d.isbn:=random(51);
	d.numSocio:=random(20)+1;
	d.dia:=random(31)+1;
	d.mes:=random(12)+1;
	d.diasPrestados:=random(100)+1;
end;

procedure agregarAdelante(var l:lista; d:datosPrestamoA);
var
	aux:lista;
begin
	new(aux);
	aux^.dato.numSocio:=d.numSocio;
	aux^.dato.dia:=d.dia;
	aux^.dato.mes:=d.mes;
	aux^.dato.diasPrestados:=d.diasPrestados;
	aux^.nodoSig:=l;
	l:=aux;
end;

procedure agregarArbolB(var a:arbolB; d:datosPrestamoA);
begin
	if (a = nil) then
		begin
			new(a);
			a^.dato.isbn:=d.isbn;
			a^.dato.lista:=nil;
			agregarAdelante(a^.dato.lista, d);
			a^.hi:=nil; a^.hd:=nil;
		end
		else
		begin
			if (d.isbn = a^.dato.isbn) then agregarAdelante(a^.dato.lista, d)
				else if (d.isbn < a^.dato.isbn) then agregarArbolB(a^.hi, d)
					else agregarArbolB(a^.hd, d);
		end;
end;

procedure agregarArbolA(var a:arbolA; d:datosPrestamoA);
begin
	if (a = nil) then
		begin
			new(a);
			a^.dato:=d;
			a^.hi:=nil; a^.hd:=nil;
		end
		else
		begin
			if (d.isbn = a^.dato.isbn) then agregarArbolA(a^.hd, d)
				else if (d.isbn < a^.dato.isbn) then agregarArbolA(a^.hi, d)
					else agregarArbolA(a^.hd, d);
		end;
end;

procedure cargarArbol(var aa:arbolA; var ab:arbolB);
var
	d:datosPrestamoA;
begin
	leerDatos(d);
	if (d.isbn <> 0) then
		begin
			agregarArbolB(ab, d);
			agregarArbolA(aa, d);
			leerDatos(d);
			cargarArbol(aa, ab);
		end;
end;

procedure imprimirArbol(a:arbolB);
begin
	if (a <> nil) then
		begin
			imprimirArbol(a^.hi);
			writeln('ISBN: ', a^.dato.isbn);
			while (a^.dato.lista <> nil) do
				begin
					write('NUMERO DE SOCIO: '); writeln(a^.dato.lista^.dato.numSocio);
					writeln('FECHA: ', a^.dato.lista^.dato.dia, '/', a^.dato.lista^.dato.mes);
					write('DIAS PRESTADOS: '); writeln(a^.dato.lista^.dato.diasPrestados);
					writeln;
					a^.dato.lista:=a^.dato.lista^.nodoSig;
				end;
			writeln('===============================');
			imprimirArbol(a^.hd);
		end;
end;

function moduloB(a:arbolA):integer;
begin
	if (a <> nil) then
		begin
			if (a^.hd <> nil) then moduloB:=moduloB(a^.hd)
				else moduloB:=a^.dato.isbn;
		end
		else moduloB:=-1;
end;

function moduloC(a:arbolB):integer;
begin
	if (a <> nil) then
		begin
			if (a^.hi <> nil) then moduloC:=moduloC(a^.hi)
				else moduloC:=a^.dato.isbn;
		end
		else moduloC:=-1;
end;

function moduloD(a:arbolA; x:integer):integer;
begin
	if (a = nil) then moduloD:=0
		else
		begin
			if (a^.dato.numSocio = x) then moduloD:=moduloD(a^.hi, x) + moduloD(a^.hd, x) + 1
				else moduloD:=moduloD(a^.hi, x) + moduloD(a^.hd, x);
		end;
end;

procedure recorrerModuloE(l:lista; numero:integer; var contador:integer);
begin
	contador:=0;
	while (l <> nil) do
		begin
			if (l^.dato.numSocio = numero) then contador:=contador+1;
			l:=l^.nodoSig;
		end;
end;

function moduloE(a:arbolB; numero:integer):integer; {?????????????????????? no funca}
var
	contador:integer;
begin
	if (a <> nil) then
		begin
			recorrerModuloE(a^.dato.lista, numero, contador);
			moduloE:=contador + moduloE(a^.hi, numero) + moduloE(a^.hd, numero);
		end
		else moduloE:=0;
end;

var
	aA:arbolA; aB:arbolB; 
begin
	cargarArbol(aa, ab);
	imprimirArbol(ab);
	writeln('El ISBN mas grande es: ', moduloB(aa));
	writeln('El ISBN mas chico es: ', moduloC(ab));
	writeln('El socio tuvo ', moduloD(aa, 10), ' prestamos');
	writeln('El socio tuvo ', moduloE(ab, 10), ' prestamos');
end.
