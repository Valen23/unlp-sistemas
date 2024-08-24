program practica1ej2abc;
const
	dimF = 300;
	
type
	rangoOficinas = 1..dimF;
	
	datos = record
			codigoIdentificacion: integer;
			DNI: integer;
			valorExpensas: real;
		end;
		
	vector = array[rangoOficinas] of datos;
	
procedure cargarVector(var v:vector; var dimL:integer);
begin
	while (v[dimL].codigoIdentificacion <> -1) and (dimL <= dimF) do
		begin
			dimL:=dimL+1;
			write('> Codigo de identificacion: '); readln(v[dimL].codigoIdentificacion);
			write('> DNI: '); readln(v[dimL].DNI);
			write('> Valor de las expensas: '); readln(v[dimL].valorExpensas);
		end;
	if (v[dimL].codigoIdentificacion = -1) then dimL:=dimL-1;
end;

procedure ordenarSeleccion(var v:vector; dimL:rangoOficinas);
var
	i, j, pos:rangoOficinas; item:datos;
begin
	for i:=1 to dimL-1 do // empiezo desde 1 hasta -1 del final, ya que el ultimo valor ya queda ordenado
		begin
			pos:=i; // guardo la posicion en la que empiezo la vuelta
			
			for j:=i+1 to dimL do // empiezo desde la N vuelta +1 hasta la dimensión lógica
				if (v[j].codigoIdentificacion < v[pos].codigoIdentificacion) then pos:=j; // comparo si el de la posicion recorrida es menor al de la posición de la N vuelta
			
			item.codigoIdentificacion:=v[pos].codigoIdentificacion;
			item.DNI:=v[pos].DNI;
			item.valorExpensas:=v[pos].valorExpensas;
			v[pos].codigoIdentificacion:=v[i].codigoIdentificacion;
			v[pos].DNI:=v[i].DNI;
			v[pos].valorExpensas:=v[i].valorExpensas;
			v[i].codigoIdentificacion:=item.codigoIdentificacion;
			v[i].DNI:=item.DNI;
			v[i].valorExpensas:=item.valorExpensas;
		end;
end;

procedure ordenarInsercion(var v:vector; dimL:rangoOficinas);
var
	i, j:integer; actual:datos;
begin
	for i:=2 to dimL do
		begin
			actual.codigoIdentificacion:=v[i].codigoIdentificacion;
			actual.DNI:=v[i].DNI;
			actual.valorExpensas:=v[i].valorExpensas;
			j:=i-1;
			while (j > 0) and (v[j].codigoIdentificacion > actual.codigoIdentificacion) do
				begin
					v[j+1].codigoIdentificacion:=v[j].codigoIdentificacion;
					v[j+1].DNI:=v[j].DNI;
					v[j+1].valorExpensas:=v[j].valorExpensas;
					j:=j-1;
				end;
				v[j+1].codigoIdentificacion:=actual.codigoIdentificacion;
				v[j+1].DNI:=actual.DNI;
				v[j+1].valorExpensas:=actual.valorExpensas;
		end;
end;

procedure imprimirVector(v:vector; dimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do
		begin
			writeln('==================================================');
			writeln('Codigo de identificacion: ', v[i].codigoIdentificacion);
			writeln('DNI: ', v[i].DNI);
			writeln('Valor de expensas: ', v[i].valorExpensas:0:2);
		end;
end;

var
	dimL:integer;
	v:vector;
begin
	cargarVector(v, dimL);
	ordenarSeleccion(v, dimL);
	//ordenarInsercion(v, dimL);
	imprimirVector(v, dimL);
end.
