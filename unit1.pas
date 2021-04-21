unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  ExtCtrls, Menus, Project1, patterns_file;

type
  matrix = array of array of integer;
  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  arr: matrix;
  matrix_size: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  //   Randomize; // It's like random(time(NULL)) in C
  // TODO Check If Edit1 is integer ?
  clear_display(StringGrid1);
  matrix_size := StrToInt(Edit1.Text) + 1;
  SetLength(arr, matrix_size, matrix_size);

  // Area is fixed, which is 300 x 300 = 900
  // So each square can have row / matrix_size pixel width and height
  // matrix_size is how many square one edge has

  StringGrid1.DefaultColWidth := Trunc(300 / matrix_size);
  StringGrid1.DefaultRowHeight := Trunc(300 / matrix_size);
  StringGrid1.RowCount := matrix_size + 1;
  StringGrid1.ColCount := matrix_size + 1;


  if ComboBox1.ItemIndex = 0 then
    seed(arr)
  else if ComboBox1.ItemIndex = 1 then
    block_seed(arr)
  else if ComboBox1.ItemIndex = 2 then
    bee_hive_seed(arr)
  else if ComboBox1.ItemIndex = 3 then
    blinker_seed(arr)
  else
  glider_seed(arr);
end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
  display(arr, StringGrid1);
  evolve(arr, matrix_size);
end;

end.

