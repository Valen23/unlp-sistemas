program e8p2;
var
    montoVentasDia, montoVentasMes, cantidadVentasMes, diaRecord, montoDiaRecord, i: integer;
begin
    montoVentasDia:=-1;
    cantidadVentasMes:=0;
    montoVentasMes:=0;
    for i:=1 to 5 do
        begin
            WriteLn('----- DIA ', i, ' -----');
            repeat
                Write('Monto de venta: ');
                    ReadLn(montoVentasDia);
                    if (montoVentasDia > 0) then
                        begin
                            cantidadVentasMes:=cantidadVentasMes+1;
                            WriteLn('CANTIDAD DE VENTAS EN EL DIA ', i, ': ', cantidadVentasMes);
                            montoVentasMes:=montoVentasMes+montoVentasDia;
                        end;
                    if (montoVentasDia > montoDiaRecord) then
                        begin
                            montoDiaRecord:=montoVentasDia;
                            diaRecord:=i;

                        end;
            until (montoVentasDia = 0);
            WriteLn('-------------------------');
            WriteLn('MONTO ACUMULADO DE VENTAS EN EL MES: ', montoVentasMes);
            WriteLn('DIA CON MAYOR RECAUDACION: ', diaRecord);
        end;
end.