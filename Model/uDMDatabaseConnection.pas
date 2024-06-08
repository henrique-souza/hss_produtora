unit uDMDatabaseConnection;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdtmdlDBConnection = class(TDataModule)
    conDatabaseConnection: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmdlDBConnection: TdtmdlDBConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
