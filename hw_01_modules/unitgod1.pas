unit unitgod1;

interface
uses
  SysUtils;
type
  Point=record
    X,Y:Real;
    end;
  Triangle=record
    A,B,C:Point;
  end;
  Line=record
    A:Point;
    B:Point;
  end;
  OKR=record
    G:point;
    Rad:Real;
  end;

Function CreatePoint():Point;
Function CreateTriangle():Triangle;
Function CreateLine():Line;
Function CreateOKR():OKR;

Function Perese4OKR(L:OKR;R:OKR):Boolean;
Function GetDistance(l:Point; r:Point):Real;
Function GetTriangleP(T:Triangle):Real;
Function GetTriangleS(T:Triangle):Real;
function CrLine(const L:line; const p1,p2:Point):Boolean;
function CrOrNot(const L:line; const T:Triangle):Boolean;

implementation

Function CreateOKR():OKR;
var
   G:Point;
   Rad:Real;
begin
Write('oG: ');
G:=CreatePoint;
Write('Rad: ');
ReadLn(Rad);
CreateOKR.G:=G;
CreateOKR.Rad:=Rad;
end;

Function Perese4OKR(L:OKR;R:OKR):Boolean;
begin
Perese4OKR:=GetDistance(L.G,R.G)<=(L.Rad+R.Rad);
end;

Function GetDistance(l:Point; r:Point):Real;
var
   vec:Point;
begin
vec.x:=l.x-r.x;
vec.y:=l.y-r.y;
GetDistance:=sqrt(sqr(vec.x)+sqr(vec.y));
end;

Procedure TrianglePerimetrAndSide(T:Triangle;out AB:Real;out BC:Real;out AC:Real;out Per:Real);
begin
AB:=GetDistance(T.A, T.B);
BC:=GetDistance(T.B, T.C);
AC:=GetDistance(T.A, T.C);
Per:=GetTriangleP(T);
end;

Function CreatePoint():Point;
begin
  Write('X: ');
  ReadLn(CreatePoint.X);
  Write('Y: ');
  ReadLn(CreatePoint.Y);
end;

Function CreateLine():Line;
begin
WriteLn('(.)LA ');
CreateLine.A:=CreatePoint();
WriteLn('(.)LB ');
CreateLine.B:=CreatePoint();
end;

Function CreateTriangle():Triangle;
begin
  WriteLn('(.)A ');
  CreateTriangle.A:=CreatePoint();
  WriteLn('(.)B ');
  CreateTriangle.B:=CreatePoint();
  WriteLn('(.)C ');
  CreateTriangle.C:=CreatePoint();
end;

Function GetTriangleP(T:Triangle):Real;
begin
GetTriangleP:=GetDistance(T.A, T.B)+GetDistance(T.C, T.B)+GetDistance(T.C, T.A);
end;

Function GetTriangleS(T:Triangle) : Real;
var
   p:Real;
   AB,BC,AC:Real;
begin
TrianglePerimetrAndSide(T, AB, BC, AC, P);
p:=(GetDistance(T.A, T.B)+GetDistance(T.C, T.B)+GetDistance(T.C, T.A))/2;
GetTriangleS:=sqrt(p*(p-AB)*(p-BC)*(p-AC));
end;

Function CrLine(const L:line; const p1,p2:Point):Boolean;
var
   t:real;
   q:real;
begin
q:=(p1.x-p2.x)*(l.A.y-l.B.y)-(p1.y-p2.Y)*(l.A.x-l.B.x);
if q=0 then
exit(false);
t:=((p1.x-l.A.x)*(l.A.y-l.B.y)-(p1.y-l.A.y)*(l.A.x-l.B.x))/((p1.x-p2.x)*(l.A.y-l.B.y)-(p1.y-p2.Y)*(l.A.x-l.B.x));
if (t<=1) and (t>=0) then
exit(true)
else
exit(false);
end;

Function CrOrNot(const L:line; const T:Triangle):Boolean;
begin
if CrLine(L,T.A,T.B) then
exit(true);
if CrLine(L,T.B,T.C) then
exit(true);
if CrLine(L,T.A,T.C) then
exit(true);
exit(false);
end;

end.

