    unit CreatePoints;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  DimensionsUnit;

type
  TCreatePointsFrm = class(TForm)
    RandomBtn: TButton;
    HorizontalBtn: TButton;
    VerticalBtn: TButton;
    FlipZCB: TCheckBox;
    CancelBtn: TButton;
    CopyToAllZFrames: TCheckBox;
    SingleCenterBtn: TButton;
    OneHStripeButton: TButton;
    Button2: TButton;
    btnCheckerd: TButton;
    OneVHButn: TButton;
    procedure RandomBtnClick(Sender: TObject);
    procedure SingleCenterBtnClick(Sender: TObject);
    procedure OneHStripeButtonClick(Sender: TObject);
    procedure HorizontalBtnClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure VerticalBtnClick(Sender: TObject);
    procedure btnCheckerdClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure OneVHButnClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Clear;
    procedure RunChecks;
    procedure CopyToAllFrames;
    procedure InverseEachFrame;
  end;

var
  CreatePointsFrm: TCreatePointsFrm;

implementation

uses
  UserIterface;

{$R *.dfm}

procedure TCreatePointsFrm.RandomBtnClick(Sender: TObject);
var
  ySpaceIndex: Integer;
begin
  Clear;
  for ySpaceIndex := 1 to 300 do
    UserInterfaceForm.Automata.Space.Points[Random(SpaceSize - 1) + 1, Random(SpaceSize - 1) + 1,1] := 1;

  RunChecks;
  Close;
end;

procedure TCreatePointsFrm.CopyToAllFrames;
var
  xSpaceIndex,
  ySpaceIndex,
  zSpaceIndex: Integer;
begin
  for zSpaceIndex := 2 to SpaceSize do
    for ySpaceIndex := 1 to SpaceSize do
      for xSpaceIndex := 1 to SpaceSize do
        UserInterfaceForm.Automata.Space.Points[xSpaceIndex, ySpaceIndex,zSpaceIndex] := UserInterfaceForm.Automata.Space.Points[xSpaceIndex, ySpaceIndex,1];
end;

procedure TCreatePointsFrm.InverseEachFrame;
var
  Flip: Boolean;
  Point: Integer;
  xSpaceIndex,
  ySpaceIndex,
  zSpaceIndex: Integer;
begin
  Flip := True;
  for zSpaceIndex := 2 to SpaceSize do
  begin
    for ySpaceIndex := 1 to SpaceSize do
      for xSpaceIndex := 1 to SpaceSize do
      begin
        Point := UserInterfaceForm.Automata.Space.Points[xSpaceIndex, ySpaceIndex,zSpaceIndex];

        if Flip then
          if Point = 0 then
            Point := 1
          else
            Point := 0;

        UserInterfaceForm.Automata.Space.Points[xSpaceIndex, ySpaceIndex,zSpaceIndex] := Point;
      end;
    Flip := not Flip;
  end;
end;

procedure TCreatePointsFrm.RunChecks;
begin
  if CopyToAllZFrames.Checked then
    CopyToAllFrames;

  if FlipZCB.Checked then
    InverseEachFrame;

  UserInterfaceForm.Automata.Iterations := 0;
end;

procedure TCreatePointsFrm.SingleCenterBtnClick(Sender: TObject);
begin
  Clear;
  UserInterfaceForm.Automata.Space.Points[1,SpaceSize div 2,1] := 1;
  RunChecks;
  Close;
end;

procedure TCreatePointsFrm.Clear;
var
  xSpaceIndex,
  ySpaceIndex,
  zSpaceIndex: Integer;
begin
  for zSpaceIndex := 1 to SpaceSize do
    for ySpaceIndex := 1 to SpaceSize do
      for xSpaceIndex := 1 to SpaceSize do
        UserInterfaceForm.Automata.Space.Points[xSpaceIndex, ySpaceIndex,zSpaceIndex] := 0;
end;

procedure TCreatePointsFrm.OneHStripeButtonClick(Sender: TObject);
var
  xSpaceIndex: Integer;
begin
  Clear;

  for xSpaceIndex := 1 to SpaceSize do
    UserInterfaceForm.Automata.Space.Points[xSpaceIndex, 1, 1] := 1;

  RunChecks;
  Close;
end;

procedure TCreatePointsFrm.HorizontalBtnClick(Sender: TObject);
var
  xSpaceIndex: Integer;
  ySpaceIndex: Integer;
begin
  Clear;

  for ySpaceIndex  := 1 to SpaceSize do
    if ySpaceIndex mod 2 = 0 then
      for xSpaceIndex := 1 to SpaceSize do
        UserInterfaceForm.Automata.Space.Points[xSpaceIndex, ySpaceIndex, 1] := 1;

  RunChecks;
  Close;
end;

procedure TCreatePointsFrm.Button2Click(Sender: TObject);
var
  ySpaceIndex: Integer;
begin
  Clear;

  for ySpaceIndex := 1 to SpaceSize do
    UserInterfaceForm.Automata.Space.Points[1, ySpaceIndex, 1] := 1;

  RunChecks;
  Close;
end;

procedure TCreatePointsFrm.VerticalBtnClick(Sender: TObject);
var
  xSpaceIndex: Integer;
  ySpaceIndex: Integer;
begin
  Clear;

  for xSpaceIndex  := 1 to SpaceSize do
    if xSpaceIndex mod 2 = 0 then
      for ySpaceIndex := 1 to SpaceSize do
        UserInterfaceForm.Automata.Space.Points[xSpaceIndex, ySpaceIndex, 1] := 1;

  RunChecks;
  Close;
end;

procedure TCreatePointsFrm.btnCheckerdClick(Sender: TObject);
var
  xSpaceIndex: Integer;
  ySpaceIndex: Integer;
begin
  Clear;

  for xSpaceIndex := 1 to SpaceSize do
    for ySpaceIndex := 1 to SpaceSize do
     if (xSpaceIndex + ySpaceIndex) mod 2 = 0 then
        UserInterfaceForm.Automata.Space.Points[xSpaceIndex, ySpaceIndex, 1] := 1;

  RunChecks;
  Close;
end;

procedure TCreatePointsFrm.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCreatePointsFrm.OneVHButnClick(Sender: TObject);
var
  xSpaceIndex: Integer;
  ySpaceIndex: Integer;
begin
  Clear;

  for xSpaceIndex := 1 to SpaceSize do
    UserInterfaceForm.Automata.Space.Points[xSpaceIndex, 1, 1] := 1;

  for ySpaceIndex := 1 to SpaceSize do
    UserInterfaceForm.Automata.Space.Points[1, ySpaceIndex, 1] := 1;

  RunChecks;
  Close;
end;

end.
