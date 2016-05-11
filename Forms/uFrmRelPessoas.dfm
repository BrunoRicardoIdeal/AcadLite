object frmRelPessoas: TfrmRelPessoas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de pessoas'
  ClientHeight = 250
  ClientWidth = 480
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 31
    Top = 85
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object lblEData: TLabel
    Left = 273
    Top = 112
    Width = 6
    Height = 13
    Caption = 'e'
    Enabled = False
  end
  object Label1: TLabel
    Left = 9
    Top = 130
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label2: TLabel
    Left = 18
    Top = 156
    Width = 33
    Height = 13
    Caption = 'Celular'
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
  object cbTipo: TComboBox
    Left = 56
    Top = 82
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
  object dtNascFim: TDateTimePicker
    Left = 287
    Top = 107
    Width = 83
    Height = 21
    Date = 42487.935495578710000000
    Time = 42487.935495578710000000
    Enabled = False
    TabOrder = 5
  end
  object dtNascIni: TDateTimePicker
    Left = 185
    Top = 107
    Width = 83
    Height = 21
    Date = 42487.935495578710000000
    Time = 42487.935495578710000000
    Enabled = False
    TabOrder = 4
  end
  object chkHabDtNasc: TCheckBox
    Left = 56
    Top = 107
    Width = 123
    Height = 21
    Caption = 'Dt. Nascimento entre'
    TabOrder = 3
    OnClick = chkHabDtNascClick
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 209
    Width = 480
    Height = 41
    Align = alBottom
    TabOrder = 8
    object btnEmitir: TButton
      Left = 404
      Top = 1
      Width = 75
      Height = 39
      Action = acEmitir
      Align = alRight
      TabOrder = 0
    end
    object btnLimpar: TButton
      Left = 329
      Top = 1
      Width = 75
      Height = 39
      Action = acLimpar
      Align = alRight
      TabOrder = 1
    end
  end
  object maskEdtTel: TMaskEdit
    Left = 56
    Top = 127
    Width = 119
    Height = 21
    EditMask = '(99) 9999999999;1;_'
    MaxLength = 15
    TabOrder = 6
    Text = '(  )           '
  end
  object maskEdtCel: TMaskEdit
    Left = 56
    Top = 153
    Width = 119
    Height = 21
    EditMask = '(99) 9999999999;1;_'
    MaxLength = 15
    TabOrder = 7
    Text = '(  )           '
  end
  object ActionList: TActionList
    Left = 232
    Top = 128
    object acLimpar: TAction
      Caption = 'Limpar'
      OnExecute = acLimparExecute
    end
    object acEmitir: TAction
      Caption = 'Emitir'
      OnExecute = acEmitirExecute
    end
  end
  object qryPessoas: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'Select * from pessoas')
    Left = 288
    Top = 136
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
      Size = 11
    end
    object qryPessoastelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 12
    end
    object qryPessoascelular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'celular'
      Origin = 'celular'
      Size = 12
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
  end
  object frxPessoas: TfrxReport
    Version = '5.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42488.413174131900000000
    ReportOptions.LastChange = 42488.413174131900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnBeforePrint = frxPessoasBeforePrint
    Left = 368
    Top = 136
    Datasets = <
      item
        DataSet = frxDBPessoas
        DataSetName = 'frxDBPessoas'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 264.567100000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBPessoas
        DataSetName = 'frxDBPessoas'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'cod_pessoa'
          DataSet = frxDBPessoas
          DataSetName = 'frxDBPessoas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBPessoas."cod_pessoa"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 71.811070000000000000
          Top = 3.779530000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          DataField = 'nome'
          DataSet = frxDBPessoas
          DataSetName = 'frxDBPessoas'
          Memo.UTF8W = (
            '[frxDBPessoas."nome"]')
        end
        object Memo9: TfrxMemoView
          Left = 454.441250000000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'tipo'
          DataSet = frxDBPessoas
          DataSetName = 'frxDBPessoas'
          Memo.UTF8W = (
            '[frxDBPessoas."tipo"]')
        end
        object Memo10: TfrxMemoView
          Left = 534.811380000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'dt_nascimento'
          DataSet = frxDBPessoas
          DataSetName = 'frxDBPessoas'
          Memo.UTF8W = (
            '[frxDBPessoas."dt_nascimento"]')
        end
        object Memo11: TfrxMemoView
          Left = 619.181510000000000000
          Top = 3.779530000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'telefone'
          DataSet = frxDBPessoas
          DataSetName = 'frxDBPessoas'
          Memo.UTF8W = (
            '[frxDBPessoas."telefone"]')
        end
        object Memo12: TfrxMemoView
          Left = 732.567410000000000000
          Top = 3.779530000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'celular'
          DataSet = frxDBPessoas
          DataSetName = 'frxDBPessoas'
          Memo.UTF8W = (
            '[frxDBPessoas."celular"]')
        end
        object Memo20: TfrxMemoView
          Left = 359.055350000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'cpf'
          DataSet = frxDBPessoas
          DataSetName = 'frxDBPessoas'
          Memo.UTF8W = (
            '[frxDBPessoas."cpf"]')
        end
        object Memo22: TfrxMemoView
          Left = 842.835190000000000000
          Top = 3.779530000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataField = 'dt_cadastro'
          DataSet = frxDBPessoas
          DataSetName = 'frxDBPessoas'
          Memo.UTF8W = (
            '[frxDBPessoas."dt_cadastro"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 355.275820000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 480.000310000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[PAGE#] of [TOTALPAGES#]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 185.196970000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 7.559060000000000000
          Top = 158.740260000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 71.811070000000000000
          Top = 158.740260000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 454.441250000000000000
          Top = 158.740260000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 534.811380000000000000
          Top = 158.740260000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Nasc.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 619.181510000000000000
          Top = 158.740260000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 732.567410000000000000
          Top = 158.740260000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Celular')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 7.559060000000000000
          Top = 181.417440000000000000
          Width = 1035.591220000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo13: TfrxMemoView
          Left = 377.953000000000000000
          Top = 7.559060000000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Pessoas')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 7.559060000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Filtros: ')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 105.826840000000000000
          Top = 64.252010000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'digo:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 105.826840000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Nome:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 41.574830000000000000
          Top = 122.944960000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Nascimento Entre:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 555.590910000000000000
          Top = 64.252010000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Telefone:')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 555.590910000000000000
          Top = 94.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Celular:')
          ParentFont = False
        end
        object memoFiltroCod: TfrxMemoView
          Left = 211.653680000000000000
          Top = 64.252010000000000000
          Width = 332.598640000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'N'#227'o informado')
          ParentFont = False
        end
        object MemoFiltroNome: TfrxMemoView
          Left = 211.653680000000000000
          Top = 94.267780000000000000
          Width = 332.598640000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'N'#227'o informado')
          ParentFont = False
        end
        object MemoFiltroDtNasc: TfrxMemoView
          Left = 211.653680000000000000
          Top = 122.944960000000000000
          Width = 332.598640000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'N'#227'o informado')
          ParentFont = False
        end
        object MemoFiltroTel: TfrxMemoView
          Left = 653.858690000000000000
          Top = 64.252010000000000000
          Width = 385.512060000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'N'#227'o informado')
          ParentFont = False
        end
        object MemoFiltroCel: TfrxMemoView
          Left = 653.858690000000000000
          Top = 94.267780000000000000
          Width = 385.512060000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'N'#227'o informado')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 359.055350000000000000
          Top = 158.740260000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CPF')
          ParentFont = False
        end
        object memo29: TfrxMemoView
          Left = 555.370440000000000000
          Top = 122.944960000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Tipo:')
          ParentFont = False
        end
        object MemoFiltroTipo: TfrxMemoView
          Left = 654.638220000000000000
          Top = 122.944960000000000000
          Width = 385.512060000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'N'#227'o informado')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 842.835190000000000000
          Top = 158.740260000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Cad.')
          ParentFont = False
        end
      end
    end
  end
  object frxDBPessoas: TfrxDBDataset
    UserName = 'frxDBPessoas'
    CloseDataSource = False
    DataSet = qryPessoas
    BCDToCurrency = False
    Left = 384
    Top = 80
  end
end
