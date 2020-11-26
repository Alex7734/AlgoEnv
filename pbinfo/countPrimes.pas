var n, x, count:integer;
    input, output:text;
    
function is_prim(x:integer):boolean;
var i:integer;
    sem:boolean;
begin
    if (x = 0) or (x = 1) then is_prim := false
    else if (x <> 2) and (x mod 2 = 0) then is_prim := false else
    begin
        sem:=true;
        i:=3;
        while i*i<=x do
            begin
                if x mod i = 0 then sem:=false;
                i := i + 2;
            end;
        if sem then is_prim:=true else is_prim:=false;
    end;
end;

begin
    assign(input, '2prim.in');
    reset(input);
    assign(output, '2prim.out');
    rewrite(output);
    read(input,n);
    count := 0;
    while not seekeof(input) do 
    begin
        read(input, x);
        if is_prim(x mod 100) then inc(count);
    end;
    write(output, count);
    close(input);
    close(output);
end.