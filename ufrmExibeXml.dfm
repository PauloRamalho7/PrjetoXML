object FrmExibeXML: TFrmExibeXML
  Left = 0
  Top = 0
  Caption = 'Exibe XML'
  ClientHeight = 617
  ClientWidth = 831
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 291
    Top = 48
    Width = 67
    Height = 13
    Caption = 'Dados do XML'
  end
  object TreeView1: TTreeView
    Left = 8
    Top = 16
    Width = 273
    Height = 593
    Indent = 19
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 287
    Top = 67
    Width = 146
    Height = 110
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 287
    Top = 584
    Width = 146
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 291
    Top = 17
    Width = 142
    Height = 25
    Caption = 'Gerar TXT'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object mmSaida: TMemo
    Left = 439
    Top = 18
    Width = 384
    Height = 591
    Lines.Strings = (
      'Saida TXT')
    TabOrder = 4
  end
  object XMLDocument: TXMLDocument
    Left = 304
    Top = 192
  end
end
