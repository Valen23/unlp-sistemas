{
procedure insertarOrdenado(var pi:lista; valor:integer);
var
  actual, anterior, nuevo:lista;
begin
  new(nuevo); nuevo^.dato:=valor; nuevo^.sig:=nil;
  if (pi = nil) then pi:=nuevo;
  else
    begin
      actual:=pi; anterior:=pi;
      while (actual <> nil) and (actual^.dato < nuevo^.dato) do
        begin
          anterior:=actual;
          actual:=actual^.nodoSig;
        end;
    end;
    if (actual = pi) then
      begin
        nuevo^.nodoSig:=pi; pi:=nuevo;
      end;
    else
      begin
        anterior^.nodoSig:=nuevo; nuevo^.nodoSig:=actual;
      end;
end;
}
