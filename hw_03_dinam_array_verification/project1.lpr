program project1;

var N,A,B,C,D:integer;
    k,i:integer;
    arr:array of integer;

begin
  Write('N= ');
  ReadLn(N);
  Write('A= ');
  ReadLn(A);
  Write('B= ');
  ReadLn(B);
  Write('C= ');
  ReadLn(C);
  Write('D= ');
  ReadLn(D);
  SetLength(arr,N);
  k:=0;
  while k<Length(arr) do
    Begin
      ReadLn(arr[k]);
      k:=k+1;
    end;
  i:=0;
  while i<Length(arr) do
    begin
      if ((arr[i] >= A) and (arr[i] <= B)) or ((arr[i] >= C) and (arr[i] <= D)) then
        begin
          for k:=i to (Length(arr)-2) do
            begin
              arr[k] := arr[k+1];

            end;
        i := i - 1;
        SetLength(arr,Length(arr)-1);
      end;
    i:=i + 1;
    end;
    Write('answer: ');
    for i:= 0 to Length(arr)-1 do
      Write(arr[i],' ');
      ReadLn;
end.

