object frmUsuarios: TfrmUsuarios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Usu'#225'rios'
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lblNome: TLabel
    Left = 95
    Top = 398
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object lblCodpes: TLabel
    Left = 89
    Top = 371
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 800
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
      TabOrder = 2
    end
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
  object grdUsuarios: TDBGrid
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
        FieldName = 'id'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Visible = True
      end>
  end
  object edtNome: TDBEdit
    Left = 129
    Top = 395
    Width = 323
    Height = 21
    DataField = 'nome'
    DataSource = dsPessoas
    TabOrder = 3
  end
  object edtCodUsu: TDBEdit
    Left = 129
    Top = 368
    Width = 73
    Height = 21
    DataField = 'id'
    DataSource = dsPessoas
    Enabled = False
    TabOrder = 2
  end
  object lblEdtNovaSenha: TLabeledEdit
    Left = 129
    Top = 423
    Width = 121
    Height = 21
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'Nova Senha'
    LabelPosition = lpLeft
    PasswordChar = '*'
    TabOrder = 4
  end
  object lblEdtConfNovaSenha: TLabeledEdit
    Left = 129
    Top = 450
    Width = 121
    Height = 21
    EditLabel.Width = 108
    EditLabel.Height = 13
    EditLabel.Caption = 'Confirmar Nova Senha'
    LabelPosition = lpLeft
    PasswordChar = '*'
    TabOrder = 5
  end
  object AcList: TActionList
    Left = 240
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
  end
  object qryUsuarios: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select * from usuarios'
      'where 1 = 2')
    Left = 416
    Top = 192
    object qryUsuariosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryUsuariosnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object qryUsuariossenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha'
      Origin = 'senha'
      Size = 50
    end
    object qryUsuariosadmin: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'admin'
      Origin = 'admin'
      FixedChar = True
      Size = 1
    end
  end
  object dsPessoas: TDataSource
    AutoEdit = False
    DataSet = qryUsuarios
    Left = 256
    Top = 184
  end
end
