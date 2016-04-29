object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 150
  Width = 215
  object MySQLConn: TFDConnection
    Params.Strings = (
      'Database=AcadLite'
      'User_Name=rise'
      'Password=#rise2015'
      'Server=localhost'
      'DriverID=MySQL')
    Left = 88
    Top = 56
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 136
    Top = 16
  end
end
