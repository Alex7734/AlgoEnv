type vector = array[1..20] of integer;
type stiva = array[1..20] of integer;
var st:stiva;
    k,n,p,i:integer;
    AS_,ev:boolean;
    l,c:vector;


procedure init;
begin
     st[k]:=0;
end;

procedure succesor;
begin
     if st[k]<n then
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
     if k > 1 then 
      begin
        if c[st[k]] = c[st[k-1]] then ev:=false;
        if l[st[k]] >= l[st[k-1]] then ev:=false;
      end;
end;

function solutie:boolean;
begin
     solutie:=k=p;
end;

procedure tipar;
var i:integer;
begin
     for i:=1 to k do
         write(st[i],' ');
     writeln;
end;

begin
     readln(n);
     readln(p);
     for i:=1 to n do 
     begin
       readln(l[i], c[i]);
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