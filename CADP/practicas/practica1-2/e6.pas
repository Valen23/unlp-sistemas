program e6;
var
    i, codigo, precio, precioMin1, precioMin2, codigoMin1, codigoMin2, contador: integer;
begin
    codigo:= 999;
    codigoMin1:= 999;
    codigoMin2:= 999;
    precio:= 999;
    precioMin1:= 9999;
    precioMin2:= 9999;
    contador:=0;
    for i:=1 to 5 do
        begin
            Write('CODIGO: ');
            ReadLn(codigo);
            Write('PRECIO: ');
            ReadLn(precio);
            if (precio < precioMin1) then
                begin
                    precioMin2:=precioMin1;
                    precioMin1:=precio;
                    codigoMin2:=codigoMin1;
                    codigoMin1:=codigo;
                end
                else if (precio < codigoMin2) then
                    begin
                        precioMin2:=precio;
                        codigoMin2:=codigo;
                    end;
                if (precio > 16) and (codigo MOD 2 = 0) then
                    begin
                        contador:=contador+1;
                    end;
            WriteLn('CODIGO MAS BARATO1: ', codigoMin1, ' CODIGO MAS BARATO2: ', codigoMin2, ' CONTADOR: ', contador);
        end;
end.