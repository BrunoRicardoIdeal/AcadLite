object frmPessoas: TfrmPessoas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pessoas'
  ClientHeight = 656
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
  PrintScale = poNone
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lblCodpes: TLabel
    Left = 41
    Top = 371
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblNome: TLabel
    Left = 47
    Top = 398
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object lblDtNasc: TLabel
    Left = 29
    Top = 425
    Width = 45
    Height = 13
    Caption = 'Dt. Nasc.'
  end
  object Label1: TLabel
    Left = 55
    Top = 452
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label2: TLabel
    Left = 32
    Top = 479
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label3: TLabel
    Left = 253
    Top = 479
    Width = 33
    Height = 13
    Caption = 'Celular'
  end
  object Label5: TLabel
    Left = 210
    Top = 371
    Width = 62
    Height = 13
    Caption = 'Dt. Cadastro'
  end
  object Label6: TLabel
    Left = 724
    Top = 361
    Width = 67
    Height = 13
    Caption = 'Inadimplentes'
  end
  object shpRed: TShape
    Left = 698
    Top = 359
    Width = 20
    Height = 20
    Brush.Color = clRed
  end
  object Label7: TLabel
    Left = 19
    Top = 554
    Width = 55
    Height = 13
    Caption = 'Logradouro'
  end
  object Label8: TLabel
    Left = 41
    Top = 530
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object Label9: TLabel
    Left = 157
    Top = 530
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label10: TLabel
    Left = 55
    Top = 505
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object Label11: TLabel
    Left = 45
    Top = 581
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Label12: TLabel
    Left = 222
    Top = 581
    Width = 65
    Height = 13
    Caption = 'Complemento'
  end
  object Label13: TLabel
    Left = 202
    Top = 505
    Width = 321
    Height = 13
    Caption = 'Nota: O recurso de completar automaticamente precisa de internet'
    WordWrap = True
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
      Width = 20
      Height = 13
      Caption = 'Tipo'
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
    object lblEdtNome: TLabeledEdit
      Left = 56
      Top = 55
      Width = 321
      Height = 21
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
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
    object cbTipo: TComboBox
      Left = 409
      Top = 55
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 2
      Text = 'Todos'
      Items.Strings = (
        'Todos'
        'Comum'
        'Aluno'
        'Professor')
    end
  end
  object grdPessoas: TDBGrid
    Left = 0
    Top = 113
    Width = 800
    Height = 240
    Align = alTop
    DataSource = dsPessoas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grdPessoasDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_pessoa'
        Title.Caption = 'C'#243'd. Pessoa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_nascimento'
        Title.Caption = 'Dt. Nasc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cpf'
        Title.Caption = 'CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Title.Caption = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'celular'
        Title.Caption = 'Celular'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_cadastro'
        Title.Caption = 'Dt.Cadastro'
        Visible = True
      end>
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 615
    Width = 800
    Height = 41
    Align = alBottom
    TabOrder = 16
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
  object edtCodPes: TDBEdit
    Left = 80
    Top = 368
    Width = 73
    Height = 21
    DataField = 'cod_pessoa'
    DataSource = dsPessoas
    Enabled = False
    TabOrder = 2
  end
  object edtNome: TDBEdit
    Left = 81
    Top = 395
    Width = 323
    Height = 21
    DataField = 'nome'
    DataSource = dsPessoas
    TabOrder = 4
  end
  object edtDtNasc: TDBEdit
    Left = 81
    Top = 422
    Width = 115
    Height = 21
    DataField = 'dt_nascimento'
    DataSource = dsPessoas
    TabOrder = 5
  end
  object edtCPF: TDBEdit
    Left = 81
    Top = 449
    Width = 115
    Height = 21
    DataField = 'cpf'
    DataSource = dsPessoas
    TabOrder = 7
  end
  object dbRgTipo: TDBRadioGroup
    Left = 232
    Top = 422
    Width = 305
    Height = 48
    Caption = 'Tipo'
    Columns = 3
    DataField = 'tipo'
    DataSource = dsPessoas
    Items.Strings = (
      'Comum'
      'Aluno'
      'Professor')
    TabOrder = 6
  end
  object edtTelefone: TDBEdit
    Left = 81
    Top = 476
    Width = 115
    Height = 21
    DataField = 'telefone'
    DataSource = dsPessoas
    TabOrder = 8
  end
  object edtCelular: TDBEdit
    Left = 289
    Top = 476
    Width = 115
    Height = 21
    DataField = 'celular'
    DataSource = dsPessoas
    TabOrder = 9
  end
  object edtCadastro: TDBEdit
    Left = 277
    Top = 368
    Width = 127
    Height = 21
    DataField = 'dt_cadastro'
    DataSource = dsPessoas
    Enabled = False
    TabOrder = 3
  end
  object edtLogradouro: TDBEdit
    Left = 81
    Top = 552
    Width = 323
    Height = 21
    DataField = 'logradouro'
    DataSource = dsPessoas
    TabOrder = 13
  end
  object edtCep: TDBEdit
    Left = 81
    Top = 502
    Width = 115
    Height = 21
    DataField = 'cep'
    DataSource = dsPessoas
    TabOrder = 10
    OnExit = edtCepExit
  end
  object edtBairro: TDBEdit
    Left = 81
    Top = 579
    Width = 136
    Height = 21
    DataField = 'bairro'
    DataSource = dsPessoas
    TabOrder = 14
  end
  object edtComplemento: TDBEdit
    Left = 293
    Top = 579
    Width = 110
    Height = 21
    DataField = 'complemento'
    DataSource = dsPessoas
    TabOrder = 15
  end
  object cbEstado: TDBLookupComboBox
    Left = 81
    Top = 527
    Width = 53
    Height = 21
    DataField = 'cod_uf'
    DataSource = dsPessoas
    KeyField = 'id'
    ListField = 'uf'
    ListSource = dsUF
    TabOrder = 11
  end
  object cbCidade: TDBLookupComboBox
    Left = 197
    Top = 527
    Width = 207
    Height = 21
    DataField = 'cod_cidade'
    DataSource = dsPessoas
    KeyField = 'id'
    ListField = 'nome'
    ListSource = dsCidade
    TabOrder = 12
  end
  object AcList: TActionList
    Left = 296
    Top = 296
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
  object qryPessoas: TFDQuery
    AfterOpen = qryPessoasAfterOpen
    AfterClose = qryPessoasAfterClose
    AfterScroll = qryPessoasAfterScroll
    AfterRefresh = qryPessoasAfterRefresh
    OnCalcFields = qryPessoasCalcFields
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select * from pessoas')
    Left = 416
    Top = 232
    object qryPessoascod_pessoa: TFDAutoIncField
      FieldName = 'cod_pessoa'
      Origin = 'cod_pessoa'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPessoasnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object qryPessoasdt_nascimento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dt_nascimento'
      Origin = 'dt_nascimento'
    end
    object qryPessoascpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cpf'
      Origin = 'cpf'
      Size = 14
    end
    object qryPessoastelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 13
    end
    object qryPessoascelular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'celular'
      Origin = 'celular'
      Size = 13
    end
    object qryPessoastipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 10
    end
    object qryPessoasdt_cadastro: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_cadastro'
      Origin = 'dt_cadastro'
    end
    object qryPessoaslogradouro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 100
    end
    object qryPessoascomplemento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'complemento'
      Origin = 'complemento'
      Size = 50
    end
    object qryPessoascep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cep'
      Origin = 'cep'
      Size = 10
    end
    object qryPessoasbairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 50
    end
    object qryPessoascod_uf: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_uf'
      Origin = 'cod_uf'
      OnChange = qryPessoascod_ufChange
    end
    object qryPessoascod_cidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_cidade'
      Origin = 'cod_cidade'
    end
    object qryPessoasinadimplente: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'inadimplente'
      Calculated = True
    end
  end
  object dsPessoas: TDataSource
    AutoEdit = False
    DataSet = qryPessoas
    Left = 304
    Top = 208
  end
  object qryUF: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select id,uf from estado')
    Left = 8
    Top = 520
    object qryUFid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryUFuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      Size = 5
    end
  end
  object qryCidade: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select id, nome, estado'
      'from cidade'
      'order by nome')
    Left = 384
    Top = 528
    object qryCidadeid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryCidadenome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 120
    end
    object qryCidadeestado: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'estado'
      Origin = 'estado'
    end
  end
  object dsUF: TDataSource
    DataSet = qryUF
    Left = 8
    Top = 568
  end
  object dsCidade: TDataSource
    DataSet = qryCidade
    Left = 416
    Top = 528
  end
end
