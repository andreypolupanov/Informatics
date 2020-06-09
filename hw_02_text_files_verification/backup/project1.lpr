program project1;

Uses SysUtils;

type
  Data = record
    Id : string;
    Name : string;
    Age : Integer;
    IsUpdated : Boolean;
  end;

var
  StartFile: TextFile;
  FilePath : String;
  FilesCount : Integer;
  UsersInfo: Data;
  EndFile : TextFile;
  i : Integer;
  M: String;

Procedure Sortirovka(S: String; out A: Data);
var
  g1,g2:integer;
begin

  for g1:=1 to Length(S) do
  if copy(S,g1,4)='Name' then
  break;
  if g1<>Length(S) then
  begin
  g1:=g1+6;
  for g2:=g1 to Length(S) do
  if S[g2]='"' then
  break;
  A.Name:=copy(S,g1,g2-g1);
  end
  else
  A.Name:='None';

  for g1:=1 to Length(S) do
  if copy(S,g1,3)='Age' then
  break;
  if g1<>Length(S) then
  begin
  g1:=g1+5;
  for g2:=g1 to Length(S) do
  if S[g2]='"' then
  break;
  A.Age:=StrToInt(copy(S,g1,g2-g1));
  end
  else
  A.Age:=0;

  for g1:=1 to Length(S) do
  if copy(S,g1,2)='Id' then
  break;
  if g1<>Length(S) then
  begin
  g1:=g1+4;
  for g2:=g1 to Length(S) do
  if S[g2]='"' then
  break;
  A.Id:=copy(S,g1,g2-g1);
  end
  else
  A.Id:='None';






end;

begin
  WriteLn('Enter FilePath: ');
  ReadLn(FilePath);
  Assign(StartFile, FilePath);
  ReSet(StartFile);
  UsersInfo.IsUpdated := true;
  Assign(EndFile, 'EndFile.txt');
  ReWrite(EndFile);
  WriteLn(EndFile,'Id;Name;Age');
  while EOF(StartFile)=false do
    begin
    ReadLn(StartFile,M);
    Sortirovka(M, UsersInfo);
    Write(EndFile, UsersInfo.Id, ';');
    Write(EndFile, UsersInfo.Name, ';');
    if UsersInfo.Age=0 then
    WriteLn(EndFile,'None')
    else
      WriteLn(EndFile, UsersInfo.Age);
    end;
    Close(StartFile);
  Close(EndFile);
  WriteLn('Done');
  ReadLn();
end.

