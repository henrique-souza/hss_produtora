program HSS_PRODUCOES;

uses
  Vcl.Forms,
  uPrincipal in 'View\uPrincipal.pas' {frmPrincipal},
  uPaiCrud in 'View\uPaiCrud.pas' {fPaiCrud},
  uDMDatabaseConnection in 'Model\uDMDatabaseConnection.pas' {dtmdlDBConnection: TDataModule},
  uTitular in 'View\uTitular.pas' {frmTitular};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
