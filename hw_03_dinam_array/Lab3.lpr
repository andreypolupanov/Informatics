program Lab3;

Type
  Matrix = array of array of Integer;

var
  arr : Matrix;
  P, Q : Integer;
  i, j, Dy, Dx, x, y : Integer;
  NewZ : Integer;
  IsNewZDirUp : Boolean;

function IncDec() : Integer;
begin
  IncDec := NewZ;
  if NewZ = 1 then
    IsNewZDirUp := true;
  if NewZ = 9 then                                        //дает значение для заполнения определенного слота
    IsNewZDirUp := false;

  if IsNewZDirUp then
    NewZ := NewZ + 1
  else
    NewZ := NewZ -1 ;

end;

begin
  Write('Enter P, Q: ');
  ReadLn(P, Q);

  SetLength(arr, Q);

  for i := 0 to Q - 1 do
    SetLength(arr[i], P);

  Dx := P;
  Dy := Q - 1;
  x := 0;
  y := 0;

  NewZ := 1;

  while (Dx + Dy) > 0 do
  begin
    for i := 0 to Dx - 1 do
    begin
      arr[y][x + i] := IncDec();
    end;
    if Dy = 0 then
      break;
    Dx := Dx - 1;
    x := x + i;
    y := y + 1;

    for i := 0 to Dy - 1 do
    begin
      arr[y + i][x] := IncDec();
    end;
    if Dx = 0 then
      break;
    Dy := Dy - 1;
    x := x - 1;
    y := y + i;

    for i := 0 to Dx - 1 do
    begin
      arr[y][x - i] := IncDec();
    end;
    if Dy = 0 then
      break;
    Dx := Dx - 1;
    x := x - i;
    y := y - 1;

    for i := 0 to Dy - 1 do
    begin
      arr[y - i][x] := IncDec();
    end;
    if Dx = 0 then
      break;
    Dy := Dy - 1;
    x := x + 1;
    y := y - i;

  end;


  for i := 0 to Q - 1 do
  begin
    for j := 0 to P - 1 do
    begin
      Write(arr[i][j]:3);
    end;
    WriteLn();
  end;

  ReadLn();
end.
