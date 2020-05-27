program LABAgod1;
uses unitgod1;
var
  T:Triangle;
  L:line;
  O1,O2:OKR;
begin
     T:=CreateTriangle;
     L:=CreateLine;
     O1:=CreateOKR;
     O2:=CreateOKR;
     WriteLn('AB: ',GetDistance(T.A, T.B):0:6);
     WriteLn('BC: ',GetDistance(T.B, T.C):0:6);
     WriteLn('AC: ',GetDistance(T.A, T.C):0:6);
     Writeln('Perimetr=',GetTriangleP(T));
     WriteLn('Square=',GetTriangleS(T));

     if CrOrNot(L,T) then
     WriteLn('pereseklo')
     else
     WriteLn('nepereseklo');

     WriteLn(Perese4OKR(O1,O2));
     ReadLn();

end.

