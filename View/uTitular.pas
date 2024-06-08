unit uTitular;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPaiCrud,
  Data.DB, Data.Win.ADODB, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.Math;

type
  TfrmTitular = class(TfPaiCrud)
    intgrfldListagemID: TIntegerField;
    strngfldListagemNome: TStringField;
    strngfldListagemNacionalidade: TStringField;
    dtmfldListagemDataNascimento: TDateTimeField;
    strngfldListagemCPF: TStringField;
    strngfldListagemSexo: TStringField;
    strngfldListagemEstadoCivil: TStringField;
    strngfldListagemLogradouro: TStringField;
    strngfldListagemNumero: TStringField;
    strngfldListagemComplemento: TStringField;
    strngfldListagemBairro: TStringField;
    strngfldListagemCEP: TStringField;
    strngfldListagemCidade: TStringField;
    strngfldListagemUF: TStringField;
    strngfldListagemPais: TStringField;
    dtmfldListagemDataInclusao: TDateTimeField;
    strngfldListagemFlagAtivo: TStringField;
    procedure btnInserirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTitular: TfrmTitular;

implementation

{$R *.dfm}
{ TfrmTitular }

procedure TfrmTitular.btnInserirClick(Sender: TObject);
var
  ID: Integer;
  qryMaxID: TADOQuery;
begin
  inherited;

  qryMaxID := TADOQuery.Create(nil);
  try
    qryMaxID.Connection := qryListagem.Connection;
    qryMaxID.SQL.Text := 'SELECT MAX(ID) AS MaxID FROM Titular';
    qryMaxID.Open;
    ID := qryMaxID.FieldByName('MaxID').AsInteger;
    qryMaxID.Close;
  finally
    qryMaxID.Free;
  end;

  Inc(ID);
  lbledtID.Text := IntToStr(ID);
end;

end.
