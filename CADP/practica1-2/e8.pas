program e8;
var
    montoVenta, cantidadVentas, totalVentas, i: integer;
begin
    montoVenta:=-1;
    cantidadVentas:=0;
    totalVentas:=0;
    for i:=1 to 5 do
        begin
            WriteLn('----- DIA ', i, ' -----');
            repeat
                Write('Monto de venta: ');
                    ReadLn(montoVenta);
                    if (montoVenta > 0) then
                        begin
                            cantidadVentas:=cantidadVentas+1;
                            WriteLn('CANTIDAD DE VENTAS EN EL DIA ', i, ': ', cantidadVentas);
                            totalVentas:=totalVentas+montoVenta;
                        end;
            until (montoVenta = 0);
            cantidadVentas:=0;
            WriteLn('MONTO ACUMULADO DE VENTAS EN EL MES: ', totalVentas);
        end;
end.