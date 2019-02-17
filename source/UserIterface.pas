unit UserIterface;

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
  DimensionsUnit,
  DimensionGraphicsUnit,
  StdCtrls,
  ComCtrls,
  ExtCtrls,
  RuleConfig,
  CreatePoints, ExtDlgs;

type
  TUserInterfaceForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    tsOneFrame: TTabSheet;
    tsAllFrames: TTabSheet;
    btnChooseRule: TButton;
    CreatePointsBtn: TButton;
    IterateBtn: TButton;
    IterationsLbl: TLabel;
    SaveDataBtn: TButton;
    SaveImageBtn: TButton;
    LoadDataBtn: TButton;
    IterateCountEdit: TEdit;
    UpDown1: TUpDown;
    OneFrameImage: TImage;
    AllFramesImage: TImage;
    Panel3: TPanel;
    FrameLabel: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel4: TPanel;
    NextBtn: TButton;
    PrevBtn: TButton;
    PlayBtn: TButton;
    SavePictureDialog1: TSavePictureDialog;
//    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnChooseRuleClick(Sender: TObject);
    procedure CreatePointsBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure IterateBtnClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SaveDataBtnClick(Sender: TObject);
    procedure LoadDataBtnClick(Sender: TObject);
    procedure SaveImageBtnClick(Sender: TObject);
  private
    fZSpaceIndex: Integer;
    function GetZSpaceIndex: Integer;
    procedure SetZSpaceIndex(const Value: Integer);
    procedure RefreshViews;
    { Private declarations }
  public
    Automata : TAutomata;
    property ZSpaceIndex : Integer read GetZSpaceIndex write SetZSpaceIndex;
  end;

var
  UserInterfaceForm: TUserInterfaceForm;

implementation

{$R *.dfm}

procedure TUserInterfaceForm.FormCreate(Sender: TObject);
begin
  Automata := TAutomata.Create;
  ZSpaceIndex := 1;
  UpDown1.Position := 1;
end;

procedure TUserInterfaceForm.FormDestroy(Sender: TObject);
begin
  Automata.Free;
end;

procedure TUserInterfaceForm.btnChooseRuleClick(Sender: TObject);
begin
  RuleConfigForm.ShowModal;
  ZSpaceIndex := 1;
end;

procedure TUserInterfaceForm.CreatePointsBtnClick(Sender: TObject);
begin
  CreatePointsFrm.ShowModal;
  ZSpaceIndex := 1;
end;

function TUserInterfaceForm.GetZSpaceIndex: Integer;
begin
  Result := FZSpaceIndex;
end;

procedure TUserInterfaceForm.SetZSpaceIndex(const Value: Integer);
var
  NewVal : Integer;
begin
  NewVal := Value;

  if (NewVal < 1) then
    NewVal := SpaceSize;

  if (NewVal > SpaceSize) then
    NewVal := 1;

  FZSpaceIndex := NewVal;
  RefreshViews;
end;

procedure TUserInterfaceForm.RefreshViews;
begin
  if PageControl1.ActivePageIndex = 0 then
  begin
    OneFrameImage.Picture.Assign(XYSpaceToBitmap(Automata.Space, ZSpaceIndex));
    FrameLabel.Caption := 'SLICE:' + IntToStr(ZSpaceIndex);
  end
  else
  begin
    AllFramesImage.Picture.Assign(SpaceToBitmap(Automata.Space));
    IterationsLbl.Caption := 'Iterations:' + IntToStr(Automata.Iterations);
  end;
end;

procedure TUserInterfaceForm.NextBtnClick(Sender: TObject);
begin
  ZSpaceIndex := ZSpaceIndex + 1;
end;

procedure TUserInterfaceForm.PrevBtnClick(Sender: TObject);
begin
  ZSpaceIndex := ZSpaceIndex - 1;
end;

procedure TUserInterfaceForm.IterateBtnClick(Sender: TObject);
var
  IterateCount : Integer;
begin
  for IterateCount := 1 to UpDown1.Position do
  begin
    Automata.Iterate;
    Application.ProcessMessages;
    IterationsLbl.Caption := 'Iterations:' + IntToStr(Automata.Iterations);
  end;

  ZSpaceIndex := 1;
end;

procedure TUserInterfaceForm.PageControl1Change(Sender: TObject);
begin
  RefreshViews;
end;

procedure TUserInterfaceForm.SaveDataBtnClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    Automata.SaveToText(SaveDialog1.FileName);
  end;
end;

procedure TUserInterfaceForm.LoadDataBtnClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Automata.LoadFromText(OpenDialog1.FileName);
    ZSpaceIndex := 1;
  end;
end;

procedure TUserInterfaceForm.SaveImageBtnClick(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
  begin
    OneFrameImage.Picture.SaveToFile(SavePictureDialog1.FileName);
  end;
end;

end.
