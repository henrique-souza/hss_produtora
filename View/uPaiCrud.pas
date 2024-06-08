unit uPaiCrud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls, Data.DB, Data.Win.ADODB, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.JSON,
  REST.HttpClient, System.UITypes;

type
  TfPaiCrud = class(TForm)
    pnlRodape: TPanel;
    pgcPrincipal: TPageControl;
    tsListagem: TTabSheet;
    tsCadastroTitulares: TTabSheet;
    dbgrdListagem: TDBGrid;
    btnInserir: TBitBtn;
    btnEditar: TBitBtn;
    btnApagar: TBitBtn;
    btnCancelar: TBitBtn;
    btnFechar: TBitBtn;
    dbnvgr1: TDBNavigator;
    btnGravar: TBitBtn;
    qryListagem: TADOQuery;
    dsListagem: TDataSource;
    grp2: TGroupBox;
    grp4: TGroupBox;
    pnl1: TPanel;
    pnl2: TPanel;
    bvl1: TBevel;
    rstclntClientCEP: TRESTClient;
    rstrqstRequestCEP: TRESTRequest;
    rstrspnsResponseCEP: TRESTResponse;
    lbledtCEP: TLabeledEdit;
    lbledtRua: TLabeledEdit;
    lbledtBairro: TLabeledEdit;
    lbledtCidade: TLabeledEdit;
    lbledtEstado: TLabeledEdit;
    btnCEPViaAPI: TBitBtn;
    lbledtNome: TLabeledEdit;
    lbledtNacionalidade: TLabeledEdit;
    grpDataDeNascimento: TGroupBox;
    dtpDataDeNascimento: TDateTimePicker;
    lbledtCPF: TLabeledEdit;
    rgSexo: TRadioGroup;
    rgEstadoCivil: TRadioGroup;
    lbledtID: TLabeledEdit;
    lbledtComplemento: TLabeledEdit;
    rgFlagAtivo: TRadioGroup;
    lbledtNumero: TLabeledEdit;
    lbledtPais: TLabeledEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdListagemTitleClick(Column: TColumn);
    procedure btnCEPViaAPIClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgFlagAtivoExit(Sender: TObject);
    procedure dbgrdListagemCellClick(Column: TColumn);
    procedure dbgrdListagemDblClick(Sender: TObject);
    procedure rgSexoExit(Sender: TObject);
    procedure rgEstadoCivilExit(Sender: TObject);
    procedure lbledtNomeExit(Sender: TObject);
  private
    procedure ControlarBotoes(btnInserir, btnEditar, btnApagar, btnGravar,
      btnCancelar: TBitBtn; LNavegador: TDBNavigator;
      LpgcPrincipal: TPageControl; LFlag: Boolean);
    procedure ControlarIndice(FpgcPrincipal: TPageControl; Indice: Integer);
    function VerificarComponentes: string;
    procedure LimparCampos(Form: TForm);
  public
    IndiceGrid: string;

    FFlagAtivo: string;
    FSexo: string;
    FEstadoCivil: string;
  end;

var
  fPaiCrud: TfPaiCrud;

implementation

uses
  uDMDatabaseConnection;

{$R *.dfm}

