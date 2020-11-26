program perm;
uses dos;
type vector = array[1..10] of Integer;
var
	p: vector;
	is_last: boolean;
	n: integer;
	h1,h2,h3,m1,m2,m3,s1,s2,s3,ss1,ss2,ss3:word;

{Procedura de initializare a vectorului care il permutam}
procedure init;
var i: integer;
begin
n := 0;
readln(n);
for i := 1 to n do read(p[i]);
end;

{Generarea noii permutari}
procedure next;
var i, j, k, aux: integer;
begin
is_last := true;
i := n - 1;
while i > 0 do
	begin
	if p[i] < p[i + 1] then
		begin
		is_last := false;
		break;
		end;
	i := i - 1;
	end;
 
if not is_last then
	begin
	j := i + 1;
	k := n;
	while j < k do
		begin
		aux := p[j];
		p[j] := p[k];
		p[k] := aux;
		j := j + 1;
		k := k - 1;
		end;
 
	j := n;
	while p[j] > p[i] do j := j - 1;
	j := j + 1;

	aux := p[i];
	p[i] := p[j];
	p[j] := aux;
	end;
end;

{Procedura de afisare a permutarii}
procedure print;
var i: integer;
begin
for i := 1 to n do write(p[i], ' ');
writeln;
end;
 
{Program principal}
BEGIN
init;
getTime(h1,m1,s1,ss1);
repeat
	print;
	next;
until is_last;
getTime(h2,m2,s2,ss2);
if ss2>=ss1 then ss3:=ss2-ss1
else
	begin
		s2:=s2-1;
		ss3:=100+ss2-ss1;
	end;
if s2>=s1 then s3:=s2-s1
else
	begin
		m2:=m2-1;
		s3:=60+s2-s1;
	end;
if m2>=m1 then m3:=m2-m1
else
	begin
		h2:=h2-1;
		m3:=60+m2-m1;
	end;
h3:=h2-h1;
write('MINUTE:', m3, ' ');
write('SECUNDE:', s3, ' ');
write('MILISECUNDE:', ss3, ' ');
END.