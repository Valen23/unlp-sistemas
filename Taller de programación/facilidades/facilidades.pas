{
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

function buscarElemento(l:lista; n:integer):boolean;
begin
	buscarElemento:=false;
	while(l <> nil) do begin
		if(l^.dato=n)then begin
			buscarElemento:=true;
		end;
		l:=l^.nodoSig;
	end;
end;

procedure agregarAtras(var l: lista;p: pelicula);
var
  nuevo, aux: lista;
begin
  new(nuevo);
  nuevo^.dato := p;
  nuevo^.sig := Nil;
  if(l = Nil) then
    l := nuevo
  else begin
    aux := l;
    while(aux^.sig <> Nil) do
      aux := aux^.sig;
    aux^.sig := nuevo;
  end;
end;
}
