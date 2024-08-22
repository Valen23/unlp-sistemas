program actividad3c;
type
lista = ^nodo;
nodo = record
	dato:integer;
	nodoSig:lista;
end;

procedure agregarAdelante(var l:lista; num:integer);
var
	aux:lista;
begin
	new(aux); aux^.dato:=num; aux^.nodoSig:=l;
	l:=aux;
end;

procedure cargarLista(var l:lista);
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

function buscarElemento(l:lista; elemento:integer):boolean;
begin
	buscarElemento:=false;
	while (l <> nil) and (buscarElemento = false) do
		begin
			if (l^.dato = elemento) then
				begin
					buscarElemento:=true;
				end;
			writeln(l^.dato);
			l:=l^.nodoSig;
		end;
	writeln(buscarElemento);
end;

var
	l:lista;
begin
	randomize;
	cargarLista(l);
	buscarElemento(l, 115);
end.
