unit DimensionsUnit;

interface

uses
  SysUtils,
  Variants,
  Math,
  Classes,
  Contnrs,
  IdGlobal;

const
  SpaceSize = 100;
  StateDimensionSize = 2;
  StateDimensionCount = 3;
  StatePointCount = StateDimensionSize * StateDimensionCount;

type
  TSpace = Class(TObject)
  private
    procedure Initialize;
  public
    Points : array[1..SpaceSize, 1..SpaceSize, 1..SpaceSize] of Byte;
    constructor Create;
    function GetPoint(x,y,z : Integer) : Byte;
    procedure SetPoint(x,y,z, PointValue : Byte);
  end;

  TState = class(TObject)
  private
    function GetText: string;
  published
    property Text : string read GetText;
  public
    Points : array[1..StatePointCount] of Byte;
    StateResult : Integer;
    constructor Create(StateNumber: Integer);
  end;

  TStateList = class(TObjectList)
  private
    FRuleNumberLow : Integer;
    FRuleNumberHigh : Integer;
    procedure CreateStates;
    function GetRuleNumberLow: Longword;
    procedure SetRuleNumberLow(const Value: Longword);
    function GetRuleNumberHigh: Longword;
    procedure SetRuleNumberHigh(const Value: Longword);
    function GetCommaText: string;
  published
    property RuleNumberLow : Longword read GetRuleNumberLow write SetRuleNumberLow;
    property RuleNumberHigh : Longword read GetRuleNumberHigh write SetRuleNumberHigh;
    property CommaText : string read GetCommaText;
  public
    procedure Clear;
    procedure SetResult(StateIndex, ResultValue : Byte);
    function GetResult(StateIndex : Integer): Byte;
    constructor Create;
  end;

  TAutomata = class(TObject)
  private
    FRuleNumber : Integer;
    function GetRuleNumberLow: Longword;
    procedure SetRuleNumberLow(const Value: Longword);
    function GetRuleNumberHigh: Longword;
    procedure SetRuleNumberHigh(const Value: Longword);
  published
    property RuleNumberLow  : Longword read GetRuleNumberLow write SetRuleNumberLow;
    property RuleNumberHigh : Longword read GetRuleNumberHigh write SetRuleNumberHigh;
  public
    Space : TSpace;
    Space2 : TSpace;
    SpaceFree : TSpace;
    Space2Free : TSpace;
    PossibleStates : TStateList;
    Iterations : Integer;
    procedure LoadFromText(TextFile: string);
    procedure SaveToText(TextFile: string);
    procedure Iterate;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TAutomata }

constructor TAutomata.Create;
begin
  FRuleNumber := 0;
  PossibleStates := TStateList.Create;
  inherited;
  Space := TSpace.Create;
  SpaceFree := Space;
  Space2 := TSpace.Create;
  Space2Free := Space2;
end;

destructor TAutomata.Destroy;
begin
  inherited;
  try
    FreeAndNil(SpaceFree);
    FreeAndNil(Space2Free);
    FreeAndNil(PossibleStates);
  except
  end;
end;

function TAutomata.GetRuleNumberLow: Longword;
begin
  Result := PossibleStates.RuleNumberLow;
end;

function TAutomata.GetRuleNumberHigh: Longword;
begin
  Result := PossibleStates.RuleNumberHigh;
end;

procedure TAutomata.SetRuleNumberHigh(const Value: LongWord);
begin
  PossibleStates.RuleNumberHigh := Value;
end;

procedure TAutomata.SetRuleNumberLow(const Value: LongWord);
begin
  PossibleStates.RuleNumberLow := Value;
end;

procedure TAutomata.Iterate;
var
  XIndex,
  YIndex,
  ZIndex : Integer;

  StateIndex : Integer;
