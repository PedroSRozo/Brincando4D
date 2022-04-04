object Form10: TForm10
  Left = 0
  Top = 0
  Caption = 'Cadastros'
  ClientHeight = 301
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 39
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label2: TLabel
    Left = 8
    Top = 84
    Width = 52
    Height = 13
    Caption = 'Refer'#234'ncia'
  end
  object Label3: TLabel
    Left = 8
    Top = 127
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label5: TLabel
    Left = 8
    Top = 7
    Width = 179
    Height = 23
    Caption = 'Cadastro de produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 152
    Top = 39
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label8: TLabel
    Left = 152
    Top = 127
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label9: TLabel
    Left = 152
    Top = 172
    Width = 39
    Height = 13
    Caption = 'Estoque'
  end
  object Button1: TButton
    Left = 8
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 58
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 8
    Top = 101
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 8
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 214
    Width = 97
    Height = 20
    Caption = 'Ativo'
    TabOrder = 4
  end
  object Button2: TButton
    Left = 152
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 11
    OnClick = Button2Click
  end
  object Edit5: TEdit
    Left = 152
    Top = 58
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object Edit7: TEdit
    Left = 152
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object Edit8: TEdit
    Left = 152
    Top = 187
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object CheckBox2: TCheckBox
    Left = 152
    Top = 214
    Width = 97
    Height = 20
    Caption = 'Ativo'
    TabOrder = 10
  end
  object LabeledEdit1: TLabeledEdit
    Left = 8
    Top = 187
    Width = 121
    Height = 21
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'Estoque'
    TabOrder = 3
  end
  object LabeledEdit2: TLabeledEdit
    Left = 152
    Top = 100
    Width = 121
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'Refer'#234'ncia'
    TabOrder = 7
  end
end
