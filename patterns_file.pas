unit patterns_file;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Project1;

type
  matrix = array of array of integer;

procedure block_seed(Arr: matrix);
procedure bee_hive_seed(Arr: matrix);
procedure blinker_seed(Arr: matrix);
procedure glider_seed(Arr: matrix);



implementation

procedure block_seed(Arr: matrix);
var
  index: integer;
begin
  fill_0_array(Arr);

  index := Trunc((Length(Arr) - 1) / 2);
  // a b
  // c d
  Arr[index][index] := 1; // a
  Arr[index + 1][index] := 1; // b
  Arr[index][index + 1] := 1; // c
  Arr[index + 1][index + 1] := 1; // d
end;

procedure bee_hive_seed(Arr: matrix);
var
  index: integer;
begin
  fill_0_array(Arr);

  index := Trunc((Length(Arr) - 1) / 2);
  // _ a b _
  // c _ _ d
  // _ e f _
  Arr[index][index] := 1; // a
  Arr[index + 1][index] := 1; // b

  Arr[index - 1][index + 1] := 1; // c
  Arr[index + 2][index + 1] := 1; // d

  Arr[index][index + 2] := 1; // e
  Arr[index + 1][index + 2] := 1; // f
end;

procedure blinker_seed(Arr: matrix);
var
  index: integer;
begin
  fill_0_array(Arr);

  index := Trunc((Length(Arr) - 1) / 2);
  // a
  // b
  // c
  Arr[index][index] := 1; // a
  Arr[index][index + 1] := 1; // b
  Arr[index][index + 2] := 1; // c

end;

procedure glider_seed(Arr: matrix);
var
  index: integer;
begin
  fill_0_array(Arr);

  // Start left corner of the secreen
  // !! Different than others
  index := Trunc((Length(Arr) - 1) / 4);
  // _ _ b
  // a _ c
  // _ d e
  Arr[index][index] := 1; // a
  Arr[index + 2][index - 1] := 1; // b
  Arr[index + 2][index] := 1; // c
  Arr[index + 1][index + 1] := 1; // d
  Arr[index + 2][index + 1] := 1; // e
end;

end.



