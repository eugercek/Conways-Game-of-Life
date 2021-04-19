program Project1;

type
  matrix = array of array of char;


procedure  seed(Arr: matrix);
var
  i, j, temp: Integer;
begin
  for i:=Low(Arr) to High(Arr) do
    for j:=Low(Arr[i]) to High(Arr[i]) do
        begin
             temp := random(2);
             if temp = 0 then
              Arr[i][j] := ' '
             else
              Arr[i][j] := 'x'
        end;

end;

var
   arr : matrix;

begin
     Randomize; // It's like random(time(NULL)) in C
     SetLength(arr, 5, 3);
     seed(arr);

end.