begin
  for ZIndex := 1 to SpaceSize do
    for XIndex := 1 to SpaceSize do
      for YIndex := 1 to SpaceSize do
        Space2.SetPoint(XIndex, YIndex, ZIndex, Space.GetPoint(XIndex,YIndex,ZIndex));
        
  for ZIndex := 1 to SpaceSize do
    for XIndex := 1 to SpaceSize do
      for YIndex := 1 to SpaceSize do
      begin
        StateIndex := 0;
        StateIndex := StateIndex or  Space2.GetPoint(XIndex - 1, YIndex,     ZIndex);
        StateIndex := StateIndex or (Space2.GetPoint(XIndex + 1, YIndex,     ZIndex)     * 2);
        StateIndex := StateIndex or (Space2.GetPoint(XIndex,     YIndex - 1, ZIndex)     * 4);
        StateIndex := StateIndex or (Space2.GetPoint(XIndex,     YIndex + 1, ZIndex)     * 8);
        StateIndex := StateIndex or (Space2.GetPoint(XIndex,     YIndex,     ZIndex - 1) * 16);
        StateIndex := StateIndex or (Space2.GetPoint(XIndex,     YIndex,     ZIndex + 1) * 32);

        Space.SetPoint(XIndex, YIndex, ZIndex, PossibleStates.GetResult(StateIndex));
      end;

  Iterations := Iterations + 1;
end;



procedure TAutomata.LoadFromText(TextFile: string);
var
  xSpaceIndex,
  ySpaceIndex,
  zSpaceIndex: Integer;
  StateIndex : Integer;
  Text: TStringList;
  TextIndex : Integer;
begin
  Text := TStringList.Create;
  try
    Text.LoadFromFile(TextFile);

    for StateIndex := 0 to PossibleStates.Count-1 do
      PossibleStates.SetResult(StateIndex,StrToInt(Text.Strings[StateIndex]));

    TextIndex := PossibleStates.Count;

    for zSpaceIndex := 1 to SpaceSize do
      for ySpaceIndex := 1 to SpaceSize do
        for xSpaceIndex := 1 to SpaceSize do
        begin
          Space.Points[xSpaceIndex, ySpaceIndex, zSpaceIndex] := StrToInt(Text.Strings[TextIndex]);
          Inc(TextIndex);
        end;

    Iterations := StrToInt(Text.Strings[TextIndex]);
  finally
    Text.Free;
  end;
end;

procedure TAutomata.SaveToText(TextFile: string);
var
  xSpaceIndex,
  ySpaceIndex,
  zSpaceIndex: Integer;
  StateIndex : Integer;
  Text: TStringList;
  TextIndex : Integer;
begin
  Text := TStringList.Create;
  try
    for StateIndex := 0 to PossibleStates.Count-1 do
      Text.Add(IntToStr(PossibleStates.GetResult(StateIndex)));

    for zSpaceIndex := 1 to SpaceSize do
      for ySpaceIndex := 1 to SpaceSize do
        for xSpaceIndex := 1 to SpaceSize do
        begin
          Text.Add(IntToStr(Space.Points[xSpaceIndex, ySpaceIndex, zSpaceIndex]));
        end;
        
    Text.Add(IntToStr(Iterations));
    Text.SaveToFile(TextFile);
  finally
    Text.Free;
  end;
end;

{ TSpace }
function AdjustCordinate(Cordinate: Integer) : Integer;
  function Constrain(ValueToConstrain, Constraint: Integer): Integer;
  begin
    Result := ValueToConstrain;
    while Result > Constraint do
    begin
      Result := Result - Constraint;
    end;
  end;
begin
  Result := Cordinate;

  if Result < 1 then
  begin
    Result := -Constrain(-Result, SpaceSize);
    Result := SpaceSize + Result;
  end
  else
    Result := Constrain(Result, SpaceSize);
end;

constructor TSpace.Create;
begin
  Initialize;
end;

function TSpace.GetPoint(x, y, z: Integer): Byte;
begin
  x := AdjustCordinate(x);
  y := AdjustCordinate(y);
  z := AdjustCordinate(z);

  Result := Points[x, y, z];
end;

procedure TSpace.Initialize;
var
  xSpaceIndex,
  ySpaceIndex,
  zSpaceIndex : Integer;
