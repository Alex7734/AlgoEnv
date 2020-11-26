program atestat;
uses crt,venbuton,mouse2,graph,dos;

const nr=10;t=50;lat=30;
var opt,xm,ym,i,j,gd,gm:integer;
   b:array[1..10,1..10] of button;
   ales:boolean;
   men:array[1..12] of button;

procedure def;
var x,y,i,j:integer;
begin
   y:=50;
   for i:=1 to nr do
     begin
        x:=275;
        for j:=1 to nr do
        begin
           definire_buton(b[i,j],x+2,y+2,x+lat,y+lat,15,5,'');
           pune_buton(b[i,j]);
           x:=x+lat;
        end;
        y:=y+lat;
    end;
end;

procedure defm;
var x,y,i,j,lat,lung:integer;
   f:text;
   s:string;
begin
   lat:=30;
   lung:=150;
   y:=30;
   x:=35;
   assign(f,'men.txt');
   reset(f);
        for i:=1 to 12 do
        begin
           readln(f,s);
           definire_buton(men[i],x+2,y+2,x+lung,y+lat,15,4,s);
           pune_buton(men[i]);
           y:=y+lat;
        end;
  close(f);
end;

procedure chenar;
begin
 setcolor(14);
 line(10,10,xm-10,10);
 line(10,ym-10,xm-10,ym-10);
 line(10,10,10,ym-10);
 line(xm-10,10,xm-10,ym-10);
 line(13,13,xm-13,13);
 line(13,ym-13,xm-13,ym-13);
 line(13,13,13,ym-13);
 line(xm-13,13,xm-13,ym-13);
 line(220,13,220,ym-13);
 line(223,13,223,ym-13);
 line(223,370,xm-13,370);
 line(223,373,xm-13,373);
end;

procedure pro1;
var l,c,i,j:integer;
    s1,s2:string;
begin
   setcolor(15);
   i:=1+random(10);
   j:=1+random(10);
   str(i,s1);
   str(j,s2);
   outtextxy(410,410,'A['+s1+','+s2+']');
   outtextxy(254,i*30+30,s1);
   outtextxy(257+j*30,25,s2);
   for c:=1 to 10 do
     begin
         b[i,c].bcolor:=14;
         b[c,j].bcolor:=14;
         pune_buton(b[i,c]);
         pune_buton(b[c,j]);
     end;
    b[i,j].bcolor:=4;
    pune_buton(b[i,j]);
    repeat until rightbutton;
   setcolor(0);
   outtextxy(410,410,'A['+s1+','+s2+']');
   outtextxy(254,i*30+30,s1);
   outtextxy(257+j*30,25,s2);
   for c:=1 to 10 do
     begin
         b[i,c].bcolor:=15;
         b[c,j].bcolor:=15;
         pune_buton(b[i,c]);
         pune_buton(b[c,j]);
     end;
end;

procedure pro2;
var l,i:integer;
    s1:string;
begin
   l:=1+random(10);
   str(l,s1);
   setcolor(15);
   outtextxy(254,l*30+30,s1);
   outtextxy(360,410,'FOR j:=1  TO N DO ... A[L,j]');
   for j:=1 to 10 do
     begin
         b[l,j].bcolor:=4;
         pune_buton(b[l,j]);
     end;
    repeat until rightbutton;
   setcolor(0);
   outtextxy(254,l*30+30,s1);
   outtextxy(360,410,'FOR j:=1  TO N DO ... A[L,j]');
   for j:=1 to 10 do
     begin
         b[l,j].bcolor:=15;
         pune_buton(b[l,j]);
     end;
end;

procedure pro3;
var l,i:integer;
    s1:string;
begin
   l:=1+random(10);
   str(l,s1);
   setcolor(15);
   outtextxy(257+l*30,25,s1);
   outtextxy(360,410,'FOR i:=1  TO N DO ... A[i,C]');
   for j:=1 to 10 do
     begin
         b[j,l].bcolor:=4;
         pune_buton(b[j,l]);
     end;
    repeat until rightbutton;
   setcolor(0);
   outtextxy(257+l*30,25,s1);
   outtextxy(360,410,'FOR i:=1  TO N DO ... A[i,C]');
   for j:=1 to 10 do
     begin
         b[j,l].bcolor:=15;
         pune_buton(b[j,l]);
     end;
