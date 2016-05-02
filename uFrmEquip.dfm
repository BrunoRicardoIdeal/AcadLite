object frmEquip: TfrmEquip
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Equipamento'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
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
  object Label5: TLabel
    Left = 148
    Top = 371
    Width = 37
    Height = 13
    Caption = 'Dt. Cad'
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
      Width = 128
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 2
      Text = 'Todos'
      Items.Strings = (
        'Todos'
        'Ergometria'
        'Muscula'#231#227'o'
        'Outro')
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 559
    Width = 800
    Height = 41
    Align = alBottom
    TabOrder = 1
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
      Enabled = False
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
      Enabled = False
      TabOrder = 4
    end
  end
  object grdEquip: TDBGrid
    Left = 0
    Top = 113
    Width = 800
    Height = 240
    Align = alTop
    DataSource = dsEquip
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_equip'
        Title.Caption = 'C'#243'd. Equip'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 400
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
        Title.Caption = 'Dt. Cadastro'
        Visible = True
      end>
  end
  object edtCodEquip: TDBEdit
    Left = 65
    Top = 368
    Width = 73
    Height = 21
    DataField = 'cod_equip'
    DataSource = dsEquip
    Enabled = False
    TabOrder = 3
  end
  object edtNome: TDBEdit
    Left = 65
    Top = 395
    Width = 323
    Height = 21
    DataField = 'nome'
    DataSource = dsEquip
    TabOrder = 5
  end
  object dbRgTipo: TDBRadioGroup
    Left = 65
    Top = 422
    Width = 305
    Height = 48
    Caption = 'Tipo'
    Columns = 3
    DataField = 'tipo'
    DataSource = dsEquip
    Items.Strings = (
      'Ergometria'
      'Muscula'#231#227'o'
      'Outro')
    TabOrder = 6
  end
  object edtCadastro: TDBEdit
    Left = 194
    Top = 368
    Width = 127
    Height = 21
    DataField = 'dt_cadastro'
    DataSource = dsEquip
    Enabled = False
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
      ShortCut = 114
      OnExecute = acGravarExecute
    end
    object acCancelar: TAction
      Caption = 'Cancelar'
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
      ShortCut = 117
      OnExecute = acPesquisarExecute
    end
  end
  object qryEquip: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select * from equipamentos')
    Left = 544
    Top = 376
    object qryEquipcod_equip: TFDAutoIncField
      FieldName = 'cod_equip'
      Origin = 'cod_equip'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryEquipnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object qryEquiptipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 15
    end
    object qryEquipdt_cadastro: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_cadastro'
      Origin = 'dt_cadastro'
      ReadOnly = True
    end
  end
  object dsEquip: TDataSource
    AutoEdit = False
    DataSet = qryEquip
    Left = 448
    Top = 368
  end
end
