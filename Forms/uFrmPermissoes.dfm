object frmPermissoes: TfrmPermissoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Permiss'#245'es de Usu'#225'rios'
  ClientHeight = 546
  ClientWidth = 584
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
  object Label2: TLabel
    Left = 27
    Top = 43
    Width = 28
    Height = 13
    Caption = 'Filtrar'
  end
  object Label1: TLabel
    Left = 19
    Top = 11
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object grdPermissao: TDBGrid
    Left = 0
    Top = 67
    Width = 584
    Height = 438
    Align = alBottom
    DataSource = dsPermissoes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grdPermissaoDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 427
        Visible = True
      end>
  end
  object edtFiltrar: TEdit
    Left = 61
    Top = 40
    Width = 367
    Height = 21
    TabOrder = 0
    OnChange = edtFiltrarChange
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 505
    Width = 584
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 511
    ExplicitWidth = 455
    object btnConceder: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = '&Conceder'
      TabOrder = 0
      OnClick = btnConcederClick
      ExplicitLeft = 192
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object btnRetirar: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = '&Retirar'
      TabOrder = 1
      OnClick = btnRetirarClick
      ExplicitLeft = 105
      ExplicitTop = -1
    end
    object btnConcederTodas: TButton
      Left = 379
      Top = 1
      Width = 102
      Height = 39
      Align = alRight
      Caption = 'C&onceder Todas'
      TabOrder = 2
      OnClick = btnConcederTodasClick
      ExplicitLeft = 208
      ExplicitTop = 6
    end
    object btnRetirarTodas: TButton
      Left = 481
      Top = 1
      Width = 102
      Height = 39
      Align = alRight
      Caption = 'RetirarTodas'
      TabOrder = 3
      OnClick = btnRetirarTodasClick
      ExplicitLeft = 277
    end
  end
  object edtNomeUsu: TEdit
    Left = 61
    Top = 8
    Width = 367
    Height = 21
    Enabled = False
    TabOrder = 3
    OnChange = edtFiltrarChange
  end
  object qryPermissoes: TFDQuery
    FilterOptions = [foCaseInsensitive]
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select u.nome '
      #9#9',p.descricao'
      '                ,p.cod_permissao'
      #9#9',(select id '
      #9#9#9#9#9'from permissoes_usuarios pu '
      #9#9#9#9#9'where pu.cod_usuario = u.id'
      #9#9#9#9#9'and pu.cod_permissao = p.cod_permissao ) id_pu'#9#9'  '#9#9#9
      'from usuarios u , permissoes p'
      'where u.id = :cod_usuario'
      'order by u.nome')
    Left = 376
    Top = 96
    ParamData = <
      item
        Name = 'COD_USUARIO'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
    object qryPermissoesnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      ReadOnly = True
      Size = 50
    end
    object qryPermissoesdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryPermissoesid_pu: TIntegerField
      FieldName = 'id_pu'
      ReadOnly = True
    end
    object qryPermissoescod_permissao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_permissao'
      Origin = 'cod_permissao'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsPermissoes: TDataSource
    DataSet = qryPermissoes
    Left = 376
    Top = 152
  end
  object qryConceder: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select id,cod_usuario,cod_permissao'
      'from permissoes_usuarios'
      'where id = :id')
    Left = 224
    Top = 232
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryConcederid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryConcedercod_usuario: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_usuario'
      Origin = 'cod_usuario'
    end
    object qryConcedercod_permissao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_permissao'
      Origin = 'cod_permissao'
    end
  end
end