end;

procedure pro4;
var i,j:integer;
begin
   setcolor(15);
   outtextxy(320,390,'FOR i:=1  TO N DO ');
   outtextxy(340,410,'FOR j:=1  TO N DO ... A[i,j]');
   for i:=1 to 10 do
     for j:=1 to 10 do
     begin
         b[i,j].bcolor:=4;
         pune_buton(b[i,j]);
         delay(t);
     end;

   repeat until rightbutton;
   setcolor(0);
   for i:=1 to 10 do
    for j:=1 to 10 do
     begin
         b[i,j].bcolor:=15;
         pune_buton(b[i,j]);
     end;
   setcolor(0);
   outtextxy(320,390,'FOR i:=1  TO N DO ');
   outtextxy(340,410,'FOR j:=1  TO N DO ... A[i,j]');

end;

procedure pro5;
var i,j:integer;
begin
   setcolor(15);
   outtextxy(320,390,'FOR j:=1  TO N DO ');
   outtextxy(340,410,'FOR i:=1  TO N DO ... A[i,j]');
   for j:=1 to 10 do
     for i:=1 to 10 do
     begin
         b[i,j].bcolor:=4;
         pune_buton(b[i,j]);
         delay(t);
     end;

   repeat until rightbutton;
   setcolor(0);
   for i:=1 to 10 do
    for j:=1 to 10 do
     begin
         b[i,j].bcolor:=15;
         pune_buton(b[i,j]);
     end;
   setcolor(0);
   outtextxy(320,390,'FOR j:=1  TO N DO ');
   outtextxy(340,410,'FOR i:=1  TO N DO ... A[i,j]');

end;


procedure pro6;
var i:integer;
begin
   setcolor(15);
   outtextxy(360,410,'FOR i:=1  TO N DO ... A[i,i]');
   for j:=1 to 10 do
     begin
         b[j,j].bcolor:=4;
         pune_buton(b[j,j]);
     end;
    repeat until rightbutton;
   setcolor(0);
   outtextxy(360,410,'FOR i:=1  TO N DO ... A[i,i]');
   for j:=1 to 10 do
     begin
         b[j,j].bcolor:=15;
         pune_buton(b[j,j]);
     end;
end;

procedure pro7;
var i:integer;
begin
   setcolor(15);
   outtextxy(360,410,'FOR i:=1  TO N DO ... A[i,N+1-i]');
   for j:=1 to 10 do
     begin
         b[j,10+1-j].bcolor:=4;
         pune_buton(b[j,10+1-j]);
     end;
    repeat until rightbutton;
   setcolor(0);
   outtextxy(360,410,'FOR i:=1  TO N DO ... A[i,n+1-i]');
   for j:=1 to 10 do
     begin
         b[j,10+1-j].bcolor:=15;
         pune_buton(b[j,10+1-j]);
     end;
   setcolor(0);
   outtextxy(360,410,'FOR i:=1  TO N DO ... A[i,N+1-i]');
end;

procedure pro8;
var i,j:integer;
begin
   setcolor(15);
   outtextxy(320,390,'FOR i:=2  TO N DO ');
   outtextxy(340,410,'FOR j:=1  TO i-1 DO ... A[i,j]');
   for i:=1 to 10 do
     begin
         b[i,i].bcolor:=14;
         pune_buton(b[i,i]);
     end;

   for i:=2 to 10 do
    for j:=1 to i-1 do
     begin
         b[i,j].bcolor:=4;
         pune_buton(b[i,j]);
     end;
    repeat until rightbutton;
   setcolor(0);
   for i:=1 to 10 do
    for j:=1 to i do
     begin
         b[i,j].bcolor:=15;
         pune_buton(b[i,j]);
     end;
   setcolor(0);
   outtextxy(320,390,'FOR i:=2  TO N DO ');
   outtextxy(340,410,'FOR j:=1  TO i-1 DO ... A[i,j]');
