object frmPessoas: TfrmPessoas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pessoas'
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
  PrintScale = poNone
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblCodpes: TLabel
    Left = 19
    Top = 371
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblNome: TLabel
    Left = 25
    Top = 398
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object lblDtNasc: TLabel
    Left = 7
    Top = 425
    Width = 45
    Height = 13
    Caption = 'Dt. Nasc.'
  end
  object Label1: TLabel
    Left = 33
    Top = 452
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label2: TLabel
    Left = 10
    Top = 479
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label3: TLabel
    Left = 201
    Top = 479
    Width = 33
    Height = 13
    Caption = 'Celular'
  end
  object Label5: TLabel
    Left = 148
    Top = 371
    Width = 62
    Height = 13
    Caption = 'Dt. Cadastro'
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
    Top = 559
    Width = 800
    Height = 41
    Align = alBottom
    TabOrder = 10
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
    Left = 65
    Top = 368
    Width = 73
    Height = 21
    DataField = 'cod_pessoa'
    DataSource = dsPessoas
    Enabled = False
    TabOrder = 2
  end
  object edtNome: TDBEdit
    Left = 65
    Top = 395
    Width = 323
    Height = 21
    DataField = 'nome'
    DataSource = dsPessoas
    TabOrder = 4
  end
  object edtDtNasc: TDBEdit
    Left = 65
    Top = 422
    Width = 115
    Height = 21
    DataField = 'dt_nascimento'
    DataSource = dsPessoas
    TabOrder = 5
  end
  object edtCPF: TDBEdit
    Left = 65
    Top = 449
    Width = 115
    Height = 21
    DataField = 'cpf'
    DataSource = dsPessoas
    TabOrder = 6
  end
  object dbRgTipo: TDBRadioGroup
    Left = 216
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
    TabOrder = 7
  end
  object edtTelefone: TDBEdit
    Left = 65
    Top = 476
    Width = 115
    Height = 21
    DataField = 'telefone'
    DataSource = dsPessoas
    TabOrder = 8
  end
  object edtCelular: TDBEdit
    Left = 240
    Top = 476
    Width = 115
    Height = 21
    DataField = 'celular'
    DataSource = dsPessoas
    TabOrder = 9
  end
  object edtCadastro: TDBEdit
    Left = 216
    Top = 368
    Width = 127
    Height = 21
    DataField = 'dt_cadastro'
    DataSource = dsPessoas
    Enabled = False
    TabOrder = 3
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
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select * from pessoas')
    Left = 424
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
      EditMask = '!99/99/0000;1;_'
    end
    object qryPessoascpf: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 14
      FieldName = 'cpf'
      Origin = 'cpf'
      EditMask = '999.999.999-99'
      Size = 14
    end
    object qryPessoastelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      EditMask = '(99) 9999999999;1;_'
      Size = 13
    end
    object qryPessoascelular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'celular'
      Origin = 'celular'
      EditMask = '(99) 9999999999;1;_'
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
      ReadOnly = True
    end
  end
  object dsPessoas: TDataSource
    AutoEdit = False
    DataSet = qryPessoas
    Left = 304
    Top = 208
  end
end
