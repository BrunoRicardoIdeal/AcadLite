object frmRelLanc: TfrmRelLanc
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de Lan'#231'amentos'
  ClientHeight = 357
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblEDataVenc: TLabel
    Left = 289
    Top = 163
    Width = 6
    Height = 13
    Caption = 'e'
    Enabled = False
  end
  object Label4: TLabel
    Left = 19
    Top = 85
    Width = 47
    Height = 13
    Caption = 'Categoria'
  end
  object Label1: TLabel
    Left = 17
    Top = 113
    Width = 49
    Height = 13
    Caption = 'Tipo Lanc.'
  end
  object lblEDataLanc: TLabel
    Left = 289
    Top = 187
    Width = 6
    Height = 13
    Caption = 'e'
    Enabled = False
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 316
    Width = 484
    Height = 41
    Align = alBottom
    TabOrder = 12
    object btnEmitir: TButton
      Left = 408
      Top = 1
      Width = 75
      Height = 39
      Action = acEmitir
      Align = alRight
      TabOrder = 0
      ExplicitLeft = 414
    end
    object btnLimpar: TButton
      Left = 333
      Top = 1
      Width = 75
      Height = 39
      Action = acLimpar
      Align = alRight
      TabOrder = 1
    end
  end
  object lblEdtCod: TLabeledEdit
    Left = 72
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
    Left = 72
    Top = 55
    Width = 314
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o'
    LabelPosition = lpLeft
    TabOrder = 1
  end
  object chkExcluidos: TCheckBox
    Left = 72
    Top = 138
    Width = 117
    Height = 17
    Caption = 'Somente Exclu'#237'dos'
    TabOrder = 5
  end
  object chkHabDtVenc: TCheckBox
    Left = 72
    Top = 161
    Width = 123
    Height = 17
    Caption = 'Dt. Vencimento entre'
    TabOrder = 6
    OnClick = chkHabDtVencClick
  end
  object dtVencIni: TDateTimePicker
    Left = 200
    Top = 157
    Width = 83
    Height = 21
    Date = 42487.935495578710000000
    Time = 42487.935495578710000000
    Enabled = False
    TabOrder = 7
  end
  object dtVencFim: TDateTimePicker
    Left = 303
    Top = 158
    Width = 83
    Height = 21
    Date = 42487.935495578710000000
    Time = 42487.935495578710000000
    Enabled = False
    TabOrder = 8
  end
  object cbCategoria: TComboBox
    Left = 72
    Top = 82
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
  object chkAtivarTpLanc: TCheckBox
    Left = 402
    Top = 112
    Width = 97
    Height = 17
    Caption = 'Ativar'
    TabOrder = 4
    OnClick = chkAtivarTpLancClick
  end
  object cbTpLanc: TComboBox
    Left = 72
    Top = 110
    Width = 314
    Height = 22
    Style = csOwnerDrawFixed
    Enabled = False
    TabOrder = 3
  end
  object DtLancFim: TDateTimePicker
    Left = 303
    Top = 182
    Width = 83
    Height = 21
    Date = 42487.935495578710000000
    Time = 42487.935495578710000000
    Enabled = False
    TabOrder = 11
  end
  object DtLAncIni: TDateTimePicker
    Left = 200
    Top = 182
    Width = 83
    Height = 21
    Date = 42487.935495578710000000
    Time = 42487.935495578710000000
    Enabled = False
    TabOrder = 10
  end
  object chkHabDtLanc: TCheckBox
    Left = 72
    Top = 184
    Width = 123
    Height = 17
    Caption = 'Dt. Lan'#231'amento entre'
    TabOrder = 9
    OnClick = chkHabDtLancClick
  end
  object ActionList: TActionList
    Left = 248
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
  object dsTipoLanc: TDataSource
    DataSet = qryTipoLanc
    Left = 400
    Top = 190
  end
  object qryTipoLanc: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select cod_tipo_lanc, descricao'
      'from tipos_lancamentos')
    Left = 344
    Top = 246
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
  object qryLanc: TFDQuery
    Active = True
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'select l.cod_lanc '
      '      ,l.descricao'
      '      ,l.dt_lanc'
      '      ,l.dt_vencimento'
      '      ,l.dt_exclusao'
      '      ,l.cod_tipo_lanc'
      '      ,tl.descricao tipo_lanc_desc'
      '      ,tl.categoria'
      'from lancamentos l , tipos_lancamentos tl'
      'where l.cod_tipo_lanc = tl.cod_tipo_lanc')
    Left = 400
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
  end
  object frxLancamentos: TfrxReport
    Version = '5.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42489.429777754600000000
    ReportOptions.LastChange = 42489.429777754600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 200
    Top = 240
    Datasets = <
      item
        DataSet = frxDBLancamentos
        DataSetName = 'frxDBLancamentos'
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
        Top = 332.598640000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBLancamentos
        DataSetName = 'frxDBLancamentos'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'cod_lanc'
          DataSet = frxDBLancamentos
          DataSetName = 'frxDBLancamentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBLancamentos."cod_lanc"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 71.811070000000000000
          Top = 3.779530000000000000
          Width = 423.307360000000000000
          Height = 18.897650000000000000
          DataField = 'descricao'
          DataSet = frxDBLancamentos
          DataSetName = 'frxDBLancamentos'
          Memo.UTF8W = (
            '[frxDBLancamentos."descricao"]')
        end
        object Memo9: TfrxMemoView
          Left = 503.236550000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'categoria'
          DataSet = frxDBLancamentos
          DataSetName = 'frxDBLancamentos'
          Memo.UTF8W = (
            '[frxDBLancamentos."categoria"]')
        end
        object Memo4: TfrxMemoView
          Left = 629.299630000000000000
          Top = 3.779530000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataField = 'dt_lanc'
          DataSet = frxDBLancamentos
          DataSetName = 'frxDBLancamentos'
          Memo.UTF8W = (
            '[frxDBLancamentos."dt_lanc"]')
        end
        object Memo18: TfrxMemoView
          Left = 765.803650000000000000
          Top = 3.779530000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'dt_vencimento'
          DataSet = frxDBLancamentos
          DataSetName = 'frxDBLancamentos'
          Memo.UTF8W = (
            '[frxDBLancamentos."dt_vencimento"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 480.000310000000000000
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
        object SysMemo2: TfrxSysMemoView
          Left = 128.504020000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Quantidade Total:')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 207.874150000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 7.559060000000000000
          Top = 185.196970000000000000
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
          Top = 185.196970000000000000
          Width = 427.086890000000000000
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
          Left = 503.236550000000000000
          Top = 185.196970000000000000
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
            'Relat'#243'rio de Lan'#231'amentos')
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
          Top = 68.252010000000000000
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
          Top = 93.708720000000000000
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
          Top = 68.252010000000000000
          Width = 287.244280000000000000
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
          Top = 93.708720000000000000
          Width = 287.244280000000000000
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
          Top = 119.165430000000000000
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
          Top = 119.165430000000000000
          Width = 287.244280000000000000
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
          Left = 629.299630000000000000
          Top = 185.196970000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Lan'#231'amento')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 582.047620000000000000
          Top = 68.252010000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Tipo Lanc.:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 529.134200000000000000
          Top = 94.598485000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Somente Exclu'#237'dos:')
          ParentFont = False
        end
        object MemoFiltroTpLanc: TfrxMemoView
          Left = 688.315400000000000000
          Top = 68.252010000000000000
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
        object MemoFiltroSomE: TfrxMemoView
          Left = 688.315400000000000000
          Top = 94.488250000000000000
          Width = 332.598640000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'N'#227'o')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 582.047620000000000000
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
            'Dt. Venc.:')
          ParentFont = False
        end
        object MemoFiltroDtVenc: TfrxMemoView
          Left = 688.315400000000000000
          Top = 120.944960000000000000
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
        object Memo11: TfrxMemoView
          Left = 105.826840000000000000
          Top = 144.622140000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dt. Lanc.:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 212.094620000000000000
          Top = 144.622140000000000000
          Width = 287.244280000000000000
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
        object Memo19: TfrxMemoView
          Left = 765.803650000000000000
          Top = 185.196970000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Vencimento')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 287.244280000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBLancamentos."cod_tipo_lanc"'
        object Memo20: TfrxMemoView
          Left = 7.559060000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo de Lan'#231'amento:')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 154.960730000000000000
          Width = 563.149970000000000000
          Height = 18.897650000000000000
          DataField = 'tipo_lanc_desc'
          DataSet = frxDBLancamentos
          DataSetName = 'frxDBLancamentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBLancamentos."tipo_lanc_desc"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 385.512060000000000000
        Width = 1046.929810000000000000
        object SysMemo3: TfrxSysMemoView
          Left = 105.826840000000000000
          Top = 6.220470000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 7.559060000000000000
          Top = 6.220470000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Quantidade:')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 7.559060000000000000
          Top = 4.000000000000000000
          Width = 1035.591220000000000000
          Color = clBlack
          Diagonal = True
        end
      end
    end
  end
  object frxDBLancamentos: TfrxDBDataset
    UserName = 'frxDBLancamentos'
    CloseDataSource = False
    DataSet = qryLanc
    BCDToCurrency = False
    Left = 240
    Top = 184
  end
end
