object frmPlanos: TfrmPlanos
  Left = 0
  Top = 0
  Caption = 'Planos'
  ClientHeight = 611
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 164
    Top = 371
    Width = 37
    Height = 13
    Caption = 'Dt. Cad'
  end
  object lblDesc: TLabel
    Left = 30
    Top = 398
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lblCodpes: TLabel
    Left = 43
    Top = 371
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label1: TLabel
    Left = 16
    Top = 424
    Width = 60
    Height = 13
    Caption = 'N'#186' de Meses'
  end
  object Label2: TLabel
    Left = 16
    Top = 452
    Width = 60
    Height = 13
    Caption = 'Valor Mensal'
  end
  object Label3: TLabel
    Left = 25
    Top = 479
    Width = 51
    Height = 13
    Caption = 'Valor Total'
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 635
    Height = 113
    Align = alTop
    Caption = 'Pesquisa'
    TabOrder = 0
    object lblEdtCod: TLabeledEdit
      Left = 56
      Top = 28
      Width = 73
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'C'#243'digo'
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 0
    end
    object lblEdtDesc: TLabeledEdit
      Left = 56
      Top = 55
      Width = 321
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Descri'#231#227'o'
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object btnPsq: TButton
      Left = 54
      Top = 82
      Width = 75
      Height = 25
      Action = acPesquisar
      TabOrder = 2
    end
  end
  object grdPlanos: TDBGrid
    Left = 0
    Top = 113
    Width = 635
    Height = 240
    Align = alTop
    DataSource = dsPlanos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 271
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_cadastro'
        Title.Caption = 'Dt.Cadastro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'num_meses'
        Title.Caption = 'N'#186' Meses'
        Visible = True
      end>
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 570
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 7
    object btnNovo: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 39
      Action = acNovo
      Align = alLeft
      TabOrder = 0
    end
    object btnExcluir: TButton
      Left = 301
      Top = 1
      Width = 75
      Height = 39
      Action = acExcluir
      Align = alLeft
      TabOrder = 4
    end
    object btnCancelar: TButton
      Left = 226
      Top = 1
      Width = 75
      Height = 39
      Action = acCancelar
      Align = alLeft
      TabOrder = 3
    end
    object btnEditar: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 39
      Action = acEditar
      Align = alLeft
      TabOrder = 1
    end
    object btnGravar: TButton
      Left = 151
      Top = 1
      Width = 75
      Height = 39
      Action = acGravar
      Align = alLeft
      TabOrder = 2
    end
  end
  object edtCodigo: TDBEdit
    Left = 81
    Top = 368
    Width = 73
    Height = 21
    DataField = 'ID'
    DataSource = dsPlanos
    Enabled = False
    TabOrder = 2
  end
  object edtCadastro: TDBEdit
    Left = 210
    Top = 368
    Width = 127
    Height = 21
    DataField = 'dt_cadastro'
    DataSource = dsPlanos
    Enabled = False
    TabOrder = 3
  end
  object edtDescricao: TDBEdit
    Left = 81
    Top = 395
    Width = 472
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dsPlanos
    TabOrder = 4
  end
  object edtNumMeses: TDBEdit
    Left = 81
    Top = 422
    Width = 73
    Height = 21
    DataField = 'NUM_MESES'
    DataSource = dsPlanos
    TabOrder = 5
  end
  object edtValor: TDBEdit
    Left = 81
    Top = 449
    Width = 73
    Height = 21
    DataField = 'VALOR'
    DataSource = dsPlanos
    TabOrder = 6
  end
  object edtVlTotal: TDBEdit
    Left = 81
    Top = 476
    Width = 73
    Height = 21
    TabStop = False
    DataField = 'valor_total'
    DataSource = dsPlanos
    Enabled = False
    TabOrder = 8
  end
  object AcList: TActionList
    Left = 384
    Top = 168
    object acNovo: TAction
      Caption = 'Novo'
      ShortCut = 112
      OnExecute = acNovoExecute
    end
    object acEditar: TAction
      Caption = 'Editar'
      ShortCut = 113
      OnExecute = acEditarExecute
    end
    object acGravar: TAction
      Caption = 'Gravar'
      Enabled = False
      ShortCut = 114
      OnExecute = acGravarExecute
    end
    object acCancelar: TAction
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 115
      OnExecute = acCancelarExecute
    end
    object acExcluir: TAction
      Caption = 'Excluir'
      ShortCut = 116
      OnExecute = acExcluirExecute
    end
    object acPesquisar: TAction
      Caption = 'Pesquisar'
      OnExecute = acPesquisarExecute
    end
  end
  object dsPlanos: TDataSource
    AutoEdit = False
    DataSet = qryPlanos
    Left = 304
    Top = 208
  end
  object qryPlanos: TFDQuery
    OnCalcFields = qryPlanosCalcFields
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select * from planos'
      'where 1 =2 ')
    Left = 416
    Top = 232
    object qryPlanosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPlanosdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 50
    end
    object qryPlanosdt_cadastro: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_cadastro'
      Origin = 'dt_cadastro'
    end
    object qryPlanosvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      currency = True
    end
    object qryPlanosnum_meses: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'num_meses'
      Origin = 'num_meses'
    end
    object qryPlanosvalor_total: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'valor_total'
      Calculated = True
    end
  end
end
