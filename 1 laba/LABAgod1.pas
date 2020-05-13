program LABAgod1;
uses unitgod1;
var
  T:Triangle;
  L:line;
  O:OKR;
begin
     T:=CreateTriangle;
     L:=CreateLine;
     O:=CreateOKR;
     WriteLn('AB: ',GetDistance(T.A, T.B):0:6);
     WriteLn('BC: ',GetDistance(T.B, T.C):0:6);
     WriteLn('AC: ',GetDistance(T.A, T.C):0:6);
     Writeln('Perimetr=',GetTriangleP(T));
     WriteLn('Square=',GetTriangleS(T));

     if CrOrNot(L,T) then
     WriteLn('pereseklo')
     else
     WriteLn('nepereseklo');


     WriteLn('SOKR',CreateOKRS(O));


     Writeln('RADIUS',GetDistance(O.A, O.C):0:6);
     ReadLn();

     CreateMassiveofOKR();
     ReadLn();


end.

