object frmRepMens: TfrmRepMens
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Replicar mensalidade para pr'#243'ximos meses'
  ClientHeight = 329
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 96
    Width = 94
    Height = 13
    Caption = 'N'#250'mero de R'#233'plicas'
  end
  object Label2: TLabel
    Left = 8
    Top = 139
    Width = 106
    Height = 13
    Caption = 'Pr'#243'ximos Vencimentos'
  end
  object lblEdtAluno: TLabeledEdit
    Left = 8
    Top = 24
    Width = 337
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Aluno'
    Enabled = False
    TabOrder = 0
  end
  object lblEdtDtVencIni: TLabeledEdit
    Left = 8
    Top = 67
    Width = 121
    Height = 21
    EditLabel.Width = 111
    EditLabel.Height = 13
    EditLabel.Caption = 'Data Vencimento Inicial'
    Enabled = False
    TabOrder = 1
  end
  object spinEdtNumRep: TSpinEdit
    Left = 8
    Top = 112
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
    OnChange = spinEdtNumRepChange
  end
  object ListBoxProxVenc: TListBox
    Left = 8
    Top = 156
    Width = 121
    Height = 114
    TabStop = False
    Style = lbOwnerDrawFixed
    ItemHeight = 13
    TabOrder = 3
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 288
    Width = 400
    Height = 41
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 276
    object btnGerar: TButton
      Left = 324
      Top = 1
      Width = 75
      Height = 39
      Action = acGerar
      Align = alRight
      TabOrder = 0
    end
    object btnCancelar: TButton
      Left = 249
      Top = 1
      Width = 75
      Height = 39
      Action = acCancelar
      Align = alRight
      TabOrder = 1
    end
  end
  object lblEdtValor: TLabeledEdit
    Left = 160
    Top = 67
    Width = 121
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor'
    Enabled = False
    TabOrder = 5
  end
  object pgReplicar: TProgressBar
    Left = 0
    Top = 271
    Width = 400
    Height = 17
    Align = alBottom
    TabOrder = 6
    ExplicitLeft = 256
    ExplicitTop = 272
    ExplicitWidth = 150
  end
  object ActionList: TActionList
    Left = 192
    Top = 168
    object acGerar: TAction
      Caption = 'Gerar'
      OnExecute = acGerarExecute
    end
    object acCancelar: TAction
      Caption = 'Cancelar'
      OnExecute = acCancelarExecute
    end
  end
  object qryInsere: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      
        'INSERT INTO MENSALIDADES(DESCRICAO,COD_ALUNO,DT_VENCIMENTO,VALOR' +
        ')'
      '         VALUES(:DESCRICAO,:COD_ALUNO,:DT_VENCIMENTO,:VALOR)')
    Left = 248
    Top = 96
    ParamData = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COD_ALUNO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT_VENCIMENTO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end>
  end
end
