program parcialC;
type
	envio = record
		codigoCliente:integer;
		dia:1..31;
		codigoPostal:integer;
		pesoPaquete:real;
	end;
	
	registroLista = record
		codigoCliente:integer;
		dia:1..31;
		pesoPaquete:real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato:registroLista;
		nodoSig:lista;
	end;
	
	registroArbol = record
		codigoPostal:integer;
		lista:lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato:registroArbol;
		hi:arbol;
		hd:arbol;
	end;
	
procedure agregarAdelante(var l:lista; e:envio);
var
	aux:lista;
begin
	new(aux);
	aux^.dato.codigoCliente:=e.codigoCliente;
	aux^.dato.dia:=e.dia;
	aux^.dato.pesoPaquete:=e.pesoPaquete;
	aux^.nodoSig:=l;
	l:=aux;
end;
	
procedure leerEnvio(var e:envio);
begin
	e.codigoCliente:=random(1000);
	e.dia:=random(31)+1;
	e.codigoPostal:=random(3000)+1;
	e.pesoPaquete:=random()*10;
end;

procedure agregarArbol(var a:arbol; e:envio);
begin
	if (a = nil) then
		begin
			new(a);
			a^.dato.codigoPostal:=e.codigoPostal;
			a^.dato.lista:=nil;
			a^.hi:=nil; a^.hd:=nil;
		end
		else
		begin
			if (e.codigoPostal = a^.dato.codigoPostal) then agregarAdelante(a^.dato.lista, e)
				else if (e.codigoPostal < a^.dato.codigoPostal) then agregarArbol(a^.hi, e)
					else agregarArbol(a^.hd, e);
		end;
end;

procedure cargarArbol(var a:arbol);
var
	e:envio;
begin
	leerEnvio(e);
	if (e.codigoCliente <> 0) then
		begin
			agregarArbol(a ,e);
			cargarArbol(a);
			leerEnvio(e);
		end;
end;

procedure buscarEnvios(a:arbol; codigo:integer; var lEnvios:lista);
begin
	if (a <> nil) then
		begin
			if (codigo = a^.dato.codigoPostal) then lEnvios:=a^.dato.lista
				else if (codigo < a^.dato.codigoPostal) then
					begin
						buscarEnvios(a^.hi, codigo, lEnvios);
					end
					else
					begin
						buscarEnvios(a^.hd, codigo, lEnvios);
					end;
		end;
end;

procedure menorPeso(l:lista; var pesoMax, pesoMin:real; var codMax, codMin:integer);
begin
	if (l <> nil) then
		begin
			if (l^.dato.pesoPaquete < pesoMin) then
				begin
					pesoMin:=l^.dato.pesoPaquete;
					codMin:=l^.dato.codigoCliente;
				end
				else if (l^.dato.pesoPaquete > pesoMax) then
					begin
						pesoMax:=l^.dato.pesoPaquete;
						codMax:=l^.dato.codigoCliente;
					end;
			menorPeso(l^.nodoSig, pesoMax, pesoMin, codMax, codMin);
		end;
end;

procedure buscarMenorPeso(l:lista; codMax, codMin:integer);
var
	pesoMax, pesoMin:real;
begin
	pesoMax:=0;
	pesoMin:=99;
	menorPeso(l, pesoMax, pesoMin, codMax, codMin);
end;

var
	a:arbol; lEnvios:lista; codigo, codMax, codMin:integer;
begin
	cargarArbol(a); {A}
	readln(codigo); buscarEnvios(a, codigo, lEnvios); {B}
	buscarMenorPeso(lEnvios, codMax, codMin); {C}
end.
