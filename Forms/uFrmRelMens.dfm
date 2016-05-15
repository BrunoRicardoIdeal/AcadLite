object frmRelMens: TfrmRelMens
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Mensalidades'
  ClientHeight = 326
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lblEDataVenc: TLabel
    Left = 289
    Top = 117
    Width = 6
    Height = 13
    Caption = 'e'
    Enabled = False
  end
  object Label1: TLabel
    Left = 38
    Top = 91
    Width = 27
    Height = 13
    Caption = 'Aluno'
  end
  object lblEdtCod: TLabeledEdit
    Left = 72
    Top = 35
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
    Top = 62
    Width = 314
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o'
    LabelPosition = lpLeft
    TabOrder = 1
  end
  object chkHabDtVenc: TCheckBox
    Left = 72
    Top = 113
    Width = 123
    Height = 17
    Caption = 'Dt. Vencimento entre'
    TabOrder = 3
    OnClick = chkHabDtVencClick
  end
  object dtVencIni: TDateTimePicker
    Left = 200
    Top = 111
    Width = 83
    Height = 21
    Date = 42487.935495578710000000
    Time = 42487.935495578710000000
    Enabled = False
    TabOrder = 4
  end
  object dtVencFim: TDateTimePicker
    Left = 303
    Top = 112
    Width = 83
    Height = 21
    Date = 42487.935495578710000000
    Time = 42487.935495578710000000
    Enabled = False
    TabOrder = 5
  end
  object cbAlunos: TComboBox
    Left = 72
    Top = 88
    Width = 314
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 2
  end
  object rgPsqRec: TRadioGroup
    Left = 72
    Top = 137
    Width = 226
    Height = 49
    Caption = 'Recebidas'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Todas'
      'Sim'
      'N'#227'o')
    TabOrder = 6
  end
  object rgInad: TRadioGroup
    Left = 72
    Top = 192
    Width = 226
    Height = 49
    Caption = 'Inadimpl'#234'ncia'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Sim'
      'N'#227'o')
    TabOrder = 7
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 285
    Width = 418
    Height = 41
    Align = alBottom
    TabOrder = 8
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
  object qryAlunos: TFDQuery
    Connection = dmPrincipal.MySQLConn
    SQL.Strings = (
      'SELECT COD_PESSOA'
      '       ,NOME'
      'FROM PESSOAS'
      'WHERE TIPO = '#39'Aluno'#39
      'ORDER BY NOME')
    Left = 328
    Top = 88
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
  object ActionList: TActionList
    Left = 334
    Top = 136
    object acLimpar: TAction
      Caption = 'Limpar'
      OnExecute = acLimparExecute
    end
    object acEmitir: TAction
      Caption = 'Emitir'
      OnExecute = acEmitirExecute
    end
  end
  object qryMensalidade: TFDQuery
    Active = True
    AggregatesActive = True
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
      'FROM MENSALIDADES M, PESSOAS P'
      'WHERE M.COD_ALUNO = P.COD_PESSOA      ')
    Left = 326
    Top = 32
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
  end
  object frxMens: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42496.744107569400000000
    ReportOptions.LastChange = 42496.753557419000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnBeforePrint = frxMensBeforePrint
    Left = 344
    Top = 208
    Datasets = <
      item
        DataSet = frxDBMens
        DataSetName = 'frxDBMens'
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
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 200.315090000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 8.559060000000000000
          Top = 170.078850000000000000
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
          Top = 170.078850000000000000
          Width = 249.448980000000000000
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
          Left = 329.378170000000000000
          Top = 170.078850000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Aluno')
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
            'Relat'#243'rio de Mensalidades')
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
          Top = 92.708720000000000000
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
          Top = 92.708720000000000000
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
          Left = 822.055660000000000000
          Top = 170.078850000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Recebimento')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 525.354670000000000000
          Top = 68.141775000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Aluno:')
          ParentFont = False
        end
        object MemoFiltroAluno: TfrxMemoView
          Left = 684.535870000000000000
          Top = 68.031540000000000000
          Width = 332.598640000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'N'#227'o Informado')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 525.354670000000000000
          Top = 93.043367500000000000
          Width = 147.401670000000000000
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
          Left = 684.535870000000000000
          Top = 93.267780000000000000
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
        object Memo25: TfrxMemoView
          Left = 617.622450000000000000
          Top = 170.078850000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 721.669821020000000000
          Top = 170.078850000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Recebido')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 105.826840000000000000
          Top = 117.165430000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Recebidas:')
          ParentFont = False
        end
        object MemoFiltroReceb: TfrxMemoView
          Left = 212.094620000000000000
          Top = 117.165430000000000000
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
        object Memo29: TfrxMemoView
          Left = 525.354670000000000000
          Top = 117.944960000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Inadimpl'#234'ncia:')
          ParentFont = False
        end
        object MemoFiltroInad: TfrxMemoView
          Left = 684.535870000000000000
          Top = 118.504020000000000000
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
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBMens."DT_VENCIMENTO"'
        object Memo19: TfrxMemoView
          Left = 8.456710000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Vencimento:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 124.724490000000000000
          Top = 0.779530000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataField = 'DT_VENCIMENTO'
          DataSet = frxDBMens
          DataSetName = 'frxDBMens'
          Memo.UTF8W = (
            '[frxDBMens."DT_VENCIMENTO"]')
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 370.393940000000000000
        Width = 1046.929810000000000000
        object Shape2: TfrxShapeView
          Left = 569.606680000000000000
          Top = 14.118120000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          Shape = skRoundRectangle
        end
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
        object SysMemo4: TfrxSysMemoView
          Left = 613.842858980000000000
          Top = 15.118120000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.ThousandSeparator = '.'
          DisplayFormat.FormatStr = '##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBMens."VALOR">,MasterData1)]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 573.047620000000000000
          Top = 15.118120000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total:')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 721.669821020000000000
          Top = 15.118120000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.ThousandSeparator = '.'
          DisplayFormat.FormatStr = '##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBMens."VALOR_RECEBIDO">,MasterData1)]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 325.039580000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBMens
        DataSetName = 'frxDBMens'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 8.559060000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'COD_MENSALIDADE'
          DataSet = frxDBMens
          DataSetName = 'frxDBMens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBMens."COD_MENSALIDADE"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 71.811070000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO'
          DataSet = frxDBMens
          DataSetName = 'frxDBMens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMens."DESCRICAO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 329.378170000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxDBMens
          DataSetName = 'frxDBMens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMens."NOME"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 825.835190000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'DT_RECEBIMENTO'
          DataSet = frxDBMens
          DataSetName = 'frxDBMens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMens."DT_RECEBIMENTO"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 617.622450000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'VALOR'
          DataSet = frxDBMens
          DataSetName = 'frxDBMens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBMens."VALOR"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 721.669821020000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'VALOR_RECEBIDO'
          DataSet = frxDBMens
          DataSetName = 'frxDBMens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBMens."VALOR_RECEBIDO"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 608.504330000000000000
        Width = 1046.929810000000000000
        object SysMemo2: TfrxSysMemoView
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
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 120.944960000000000000
        Top = 464.882190000000000000
        Width = 1046.929810000000000000
        object Shape1: TfrxShapeView
          Left = 11.338590000000000000
          Top = 32.015770000000000000
          Width = 355.275820000000000000
          Height = 68.031540000000000000
          Shape = skRoundRectangle
        end
        object SysMemo5: TfrxSysMemoView
          Left = 105.826840000000000000
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = -22.677180000000000000
          Top = 45.354360000000000000
          Width = 124.724490000000000000
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
        object Memo27: TfrxMemoView
          Left = 7.559060000000000000
          Top = 68.031540000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor:')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 102.826840000000000000
          Top = 68.031540000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBMens."VALOR">,MasterData1)]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 13.897650000000000000
          Top = 15.118120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Totais:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 188.976500000000000000
          Top = 45.354360000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Recebido:')
          ParentFont = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 284.244280000000000000
          Top = 45.354360000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBMens."VALOR_RECEBIDO">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBMens: TfrxDBDataset
    UserName = 'frxDBMens'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_MENSALIDADE=COD_MENSALIDADE'
      'DESCRICAO=DESCRICAO'
      'COD_ALUNO=COD_ALUNO'
      'NOME=NOME'
      'DT_CADASTRO=DT_CADASTRO'
      'DT_RECEBIMENTO=DT_RECEBIMENTO'
      'VALOR=VALOR'
      'VALOR_RECEBIDO=VALOR_RECEBIDO'
      'DT_VENCIMENTO=DT_VENCIMENTO'
      'VENCIDA=VENCIDA')
    DataSet = qryMensalidade
    BCDToCurrency = False
    Left = 200
    Top = 168
  end
end
