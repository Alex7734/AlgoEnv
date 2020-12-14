uses crt,venbuton,mouse2,graph,dos;

const nr=3;lat=70;
var opt,xm,ym,i,j,gd,gm:integer;
var b:array[1..10,1..10] of button;
var sem,sem2: boolean;
var k,n,l,c: integer;
var ass, ev: boolean;
var cineMuta: char;


procedure def;
var x,y,i,j:integer;
begin
   y:=90;
   for i:=1 to nr do
     begin
        x:=250;
        for j:=1 to nr do
        begin
           definire_buton(b[i,j],x+2,y+2,x+lat,y+lat,15,5,'');
           pune_buton(b[i,j]);
           x:=x+lat;
        end;
        y:=y+lat;
    end;
end;

function verif:Boolean;
var sem, checkEnd:Boolean;
begin
     sem:=False;
     if (b[1,1].t=b[2,2].t) and (b[2,2].t=b[3,3].t) and (b[1,1].t<>'') then sem:= True;
     if (b[1,3].t=b[2,2].t) and (b[2,2].t=b[3,1].t) and (b[1,3].t<>'') then sem:= True;
     for i:=1 to nr do
     begin
          if (b[1,i].t=b[2,i].t) and (b[2,i].t=b[3,i].t) and (b[1,i].t<>'') then sem:= True;
          if (b[i,1].t=b[i,2].t) and (b[i,2].t=b[i,3].t) and (b[i,1].t<>'') then sem:= True;
     end;
     for i:=1 to nr do
         for j:=1 to nr do
              begin
                 checkEnd:=True;
                 if b[i,j].t='' then checkEnd:=False;
              end;
     if checkEnd then verif:=True;
     verif:=sem;
end;

begin
     gd:=detect;
     initgraph(gd,gm,'');
     setbkcolor(3);
     cleardevice;
     mouseon;
     def;
     cineMuta:='X';
     k:=0;
     repeat
        sem2:=false;
        repeat
           for i:=1 to nr do
               for j:=1 to nr do
                  if buton_apasat(b[i,j]) and (b[i,j].t = '') then
                                          begin
                                             l:=i;
                                             c:=j;
                                             sem2:=true;
                                             inc(k);
                                             cineMuta:='0'
                                          end;
        until sem2;
        b[l,c].t:='X';
        pune_buton(b[l,c]);
        sem2:=false;
        if not verif then
        repeat
           for i:=1 to nr do
               for j:=1 to nr do
                  if buton_apasat(b[i,j]) and (b[i,j].t = '') then
                                          begin
                                             l:=i;
                                             c:=j;
                                             sem2:=true;
                                             inc(k);
                                             cineMuta:='X'
                                          end;
        until sem2;
        b[l,c].t:='0';
        pune_buton(b[l,c]);
     until (k = 9) or (verif);
     closegraph;
     if k=9 then write('Nu a castigat nimeni !') else
     if cineMuta='X' then write('Castiga 0 !') else write('Castiga X !');
     readln;
end.