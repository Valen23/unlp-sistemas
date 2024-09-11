program practica5;
const
	dimF = 300;
type
	infoPropietario = record
		codigoID:integer;
		DNI:integer;
		valorExpensas:real;
	end;
	
	vector = array[1..dimF] of infoPropietario;

procedure leerDatos(var i:infoPropietario);
begin
	i.codigoID:=random(21);
	i.DNI:=random(1000)+1;
	i.valorExpensas:=random()*5000;
end;

procedure cargarVector(var v:vector; var dimL:integer);
var
	r:infoPropietario;
begin
	dimL:=1;
	leerDatos(r);
	while (dimL <> dimF) and (r.codigoID <> 0) do
		begin
			v[dimL]:=r;
			leerDatos(r);
			dimL:=dimL+1;
		end;
	dimL:=dimL-1;
end;

procedure imprimirVector(v:vector; dimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do
		begin
			writeln('ID: ', v[i].codigoID);
			writeln('DNI: ',v[i].DNI);
			writeln('Expensas: ', v[i].valorExpensas:0:2);
			writeln('==========================');
		end;
end;

procedure ordenarSeleccion(var v:vector; dimL:integer);
var
	i, j, pos:integer; item:infoPropietario;
begin
	for i:=1 to dimL-1 do
		begin
			pos:=i;
			for j:=i+1 to dimL do
				if (v[j].codigoID > v[pos].codigoID) then pos:=j;
				item:=v[pos];
				v[pos]:=v[i];
				v[i]:=item;
		end;
end;

function busquedaDicotomica(v:vector; cod:integer; dimL:integer):integer;
var
	i, mitad:integer;
begin
	mitad:=dimL mod 2;
	if (cod >= mitad) then
		begin
			for i:=mitad to dimL do
				if (v[i].codigoID = cod) then busquedaDicotomica:=i
					else busquedaDicotomica:=0;
		end
		else
		begin
			for i:=1 to mitad-1 do
				if(v[i].codigoID = cod) then busquedaDicotomica:=i
					else busquedaDicotomica:=0;
		end
end;

function sumarTotalExpensas(v:vector; dimL:integer):real;
begin
	if (dimL > 0) then
		begin
			sumarTotalExpensas:=v[dimL].valorExpensas + sumarTotalExpensas(v, dimL-1);
		end
		else sumarTotalExpensas:=0;
end;

function totalExpensas(v:vector; dimL:integer):real;
begin
	totalExpensas:=sumarTotalExpensas(v, dimL);
end;

var
	v:vector; dimL:integer;
begin
	randomize;
	cargarVector(v, dimL);
	ordenarSeleccion(v, dimL);
	imprimirVector(v, dimL);
	writeln('La oficina esta en la posicion ', busquedaDicotomica(v, 3, dimL), ', (0 si no se encuentra en el vector.)');
	writeln('Monto total de las expensas: ', totalExpensas(v, dimL):0:2);
end.