procedure TfPaiCrud.btnApagarClick(Sender: TObject);
begin
  ControlarBotoes(btnInserir, btnEditar, btnApagar, btnGravar, btnCancelar,
    dbnvgr1, pgcPrincipal, True);

  if MessageDlg('Tem certeza de que deseja deletar este registro?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    qryListagem.Delete;
  end;

  qryListagem.SQL.Text := 'SELECT * FROM Titular';
  qryListagem.Open;
end;

procedure TfPaiCrud.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(btnInserir, btnEditar, btnApagar, btnGravar, btnCancelar,
    dbnvgr1, pgcPrincipal, True);

  ControlarIndice(pgcPrincipal, 0);
end;

procedure TfPaiCrud.btnCEPViaAPIClick(Sender: TObject);
var
  JSONValue: TJSONValue;
  JSONObject: TJSONObject;
begin
  if not(Trim(lbledtCEP.Text) = EmptyStr) and (Length(lbledtCEP.Text) = 9) then
  begin
    rstclntClientCEP.BaseURL := 'http://viacep.com.br/ws/' +
      StringReplace(lbledtCEP.Text, '-', '', [rfReplaceAll, rfIgnoreCase])
      + '/json';

    rstrqstRequestCEP.Execute;
  end
  else
  begin
    MessageDlg('Por favor, insira um CEP válido', mtWarning, [mbOk], 0, mbOk);
  end;

  try
    JSONValue := TJSONObject.ParseJSONValue
      (TEncoding.ASCII.GetBytes(rstrspnsResponseCEP.Content), 0);

    if JSONValue <> nil then
      try
        JSONObject := JSONValue as TJSONObject;
        lbledtRua.Text := JSONObject.GetValue('logradouro').Value;
        lbledtBairro.Text := JSONObject.GetValue('bairro').Value;
        lbledtCidade.Text := JSONObject.GetValue('localidade').Value;
        lbledtEstado.Text := JSONObject.GetValue('uf').Value;

        lbledtPais.Text := EmptyStr;
      finally
        JSONValue.Free;
        rstclntClientCEP.BaseURL := EmptyStr;
      end;
  except
    on EDBEditError do
    begin
      MessageDlg('Por favor, insira um CEP válido', mtWarning, [mbOk], 0, mbOk);
    end;

    on EHTTPProtocolException do
    begin
      MessageDlg('Por favor, insira um CEP válido', mtWarning, [mbOk], 0, mbOk);
    end;

    on E: Exception do
    begin
      MessageDlg('Por favor, insira um CEP válido', mtWarning, [mbOk], 0, mbOk);
    end;
  end;
end;

procedure TfPaiCrud.btnEditarClick(Sender: TObject);
begin
  ControlarBotoes(btnInserir, btnEditar, btnApagar, btnGravar, btnCancelar,
    dbnvgr1, pgcPrincipal, False);

  qryListagem.Edit;
end;

procedure TfPaiCrud.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfPaiCrud.btnGravarClick(Sender: TObject);
var
  LMensagemDeErro: string;
begin
  LMensagemDeErro := VerificarComponentes;

  if LMensagemDeErro <> '' then
  begin
    ShowMessage(LMensagemDeErro);
  end
  else
  begin
    ControlarBotoes(btnInserir, btnEditar, btnApagar, btnGravar, btnCancelar,
      dbnvgr1, pgcPrincipal, True);

    ControlarIndice(pgcPrincipal, 0);

    qryListagem.Connection.BeginTrans;

    try
      if qryListagem.State = dsInsert then
      begin
        qryListagem.Close;

        qryListagem.SQL.Text :=
          'INSERT INTO Titular (ID, Nome, Nacionalidade, DataNascimento, CPF, '
          + ' Sexo, EstadoCivil, Logradouro, Numero, Complemento, Bairro, CEP, '
          + 'Cidade, UF, Pais, FlagAtivo) VALUES (:ID, :Nome, :Nacionalidade, '
          + ':DataNascimento, :CPF, :Sexo, :EstadoCivil, :Rua, :Numero, :Complemento,'
          + ' :Bairro, :CEP, :Cidade, :Estado, :Pais, :FlagAtivo)';
      end
      else if qryListagem.State = dsEdit then
      begin
        qryListagem.Close;

        qryListagem.SQL.Text :=
          'UPDATE Titular SET Nome = :Nome, Nacionalidade = :Nacionalidade, ' +
          'DataNascimento = :DataNascimento, CPF = :CPF, Sexo = :Sexo, ' +
          'EstadoCivil = :EstadoCivil, Logradouro = :Rua, Numero = :Numero, ' +
          'Complemento = :Complemento, Bairro = :Bairro, CEP = :CEP, ' +
          'Cidade = :Cidade, UF = :Estado, Pais = :Pais, FlagAtivo = :FlagAtivo '
          + 'WHERE ID = :ID';
      end;

      qryListagem.Parameters.ParamByName('ID').Value := lbledtID.Text;
      qryListagem.Parameters.ParamByName('Nome').Value := lbledtNome.Text;
      qryListagem.Parameters.ParamByName('Nacionalidade').Value :=
        lbledtNacionalidade.Text;
      qryListagem.Parameters.ParamByName('DataNascimento').Value :=
        dtpDataDeNascimento.Date;
      qryListagem.Parameters.ParamByName('CPF').Value := lbledtCPF.Text;

      if (rgSexo.ItemIndex = 0) then
      begin
        FSexo := 'M';
      end
      else
      begin
        FSexo := 'F';
      end;

      qryListagem.Parameters.ParamByName('Sexo').Value := FSexo;

      if (rgEstadoCivil.ItemIndex = 0) then
      begin
        FEstadoCivil := 'S';
      end
      else
      begin
        FEstadoCivil := 'C';
      end;

      qryListagem.Parameters.ParamByName('EstadoCivil').Value := FEstadoCivil;
      qryListagem.Parameters.ParamByName('Rua').Value := lbledtRua.Text;
      qryListagem.Parameters.ParamByName('Numero').Value := lbledtNumero.Text;
      qryListagem.Parameters.ParamByName('Complemento').Value :=
        lbledtComplemento.Text;
      qryListagem.Parameters.ParamByName('Bairro').Value := lbledtBairro.Text;
      qryListagem.Parameters.ParamByName('CEP').Value := lbledtCEP.Text;
      qryListagem.Parameters.ParamByName('Cidade').Value := lbledtCidade.Text;
      qryListagem.Parameters.ParamByName('Estado').Value := lbledtEstado.Text;
      qryListagem.Parameters.ParamByName('Pais').Value := lbledtPais.Text;

      if (rgFlagAtivo.ItemIndex = 0) then
      begin
        FFlagAtivo := 'S';
      end
      else
      begin
        FFlagAtivo := 'N';
      end;

      qryListagem.Parameters.ParamByName('FlagAtivo').Value := FFlagAtivo;

      qryListagem.ExecSQL;

      qryListagem.Connection.CommitTrans;
    except
      qryListagem.Connection.RollbackTrans;
      raise;
    end;
  end;

  qryListagem.SQL.Text := 'SELECT * FROM Titular';
  qryListagem.Open;

  LimparCampos(Self);
end;

procedure TfPaiCrud.btnInserirClick(Sender: TObject);
begin
  LimparCampos(Self);

  ControlarBotoes(btnInserir, btnEditar, btnApagar, btnGravar, btnCancelar,
    dbnvgr1, pgcPrincipal, False);

  qryListagem.Insert;
end;

procedure TfPaiCrud.ControlarBotoes(btnInserir, btnEditar, btnApagar, btnGravar,
  btnCancelar: TBitBtn; LNavegador: TDBNavigator; LpgcPrincipal: TPageControl;
  LFlag: Boolean);
begin
  btnInserir.Enabled := LFlag;
  btnEditar.Enabled := LFlag;
  btnApagar.Enabled := LFlag;

  LNavegador.Enabled := LFlag;
  LpgcPrincipal.Pages[0].TabVisible := LFlag;

  btnCancelar.Enabled := not(LFlag);
  btnGravar.Enabled := not(LFlag);
end;

procedure TfPaiCrud.ControlarIndice(FpgcPrincipal: TPageControl;
  Indice: Integer);
begin
  if (FpgcPrincipal.Pages[Indice].TabVisible) then
  begin
    FpgcPrincipal.TabIndex := 0;
  end;
end;

procedure TfPaiCrud.dbgrdListagemCellClick(Column: TColumn);
begin
  lbledtID.Text := dbgrdListagem.Fields[0].AsString;
  lbledtNome.Text := dbgrdListagem.Fields[1].AsString;
  lbledtNacionalidade.Text := dbgrdListagem.Fields[2].AsString;
  dtpDataDeNascimento.Date := dbgrdListagem.Fields[3].AsDateTime;
  lbledtCPF.Text := dbgrdListagem.Fields[4].AsString;

  if (dbgrdListagem.Fields[5].AsString = 'M') then
  begin
    rgSexo.ItemIndex := 0;
  end
  else
  begin
    rgSexo.ItemIndex := 1;
  end;

  if (dbgrdListagem.Fields[6].AsString = 'S') then
  begin
    rgEstadoCivil.ItemIndex := 0;
  end
  else
  begin
    rgEstadoCivil.ItemIndex := 1;
  end;

  lbledtRua.Text := dbgrdListagem.Fields[7].AsString;
  lbledtNumero.Text := dbgrdListagem.Fields[8].AsString;
  lbledtComplemento.Text := dbgrdListagem.Fields[9].AsString;
  lbledtBairro.Text := dbgrdListagem.Fields[10].AsString;
  lbledtCEP.Text := dbgrdListagem.Fields[11].AsString;
  lbledtCidade.Text := dbgrdListagem.Fields[12].AsString;
  lbledtEstado.Text := dbgrdListagem.Fields[13].AsString;
  lbledtPais.Text := dbgrdListagem.Fields[14].AsString;

  if (dbgrdListagem.Fields[15].AsString = 'S') then
  begin
    rgFlagAtivo.ItemIndex := 0;
  end
  else
  begin
    rgFlagAtivo.ItemIndex := 1;
  end;
end;

procedure TfPaiCrud.dbgrdListagemDblClick(Sender: TObject);
begin
  btnEditar.Click;
end;

procedure TfPaiCrud.dbgrdListagemTitleClick(Column: TColumn);
begin
  if qryListagem.Active then
  begin
    qryListagem.Close;

    // Identifica se há a sentença
    if qryListagem.SQL.Text.Contains('ORDER BY') then
    begin
      // Deleta-a
      qryListagem.SQL.Text := qryListagem.SQL.Text.Remove
        (qryListagem.SQL.Text.IndexOf('ORDER BY'));
    end;

    // Adiciona ordenação
    qryListagem.SQL.Add('ORDER BY ' + Column.FieldName);
    qryListagem.Open;
  end;
end;

procedure TfPaiCrud.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryListagem.Close;
end;

procedure TfPaiCrud.FormCreate(Sender: TObject);
begin
  dtpDataDeNascimento.Date := Now;
  pgcPrincipal.ActivePage := tsListagem;
end;

procedure TfPaiCrud.FormShow(Sender: TObject);
begin
  if (qryListagem.SQL.Text <> EmptyStr) then
  begin
    qryListagem.Open;
  end;
end;

procedure TfPaiCrud.lbledtNomeExit(Sender: TObject);
var
  qry: TADOQuery;
begin
  qry := TADOQuery.Create(nil);
  try
    qry.Connection := qryListagem.Connection;

    qry.SQL.Text := 'SELECT COUNT(*) AS Count FROM Titular WHERE Nome = :Nome';
    qry.Parameters.ParamByName('Nome').Value := lbledtNome.Text;
    qry.Open;

    if qry.FieldByName('Count').AsInteger > 0 then
    begin
      ShowMessage('Já existe um titular com este nome.');
      lbledtNome.SetFocus;
    end;
  finally
    qry.Free;
  end;
end;

procedure TfPaiCrud.LimparCampos(Form: TForm);
var
  i: Integer;
begin
  for i := 0 to Form.ComponentCount - 1 do
  begin
    if Form.Components[i] is TLabeledEdit then
    begin
      TLabeledEdit(Form.Components[i]).Text := EmptyStr;
    end
    else if Form.Components[i] is TRadioGroup then
    begin
      TRadioGroup(Form.Components[i]).ItemIndex := -1;
    end
    else if Form.Components[i] is TDateTimePicker then
    begin
      TDateTimePicker(Form.Components[i]).Date := Now;
    end;
  end;
end;

procedure TfPaiCrud.rgEstadoCivilExit(Sender: TObject);
begin
  if (rgEstadoCivil.ItemIndex = 0) then
  begin
    FEstadoCivil := 'S';
  end
  else
  begin
    FEstadoCivil := 'C';
  end;
end;

procedure TfPaiCrud.rgFlagAtivoExit(Sender: TObject);
begin
  if (rgFlagAtivo.ItemIndex = 0) then
  begin
    FFlagAtivo := 'S';
  end
  else
  begin
    FFlagAtivo := 'N';
  end;
end;

procedure TfPaiCrud.rgSexoExit(Sender: TObject);
begin
  if (rgSexo.ItemIndex = 0) then
  begin
    FSexo := 'M';
  end
  else
  begin
    FSexo := 'F';
  end;
end;

function TfPaiCrud.VerificarComponentes: string;
var
  i: Integer;
  Labels: TLabeledEdit;
  CampoData: TDateTimePicker;
  Radios: TRadioGroup;
begin
  Result := '';

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TLabeledEdit then
    begin
      Labels := TLabeledEdit(Components[i]);

      if Trim(Labels.Text) = '' then
      begin
        Result := 'Por favor, preencha o campo ' + Labels.EditLabel.Caption;
        Break;
      end;
    end
    else if Components[i] is TDateTimePicker then
    begin
      CampoData := TDateTimePicker(Components[i]);

      if CampoData.Date = 0 then
      begin
        Result := 'Por favor, selecione uma data válida no campo ' +
          grpDataDeNascimento.Caption;
        Break;
      end;
    end
    else if Components[i] is TRadioGroup then
    begin
      Radios := TRadioGroup(Components[i]);

      if Radios.ItemIndex = -1 then
      begin
        Result := 'Por favor, selecione uma opção no campo ' + Radios.Caption;
        Break;
      end;
    end;
  end;
end;

end.
