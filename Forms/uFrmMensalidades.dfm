object frmMensalidades: TfrmMensalidades
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Mensalidades'
  ClientHeight = 672
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 180
    Top = 459
    Width = 62
    Height = 13
    Caption = 'Dt. Cadastro'
  end
  object lblCodpes: TLabel
    Left = 51
    Top = 459
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblNome: TLabel
    Left = 38
    Top = 486
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label1: TLabel
    Left = 57
    Top = 511
    Width = 27
    Height = 13
    Caption = 'Aluno'
  end
  object Label6: TLabel
    Left = 60
    Top = 561
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label2: TLabel
    Left = 247
    Top = 588
    Width = 80
    Height = 13
    Caption = 'Dt. Recebimento'
  end
  object Label3: TLabel
    Left = 373
    Top = 561
    Width = 71
    Height = 13
    Caption = 'Valor Recebido'
  end
  object Label7: TLabel
    Left = 11
    Top = 588
    Width = 73
    Height = 13
    Caption = 'Dt. Vencimento'
  end
  object Label8: TLabel
    Left = 648
    Top = 456
    Width = 51
    Height = 13
    Caption = 'Valor Total'
  end
  object Label9: TLabel
    Left = 628
    Top = 483
    Width = 71
    Height = 13
    Caption = 'Total Recebido'
  end
  object shpREd: TShape
    Left = 485
    Top = 456
    Width = 20
    Height = 20
    Brush.Color = clRed
  end
  object Label10: TLabel
    Left = 511
    Top = 460
    Width = 42
    Height = 13
    Caption = 'Vencidas'
  end
  object Label11: TLabel
    Left = 58
    Top = 537
    Width = 26
    Height = 13
    Caption = 'Plano'
  end
  object Label13: TLabel
    Left = 489
    Top = 537
    Width = 60
    Height = 13
    Caption = 'N'#186' de Meses'
  end
  object Label14: TLabel
    Left = 490
    Top = 510
    Width = 59
    Height = 13
    Caption = 'C'#243'd. Agrup.'
  end
  object Label15: TLabel
    Left = 192
    Top = 561
    Width = 55
    Height = 13
    Caption = 'Forma Pag.'
  end
  object gbPsq: TGroupBox
    Left = 0
    Top = 0
    Width = 800
    Height = 193
    Align = alTop
    Caption = 'Pesquisa'
    TabOrder = 0
    object Label4: TLabel
      Left = 24
      Top = 109
      Width = 27
      Height = 13
      Caption = 'Aluno'
    end
    object lblEDtVenc: TLabel
      Left = 274
      Top = 85
      Width = 6
      Height = 13
      Caption = 'e'
      Enabled = False
    end
    object Label12: TLabel
      Left = 23
      Top = 137
      Width = 26
      Height = 13
      Caption = 'Plano'
    end
    object Label16: TLabel
      Left = 135
      Top = 31
      Width = 87
      Height = 13
      Caption = 'Forma Pagamento'
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
    object lblEdtDescricao: TLabeledEdit
      Left = 56
      Top = 55
      Width = 321
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Descri'#231#227'o'
      LabelPosition = lpLeft
      TabOrder = 2
    end
    object btnPsq: TButton
      Left = 54
      Top = 160
      Width = 75
      Height = 25
      Action = acPesquisar
      TabOrder = 10
    end
    object cbPsqAlunos: TComboBox
      Left = 56
      Top = 106
      Width = 321
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 7
    end
    object rgPsqRec: TRadioGroup
      Left = 383
      Top = 51
      Width = 226
      Height = 49
      Caption = 'Recebidas'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Sim'
        'N'#227'o')
      TabOrder = 3
    end
    object dtVencFim: TDateTimePicker
      Left = 288
      Top = 80
      Width = 89
      Height = 21
      Date = 42487.935495578710000000
      Time = 42487.935495578710000000
      Enabled = False
      TabOrder = 6
    end
    object dtVencIni: TDateTimePicker
      Left = 186
      Top = 80
      Width = 83
      Height = 21
      Date = 42487.935495578710000000
      Time = 42487.935495578710000000
      Enabled = False
      TabOrder = 5
    end
    object chkHabDtVenc: TCheckBox
      Left = 57
      Top = 83
      Width = 123
      Height = 17
      Caption = 'Dt. Vencimento entre'
      TabOrder = 4
      OnClick = chkHabDtVencClick
    end
    object rgVencidas: TRadioGroup
      Left = 383
      Top = 106
      Width = 226
      Height = 49
      Caption = 'Vencidas'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Sim'
        'N'#227'o')
      TabOrder = 8
    end
    object cbPsqPlanos: TComboBox
      Left = 56
      Top = 134
      Width = 321
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 9
    end
    object cbPsqFormaPag: TComboBox
      Left = 228
      Top = 28
      Width = 149
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 1
    end
  end
  object grdMens: TDBGrid
    Left = 0
    Top = 193
    Width = 800
    Height = 254
    Align = alTop
    DataSource = dsMensalidade
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grdMensDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_MENSALIDADE'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Aluno'
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENCIMENTO'
        Title.Caption = 'Dt. Vencimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_RECEBIDO'
        Title.Caption = 'Valor Recebido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_RECEBIMENTO'
        Title.Caption = 'Dt. Recebimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_CADASTRO'
        Title.Caption = 'Dt. Cadastro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLANO_DESC'
        Title.Caption = 'Plano'
        Width = 204
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMA_PAG_DESC'
        Title.Caption = 'Forma Pagamento'
        Width = 227
        Visible = True
      end>
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 631
    Width = 800
    Height = 41
    Align = alBottom
    TabOrder = 15
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
    object btnReplicar: TButton
      Left = 724
      Top = 1
      Width = 75
      Height = 39
      Action = acReplicar
      Align = alRight
      TabOrder = 5
      Visible = False
    end
  end
  object edtCadastro: TDBEdit
    Left = 248
    Top = 456
    Width = 127
    Height = 21
    DataField = 'DT_CADASTRO'
    DataSource = dsMensalidade
    Enabled = False
    TabOrder = 3
  end
  object edtCodPes: TDBEdit
    Left = 96
    Top = 456
    Width = 73
    Height = 21
    DataField = 'COD_MENSALIDADE'
    DataSource = dsMensalidade
    Enabled = False
    TabOrder = 2
  end
  object edtDescricao: TDBEdit
    Left = 96
    Top = 483
    Width = 383
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dsMensalidade
    TabOrder = 4
  end
  object lkpCbAluno: TDBLookupComboBox
    Left = 96
    Top = 507
    Width = 383
    Height = 21
    DataField = 'COD_ALUNO'
    DataSource = dsMensalidade
    KeyField = 'COD_PESSOA'
    ListField = 'NOME'
    ListSource = dsAluno
    TabOrder = 5
  end
  object edtValor: TDBEdit
    Left = 96
    Top = 558
    Width = 90
    Height = 21
    DataField = 'VALOR'
    DataSource = dsMensalidade
    Enabled = False
    TabOrder = 9
  end
  object edtDtRecebimento: TDBEdit
    Left = 333
    Top = 585
    Width = 146
    Height = 21
    DataField = 'DT_RECEBIMENTO'
    DataSource = dsMensalidade
    Enabled = False
    TabOrder = 14
  end
  object edtValorRecebido: TDBEdit
    Left = 450
    Top = 558
    Width = 90
    Height = 21
    DataField = 'VALOR_RECEBIDO'
    DataSource = dsMensalidade
    Enabled = False
    TabOrder = 11
    OnExit = edtValorRecebidoExit
  end
  object btnReceber: TButton
    Left = 544
    Top = 556
    Width = 84
    Height = 25
    Action = acBtnReceber
    TabOrder = 12
    TabStop = False
  end
  object edtDtVencimento: TDBEdit
    Left = 96
    Top = 585
    Width = 146
    Height = 21
    DataField = 'DT_VENCIMENTO'
    DataSource = dsMensalidade
    TabOrder = 13
  end
  object edtAggTotal: TDBEdit
    Left = 705
    Top = 453
    Width = 88
    Height = 21
    TabStop = False
    DataField = 'AGGVLTOTAL'
    DataSource = dsMensalidade
    TabOrder = 16
  end
  object edtAggTotalRec: TDBEdit
    Left = 705
    Top = 480
    Width = 88
    Height = 21
    TabStop = False
    DataField = 'AGGVLREC'
    DataSource = dsMensalidade
    TabOrder = 17
  end
  object lkpcbPlano: TDBLookupComboBox
    Left = 96
    Top = 532
    Width = 383
    Height = 21
    DataField = 'COD_PLANO'
    DataSource = dsMensalidade
    KeyField = 'ID'
    ListField = 'DESCRICAO'
    ListSource = dsPlanos
    TabOrder = 7
  end
  object edtNumMeses: TDBEdit
    Left = 555
    Top = 534
    Width = 73
    Height = 21
    DataField = 'NUM_MESES'
    DataSource = dsMensalidade
    Enabled = False
    TabOrder = 8
  end
  object edtCodAgrup: TDBEdit
    Left = 555
    Top = 507
    Width = 73
    Height = 21
    DataField = 'COD_AGRUPAMENTO'
    DataSource = dsMensalidade
    Enabled = False
    TabOrder = 6
  end
  object lkpCbFormaPag: TDBLookupComboBox
    Left = 248
    Top = 558
    Width = 119
    Height = 21
    DataField = 'COD_FORMA_PAGAMENTO'
    DataSource = dsMensalidade
    Enabled = False
    KeyField = 'id'
    ListField = 'descricao'
    ListSource = dsFormaPag
    TabOrder = 10
  end
  object AcList: TActionList
    Left = 216
    Top = 240
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
    object acBtnReceber: TAction
      Caption = 'Receber'
      ShortCut = 16466
      OnExecute = acBtnReceberExecute
    end
    object acReplicar: TAction
      Caption = 'Replicar'
      ShortCut = 16452
      OnExecute = acReplicarExecute
    end
  end
  object qryMensalidade: TFDQuery
    AfterOpen = qryMensalidadeAfterOpen
    AfterClose = qryMensalidadeAfterClose
    OnCalcFields = qryMensalidadeCalcFields
    AggregatesActive = True
    Connection = dmPrincipal.MySQLConn
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT M.COD_MENSALIDADE'
      '      ,M.DESCRICAO'
      '      ,M.COD_ALUNO'
      '      ,P.NOME'
      '      ,M.DT_VENCIMENTO'
      '      ,M.DT_CADASTRO'
      '      ,M.DT_RECEBIMENTO'
      '      ,M.VALOR'
      '      ,M.VALOR_RECEBIDO'
      '      ,M.COD_PLANO'
      '      ,M.COD_AGRUPAMENTO '
      '      ,M.COD_FORMA_PAGAMENTO'
      '      ,PL.DESCRICAO PLANO_DESC'
      '      ,PL.NUM_MESES'
      '      ,FP.DESCRICAO FORMA_PAG_DESC'
      'FROM MENSALIDADES M'
      'INNER JOIN PESSOAS P ON M.COD_ALUNO = P.COD_PESSOA'
      'LEFT JOIN PLANOS PL ON M.COD_PLANO = PL.ID'
      'LEFT JOIN FORMAS_PAGAMENTO FP ON M.COD_FORMA_PAGAMENTO = FP.ID'
      'WHERE 1=2')
    Left = 608
    Top = 248
    object qryMensalidadeCOD_MENSALIDADE: TFDAutoIncField
      FieldName = 'COD_MENSALIDADE'
      Origin = 'cod_mensalidade'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryMensalidadeDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'descricao'
      Size = 100
    end
    object qryMensalidadeCOD_ALUNO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_ALUNO'
      Origin = 'cod_aluno'
    end
    object qryMensalidadeNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryMensalidadeDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'dt_cadastro'
      ReadOnly = True
    end
    object qryMensalidadeDT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
      Origin = 'dt_recebimento'
    end
    object qryMensalidadeVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'valor'
      Required = True
      currency = True
    end
    object qryMensalidadeVALOR_RECEBIDO: TFloatField
      FieldName = 'VALOR_RECEBIDO'
      Origin = 'valor_recebido'
      currency = True
    end
    object qryMensalidadeDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
      Origin = 'dt_vencimento'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object qryMensalidadeVENCIDA: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'VENCIDA'
      Calculated = True
    end
    object qryMensalidadeCOD_PLANO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_PLANO'
      Origin = 'cod_plano'
      OnChange = qryMensalidadeCOD_PLANOChange
    end
    object qryMensalidadePLANO_DESC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PLANO_DESC'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryMensalidadeNUM_MESES: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NUM_MESES'
      Origin = 'num_meses'
      ProviderFlags = []
    end
    object qryMensalidadeCOD_AGRUPAMENTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_AGRUPAMENTO'
      Origin = 'cod_agrupamento'
    end
    object qryMensalidadeCOD_FORMA_PAGAMENTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_FORMA_PAGAMENTO'
      Origin = 'cod_forma_pagamento'
    end
    object qryMensalidadeFORMA_PAG_DESC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORMA_PAG_DESC'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryMensalidadeAGGVLTOTAL: TAggregateField
      FieldName = 'AGGVLTOTAL'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(VALOR)'
    end
    object qryMensalidadeAGGVLREC: TAggregateField
      FieldName = 'AGGVLREC'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(VALOR_RECEBIDO)'
    end
  end
  object dsMensalidade: TDataSource
    AutoEdit = False
    DataSet = qryMensalidade
    Left = 608
    Top = 296
  end
  object qryAlunos: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'SELECT COD_PESSOA'
      '       ,NOME'
      'FROM PESSOAS'
      'WHERE TIPO = '#39'Aluno'#39
      'order by nome')
    Left = 392
    Top = 296
    object qryAlunosCOD_PESSOA: TFDAutoIncField
      FieldName = 'COD_PESSOA'
      Origin = 'cod_pessoa'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryAlunosNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'nome'
      Size = 100
    end
  end
  object dsAluno: TDataSource
    DataSet = qryAlunos
    Left = 392
    Top = 248
  end
  object qryInsereLanc: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      
        'INSERT INTO LANCAMENTOS(DESCRICAO,DT_VENCIMENTO,COD_TIPO_LANC,VA' +
        'LOR,COD_MENSALIDADE)'
      
        ' VALUES(:DESCRICAO,:DT_VENCIMENTO,:COD_TIPO_LANC,:VALOR,:COD_MEN' +
        'SALIDADE)')
    Left = 104
    Top = 248
    ParamData = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
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
        Name = 'COD_TIPO_LANC'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COD_MENSALIDADE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryPlanos: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'SELECT ID, DESCRICAO'
      'FROM PLANOS'
      'ORDER BY DESCRICAO')
    Left = 296
    Top = 240
    object qryPlanosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPlanosDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'descricao'
      Size = 50
    end
  end
  object dsPlanos: TDataSource
    AutoEdit = False
    DataSet = qryPlanos
    Left = 296
    Top = 296
  end
  object qryAgrupamento: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select cod_agrupamento , dt_operacao'
      'from agrupamento_mensalidade')
    Left = 720
    Top = 256
    object qryAgrupamentocod_agrupamento: TFDAutoIncField
      FieldName = 'cod_agrupamento'
      Origin = 'cod_agrupamento'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryAgrupamentodt_operacao: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_operacao'
      Origin = 'dt_operacao'
    end
  end
  object qryUpdateMesmoAgrup: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'update mensalidades'
      'set descricao = :descricao'
      ',cod_aluno = :cod_aluno'
      ',cod_plano = :cod_plano'
      ',valor = :valor'
      'where cod_agrupamento = :cod_agrupamento')
    Left = 104
    Top = 304
    ParamData = <
      item
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        Name = 'COD_ALUNO'
        ParamType = ptInput
      end
      item
        Name = 'COD_PLANO'
        ParamType = ptInput
      end
      item
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        Name = 'COD_AGRUPAMENTO'
        ParamType = ptInput
      end>
  end
  object qryReceber: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'SELECT M.COD_MENSALIDADE'
      '      ,M.DESCRICAO'
      '      ,M.COD_ALUNO'
      '      ,P.NOME'
      '      ,M.DT_VENCIMENTO'
      '      ,M.DT_CADASTRO'
      '      ,M.DT_RECEBIMENTO'
      '      ,M.VALOR'
      '      ,M.VALOR_RECEBIDO'
      '      ,M.COD_PLANO'
      '      ,M.COD_AGRUPAMENTO '
      '      ,M.COD_FORMA_PAGAMENTO'
      '      ,PL.DESCRICAO PLANO_DESC'
      '      ,PL.NUM_MESES'
      'FROM MENSALIDADES M'
      'INNER JOIN PESSOAS P ON M.COD_ALUNO = P.COD_PESSOA'
      'LEFT JOIN PLANOS PL ON M.COD_PLANO = PL.ID'
      'WHERE COD_AGRUPAMENTO = :COD_AGRUPAMENTO')
    Left = 392
    Top = 344
    ParamData = <
      item
        Name = 'COD_AGRUPAMENTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryReceberCOD_MENSALIDADE: TFDAutoIncField
      FieldName = 'COD_MENSALIDADE'
      Origin = 'cod_mensalidade'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryReceberDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'descricao'
      Size = 100
    end
    object qryReceberCOD_ALUNO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_ALUNO'
      Origin = 'cod_aluno'
    end
    object qryReceberNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryReceberDT_VENCIMENTO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DT_VENCIMENTO'
      Origin = 'dt_vencimento'
    end
    object qryReceberDT_CADASTRO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_CADASTRO'
      Origin = 'dt_cadastro'
    end
    object qryReceberDT_RECEBIMENTO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DT_RECEBIMENTO'
      Origin = 'dt_recebimento'
    end
    object qryReceberVALOR: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR'
      Origin = 'valor'
    end
    object qryReceberVALOR_RECEBIDO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_RECEBIDO'
      Origin = 'valor_recebido'
    end
    object qryReceberCOD_PLANO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_PLANO'
      Origin = 'cod_plano'
    end
    object qryReceberCOD_AGRUPAMENTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_AGRUPAMENTO'
      Origin = 'cod_agrupamento'
    end
    object qryReceberPLANO_DESC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PLANO_DESC'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryReceberNUM_MESES: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NUM_MESES'
      Origin = 'num_meses'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryReceberCOD_FORMA_PAGAMENTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_FORMA_PAGAMENTO'
      Origin = 'cod_forma_pagamento'
    end
  end
  object qryFormaPag: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select id, descricao '
      'from formas_pagamento'
      'order by descricao')
    Left = 392
    Top = 392
    object qryFormaPagid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryFormaPagdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 50
    end
  end
  object dsFormaPag: TDataSource
    DataSet = qryFormaPag
    Left = 464
    Top = 392
  end
end
