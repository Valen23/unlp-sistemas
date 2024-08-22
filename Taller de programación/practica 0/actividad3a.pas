program actividad3a;

type
lista = ^nodo;

nodo = record
	dato: integer;
	nodoSig: ^nodo;
end;

procedure agregarAdelante(var l:lista; num:integer);
var
	aux: lista;
begin
	new(aux); aux^.dato:=num; aux^.nodoSig:=l;
	l:=aux;
end;

procedure CargarLista(var l:lista);
var
	num:integer;
begin
	num:=random(51)+100;
	while (num <> 120) do
		begin
			agregarAdelante(l, num);
			num:=random(51)+100;
		end;
end;

procedure ImprimirLista(l:lista);
begin
	while (l <> nil) do
		begin
			writeln(l^.dato);
			l:=l^.nodoSig;
		end;
end;

var
	l:lista;
begin
	randomize;
	CargarLista(l);
	ImprimirLista(l);
end.
