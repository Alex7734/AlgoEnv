program permutari;
type stiva=array[1..20] of integer;
var st,a:stiva;
    k,n,s,s1,i:integer;
    AS_,ev:boolean;

procedure init;
begin
    st[k]:=-1;
end;

procedure succesor;
begin
    if  (k<=n) and (st[k]<(s div a[k])) then
        begin
            inc(st[k]);
            AS_:=true;
        end
            else
        AS_:=false;
    {writeln(k);
    for i:=1 to k do write(st[i], ' ');
    writeln;}
end;

procedure valid;
var i:integer;
begin
     ev:=true;
     s1:=0;
     for i:=1 to k do
     	s1 := s1 + a[i] * st[i];
     if s1>s then ev:=false;
end;

function solutie:boolean;
begin
    solutie:=(k=n)and(s=s1);
end;

procedure tipar;
var i:integer;
begin
     for i:=1 to k do
         write(st[i],' ');
     writeln;
end;

begin
	 read(s);
	 read(n);
	 for i:=1 to n do read(a[i]);
     k:=1; init;
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
end.