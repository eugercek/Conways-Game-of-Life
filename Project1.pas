program Project1;

type
  matrix = array of array of integer;


  procedure display(Arr: matrix);
  var
    i, j: integer;
    ch: char;
  begin
    for i := Low(Arr) to High(Arr) do
    begin
      for j := Low(Arr[i]) to High(Arr[i]) do
      begin
        if Arr[i][j] = 1 then
          ch := 'x'
        else
          ch := ' ';
        Write(ch: 2, ' ');
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

   {
   count_neighbours doesn't checks edges.
   Matrix contains edges and cells.
   }
  function count_neighbours(Arr: matrix; row: integer; col: integer): integer;
  var
    i, j, ret: integer;
  begin
    ret := 0;
    for i := -1 to 1 do
      for j := -1 to 1 do
      begin
        ret += Arr[row + i][col + j];
      end;
    Exit(ret);
  end;

  function selection(Arr: matrix; row: integer; col: integer): integer;
  var
    neighbours: integer;

  begin
    neighbours := count_neighbours(Arr, row, col);
    if neighbours < 2 then
      Exit(0)
    else if neighbours <= 3 then
      Exit(1)
    else
     Exit(0);
  end;

  procedure evolve(Arr: matrix);
  var
    i, j: integer;
    original: matrix;
  begin
    original := copy(Arr, 0, length(Arr));
    for i := Low(Arr) + 1 to High(Arr) - 1 do
      for j := Low(Arr[i]) + 1to High(Arr[i]) - 1 do
        Arr[i][j] := selection(original, i, j);
  end;

var
  arr: matrix;

begin

  Randomize; // It's like random(time(NULL)) in C
  SetLength(arr, 5, 5);
  seed(arr);
  display(arr);
end.

