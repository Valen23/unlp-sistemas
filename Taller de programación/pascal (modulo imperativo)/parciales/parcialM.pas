program parcialM;
type
	rangoDiagnostico = 1..6;

	atencion = record
		matricula:integer;
		dniPaciente:integer;
		dia:integer;
		diagnostico:rangoDiagnostico;
	end;
	
	registroArbol = record
		matricula:integer;
		cantidad:integer;
	end;
	
	lista = ^nodo;
	nodo = record
		datoDNI:integer;
		nodoSig:lista;
	end;
	
	registroVector = record
		genero:integer;
		lista:lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato:registroArbol;
		hi:arbol;
		hd:arbol;
	end;
	
	v = array[rangoDiagnostico] of registroVector;
	
procedure leerAtencion(var a:atencion);
begin
	a.dniPaciente:=random(5000);
	a.matricula:=random(1000)+2000;
	a.dia:=random(31)+1;
	a.diagnostico:=random(6)+1;
end;

procedure agregarArbol(var a:arbol; at:atencion);
begin
	if (a = nil) then
		begin
			new(a);
			a^.dato.matricula:=at.matricula;
			a^.dato.cantidad:=1;
			a^.hi:=nil; a^.hd:=nil;
		end
		else
		begin
			if (at.matricula = a^.dato.matricula) then a^.dato.cantidad:=a^.dato.cantidad+1
				else if (at.matricula < a^.dato.matricula) then agregarArbol(a^.hi, at)
					else agregarArbol(a^.hd, at);
		end;
end;

procedure inicializarVector(var v:v);
var
	a:integer;
begin
	for a:=1 to 6 do	
		begin
			v[a].genero:=a;
			v[a].lista:=nil;
		end;
end;

procedure agregarAdelante(var l:lista; dni:integer);
var
	aux:lista;
begin
	new(aux);
	aux^.datoDNI:=dni;
	aux^.nodoSig:=l;
	l:=aux;
end;

procedure cargarArbol(a:arbol; vector:v);
var
	at:atencion;
begin
	leerAtencion(at);
	if (at.dniPaciente <> 0) then
		begin
			agregarArbol(a, at);
			agregarAdelante(vector[at.diagnostico].lista, at.dniPaciente);
			cargarArbol(a, vector);
			leerAtencion(at);
		end;
end;

procedure buscarMatricula(a:arbol; var contador:integer; m:integer);
begin
	if (a <> nil) then
		begin
			if (a^.dato.matricula < m) then
				begin
					buscarMatricula(a^.hd, contador, m);
				end
				else
				begin
					contador:=contador+a^.dato.cantidad;
					buscarMatricula(a^.hd, contador, m);
					buscarMatricula(a^.hi, contador, m);
				end;
		end;
end;

procedure recorrerLista(l:lista; var contador:integer);
begin
	contador:=0;
	while (l <> nil) do
		begin
			contador:=contador+1;
			l:=l^.nodoSig;
		end;
end;

procedure moduloC(v:v; i:integer; var cantMax:integer; var res:char; contador:integer);
var
	x:array[1..6] of char = ('a', 'b', 'c', 'd', 'e', 'f');
begin
	if (i < 7) then
		begin
			recorrerLista(v[i].lista, contador);
			if (contador > cantMax) then
				begin
					cantMax:=contador;
					res:=x[i];
				end;
			contador:=0;
		end;
	moduloC(v, i+1, cantMax, res, contador);
end;

var
	i, cantMax:integer; res:char;
	a:arbol; vector:v; contador:integer; matriculaBuscar:integer;
begin
	i:=1;
	cantMax:=-1;
	contador:=0;
	a:=nil;
	inicializarVector(vector); {a ii}
	cargarArbol(a, vector); {a i}
	readln(matriculaBuscar);
	buscarMatricula(a, contador, matriculaBuscar);
	moduloC(vector, i, cantMax, res, contador);
end.
