program Project1;

type
  matrix = array of array of integer;


  procedure display(Arr: matrix);
  var
    i, j: integer;
    ch : char;
  begin
    for i := Low(Arr) to High(Arr) do
    begin
      for j := Low(Arr[i]) to High(Arr[i]) do
      begin
        if Arr[i][j] = 1 then
          ch := 'x'
        else
          ch := ' ';
        write(ch:2 , ' ');
      end;
      WriteLn;
    end;
  end;

  procedure seed(Arr: matrix);
  var
    i, j, temp: integer;
  begin
    for i := Low(Arr) to High(Arr) do
      for j := Low(Arr[i]) to High(Arr[i]) do
      begin
        temp := random(2);
        Arr[i][j] := temp;
      end;

  end;

var
  arr: matrix;

begin
  Randomize; // It's like random(time(NULL)) in C
  SetLength(arr, 5, 3);
  seed(arr);
  display(arr);
end.


