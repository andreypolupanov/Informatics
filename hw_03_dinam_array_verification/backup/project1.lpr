program project1;

uses crt;
var N,A,B,C,D:integer;
    k,i:integer;
    arr:array of integer;

begin
  Write('N= ');
  ReadLn(N);
  A:=5;
  B:=10;
  C:=20;
  D:=50;
  SetLength(arr,N);
  k:=0;
  while k<(N) do
    Begin
      ReadLn(arr[k]);
      k:=k+1;
    end;
  for i:=0 to N do
    begin
      if ((arr[i] >= A) and (arr[i] <= B)) or ((arr[i] >= C) and (arr[i] <= D)) then
        begin
          for k:=i to N do
            begin
              arr[k] := arr[k+1];

            end;
        N := N - 1;
      end;
    end;
    Write('answer: ');
    for i:= 0 to N-1 do
      Write(arr[i],' ');
      ReadLn;
end.

