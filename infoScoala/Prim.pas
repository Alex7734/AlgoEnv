type matrice = array[1..10, 1..10] of Integer;
type hash_key = array[1..10] of longint;
type hash_dad = array[1..10] of Integer;
type hash_simp = array[1..10] of Boolean;

const n = 5;
{
const n = 5
0 2 0 7 0
2 0 3 8 5
0 3 0 0 7
7 8 0 0 9
0 5 7 9 0
}
const minim = 9999;

var a:matrice;
var input: text;
var hash_cheie: hash_key;
var hash_seen: hash_simp;
var hash_tata: hash_dad;

procedure files(var input:text);
begin
  assign(input, 'prim.in'); reset(input);
end;

procedure cit;
var i,j:Integer;
begin
  for i:=1 to n do
    for j:=1 to n do 
      read(input, a[i,j]);
end;

procedure init;
var i:integer;
begin
	for i:=1 to n do 
	begin
		hash_cheie[i] := minim;
		hash_tata[i] := 0; 
		hash_seen[i] := False;
	end;
	hash_tata[1] := -1;
	hash_cheie[1] := 0;
end;

procedure print;
var i,sum:integer;
begin
	writeln('MUCHIE		COST');
	writeln('--------------------');
	sum := 0;
	for i:=2 to n do 
	begin
		sum := sum + a[i, hash_tata[i]];
		writeln(hash_tata[i], '-', i, '		', a[i, hash_tata[i]]);
	end;
	writeln();
	writeln('SUMA COSTURILOR:', sum);
end;


function cheie_minima:Integer;
var i, min, min_index:integer;
begin
	min := minim;
	for i:=1 to n do 
	begin
		if (hash_cheie[i]<min) and (hash_seen[i] = False) then
		begin
			min:= hash_cheie[i];
			min_index := i;
		end;
	end;
	cheie_minima := min_index;
end;

procedure main;
var i,j,u:integer;
begin
	files(input);
	cit;
	init;
	for i:=1 to n do
	begin
		u := cheie_minima;
		hash_seen[i]:=True;
		for j:=1 to n do 
		begin
			if (a[u, j] > 0) and (hash_seen[j] = False) and (hash_cheie[j] > a[u, j]) then 
			begin
				hash_cheie[j] := a[u, j];
				hash_tata[j] := u;
			end;
		end;
	end;
	print;
end;

begin
	main;
end.