end;

procedure pro9;
var i,j:integer;
begin
   setcolor(15);
   outtextxy(320,390,'FOR i:=1  TO N-1 DO ');
   outtextxy(340,410,'FOR j:=i+1  TO N DO ... A[i,j]');
   for i:=1 to 10 do
     begin
         b[i,i].bcolor:=14;
         pune_buton(b[i,i]);
     end;

   for i:=1 to 10 do
    for j:=i+1 to 10 do
     begin
         b[i,j].bcolor:=4;
         pune_buton(b[i,j]);
     end;
    repeat until rightbutton;
   setcolor(0);
   for i:=1 to 10 do
    for j:=i to 10 do
     begin
         b[i,j].bcolor:=15;
         pune_buton(b[i,j]);
     end;
   setcolor(0);
   outtextxy(320,390,'FOR i:=1  TO N-1 DO ');
   outtextxy(340,410,'FOR j:=i+1  TO N DO ... A[i,j]');
end;


procedure pro10;
var i,j:integer;
begin
   setcolor(15);
   outtextxy(320,390,'FOR i:=2  TO N DO ');
   outtextxy(340,410,'FOR j:=N+2-i  TO N DO ... A[i,j]');
   for i:=1 to 10 do
     begin
         b[i,10+1-i].bcolor:=14;
         pune_buton(b[i,10+1-i]);
     end;
   for i:=2 to 10 do
    for j:=10+2-i to 10 do
     begin
         b[i,j].bcolor:=4;
         pune_buton(b[i,j]);
     end;
    repeat until rightbutton;
   setcolor(0);
   for i:=1 to 10 do
    for j:=1 to 10 do
     begin
         b[i,j].bcolor:=15;
         pune_buton(b[i,j]);
     end;
   setcolor(0);
   outtextxy(320,390,'FOR i:=2  TO N DO ');
   outtextxy(340,410,'FOR j:=N+2-i  TO N DO ... A[i,j]');
end;



procedure pro11;
var i,j:integer;
begin
   setcolor(15);
   outtextxy(320,390,'FOR i:=1  TO N-1 DO ');
   outtextxy(340,410,'FOR j:=1  TO N-i DO ... A[i,j]');
   for i:=1 to 10 do
     begin
         b[i,10+1-i].bcolor:=14;
         pune_buton(b[i,10+1-i]);
     end;
   for i:=1 to 9 do
    for j:=1 to 10-i do
     begin
         b[i,j].bcolor:=4;
         pune_buton(b[i,j]);
     end;
    repeat until rightbutton;
   setcolor(0);
   for i:=1 to 10 do
    for j:=1 to 10 do
     begin
         b[i,j].bcolor:=15;
         pune_buton(b[i,j]);
     end;
   setcolor(0);
   outtextxy(320,390,'FOR i:=1  TO N-1 DO ');
   outtextxy(340,410,'FOR j:=1  TO N-i DO ... A[i,j]');
end;




begin
   randomize;
   gd:=detect;
   initgraph(gd,gm,'');
   xm:=getmaxx;
   ym:=getmaxy;
   mousewindow(13,13,220,ym-13);
   setbkcolor(brown);
   chenar;
   def;
   defm;
   repeat
         mouseon;
         repeat
             ales:=false;
             for i:=1 to 12 do
                   if (buton_apasat(men[i]))and(not ales) then
                       begin
                          opt:=i;
                          ales:=true;
                          mouseoff;
                       end;
          until ales;
          case opt of
            1:pro1;
            2:pro2;
            3:pro3;
            4:pro4;
            5:pro5;
            6:pro6;
            7:pro7;
            8:pro8;
            9:pro9;
           10:pro10;
           11:pro11;
         end;
   until (buton_apasat(men[12])) or(opt=12);;
end.