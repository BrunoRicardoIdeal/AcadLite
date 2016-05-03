object frmRelEquip: TfrmRelEquip
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de Equipamento'
  ClientHeight = 186
  ClientWidth = 418
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
  object Label4: TLabel
    Left = 31
    Top = 85
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 145
    Width = 418
    Height = 41
    Align = alBottom
    TabOrder = 3
    object btnEmitir: TButton
      Left = 342
      Top = 1
      Width = 75
      Height = 39
      Action = acEmitir
      Align = alRight
      TabOrder = 0
    end
    object btnLimpar: TButton
      Left = 267
      Top = 1
      Width = 75
      Height = 39
      Action = acLimpar
      Align = alRight
      TabOrder = 1
    end
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
      'Ergometria'
      'Muscula'#231#227'o')
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
  object qryEquip: TFDQuery
    Active = True
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select * from equipamentos')
    Left = 302
    Top = 78
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
  object frxEquip: TfrxReport
    Version = '5.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42488.806165925900000000
    ReportOptions.LastChange = 42488.806165925900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnBeforePrint = frxEquipBeforePrint
    Left = 200
    Top = 96
    Datasets = <
      item
        DataSet = frxDBEquip
        DataSetName = 'frxDBEquip'
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
        DataSet = frxDBEquip
        DataSetName = 'frxDBEquip'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'cod_equip'
          DataSet = frxDBEquip
          DataSetName = 'frxDBEquip'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBEquip."cod_equip"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 71.811070000000000000
          Top = 6.907416896551720000
          Width = 631.181510000000000000
          Height = 19.549293103448300000
          DataField = 'nome'
          DataSet = frxDBEquip
          DataSetName = 'frxDBEquip'
          Memo.UTF8W = (
            '[frxDBEquip."nome"]')
        end
        object Memo9: TfrxMemoView
          Left = 710.551640000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'tipo'
          DataSet = frxDBEquip
          DataSetName = 'frxDBEquip'
          Memo.UTF8W = (
            '[frxDBEquip."tipo"]')
        end
        object Memo4: TfrxMemoView
          Left = 839.055660000000000000
          Top = 3.779530000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DataField = 'dt_cadastro'
          DataSet = frxDBEquip
          DataSetName = 'frxDBEquip'
          Memo.UTF8W = (
            '[frxDBEquip."dt_cadastro"]')
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
          Width = 631.181510000000000000
          Height = 19.549293103448300000
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
          Left = 710.551640000000000000
          Top = 158.740260000000000000
          Width = 120.944960000000000000
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
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Equipamentos')
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
        object MemoFiltroNome: TfrxMemoView
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
            'Tipo:')
          ParentFont = False
        end
        object MemoFiltroTipo: TfrxMemoView
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
          Left = 839.055660000000000000
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
  object frxDBEquip: TfrxDBDataset
    UserName = 'frxDBEquip'
    CloseDataSource = False
    DataSet = qryEquip
    BCDToCurrency = False
    Left = 272
    Top = 104
  end
end
