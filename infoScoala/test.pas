type vector = array[1..20] of integer;
var v:vector;
	n,i:integer;

procedure citire(var n:integer);
var i:integer;
begin
	for i:=1 to n do read(v[i]);
end;

procedure schimbare(var v:vector; n:integer);
var i,aux:integer;
begin
	for i:=1 to n-1 do
	begin
		aux := v[i];
		v[i] := v[i+1];
		v[i+1] := aux;
	end;
end;

procedure del(var v:vector; var n:integer);
var i,j:integer;
begin
	schimbare(v, n);
	i:=1;
	while i<n div 2 do
	begin
		for j:=i to n do
		begin
			v[j]:=v[j+1];
		end;
		n:=n-1;
		i:=i+2;
	end;
end;

begin
	read(n);
	citire(n);
	schimbare(v, n);
	for i:=1 to n do write(v[i], ' ');
	writeln;
	del(v, n);
	for i:=1 to n do write(v[i], ' ');
end.