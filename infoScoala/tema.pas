{
Se da un fisier sa se scrie toate expresile aritmetice cu plus
sau minus intre numere astfel incat evaluand expresia tot timpul 
sa fie pozitiva

s:=x[1];
for i:=1 to k do 
	begin
		if st[i] = 1 then s:=s+x[i+1]
		else s:=s-x[i+1];
		if s<=0 then ev:=False;
	end;
}
type stiva=array[1..20] of integer;
     vec=array[1..100] of integer;
var st:stiva;
    k,n,p,s,i:integer;
    AS_,ev:boolean;
    f:text;
    v:vec;

procedure init;
begin
     st[k]:=0;
end;

procedure succesor;
begin
     if st[k]<2 then
        begin
             inc(st[k]);
             AS_:=true;
        end
                else
        AS_:=false;
end;

procedure valid;
var i:integer;
begin
     ev:=true;
     s:=v[1];
     for i:=1 to k do
        begin
            if st[i]=1 then s:=s+v[i+1]
                       else s:=s-v[i+1];
            if s<=0 then ev:=false;
        end;
end;

function solutie:boolean;
begin
     solutie:=k=n-1;
end;

procedure tipar;
var i:integer;
begin
     write(v[1]);
     for i:=1 to k do
        begin
            if st[i]=1 then write('+')
                       else write('-');
            write(v[i+1]);
        end;
     write('=',s);
     writeln;
end;

begin
     assign(f,'a.txt');
     reset(f);
     n:=0;
     while not seekeof(f) do
        begin
            n:=n+1;
            read(f,v[n] );
        end;
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
