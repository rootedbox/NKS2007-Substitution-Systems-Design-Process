unit RuleConfig;

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
  StdCtrls;

type
  TRuleConfigForm = class(TForm)
    CB1: TCheckBox;
    CB2: TCheckBox;
    CB3: TCheckBox;
    Label1: TLabel;
    LowRuleEdit: TEdit;
    CB4: TCheckBox;
    CB5: TCheckBox;
    CB6: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    RuleHighEdit: TEdit;
    OutPutCB: TCheckBox;
    NextBtn: TButton;
    DisplayAllBtn: TButton;
    CloseBTN: TButton;
    ClearBtn: TButton;
    procedure CB3Click(Sender: TObject);
    procedure OutPutCBClick(Sender: TObject);
    procedure CloseBTNClick(Sender: TObject);
    procedure LowRuleEditChange(Sender: TObject);
    procedure RuleHighEditChange(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GetStateOut;
  end;

var
  RuleConfigForm: TRuleConfigForm;

implementation

uses
  UserIterface;
{$R *.dfm}

{ TForm2 }

procedure TRuleConfigForm.GetStateOut;
var
  StateIndex : Integer;
begin
  StateIndex := 0;

  if CB1.Checked then StateIndex := StateIndex or 1;
  if CB2.Checked then StateIndex := StateIndex or 2;
  if CB3.Checked then StateIndex := StateIndex or 4;
  if CB4.Checked then StateIndex := StateIndex or 8;
  if CB5.Checked then StateIndex := StateIndex or 16;
  if CB6.Checked then StateIndex := StateIndex or 32;

  OutPutCB.Checked := (UserInterfaceForm.Automata.PossibleStates.GetResult(StateIndex) = 1);
end;

procedure TRuleConfigForm.CB3Click(Sender: TObject);
begin
  GetStateOut;
end;

procedure TRuleConfigForm.OutPutCBClick(Sender: TObject);
var
  StateIndex : Integer;
  Value : Integer;
begin
  StateIndex := 0;

  if CB1.Checked then StateIndex := StateIndex or 1;
  if CB2.Checked then StateIndex := StateIndex or 2;
  if CB3.Checked then StateIndex := StateIndex or 4;
  if CB4.Checked then StateIndex := StateIndex or 8;
  if CB5.Checked then StateIndex := StateIndex or 16;
  if CB6.Checked then StateIndex := StateIndex or 32;

  if OutPutCB.Checked then
    Value := 1
  else
    Value := 0;

  UserInterfaceForm.Automata.PossibleStates.SetResult(StateIndex, Value);
  //LowRuleEdit.Text := IntToStr(UserInterfaceForm.Automata.PossibleStates.RuleNumberLow);
  //RuleHighEdit.Text := IntToStr(UserInterfaceForm.Automata.PossibleStates.RuleNumberHigh);
end;

procedure TRuleConfigForm.CloseBTNClick(Sender: TObject);
begin
  Close;
end;

procedure TRuleConfigForm.LowRuleEditChange(Sender: TObject);
begin
  try
    //UserInterfaceForm.Automata.PossibleStates.RuleNumberLow := StrToInt(LowRuleEdit.Text);
    //CB3Click(nil);
  except
  end;
end;

procedure TRuleConfigForm.RuleHighEditChange(Sender: TObject);
begin
  try
    //UserInterfaceForm.Automata.PossibleStates.RuleNumberHigh := StrToInt(RuleHighEdit.Text);
    //CB3Click(nil);
  except
  end;
end;

procedure TRuleConfigForm.ClearBtnClick(Sender: TObject);
begin
  UserInterfaceForm.Automata.PossibleStates.Clear;
  CB1.Checked := False;
  CB2.Checked := False;
  CB3.Checked := False;
  CB4.Checked := False;
  CB5.Checked := False;
  CB6.Checked := False;
end;

end.