begin
  for zSpaceIndex := 1 to SpaceSize do
    for ySpaceIndex := 1 to SpaceSize do
      for xSpaceIndex := 1 to SpaceSize do
        Points[xSpaceIndex, ySpaceIndex, zSpaceIndex] := 0;
end;

procedure TSpace.SetPoint(x, y, z, PointValue: Byte);
begin
  x := AdjustCordinate(x);
  y := AdjustCordinate(y);
  z := AdjustCordinate(z);

  Points[x, y, z] := PointValue;
end;

{ TRuleList }
constructor TStateList.Create;
begin
  FRuleNumberLow := 0;
  FRuleNumberHigh := 0;
  inherited;
  CreateStates;
  OwnsObjects := True;
end;

procedure TStateList.CreateStates;
var
  State: TState;
  StateIndex : Integer;
begin
  for StateIndex := 1 to Trunc(Power(2, StatePointCount)) do
  begin
    State := TState.Create(StateIndex);
    Add(State);
  end;
end;

function TStateList.GetCommaText: string;
var
  StateIndex: Integer;
  StringList : TStringList;
begin
  Result := '';

  StringList := TStringList.Create;
  try
    for StateIndex := 0 to Count - 1 do
      StringList.Add(TState(Items[StateIndex]).Text);

    Result := StringList.CommaText;
  finally
    FreeAndNil(StringList);
  end;
end;

function TStateList.GetResult(StateIndex: Integer): Byte;
begin
  Result := TState(Items[StateIndex]).StateResult;
end;

{ TState }
constructor TState.Create(StateNumber: Integer);
var
  StateIndex: Integer;
begin
  for StateIndex := 1 to StatePointCount do
    if ((StateNumber - 1) and (Trunc(Power(2, StateIndex - 1)))) > 0 then
      Points[StateIndex] := 1
    else
      Points[StateIndex] := 0;
end;

procedure TStateList.SetResult(StateIndex, ResultValue: Byte);
begin
  TState(Items[StateIndex]).StateResult := ResultValue;
end;

procedure TStateList.SetRuleNumberLow(const Value: Longword);
var
  StateIndex: Integer;
 BitString : string;
begin
  if Value > 0 then
  begin
    FRuleNumberLow := Value - 1;
    BitString := IntToBin(Value);

    for StateIndex := 1 to 32 do
    begin
      SetResult(StateIndex - 1, StrToInt(BitString[StateIndex]));
    end;
  end;
end;

procedure TStateList.SetRuleNumberHigh(const Value: Longword);
var
  StateIndex: Integer;
  BitString : string;
begin
  if Value > 0 then
  begin
    FRuleNumberHigh := Value-1;

    BitString := IntToBin(Value);

    for StateIndex := 33 to 64 do
    begin
      SetResult(StateIndex - 1, StrToInt(BitString[StateIndex - 32]));
    end;
  end;
end;

function TState.GetText: string;
var
  PointIndex : Integer;
begin
  Result := '';
  for PointIndex := 1 to StatePointCount do
  begin
    Result := Result + IntToStr(Points[PointIndex]);
  end;
  
  Result := Result + ' =' + IntToStr(StateResult);
end;

function TStateList.GetRuleNumberHigh: Longword;
var
  StateIndex : Integer;
  OrMultiplyer : Integer;
begin
  Result := 1;
  OrMultiplyer := 1;

  for StateIndex := 32 to 63 do
  begin
    if GetResult(StateIndex) > 0 then
      Result := Result or OrMultiplyer;

    OrMultiplyer := OrMultiplyer * 2;
  end;
end;

function TStateList.GetRuleNumberLow: Longword;
var
  StateIndex : Integer;
  OrMultiplyer : Integer;
begin
  Result := 1;

  OrMultiplyer := 1;

  for StateIndex := 0 to 31 do
  begin
    if GetResult(StateIndex) > 0 then
      Result := Result or OrMultiplyer;

    OrMultiplyer := OrMultiplyer * 2;
  end;
end;

procedure TStateList.Clear;
var
  StateIndex : Integer;
begin
  for StateIndex := 0 to 63 do
  begin
    SetResult(StateIndex,0);
  end;
end;

end.
