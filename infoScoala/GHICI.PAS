program atestat;
uses crt,venbuton,mouse2,graph,dos;

const
     nr=2;
     lat=70;
     cu1=14;
     cu2=4;
var
   opt,xm,ym,i,j,gd,gm:integer;
   b:array[1..nr,1..nr] of button;
   k,n,l,c,l2,c2,count:integer;
   sem,sem2:boolean;
   repeating:char;

procedure def;
var x,y,i,j:integer;
c:char;
begin
   y:=100;
   for i:=1 to nr do
   begin
        x:=175;
        for j:=1 to nr do
        begin
           definire_buton(b[i,j],x+2,y+2,x+lat,y+lat,14,cu1,'');
           pune_buton(b[i,j]);
           x:=x+lat;
        end;
        y:=y+lat;
    end;
    c:='A';

    for i:=1 to nr*nr div 2 do
    begin
         repeat
               x:=1+random(nr);
              y:=1+random(nr);
         until  b[x,y].t='';
         b[x,y].t:=c;
         repeat
              x:=1+random(nr);
              y:=1+random(nr);
         until  b[x,y].t='';
         b[x,y].t:=c;
         c:=succ(c);
    end;

    for i:=1 to nr do
        for j:=1 to nr do
            pune_buton(b[i,j]);

end;

begin

repeating:='y';
repeat
   randomize;
   gd:=detect;
   initgraph(gd,  gm,'');
   setbkcolor(12);
   cleardevice;
   mouseon;
   def;
   k:=0;
   count:=0;

   repeat
         sem2:=false;
         repeat
               for i:=1 to nr do for j:=1 to nr do
               if buton_apasat(b[i,j]) and (b[i,j].bcolor=14) and (b[i,j].tcolor=cu1) then
               begin
                    l:=i;
                    c:=j;
                    sem2:=true;
                    inc(count);
               end;
         until sem2;

         b[l,c].tcolor:=cu2;
         pune_buton(b[l,c]);


         sem2:=false;
         repeat
               for i:=1 to nr do for j:=1 to nr do
               if buton_apasat(b[i,j]) and (b[i,j].bcolor=14) and (b[i,j].tcolor=cu1) then
               begin
                    l2:=i;
                    c2:=j;
                    sem2:=true;
                    inc(count);
               end;
         until sem2;

         b[l2,c2].tcolor:=cu2;
         pune_buton(b[l2,c2]);
         delay(200);

         if (b[l,c].t=b[l2,c2].t) then
         begin
              b[l,c].bcolor:=blue;
              pune_buton(b[l,c]);
              b[l2,c2].bcolor:=blue;
              pune_buton(b[l2,c2]);
              inc(k);
         end else begin
             b[l2,c2].tcolor:=cu1;
             pune_buton(b[l2,c2]);
             b[l,c].tcolor:=cu1;
             pune_buton(b[l,c]);
         end;
    until k>=nr*nr div 2;
    closegraph;
    writeln('You tried ',count div 2,' times untill you got all ',nr*nr div 2,' pairs');
    write('Would you want to repeat?(y/n)');
    read(repeating);
    readln;
until repeating='n';
end.