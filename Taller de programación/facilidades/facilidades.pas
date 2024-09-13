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

{-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=}

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

{-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=}

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

{-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=}

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

{-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=}

procedure busquedaDicotomica(v:vector; cod:integer; dimL:integer; var res:integer);
var
	i, mitad:integer;
begin
	mitad:=dimLog mod 2;
	if(cod >= mitad)then begin
		for i:=mitad to dimLog do begin
			if(v[i].codi=cod)then
				res:=i;
		end;
	end
	else begin
		for i:=1 to mitad-1 do begin
			if(v[i].codi=cod)then
				res:=i;
		end;
	end;
end;

{-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=}

procedure entreDosValores(a:arbol; min,max: integer; var cant_total: integer);
	begin
		if (a<>nil) then
			begin
				if(a^.dato.cod_prod<max) and (a^.dato.cod_prod>min) then
					begin
						cant_total:=cant_total+a^.dato.total_vendido;
						entreDosValores(a^.hi,min,max,cant_total);
						entreDosValores(a^.hd,min,max,cant_total);
					end
					else
					if(a^.dato.cod_prod>=max) then entreDosValores(a^.hi,min,max,cant_total)
						else if(a^.dato.cod_prod<=min) then entreDosValores(a^.hd,min,max,cant_total);
			end;
	end;
