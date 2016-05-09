object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object MySQLConn: TFDConnection
    Params.Strings = (
      'Database=AcadLite'
      'User_Name=rise'
      'Password=#rise2015'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    Left = 88
    Top = 56
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 136
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
    Left = 152
    Top = 80
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
end
