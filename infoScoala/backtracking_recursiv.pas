program recursiv;
type STIVA = array[1..10] of Integer;
var ST:STIVA;
var nrsol, n:Integer;

procedure Afiseaza(k:integer);
var i:integer;
begin
	nrsol := nrsol + 1;
	Write(nrsol, ': ');
	for i:=1 to k do write(ST[i], ' ');
	writeln;
end;

function Valid(x, k:integer):boolean;
var v:boolean; i:Integer;
begin
	v := True;
	for i:=1 to k-1 do if x = ST[i] then v := False;
	Valid := v;
end;

procedure Back(k:Integer);
var x:Integer;
begin
	if k > n then Afiseaza(k-1)
	else
		for x:=1 to n do if Valid(x, k) then
		begin
			ST[k] := x;
			Back(k+1);
		end;
end;

begin
	readln(n);
	nrsol := 0;
	Back(n);
	if nrsol = 0 then Writeln('Nemtudom solution')
	else Write(nrsol, 'solutions')
end.