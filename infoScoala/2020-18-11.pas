{Genereaza nr de n cifre a.i pe pozitii pare sa am numere
pare iar pe poziti impare cifre impare}

program permutari;
type stiva=array[1..20] of integer;
var st:stiva;
    k,n:integer;
    nrsol:longint;
    AS_,ev:boolean;

procedure init;
begin
  if k mod 2 = 0 then st[k]:=-2
  else st[k]:=-1;
end;

procedure succesor;
begin
  if st[k]<8 then
  begin
    st[k]:=st[k]+2;
    AS_:=true;
  end
  else
    AS_:=false;
end;

procedure valid;
var i:integer;
begin
     ev:=true;
end;

function solutie:boolean;
begin
     solutie:=k=n;
end;

procedure tipar;
var i:integer;
begin
  for i:=1 to k do write(st[i]);
  writeln;
  inc(nrsol)
end;

begin
  readln(n);
  k:=1;
  nrsol:=0;
  init;

    while k>0 do
      begin
        repeat
            succesor;
            if AS_ then valid;
        until (AS_ and ev) or (not AS_);
        if AS_ then
          if solutie then tipar
          else
            begin
              inc(k);
              init;
            end
        else
        dec(k);
      end;

  writeln(nrsol);
end.