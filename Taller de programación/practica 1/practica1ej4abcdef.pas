program practica1ej4abcdef;
const
	dimF = 30;
	
type
	rangoRubro = 1..8;

	producto = record
		codigoProducto:integer;
		codigoRubro:rangoRubro;
		precio:real;
	end;

	lista = ^nodo;
	nodo = record
		dato:producto;
		nodoSig:lista;
	end;
	
	vector = array[rangoRubro] of lista;
	
	vectorProductos3 = array[1..30] of producto;
	
procedure leerProducto(var p:producto);
begin
	p.codigoProducto:=random(1000)+1; // write(' > Codigo de producto: '); readln(p.codigoProducto);
	p.codigoRubro:=random(8)+1; // write(' > Codigo de rubro: '); readln(p.codigoRubro);
	p.precio:=random(10001); // write(' > Precio: '); readln(p.precio);
end;

procedure insertarOrdenado(var l:lista; p:producto);
var
	nue, act, ant:lista;
begin
    new(nue); nue^.dato:=p; act:=l;
	ant:=l;
	
	while (act<>nil) and (p.codigoProducto > act^.dato.codigoProducto) do begin
		ant:=act;
		act:=act^.nodoSig;
	end;
	
	if(act=ant)then
		l:=nue
	else
		ant^.nodoSig:=nue;
	nue^.nodoSig:=act;
end;

procedure crearLista(var l:lista; var v:vector; var p:producto);
begin
	p.precio:=-1;
	while (p.precio <> 0) do
		begin
			leerProducto(p);
			insertarOrdenado(v[p.codigoRubro], p);
		end;
end;

procedure imprimirVectorListas(v:vector; l:lista);
var
	i:integer;
begin
	for i:=1 to	8 do
		begin
			while (v[i] <> nil) do
				begin
					writeln(i, ':');
					writeln(v[i]^.dato.codigoProducto);
					writeln('===============================');
					v[i]:=v[i]^.nodoSig;
				end;
		end;
end;

procedure crearVectorRubro3(var vP3:vectorProductos3; l:lista; var dimL:integer);
begin
	while (l <> nil) and (dimL <= 30) do
		begin
			dimL+=1;
			vP3[dimL]:=l^.dato;
			l:=l^.nodoSig;
		end;
end;

procedure imprimirVectorRubro3(vP3:vectorProductos3);
var
	i:integer;
begin
	for i:=1 to dimF do writeln(vP3[i].precio:0:2);
end;

procedure ordenarInsercion(var v:vectorProductos3; dimL: integer);
var
  i, j: integer;
  actual: producto; // pasamos el registro
begin
  for i := 2 to dimL do begin
    actual := v[i];
    j := i-1;
    while((j > 0) and (v[j].precio > actual.precio)) do begin
      v[j+1] := v[j];
      j := j - 1;
    end;
    v[j+1] := actual;
  end;
end;

function calcularPromedio(vP3:vectorProductos3; dimL:integer):real;
var
	i:integer;
begin
	calcularPromedio:=0;
	for i:=1 to dimL do
		begin
			calcularPromedio:=calcularPromedio+vP3[i].precio;
		end;
	calcularPromedio:=calcularPromedio/dimL;
end;

var
	l:lista;
	v:vector;
	p:producto;
	vP3:vectorProductos3;
	dimL:integer;
	
begin
	dimL:=0;
	randomize;
	crearLista(l, v, p);
	crearVectorRubro3(vP3, v[3], dimL);
	ordenarInsercion(vP3, dimL);
	imprimirVectorListas(v, l);
	imprimirVectorRubro3(vP3);
	writeln('> Precio promedio: ', calcularPromedio(vP3, dimL):0:2);
end.
