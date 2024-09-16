program practica2ej2abcde;
const
	minimo = 100;
	maximo = 200;

type
	lista = ^nodo;
	nodo = record
		numero:integer;
		nodoSig:lista;
	end;
	
procedure agregarAdelante(var l:lista; x:integer);
var
	aux:lista;
begin
	new(aux); aux^.numero:=x; aux^.nodoSig:=l;
	l:=aux;
end;

procedure crearLista(var l:lista);
var
	x:integer;
begin
	x:=random(101)+100;
	agregarAdelante(l, x);
	if (x <> 100) then crearLista(l^.nodoSig);
end;

procedure imprimirLista(l:lista);
begin
	if (l <> nil) then
	begin
		writeln(l^.numero);
		imprimirLista(l^.nodoSig);
	end;
end;

procedure imprimirListaInversa(l:lista);
begin
	if (l <> nil) then
	begin
		imprimirListaInversa(l^.nodoSig);
		writeln(l^.numero);
	end;
end;

procedure minimoValor(l:lista; var k:integer);
begin
	if (l <> nil) then
		begin
			if (l^.numero < k) then k:=l^.numero;
			minimoValor(l^.nodoSig, k);
		end;
end;

function encontrarValor(l:lista; k:integer):boolean;
begin
	encontrarValor:=false;
	if (l <> nil) then
		begin
			if (k = l^.numero) then
			begin
				encontrarValor:=true;
			end
			else
				encontrarValor(l^.nodoSig, k);
		end;
end;

function BuscarValor(l: lista; valor: integer): boolean;
begin 
  if (l = nil) then 
    BuscarValor := false
  else if (l^.numero = valor) then
    BuscarValor := true
  else
    BuscarValor := BuscarValor(l^.nodoSig, valor);
end;

var
	l:lista;
	k:integer;
begin
	k:=1000;
	l:=nil;
	randomize;
	crearLista(l);
	imprimirLista(l);
	{writeln('=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.-=-.');
	imprimirListaInversa(l);}
	minimoValor(l, k);
	writeln('Valor mas chico encontrado: ', k);
	writeln(buscarValor(l, 130));
end.
