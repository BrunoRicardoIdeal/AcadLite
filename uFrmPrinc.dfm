object frmPrinc: TfrmPrinc
  Left = 0
  Top = 0
  Caption = 'AcadLite'
  ClientHeight = 695
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 145
    Height = 695
    Align = alLeft
    TabOrder = 0
    object btnPessoas: TButton
      Left = 1
      Top = 1
      Width = 143
      Height = 50
      Align = alTop
      Caption = 'Pessoas'
      TabOrder = 0
      OnClick = btnPessoasClick
    end
    object btnEquip: TButton
      Left = 1
      Top = 51
      Width = 143
      Height = 50
      Align = alTop
      Caption = 'Equipamentos'
      TabOrder = 1
      OnClick = btnEquipClick
    end
    object btnTpLanc: TButton
      Left = 1
      Top = 101
      Width = 143
      Height = 50
      Align = alTop
      Caption = 'Tipos de Lan'#231'amentos'
      TabOrder = 2
      OnClick = btnTpLancClick
      ExplicitLeft = 17
      ExplicitTop = 57
    end
    object Button1: TButton
      Left = 1
      Top = 151
      Width = 143
      Height = 50
      Align = alTop
      Caption = 'Lan'#231'amentos'
      TabOrder = 3
      OnClick = Button1Click
      ExplicitLeft = 0
    end
  end
end
