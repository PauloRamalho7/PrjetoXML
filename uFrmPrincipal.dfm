object FrmLeitorXMLs: TFrmLeitorXMLs
  Left = 0
  Top = 0
  Caption = 'Exibir XML'
  ClientHeight = 113
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 40
    Width = 64
    Height = 13
    Caption = 'Nome do XML'
  end
  object Edit1: TEdit
    Left = 24
    Top = 59
    Width = 369
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 399
    Top = 57
    Width = 105
    Height = 25
    Caption = 'Abrir'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object OpenDialog: TOpenDialog
    Left = 400
    Top = 8
  end
end
