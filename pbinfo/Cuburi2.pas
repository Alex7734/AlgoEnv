type vector = array[1..1000] of integer;
var n, i, x, nr:integer;
var stiva:vector;

begin
	readln(nr);
	n := 0; {init stiva}
	for i:=1 to nr do 
	begin
		read(x);
		if n>0 then while stiva[n]<x do 
		begin
			stiva[n] := 0;
			dec(n);
		end;
		stiva[n+1] := x;
		inc(n);	
	end;
	writeln(n);
	for i:=1 to n do write(stiva[i]);
end.