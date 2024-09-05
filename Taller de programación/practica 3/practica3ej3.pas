program practica3ej3;
type

	formatoFecha = record
		dia:1..31;
		mes:1..12;
		ano:1900..2024;
	end;

	datosFinal = record
		nota:real;
		fecha:formatoFecha;
		codigo:integer;
	end;

	lista = ^nodo;
	nodo = record
		datos:datosFinal;
		nodoSig:lista;
	end;
	
	registrodearbol = record
		legajo: integer;
		infoFinales: lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato:registrodearbol;
		hi:arbol;
		hd:arbol;
	end;
	
	alumnoProm = record
		legajo:integer;
		promedio:real;
	end;
	
	listaC = ^nodoC;
	nodoC = record
		dato:alumnoProm;
		nodoSig:listaC;
	end;
	
procedure agregarAdelante(var l:lista; d:datosFinal);
var
	aux:lista;
begin
	new(aux);
	aux^.datos:=d;
	aux^.nodoSig:=l;
	l:=aux;
end;
	
procedure leerRegistros(var d: datosFinal; var legajo: integer);
begin
	legajo:=random(50);
	d.codigo:=random(50);
	d.fecha.dia:=random(31)+1;
	d.fecha.mes:=random(12)+1;
	d.fecha.ano:=random(5)+2020;
	d.nota:=random()*10;
end;

procedure agregar(var a:arbol; legajo: integer; datosLista: datosFinal);
begin
	if(a = nil) then begin
		new(a);
		a^.HI:=nil;
		a^.HD:=nil;
		a^.dato.legajo:=legajo;
		a^.dato.infoFinales:=nil;
		agregarAdelante(a^.dato.infoFinales, datosLista);
	end
	else begin
		if(legajo = a^.dato.legajo) then agregarAdelante(a^.dato.infoFinales, datosLista)
			else if(legajo < a^.dato.legajo) then agregar(a^.hi, legajo, datosLista)
				else agregar(a^.hd, legajo, datosLista);
	end;
end;

procedure cargarArbol(var a:arbol);
var
	legajo:integer;
	d: datosFinal;
begin
	leerRegistros(d, legajo);
	if (legajo <> 0) then
		begin
			agregar(a, legajo, d);
			cargarArbol(a);
		end;
end;

procedure imprimirLista(l: lista);
begin
	while (l <> nil) do begin
		writeln;
		writeln('Codigo materia: ',l^.datos.codigo);
		writeln('Fecha: ',l^.datos.fecha.dia, '/',l^.datos.fecha.mes,'/',l^.datos.fecha.ano);
		writeln('Nota: ',l^.datos.nota:0:2);
		l:=l^.nodoSig;
	end;
	writeln('==================================================');
end;

procedure imprimirArbol(a:arbol);
begin
	if (a <> nil) then
		begin
			if (a^.hi <> nil) then imprimirArbol(a^.hi);
			writeln('Legajo: ', a^.dato.legajo);
			imprimirLista(a^.dato.infoFinales);
			if (a^.hd <> nil) then imprimirArbol(a^.hd);
		end;
end;

function legajosPares(a:arbol):integer;
var
	aux:integer;
begin
	if (a = nil) then
		begin
			legajosPares:=0;
		end
		else
		begin
			aux:=legajosPares(a^.hi) + legajosPares(a^.hd);
			if (a^.dato.legajo mod 2 = 1) then aux+=1;
			legajosPares:=aux;
		end;
end;

function contadorAlumnosAprobados(l:lista):integer;
begin
	contadorAlumnosAprobados:=0;
	while (l <> nil) do
		begin
			if (l^.datos.nota >= 4) then contadorAlumnosAprobados+=1;
			l:=l^.nodoSig
		end;
end;

procedure alumnosAprobados(a:arbol);
begin
	if (a <> nil) then
		begin
			alumnosAprobados(a^.hi);
			writeln('Legajo: ', a^.dato.legajo, ', finales aprobados: ', contadorAlumnosAprobados(a^.dato.infoFinales));
			alumnosAprobados(a^.hd);
		end;
end;

procedure agregarAdelante2(var l:listaC; d:alumnoProm);
var
	nue:listaC;
begin
	new(nue);
	nue^.dato:=d;
	nue^.nodoSig:=l;
	l:=nue;
end;

function calcularPromedio(l:lista; var lC:listaC):real;
var
	contador:integer; sumador:real;
begin
	contador:=0;
	sumador:=0;
	while (l <> nil) do
		begin
			contador+=1;
			sumador+=l^.datos.nota;
			l:=l^.nodoSig;
		end;
	calcularPromedio:=(sumador/ contador);
end;

procedure finalesPromedio(a:arbol; x:real; var l:listaC);
var
	d:alumnoProm;
begin
	if (a <> nil) then
		begin
			finalesPromedio(a^.hi, x, l);
			d.promedio:=calcularPromedio(a^.dato.infoFinales, l);
			d.legajo:=a^.dato.legajo;
			if (d.promedio > x) then agregarAdelante2(l, d);
			finalesPromedio(a^.hd, x, l);
		end;
end;

var
	a:arbol; l:listaC;
begin
	randomize;
	a:=nil;
	cargarArbol(a);
	imprimirArbol(a);
	writeln('Cantidad de alumnos con legajo impar: ', legajosPares(a));
	alumnosAprobados(a);
	finalesPromedio(a, 0, l);
end.
