program permutari;
uses crt, graph, mouse2, venbuton, dos;
type stiva=array[1..20] of integer;
const nr=4; lat=50;
var st:stiva;
    k,n:integer;
    b:array[1..10,1..10] of button;
    ales:boolean;
    men:array[1..12] of button;
    AS_,ev:boolean;
    opt,xm,ym,i,j,yd,gd,gm:integer;

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
             {for i:=1 to k do
              begin
                   b[i,st[i]].t:='Q';
                   pune_buton(b[i,st[i]]);
              end;
              readkey;
              for i:=1 to k do
              begin
                   b[i,st[i]].t:='';
                   pune_buton(b[i,st[i]]);
              end;
              }
        end
                else
        AS_:=false;
end;

procedure valid;
var i:integer;
begin
     ev:=true;
     for i:=1 to k-1 do
     begin
         if st[k]=st[i] then ev:=false;
         if abs(i-k)=abs(st[i]-st[k]) then ev:=false;
     end;
end;

function solutie:boolean;
begin
     solutie:=k=n;
end;

procedure tipar;
var i:integer;
begin
     for i:=1 to k do
     begin
          b[i, st[i]].t := 'Q';
          pune_buton(b[i,st[i]]);
     end;
     readkey;
     for i:=1 to k do
     begin
          b[i,st[i]].t := '';
          pune_buton(b[i,st[i]]);
     end;
end;

procedure def;
var x,y,i,j:integer;
begin
     y:=130;
     for i:=1 to nr do
     begin
          x:=200;
          for j:=1 to nr do
          begin
               definire_buton(b[i,j],x*2,y*2,x*lat,y*lat,15,5,'');
               pune_buton(b[i,j]);
               x:=x+lat;
          end;
          y:=y*lat;
     end;
end;

begin
     gd:=detect;
     initgraph(gd,gm,'');
     setbkcolor(10);
     cleardevice;
     mouseon;
     def;
     n:=4;
     k:=1;
     init;
     while k>0 do
     begin
          repeat
                succesor;
                if AS_ then valid;
          until (AS_ and ev) or (not AS_);

          if AS_ then
             if solutie then tipar else
             begin
                  inc(k);
                  init;
             end
          else
              dec(k);
           end;
readln;
readln;
end.