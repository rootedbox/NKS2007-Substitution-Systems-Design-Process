object CreatePointsFrm: TCreatePointsFrm
  Left = 181
  Top = 175
  Width = 230
  Height = 297
  Caption = 'Create Points'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RandomBtn: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Random'
    TabOrder = 0
    OnClick = RandomBtnClick
  end
  object HorizontalBtn: TButton
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = 'H Stripes'
    TabOrder = 1
    OnClick = HorizontalBtnClick
  end
  object VerticalBtn: TButton
    Left = 8
    Top = 168
    Width = 75
    Height = 25
    Caption = 'V Stripes'
    TabOrder = 2
    OnClick = VerticalBtnClick
  end
  object FlipZCB: TCheckBox
    Left = 96
    Top = 40
    Width = 121
    Height = 17
    Caption = 'Inverse Each Frame'
    TabOrder = 3
  end
  object CancelBtn: TButton
    Left = 136
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = CancelBtnClick
  end
  object CopyToAllZFrames: TCheckBox
    Left = 96
    Top = 8
    Width = 121
    Height = 17
    Caption = 'Copy To All Frames'
    TabOrder = 5
  end
  object SingleCenterBtn: TButton
    Left = 8
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Single Center'
    TabOrder = 6
    OnClick = SingleCenterBtnClick
  end
  object OneHStripeButton: TButton
    Left = 8
    Top = 72
    Width = 75
    Height = 25
    Caption = '1H Stripe'
    TabOrder = 7
    OnClick = OneHStripeButtonClick
  end
  object Button2: TButton
    Left = 8
    Top = 136
    Width = 75
    Height = 25
    Caption = '1 V Stripe'
    TabOrder = 8
    OnClick = Button2Click
  end
  object btnCheckerd: TButton
    Left = 8
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Checkerd'
    TabOrder = 9
    OnClick = btnCheckerdClick
  end
  object OneVHButn: TButton
    Left = 8
    Top = 200
    Width = 75
    Height = 25
    Caption = 'One VH Line'
    TabOrder = 10
    OnClick = OneVHButnClick
  end
end
