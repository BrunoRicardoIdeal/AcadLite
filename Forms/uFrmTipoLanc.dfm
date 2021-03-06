object frmTiposLanc: TfrmTiposLanc
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Tipos de Lan'#231'amentos'
  ClientHeight = 600
  ClientWidth = 800
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
  object lblCodpes: TLabel
    Left = 19
    Top = 371
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label5: TLabel
    Left = 148
    Top = 371
    Width = 37
    Height = 13
    Caption = 'Dt. Cad'
  end
  object lblDesc: TLabel
    Left = 6
    Top = 398
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 800
    Height = 113
    Align = alTop
    Caption = 'Pesquisa'
    TabOrder = 0
    object Label4: TLabel
      Left = 383
      Top = 58
      Width = 47
      Height = 13
      Caption = 'Categoria'
    end
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
      TabOrder = 3
    end
    object cbCategoria: TComboBox
      Left = 436
      Top = 55
      Width = 128
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 2
      Text = 'Todas'
      Items.Strings = (
        'Todas'
        'Despesa'
        'Receita')
    end
  end
  object grTipoLanc: TDBGrid
    Left = 0
    Top = 113
    Width = 800
    Height = 240
    Align = alTop
    DataSource = dsTpLanc
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_tipo_lanc'
        Title.Caption = 'C'#243'd. Tipo Lanc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'categoria'
        Title.Caption = 'Categoria'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_cadastro'
        Title.Caption = 'Dt. Cadastro'
        Visible = True
      end>
  end
  object edtCodTpLanc: TDBEdit
    Left = 65
    Top = 368
    Width = 73
    Height = 21
    DataField = 'cod_tipo_lanc'
    DataSource = dsTpLanc
    Enabled = False
    TabOrder = 1
  end
  object edtCadastro: TDBEdit
    Left = 194
    Top = 368
    Width = 127
    Height = 21
    DataField = 'dt_cadastro'
    DataSource = dsTpLanc
    Enabled = False
    TabOrder = 2
  end
  object edtDescricao: TDBEdit
    Left = 65
    Top = 395
    Width = 472
    Height = 21
    DataField = 'descricao'
    DataSource = dsTpLanc
    TabOrder = 3
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 559
    Width = 800
    Height = 41
    Align = alBottom
    TabOrder = 6
    object btnNovo: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 39
      Action = acNovo
      Align = alLeft
      TabOrder = 0
      ExplicitLeft = -5
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
  object dbRgCat: TDBRadioGroup
    Left = 65
    Top = 422
    Width = 323
    Height = 48
    Caption = 'Categoria'
    Columns = 3
    DataField = 'categoria'
    DataSource = dsTpLanc
    Items.Strings = (
      'Receita'
      'Despesa')
    TabOrder = 4
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
  object qryTpLanc: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select * from tipos_lancamentos'
      'where 1=2')
    Left = 312
    Top = 152
    object qryTpLanccod_tipo_lanc: TFDAutoIncField
      FieldName = 'cod_tipo_lanc'
      Origin = 'cod_tipo_lanc'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTpLancdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object qryTpLanccategoria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'categoria'
      Origin = 'categoria'
      Size = 15
    end
    object qryTpLancdt_cadastro: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_cadastro'
      Origin = 'dt_cadastro'
      ReadOnly = True
    end
    object qryTpLancpadrao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'padrao'
      Origin = 'padrao'
      FixedChar = True
      Size = 1
    end
  end
  object dsTpLanc: TDataSource
    AutoEdit = False
    DataSet = qryTpLanc
    Left = 400
    Top = 312
  end
end
