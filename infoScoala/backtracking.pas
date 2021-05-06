program permutari;
type stiva=array[1..20] of integer;
var st:stiva;
    k,n:integer;
    AS_,ev:boolean;

procedure init;
begin
     st[k]:=0;
end;

procedure succesor;
begin
  if st[k]<5 then
  begin
    inc(st[k]);
    AS_:=true;
  end else
    AS_:=false;
end;

procedure valid;
var i:integer;
begin
  ev:=true;
  for i:=1 to k-1 do
    if st[k]=st[i] then ev:=false;
  if k=2 then if st[k] > 2 then ev:=false
end;

function solutie:boolean;
begin
  solutie:=k=n;
end;

procedure tipar;
var i:integer;
begin
  for i:=1 to k do
    write(st[i],' ');
  writeln;
end;

begin
  n:=3;
  k:=1; 
  init;
  while k>0 do
  begin
    repeat
      succesor;
      if AS_ then valid;
    until (AS_ and ev) or (not AS_);
      if AS_ then
        if solutie then tipar
        else begin
          inc(k);
          init;
        end
      else dec(k);
  end;
end.