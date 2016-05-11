object frmRelTpLanc: TfrmRelTpLanc
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de Tipos de Lan'#231'amentos'
  ClientHeight = 250
  ClientWidth = 450
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 31
    Top = 85
    Width = 47
    Height = 13
    Caption = 'Categoria'
  end
  object lblEdtCod: TLabeledEdit
    Left = 84
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
    Left = 84
    Top = 55
    Width = 321
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o'
    LabelPosition = lpLeft
    TabOrder = 1
  end
  object cbCategoria: TComboBox
    Left = 84
    Top = 82
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemIndex = 0
    TabOrder = 2
    Text = 'Todas'
    Items.Strings = (
      'Todas'
      'Receita'
      'Despesa')
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 209
    Width = 450
    Height = 41
    Align = alBottom
    TabOrder = 3
    object btnEmitir: TButton
      Left = 374
      Top = 1
      Width = 75
      Height = 39
      Action = acEmitir
      Align = alRight
      TabOrder = 0
    end
    object btnLimpar: TButton
      Left = 299
      Top = 1
      Width = 75
      Height = 39
      Action = acLimpar
      Align = alRight
      TabOrder = 1
    end
  end
  object ActionList: TActionList
    Left = 232
    Top = 16
    object acLimpar: TAction
      Caption = 'Limpar'
      OnExecute = acLimparExecute
    end
    object acEmitir: TAction
      Caption = 'Emitir'
      OnExecute = acEmitirExecute
    end
  end
  object qryTpLanc: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select * from tipos_lancamentos')
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
  end
  object frxTpLanc: TfrxReport
    Version = '5.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42488.806165925890000000
    ReportOptions.LastChange = 42488.806165925890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnBeforePrint = frxTpLancBeforePrint
    Left = 200
    Top = 96
    Datasets = <
      item
        DataSet = frxDBTpLanc
        DataSetName = 'frxDBTpLanc'
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
        DataSet = frxDBTpLanc
        DataSetName = 'frxDBTpLanc'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'cod_tipo_lanc'
          DataSet = frxDBTpLanc
          DataSetName = 'frxDBTpLanc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBTpLanc."cod_tipo_lanc"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 71.811070000000000000
          Top = 3.779530000000000000
          Width = 370.393940000000000000
          Height = 18.897650000000000000
          DataField = 'descricao'
          DataSet = frxDBTpLanc
          DataSetName = 'frxDBTpLanc'
          Memo.UTF8W = (
            '[frxDBTpLanc."descricao"]')
        end
        object Memo9: TfrxMemoView
          Left = 457.323130000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'categoria'
          DataSet = frxDBTpLanc
          DataSetName = 'frxDBTpLanc'
          Memo.UTF8W = (
            '[frxDBTpLanc."categoria"]')
        end
        object Memo4: TfrxMemoView
          Left = 593.386210000000000000
          Top = 3.779530000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'dt_cadastro'
          DataSet = frxDBTpLanc
          DataSetName = 'frxDBTpLanc'
          Memo.UTF8W = (
            '[frxDBTpLanc."dt_cadastro"]')
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
          Width = 370.393940000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 457.323130000000000000
          Top = 158.740260000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Categoria')
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
          Width = 359.055350000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Tipos de Lan'#231'amentos')
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
            'Descri'#231#227'o:')
          ParentFont = False
        end
        object memoFiltroCod: TfrxMemoView
          Left = 212.094620000000000000
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
        object MemoFiltroDesc: TfrxMemoView
          Left = 212.094620000000000000
          Top = 94.488250000000000000
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
        object memo29: TfrxMemoView
          Left = 105.826840000000000000
          Top = 120.944960000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Categoria:')
          ParentFont = False
        end
        object MemoFiltroCat: TfrxMemoView
          Left = 212.094620000000000000
          Top = 120.944960000000000000
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
        object Memo5: TfrxMemoView
          Left = 593.386210000000000000
          Top = 158.740260000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Cadastro')
          ParentFont = False
        end
      end
    end
  end
  object frxDBTpLanc: TfrxDBDataset
    UserName = 'frxDBTpLanc'
    CloseDataSource = False
    DataSet = qryTpLanc
    BCDToCurrency = False
    Left = 272
    Top = 104
  end
end
