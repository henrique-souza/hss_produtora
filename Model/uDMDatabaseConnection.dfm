object dtmdlDBConnection: TdtmdlDBConnection
  Height = 480
  Width = 640
  object conDatabaseConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security ' +
      'Info=False;User ID="";Initial Catalog=HSS_PRODUCOES;Data Source=' +
      'HENRIQUE\SQLEXPRESS01;Initial File Name="";Server SPN="";Authent' +
      'ication="";Access Token=""'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 264
    Top = 96
  end
end
