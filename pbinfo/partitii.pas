{
Se dă un număr natural n. Determinaţi, în ordine lexicografică, 
toate modalităţile de a-l scrie pe n ca sumă de numere naturale.
}

type vector = array[1..40] of Integer; 
var n:integer;
var x:vector;
var input,output:text;

procedure afisare(k:integer);
var i:integer;
begin
	for i:=1 to k do write(output, x[i], ' ');
	writeln(output);
end;

procedure back(k,suma:integer);
var i:integer;
begin
	for i:= x[k-1] to n do 
	begin
		x[k] := i;
		suma := suma + x[k];
		if (suma <= n) then
			if (suma = n) then afisare(k)
			else back(k+1, suma);
		suma := suma - x[k];
	end;
end;

procedure files(var input, output:text);
begin
	assign(input, 'partitiinumar.in'); reset(input);
	assign(output, 'partitiinumar.out'); rewrite(output);
end;

begin
	files(input, output);
	read(input, n);
	x[0] := 1;
	back(1, 0);
	close(input);
	close(output);
end.
