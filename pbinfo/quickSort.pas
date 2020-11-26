program Quicksort;
 
type vector = array[1..100000] of Longint;
var
  AI: vector;
  I: Integer;
  Len: LongInt;

procedure QuickSort(var AI: vector; ALo, AHi: Integer);
var
  Lo, Hi, Pivot, T: Integer;
begin
  Lo := ALo;
  Hi := AHi;
  Pivot := AI[(Lo + Hi) div 2];
  repeat
    while AI[Lo] < Pivot do
      Inc(Lo) ;
    while AI[Hi] > Pivot do
      Dec(Hi) ;
    if Lo <= Hi then
    begin
      T := AI[Lo];
      AI[Lo] := AI[Hi];
      AI[Hi] := T;
      Inc(Lo) ;
      Dec(Hi) ;
    end;
  until Lo > Hi;
  if Hi > ALo then
    QuickSort(AI, ALo, Hi) ;
  if Lo < AHi then
    QuickSort(AI, Lo, AHi) ;
end;
 
 
begin
  Readln(Len);
  for I := 1 to Len do
  begin
    Read(AI[I]);
  end;
 
  QuickSort(AI, 1, Len);
 
  for I := 1 to Len do
    Write(AI[I], ' ');
end.
