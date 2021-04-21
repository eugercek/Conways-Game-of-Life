unit patterns_file;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,  Project1;

type
  matrix = array of array of integer;

procedure block_seed(Arr: matrix);




implementation

procedure block_seed(Arr: matrix);
var
 index: integer;
begin
  // First clear the Arr
  fill_0_array(Arr);

  index := Trunc((Length(Arr) - 1) / 2);
  // a b
  // c d
  Arr[index][index] := 1; // a
  Arr[index + 1][index] := 1; // b
  Arr[index][index + 1] := 1; // c
  Arr[index + 1][index + 1] := 1; // d
end;

end.


