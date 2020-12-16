// Voi incerca sa implementez in pascal un priority queue
type
    QueueNode=record
        priority, data:Integer; //higher number get higher priority 
    end;
    PriorityQueue=array of QueueNode;

var 
	size,len,i:Integer;
	nodes:PriorityQueue;

procedure createPriorityQueue;
begin
	size:=0;
	len:=0;	
end;

procedure push(priority, data:integer);
var
  i,j:integer;
begin
    if (len + 1 >= size) then
    begin
      if size>0 then
        size  := size * 2
      else
        size  := 4;
      setlength(nodes,size);
    end;
    i := len + 1;
    j := i div 2;
    while (i > 1) and (nodes[j].priority < priority) do
    begin
        nodes[i] := nodes[j];
        i := j;
        j := j div 2;
    end;
    nodes[i].priority := priority;
    nodes[i].data     := data;
    inc(len);
end;
 
function pop:Integer;
var
  i, j, k:integer;
  data:Integer;
begin
    if len=0 then
    	result:=-1;    	
    data := nodes[1].data;
 
    nodes[1] := nodes[len];
 
    dec(len);
 
    i := 1;
    while (i<>len+1) do
    begin
        k := len+1;
        j := 2 * i;
        if (j <= len) and (nodes[j].priority > nodes[k].priority) then
        begin
            k := j;
        end;
        if (j + 1 <= len) and (nodes[j + 1].priority > nodes[k].priority) then
        begin
            k := j + 1;
        end;
        nodes[i] := nodes[k];
        i := k;
    end;
    result:= data;
end;
 
procedure afisQueue;
var i:Integer;
begin
	for i:=1 to size do 
	begin
		writeln('priority: ', nodes[i].priority, ' data: ', nodes[i].data);	
	end;
end;
