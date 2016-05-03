object frmLancFixos: TfrmLancFixos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Lan'#231'amentos Fixos'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 368
    Width = 49
    Height = 13
    Caption = 'Tipo Lanc.'
  end
  object lblCodpes: TLabel
    Left = 40
    Top = 396
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblDesc: TLabel
    Left = 27
    Top = 423
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label2: TLabel
    Left = 28
    Top = 450
    Width = 45
    Height = 13
    Caption = 'Dt. Inicial'
  end
  object Label3: TLabel
    Left = 58
    Top = 477
    Width = 15
    Height = 13
    Caption = 'Dia'
  end
  object Label5: TLabel
    Left = 158
    Top = 479
    Width = 371
    Height = 13
    Caption = 
      'Obs: se o m'#234's n'#227'o possuir esse dia, a data usada ser'#225' a do '#250'ltim' +
      'o dia do m'#234's'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 49
    Top = 501
    Width = 24
    Height = 13
    Caption = 'Valor'
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
      Left = 56
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
  object grLancFixos: TDBGrid
    Left = 0
    Top = 113
    Width = 800
    Height = 238
    Align = alTop
    DataSource = dsLancFixos
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
        FieldName = 'cod_lanc_fixo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_ini'
        Title.Caption = 'dt. Inicial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dia'
        Title.Caption = 'Dia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'desc_lanc'
        Title.Caption = 'Tipo Lan'#231'amento'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'categoria'
        Title.Caption = 'Categoria'
        Visible = True
      end>
  end
  object cbLkpTipoLanc: TDBLookupComboBox
    Left = 79
    Top = 365
    Width = 472
    Height = 21
    DataField = 'cod_tipo_lanc'
    DataSource = dsLancFixos
    KeyField = 'cod_tipo_lanc'
    ListField = 'descricao'
    ListSource = dsTipoLanc
    TabOrder = 2
  end
  object edtCodLanc: TDBEdit
    Left = 79
    Top = 393
    Width = 73
    Height = 21
    DataField = 'cod_lanc_fixo'
    DataSource = dsLancFixos
    Enabled = False
    TabOrder = 3
  end
  object edtDescricao: TDBEdit
    Left = 79
    Top = 420
    Width = 472
    Height = 21
    DataField = 'descricao'
    DataSource = dsLancFixos
    TabOrder = 5
  end
  object dbRgCat: TDBRadioGroup
    Left = 557
    Top = 368
    Width = 86
    Height = 74
    Hint = 'Representa a categoria do tipo de lan'#231'amento'
    Caption = 'Categoria'
    DataField = 'categoria'
    DataSource = dsLancFixos
    Items.Strings = (
      'Receita'
      'Despesa')
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
  end
  object edtDtIni: TDBEdit
    Left = 79
    Top = 447
    Width = 73
    Height = 21
    DataField = 'dt_ini'
    DataSource = dsLancFixos
    TabOrder = 6
  end
  object edtDia: TDBEdit
    Left = 79
    Top = 474
    Width = 73
    Height = 21
    Hint = 'Dia do m'#234's para a gera'#231#227'o autom'#225'tica'
    DataField = 'dia'
    DataSource = dsLancFixos
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 559
    Width = 800
    Height = 41
    Align = alBottom
    TabOrder = 9
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
      TabOrder = 1
    end
    object btnCancelar: TButton
      Left = 226
      Top = 1
      Width = 75
      Height = 39
      Action = acCancelar
      Align = alLeft
      TabOrder = 2
    end
    object btnEditar: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 39
      Action = acEditar
      Align = alLeft
      TabOrder = 3
    end
    object btnGravar: TButton
      Left = 151
      Top = 1
      Width = 75
      Height = 39
      Action = acGravar
      Align = alLeft
      TabOrder = 4
    end
  end
  object edtValor: TDBEdit
    Left = 79
    Top = 498
    Width = 90
    Height = 21
    DataField = 'valor'
    DataSource = dsLancFixos
    TabOrder = 8
  end
  object qryTipoLanc: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select cod_tipo_lanc, descricao'
      'from tipos_lancamentos')
    Left = 192
    Top = 288
    object qryTipoLanccod_tipo_lanc: TFDAutoIncField
      FieldName = 'cod_tipo_lanc'
      Origin = 'cod_tipo_lanc'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryTipoLancdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
  end
  object dsTipoLanc: TDataSource
    DataSet = qryTipoLanc
    Left = 256
    Top = 304
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
  object qryLancFixos: TFDQuery
    AfterOpen = qryLancFixosAfterOpen
    AfterClose = qryLancFixosAfterClose
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select lf.cod_lanc_fixo,'
      '       lf.descricao,'
      '       lf.cod_tipo_lanc,'
      '       lf.dt_ini,'
      '       lf.valor,'
      '       lf.dia,'
      '       tl.descricao desc_lanc,'
      '       tl.categoria  '
      'from lancamentos_fixos lf, tipos_lancamentos tl'
      'where lf.cod_tipo_lanc = tl.cod_tipo_lanc')
    Left = 392
    Top = 304
    object qryLancFixoscod_lanc_fixo: TFDAutoIncField
      FieldName = 'cod_lanc_fixo'
      Origin = 'cod_lanc_fixo'
      ReadOnly = True
    end
    object qryLancFixosdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object qryLancFixoscod_tipo_lanc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_tipo_lanc'
      Origin = 'cod_tipo_lanc'
      OnChange = qryLancFixoscod_tipo_lancChange
    end
    object qryLancFixosdt_ini: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dt_ini'
      Origin = 'dt_ini'
      EditMask = '!99/99/0000;1;_'
    end
    object qryLancFixosdia: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'dia'
      Origin = 'dia'
    end
    object qryLancFixosdesc_lanc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'desc_lanc'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryLancFixoscategoria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'categoria'
      Origin = 'categoria'
      ProviderFlags = []
      Size = 15
    end
    object qryLancFixosvalor: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      currency = True
    end
  end
  object dsLancFixos: TDataSource
    AutoEdit = False
    DataSet = qryLancFixos
    Left = 456
    Top = 312
  end
end
