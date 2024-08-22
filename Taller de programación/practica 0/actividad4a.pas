program actividad4a;
type
	lista = ^nodo;
	nodo = record
		dato:integer;
		nodoSig:lista;
	end;

procedure insertarOrdenado(var l:lista; num:integer);
var
	nue, act, ant:lista;
begin
	new(nue); nue^.dato:=num; act:=l;
	ant:=l;
	
	while(act<>nil)and(num>act^.dato)do begin
		ant:=act;
		act:=act^.nodoSig;
	end;
	
	if(act=ant)then
		l:=nue
	else
		ant^.nodoSig:=nue;
	nue^.nodoSig:=act;
end;

procedure cargarLista(var l:lista);
var
	num:integer;
begin
	num:=random(50)+100;
	while (num <> 120) do
		begin
			insertarOrdenado(l, num);
			num:=random(50)+100;
		end;
end;

procedure imprimirLista(l:lista);
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
	cargarLista(l);
	imprimirLista(l);
end.
