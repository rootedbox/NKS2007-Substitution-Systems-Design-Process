object RuleConfigForm: TRuleConfigForm
  Left = 241
  Top = 184
  Width = 288
  Height = 292
  Caption = 'RULE CONFIG'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 67
    Height = 24
    Caption = 'STATE:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 168
    Width = 79
    Height = 24
    Caption = 'Rule Low'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 144
    Top = 168
    Width = 84
    Height = 24
    Caption = 'Rule High'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object CB1: TCheckBox
    Left = 56
    Top = 64
    Width = 33
    Height = 25
    Caption = 'x-1'
    TabOrder = 0
    OnClick = CB3Click
  end
  object CB2: TCheckBox
    Left = 104
    Top = 64
    Width = 33
    Height = 25
    Caption = 'x+1'
    TabOrder = 1
    OnClick = CB3Click
  end
  object CB3: TCheckBox
    Left = 80
    Top = 40
    Width = 41
    Height = 25
    Caption = 'y-1'
    TabOrder = 2
    OnClick = CB3Click
  end
  object LowRuleEdit: TEdit
    Left = 16
    Top = 192
    Width = 121
    Height = 21
    TabOrder = 3
    Visible = False
    OnChange = LowRuleEditChange
  end
  object CB4: TCheckBox
    Left = 80
    Top = 88
    Width = 33
    Height = 25
    Caption = 'y+1'
    TabOrder = 4
    OnClick = CB3Click
  end
  object CB5: TCheckBox
    Left = 16
    Top = 64
    Width = 33
    Height = 25
    Caption = 'z-1'
    TabOrder = 5
    OnClick = CB3Click
  end
  object CB6: TCheckBox
    Left = 144
    Top = 64
    Width = 33
    Height = 25
    Caption = 'z+1'
    TabOrder = 6
    OnClick = CB3Click
  end
  object RuleHighEdit: TEdit
    Left = 144
    Top = 192
    Width = 121
    Height = 21
    TabOrder = 7
    Visible = False
    OnChange = RuleHighEditChange
  end
  object OutPutCB: TCheckBox
    Left = 160
    Top = 104
    Width = 105
    Height = 17
    Caption = 'OUTPUT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = OutPutCBClick
  end
  object NextBtn: TButton
    Left = 192
    Top = 136
    Width = 75
    Height = 25
    Caption = 'NEXT'
    TabOrder = 9
  end
  object DisplayAllBtn: TButton
    Left = 112
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Display All'
    TabOrder = 10
    Visible = False
  end
  object CloseBTN: TButton
    Left = 192
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 11
    OnClick = CloseBTNClick
  end
  object ClearBtn: TButton
    Left = 16
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 12
    OnClick = ClearBtnClick
  end
end
