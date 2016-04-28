object frmRelatorios: TfrmRelatorios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relatorios'
  ClientHeight = 200
  ClientWidth = 200
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 200
    Height = 200
    Align = alClient
    TabOrder = 0
    ExplicitTop = -495
    ExplicitWidth = 145
    ExplicitHeight = 695
    object btnPessoas: TButton
      Left = 1
      Top = 1
      Width = 198
      Height = 50
      Align = alTop
      Caption = 'Pessoas'
      TabOrder = 0
      ExplicitWidth = 143
    end
    object btnEquip: TButton
      Left = 1
      Top = 51
      Width = 198
      Height = 50
      Align = alTop
      Caption = 'Equipamentos'
      TabOrder = 1
      ExplicitWidth = 143
    end
    object btnTpLanc: TButton
      Left = 1
      Top = 101
      Width = 198
      Height = 50
      Align = alTop
      Caption = 'Tipos de Lan'#231'amentos'
      TabOrder = 2
      ExplicitWidth = 143
    end
    object Button1: TButton
      Left = 1
      Top = 151
      Width = 198
      Height = 50
      Align = alTop
      Caption = 'Lan'#231'amentos'
      TabOrder = 3
      ExplicitWidth = 143
    end
  end
end
