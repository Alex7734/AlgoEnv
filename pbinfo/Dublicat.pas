{
Cerința
Se dau un număr n și n+1 numere naturale cuprinse între 1 și n inclusiv.
Cerința 1: Pentru un număr k citit, să se afișeze al k-lea termen al șirului citit anterior.
Cerința 2: Știind că dintre cele n+1 numere citite, un singur număr se poate repeta, se cere să se afișeze acest număr.

Date de intrare
Programul citește de la tastatură numărul n pe prima linie, iar apoi, pe a doua linie n+1 numere naturale, separate prin spații. Pe a treia linie se va afla numărul k.

Date de ieșire
Programul va afișa pe ecran pe prima linie răspunsul pentru cerința 1, iar pe a doua linie răspunsul pentru cerința 2.

Restricții și precizări
1 ≤ n ≤ 470000
Pentru cerința 2, un singur număr se poate repeta de mai multe ori
Atenție la limita de timp și de memorie !
}

type vector = array[1..47000] of Longint;
type frecventa = array[1..47000] of boolean;
var n,k, duplicate, i:Longint;
var v:vector;
var seen:frecventa;
BEGIN
	readln(n);
	duplicate:=0;
	for i:=1 to n do seen[i]:=False;
	for i:=1 to n+1 do 
	begin
		read(v[i]);
		if seen[v[i]] = True then duplicate:=v[i];
		seen[v[i]]:=True;
	end;
	read(k);
	writeln(v[k]);
	writeln(duplicate);
END.