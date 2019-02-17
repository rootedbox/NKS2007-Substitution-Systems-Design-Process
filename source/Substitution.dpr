program Substitution;

uses
  Forms,
  UserIterface in 'UserIterface.pas' {UserInterfaceForm},
  DimensionsUnit in 'DimensionsUnit.pas',
  DimensionGraphicsUnit in 'DimensionGraphicsUnit.pas',
  RuleConfig in 'RuleConfig.pas' {RuleConfigForm},
  CreatePoints in 'CreatePoints.pas' {CreatePointsFrm},
  MathematicaUtils in 'MathematicaUtils.pas',
  AutomataRewriteUnit in 'AutomataRewriteUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TUserInterfaceForm, UserInterfaceForm);
  Application.CreateForm(TRuleConfigForm, RuleConfigForm);
  Application.CreateForm(TCreatePointsFrm, CreatePointsFrm);
  Application.Run;
end.
