object frmRelatorios: TfrmRelatorios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relatorios'
  ClientHeight = 252
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
    Height = 252
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 200
    object btnPessoas: TButton
      Left = 1
      Top = 1
      Width = 198
      Height = 50
      Align = alTop
      Caption = 'Pessoas'
      TabOrder = 0
      OnClick = btnPessoasClick
    end
    object btnEquip: TButton
      Left = 1
      Top = 51
      Width = 198
      Height = 50
      Align = alTop
      Caption = 'Equipamentos'
      TabOrder = 1
      OnClick = btnEquipClick
    end
    object btnTpLanc: TButton
      Left = 1
      Top = 101
      Width = 198
      Height = 50
      Align = alTop
      Caption = 'Tipos de Lan'#231'amentos'
      TabOrder = 2
      OnClick = btnTpLancClick
    end
    object btnLancamentos: TButton
      Left = 1
      Top = 151
      Width = 198
      Height = 50
      Align = alTop
      Caption = 'Lan'#231'amentos'
      TabOrder = 3
      OnClick = btnLancamentosClick
    end
    object btnMens: TButton
      Left = 1
      Top = 201
      Width = 198
      Height = 50
      Align = alTop
      Caption = 'Mensalidades'
      TabOrder = 4
      OnClick = btnMensClick
      ExplicitLeft = 0
      ExplicitTop = 223
    end
  end
end
