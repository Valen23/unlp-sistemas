program practica2ej4;//
procedure binarioRecursivo(num:integer);
begin
	if (num > 0) then
		begin
			binarioRecursivo(num div 2);
			write(num mod 2);
		end;
end;
	
var
	num:integer;
begin
	write('Escriba un numero: '); readln(num);
	binarioRecursivo(num);
end.
