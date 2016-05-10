object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 320
  Width = 215
  object MySQLConn: TFDConnection
    Params.Strings = (
      'Database=AcadLite'
      'User_Name=rise'
      'Password=#rise2015'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 16
    Top = 16
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 80
    Top = 16
  end
  object qryLog: TFDQuery
    Connection = MySQLConn
    SQL.Strings = (
      'select  l.id'
      '       ,l.cod_usuario'
      '       ,l.computador'
      '       ,l.operacao'
      'from log l '
      'where 1=2')
    Left = 144
    Top = 16
    object qryLogid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryLogcod_usuario: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_usuario'
      Origin = 'cod_usuario'
    end
    object qryLogcomputador: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'computador'
      Origin = 'computador'
      Size = 50
    end
    object qryLogoperacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'operacao'
      Origin = 'operacao'
      Size = 50
    end
  end
  object cdsEndereco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'XMLTransfProv'
    Left = 48
    Top = 240
    object cdsEnderecocep: TStringField
      FieldName = 'cep'
      Size = 9
    end
    object cdsEnderecologradouro: TStringField
      FieldName = 'logradouro'
      Size = 11
    end
    object cdsEnderecocomplemento: TStringField
      FieldName = 'complemento'
      Size = 10
    end
    object cdsEnderecobairro: TStringField
      FieldName = 'bairro'
      Size = 2
    end
    object cdsEnderecolocalidade: TStringField
      FieldName = 'localidade'
      Size = 9
    end
    object cdsEnderecouf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object cdsEnderecounidade: TStringField
      FieldName = 'unidade'
      Size = 32
    end
    object cdsEnderecoibge: TStringField
      FieldName = 'ibge'
      Size = 7
    end
    object cdsEnderecogia: TStringField
      FieldName = 'gia'
      Size = 4
    end
  end
  object XMLTransfProv: TXMLTransformProvider
    TransformRead.TransformationFile = 'D:\Projetos\AcadLite\AcadLite\docs\TransformationFiles\ToDp.xtr'
    XMLDataFile = 'C:\Users\BRUNO\Desktop\Correios.xml'
    Left = 120
    Top = 240
  end
  object TCPCStatusNet: TIdTCPClient
    ConnectTimeout = 5000
    Host = 'google.com'
    IPVersion = Id_IPv4
    Port = 80
    ReadTimeout = 5000
    Left = 127
    Top = 96
  end
end
