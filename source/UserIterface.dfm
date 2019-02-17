object UserInterfaceForm: TUserInterfaceForm
  Left = 211
  Top = 202
  Width = 696
  Height = 441
  Caption = 'NKS 2007'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 366
    Width = 688
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnChooseRule: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Choose Rule'
      TabOrder = 0
      OnClick = btnChooseRuleClick
    end
    object CreatePointsBtn: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Create Points'
      TabOrder = 1
      OnClick = CreatePointsBtnClick
    end
    object IterateBtn: TButton
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Iterate'
      TabOrder = 2
      OnClick = IterateBtnClick
    end
    object SaveDataBtn: TButton
      Left = 456
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Save Data'
      TabOrder = 3
      OnClick = SaveDataBtnClick
    end
    object SaveImageBtn: TButton
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Save Image'
      TabOrder = 4
      OnClick = SaveImageBtnClick
    end
    object LoadDataBtn: TButton
      Left = 536
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Load Data'
      TabOrder = 5
      OnClick = LoadDataBtnClick
    end
    object IterateCountEdit: TEdit
      Left = 264
      Top = 8
      Width = 75
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Text = '1'
    end
    object UpDown1: TUpDown
      Left = 339
      Top = 8
      Width = 16
      Height = 24
      Associate = IterateCountEdit
      Min = 1
      Max = 10000
      Position = 1
      TabOrder = 7
      Wrap = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 325
    Width = 688
    Height = 41
    Align = alBottom
    TabOrder = 1
    object IterationsLbl: TLabel
      Left = 8
      Top = 8
      Width = 117
      Height = 24
      Caption = 'ITERATIONS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 688
    Height = 325
    ActivePage = tsOneFrame
    Align = alClient
    TabIndex = 0
    TabOrder = 2
    OnChange = PageControl1Change
    object tsOneFrame: TTabSheet
      Caption = 'One Frame'
      object OneFrameImage: TImage
        Left = 129
        Top = 0
        Width = 551
        Height = 297
        Align = alClient
        Stretch = True
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 129
        Height = 297
        Align = alLeft
        TabOrder = 0
        object FrameLabel: TLabel
          Left = 1
          Top = 1
          Width = 127
          Height = 48
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'SLICE:1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object Panel4: TPanel
          Left = 1
          Top = 176
          Width = 127
          Height = 120
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object NextBtn: TButton
            Left = 24
            Top = 16
            Width = 75
            Height = 25
            Caption = 'Next'
            TabOrder = 0
            OnClick = NextBtnClick
          end
          object PrevBtn: TButton
            Left = 24
            Top = 48
            Width = 75
            Height = 25
            Caption = 'Previous'
            TabOrder = 1
            OnClick = PrevBtnClick
          end
          object PlayBtn: TButton
            Left = 24
            Top = 80
            Width = 75
            Height = 25
            Caption = 'Play'
            TabOrder = 2
          end
        end
      end
    end
    object tsAllFrames: TTabSheet
      Caption = 'All Frames'
      ImageIndex = 1
      object AllFramesImage: TImage
        Left = 0
        Top = 0
        Width = 680
        Height = 297
        Align = alClient
        Stretch = True
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'txt'
    Left = 608
    Top = 32
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    InitialDir = 'c:\data'
    Left = 576
    Top = 32
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 608
    Top = 64
  end
end
