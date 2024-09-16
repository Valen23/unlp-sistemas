program practica2ej3abc;
const
	dimF = 20;
	min = 300;
	max = 1550;
type
	vector = array[1..dimF] of integer;
	indice = -1..20;
	
procedure crearVectorRecursivo(var v:vector; dimL:integer);
begin
	if (dimL > 0) then
		begin
			v[dimL]:=random(1251)+300;
			crearVectorRecursivo(v, dimL-1);
		end;
end;

procedure ordenarSeleccion(var v:vector);
var
	i, j, pos:integer; item:integer;
begin
	for i:=1 to dimF-1 do
		begin
			pos:=i;
			for j:=i+1 to dimF do
				if (v[j] > v[pos]) then
					pos:=j;
				item:=v[pos];
				v[pos]:=v[i];
				v[i]:=item
		end;
end;

procedure busquedaDicotomica(v: vector; ini,fin: indice;dato: integer;var pos: indice);
var
	medio: indice;
begin
		if(ini > fin) then
			pos := -1
		else begin
			medio := (ini + fin) div 2;
			if(v[medio] = dato) then begin
				pos := medio;
			end
			else if(v[medio] > dato) then begin
				busquedaDicotomica(v,ini,medio-1,dato,pos)
			end
			else begin
				busquedaDicotomica(v,medio+1,fin,dato,pos);
				end;
		end;
end;

procedure imprimirVector(v:vector);
var
	i:integer;
begin
	for i:=1 to dimF do writeln(v[i]);
end;

var
	v:vector;
	pos:indice;
begin
	randomize;
	crearVectorRecursivo(v, dimF);
	ordenarSeleccion(v);
	busquedaDicotomica(v, 1, dimF, 1330, pos);
	imprimirVector(v);
end.
