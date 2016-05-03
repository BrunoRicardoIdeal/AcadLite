object frmLancamentos: TfrmLancamentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Lan'#231'amentos'
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCodpes: TLabel
    Left = 40
    Top = 452
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label5: TLabel
    Left = 164
    Top = 452
    Width = 44
    Height = 13
    Caption = 'Dt. Lanc.'
  end
  object lblDesc: TLabel
    Left = 27
    Top = 479
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label1: TLabel
    Left = 24
    Top = 424
    Width = 49
    Height = 13
    Caption = 'Tipo Lanc.'
  end
  object Label2: TLabel
    Left = 3
    Top = 506
    Width = 70
    Height = 13
    Caption = 'Dt.Vencimento'
  end
  object Label3: TLabel
    Left = 362
    Top = 452
    Width = 57
    Height = 13
    Caption = 'Dt.Exclus'#227'o'
  end
  object Label6: TLabel
    Left = 49
    Top = 531
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label7: TLabel
    Left = 292
    Top = 389
    Width = 51
    Height = 13
    Caption = 'Valor Total'
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 800
    Height = 161
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
    object lblEDtVenc: TLabel
      Left = 273
      Top = 107
      Width = 6
      Height = 13
      Caption = 'e'
      Enabled = False
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
      Top = 128
      Width = 75
      Height = 25
      Action = acPesquisar
      TabOrder = 7
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
    object chkExcluidos: TCheckBox
      Left = 56
      Top = 82
      Width = 117
      Height = 17
      Hint = 
        'Se marcado, mostra somente lan'#231'amentos exclu'#237'dos. Se desmarcado,' +
        ' somente n'#227'o exclu'#237'dos.'
      Caption = 'Somente Exclu'#237'dos'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object chkHabDtVenc: TCheckBox
      Left = 56
      Top = 105
      Width = 123
      Height = 17
      Caption = 'Dt. Vencimento entre'
      TabOrder = 4
      OnClick = chkHabDtVencClick
    end
    object dtVencIni: TDateTimePicker
      Left = 185
      Top = 102
      Width = 83
      Height = 21
      Date = 42487.935495578710000000
      Time = 42487.935495578710000000
      Enabled = False
      TabOrder = 5
    end
    object dtVencFim: TDateTimePicker
      Left = 287
      Top = 102
      Width = 83
      Height = 21
      Date = 42487.935495578710000000
      Time = 42487.935495578710000000
      Enabled = False
      TabOrder = 6
    end
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
  object grLanc: TDBGrid
    Left = 0
    Top = 161
    Width = 800
    Height = 224
    Align = alTop
    DataSource = dsLanc
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_lanc'
        Title.Caption = 'C'#243'd.Lanc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 300
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
        FieldName = 'dt_vencimento'
        Title.Caption = 'Dt. Venc.'
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
        FieldName = 'dt_lanc'
        Title.Caption = 'Dt. Lan'#231'amento'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo_lanc_desc'
        Title.Caption = 'Tipo'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_exclusao'
        Title.Caption = 'Dt. Exclus'#227'o'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fixo'
        Title.Caption = 'Fixo'
        Visible = True
      end>
  end
  object edtCodLanc: TDBEdit
    Left = 79
    Top = 449
    Width = 73
    Height = 21
    DataField = 'cod_lanc'
    DataSource = dsLanc
    Enabled = False
    TabOrder = 2
  end
  object edtDtLanc: TDBEdit
    Left = 214
    Top = 449
    Width = 127
    Height = 21
    DataField = 'dt_lanc'
    DataSource = dsLanc
    Enabled = False
    TabOrder = 3
  end
  object edtDescricao: TDBEdit
    Left = 79
    Top = 476
    Width = 472
    Height = 21
    DataField = 'descricao'
    DataSource = dsLanc
    TabOrder = 6
  end
  object dbRgCat: TDBRadioGroup
    Left = 557
    Top = 424
    Width = 86
    Height = 74
    Hint = 'Representa a categoria do tipo de lan'#231'amento'
    Caption = 'Categoria'
    DataField = 'categoria'
    DataSource = dsLanc
    Items.Strings = (
      'Receita'
      'Despesa')
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 5
  end
  object edtDtVenc: TDBEdit
    Left = 79
    Top = 503
    Width = 90
    Height = 21
    DataField = 'dt_vencimento'
    DataSource = dsLanc
    TabOrder = 7
  end
  object cbLkpTipoLanc: TDBLookupComboBox
    Left = 79
    Top = 421
    Width = 472
    Height = 21
    DataField = 'cod_tipo_lanc'
    DataSource = dsLanc
    KeyField = 'cod_tipo_lanc'
    ListField = 'descricao'
    ListSource = dsTipoLanc
    TabOrder = 1
  end
  object edtDtExclusao: TDBEdit
    Left = 425
    Top = 449
    Width = 126
    Height = 21
    DataField = 'dt_exclusao'
    DataSource = dsLanc
    Enabled = False
    TabOrder = 4
  end
  object edtValor: TDBEdit
    Left = 79
    Top = 528
    Width = 90
    Height = 21
    DataField = 'valor'
    DataSource = dsLanc
    TabOrder = 8
  end
  object DBCheckBox1: TDBCheckBox
    Left = 185
    Top = 507
    Width = 97
    Height = 17
    Hint = 'Indica se foi gerado a partir de um la'#231'amento fixo cadastrado'
    Caption = 'Fixo'
    DataField = 'fixo'
    DataSource = dsLanc
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object edtValorTotal: TDBEdit
    Left = 346
    Top = 386
    Width = 90
    Height = 21
    DataField = 'AggValorTotal'
    DataSource = dsLanc
    TabOrder = 12
  end
  object AcList: TActionList
    Left = 680
    Top = 184
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
  object qryLanc: TFDQuery
    AfterOpen = qryLancAfterOpen
    AfterClose = qryLancAfterClose
    AggregatesActive = True
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select l.cod_lanc '
      '      ,l.descricao'
      '      ,l.dt_lanc'
      '      ,l.dt_vencimento'
      '      ,l.dt_exclusao'
      '      ,l.cod_tipo_lanc'
      '      ,l.valor'
      '      ,l.fixo'
      '      ,tl.descricao tipo_lanc_desc'
      '      ,tl.categoria'
      'from lancamentos l , tipos_lancamentos tl'
      'where l.cod_tipo_lanc = tl.cod_tipo_lanc')
    Left = 552
    Top = 240
    object qryLanccod_lanc: TFDAutoIncField
      FieldName = 'cod_lanc'
      Origin = 'cod_lanc'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryLancdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object qryLancdt_lanc: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_lanc'
      Origin = 'dt_lanc'
      ReadOnly = True
    end
    object qryLancdt_vencimento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dt_vencimento'
      Origin = 'dt_vencimento'
      EditMask = '!99/99/0000;1;_'
    end
    object qryLanccod_tipo_lanc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_tipo_lanc'
      Origin = 'cod_tipo_lanc'
      OnChange = qryLanccod_tipo_lancChange
    end
    object qryLanctipo_lanc_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo_lanc_desc'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryLanccategoria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'categoria'
      Origin = 'categoria'
      ProviderFlags = []
      Size = 15
    end
    object qryLancdt_exclusao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_exclusao'
      Origin = 'dt_exclusao'
    end
    object qryLancvalor: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      currency = True
    end
    object qryLancfixo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fixo'
      Origin = 'fixo'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryLancAggValorTotal: TAggregateField
      FieldName = 'AggValorTotal'
      ReadOnly = True
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valor)'
    end
  end
  object dsLanc: TDataSource
    AutoEdit = False
    DataSet = qryLanc
    Left = 712
    Top = 184
  end
  object qryTipoLanc: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select cod_tipo_lanc, descricao'
      'from tipos_lancamentos')
    Left = 672
    Top = 304
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
    Left = 672
    Top = 240
  end
end
