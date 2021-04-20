unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  ExtCtrls, Project1;

type
   matrix = array of array of integer;
  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
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

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin

  Randomize; // It's like random(time(NULL)) in C
  SetLength(arr, 5, 5);
  seed(arr);

  StringGrid1.Cells[3, 3] := 'x';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  display(arr, StringGrid1);
  evolve(arr);
end;

end.

