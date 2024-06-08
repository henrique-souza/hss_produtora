unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    mniCadastro: TMenuItem;
    mniTitulares: TMenuItem;
    mniN1: TMenuItem;
    mniSair: TMenuItem;
    pnlAvaliacaoLogica: TPanel;
    lbledtAvaliacaoLogica: TLabeledEdit;
    btnSomar: TButton;
    procedure mniSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniTitularesClick(Sender: TObject);
    procedure btnSomarClick(Sender: TObject);
  private
    { Private declarations }
  public
    function SomaSequencial(Numero: Integer): Integer;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uDMDatabaseConnection, uTitular;

{$R *.dfm}

procedure TfrmPrincipal.btnSomarClick(Sender: TObject);
begin
  ShowMessage(IntToStr(SomaSequencial(StrToInt(lbledtAvaliacaoLogica.Text))));
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  dtmdlDBConnection := TdtmdlDBConnection.Create(Self);
end;

procedure TfrmPrincipal.mniSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.mniTitularesClick(Sender: TObject);
begin
  frmTitular := TfrmTitular.Create(Self);
  frmTitular.ShowModal;
  frmTitular.Release;
end;

function TfrmPrincipal.SomaSequencial(Numero: Integer): Integer;
var
  I, Soma: Integer;
begin
  Soma := 0;

  for I := Numero to Numero + 100 do
  begin
    Soma := Soma + I;
  end;

  Result := Soma;
end;

end.
