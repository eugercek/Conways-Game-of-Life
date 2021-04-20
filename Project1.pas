unit Project1;

interface   // Public Stuff (Declarations)


uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  ExtCtrls;

type
  matrix = array of array of integer;

procedure display(Arr: matrix; StringGrid: TStringGrid);
procedure seed(Arr: matrix);
function count_neighbours(Arr: matrix; row: integer; col: integer): integer;
function selection(Arr: matrix; row: integer; col: integer): integer;
procedure evolve(Arr: matrix);


implementation

procedure display(Arr: matrix; StringGrid: TStringGrid);
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
      StringGrid.Cells[i, j] := ch;
    end;
  end;
end;

procedure seed(Arr: matrix);
var
  i, j, temp: integer;
begin
  { Again ... Corners are not cells
  Because Edges are not living creature ...
  }
  for i := Low(Arr) + 1 to High(Arr) - 1 do
    for j := Low(Arr[i]) + 1 to High(Arr[i]) - 1 do
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
  Exit(ret - Arr[row][col]); // Added twice
end;

function selection(Arr: matrix; row: integer; col: integer): integer;
var
  neighbours: integer;

begin
  neighbours := count_neighbours(Arr, row, col);
  if Arr[row][col] = 1 then // For live one
    if neighbours < 2 then // Underpopulation
      Exit(0)
    else if neighbours <= 3 then // Lives
      Exit(1)
    else // Overpopulation
      Exit(0)
  else
  if neighbours = 3 then // Reproduction
    Exit(1)
  else// No change
    Exit(0);

end;

procedure evolve(Arr: matrix);
var
  i, j: integer;
  original: matrix;
begin
  SetLength(original, 5, 5);
  for i := Low(Arr) to High(Arr) do
    for j := Low(Arr[i]) to High(Arr[i]) do
      original[i][j] := Arr[i][j];

  for i := Low(Arr) + 1 to High(Arr) - 1 do
    for j := Low(Arr[i]) + 1 to High(Arr[i]) - 1 do
    begin
      Arr[i][j] := selection(original, i, j);
    end;
end;


end.
