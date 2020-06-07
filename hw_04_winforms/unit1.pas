unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Ax: TEdit;
    Ay: TEdit;
    Bx: TEdit;
    By: TEdit;
    TrTop: TEdit;
    TrDown: TEdit;
    TrLeft: TEdit;
    TrRight: TEdit;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  A, B, C: TPoint;

implementation

{$R *.lfm}

{ TForm1 }

Function GiveColor(S:string):TColor;
begin

  if AnsiCompareStr(S, 'GREEN')=0 then  //(AnsiCompareStr) возвращает 0, если строки равны
  exit(ClGreen);
  if AnsiCompareStr(S, 'BROWN')=0 then
  exit(RgbToColor(210,105,30));
  if AnsiCompareStr(S, 'YELLOW')=0 then
  exit(ClYellow);
  if AnsiCompareStr(S, 'RED')=0 then
  exit(ClRed);
  if AnsiCompareStr(S, 'ORANGE')=0 then
  exit(RgbToColor(255,105,0));
  if AnsiCompareStr(S, 'BLUE')=0 then
  exit(ClBlue);
  exit(ClWhite);

end;


procedure TForm1.Button1Click(Sender: TObject);
begin

  Image1.Canvas.Pen.Style:=PsSolid;       //непрерывная линия
  Image1.Canvas.Pen.Color:=ClWhite;
  Image1.Canvas.Pen.Width:=1;
  Image1.Canvas.Brush.Color:=ClWhite;
  Image1.Canvas.Brush.Style:=Bssolid;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);

  A.X:=StrToInt(Ax.Text);                //(StrToInt) преобразуем строчку в Integer
  A.Y:=StrToInt(Ay.Text);
  B.X:=StrToInt(Bx.Text);
  B.Y:=StrToInt(By.Text);
  C.X:=(A.X+B.X)div 2;
  C.Y:=(A.Y+B.Y)div 2;

  Image1.Canvas.Pen.Style:=Pssolid;
  Image1.Canvas.Pen.Color:=ClBlack;
  Image1.Canvas.Pen.Width:=5;
  Image1.Canvas.MoveTo(A);
  Image1.Canvas.LineTo(B.X, A.Y);
  Image1.Canvas.LineTo(B);
  Image1.Canvas.LineTo(A.X, B.Y);
  Image1.Canvas.LineTo(A);
  Image1.Canvas.LineTo(B);
  Image1.Canvas.MoveTo(B.X,A.Y);
  Image1.Canvas.LineTo(A.X,B.Y);

  Image1.Canvas.Brush.Color:=GiveColor(TrTop.text);
  Image1.Canvas.Brush.Style:=Bssolid;
  Image1.Canvas.Polygon([A,C,Point(B.X,A.Y)]);

  Image1.Canvas.Brush.Color:=GiveColor(TrDown.text);
  Image1.Canvas.Brush.Style:=Bssolid;
  Image1.Canvas.Polygon([Point(A.X, B.Y),C,B]);

  Image1.Canvas.Brush.Color:=GiveColor(TrLeft.text);
  Image1.Canvas.Brush.Style:=Bssolid;
  Image1.Canvas.Polygon([A,C,Point(A.X,B.Y)]);

  Image1.Canvas.Brush.Color:=GiveColor(TrRight.text);
  Image1.Canvas.Brush.Style:=Bssolid;
  Image1.Canvas.Polygon([Point(B.X, A.Y),C,B]);

end;

end.

