unit uFrmPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.Actions,
  Vcl.ActnList, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error,System.UITypes ,FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Menus;

type
  TfrmPessoas = class(TForm)
    GroupBox1: TGroupBox;
    lblEdtCod: TLabeledEdit;
    lblEdtNome: TLabeledEdit;
    btnPsq: TButton;
    grdPessoas: TDBGrid;
    pnlBotoes: TPanel;
    btnNovo: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    btnEditar: TButton;
    edtCodPes: TDBEdit;
    lblCodpes: TLabel;
    edtNome: TDBEdit;
    lblNome: TLabel;
    edtDtNasc: TDBEdit;
    lblDtNasc: TLabel;
    edtCPF: TDBEdit;
    Label1: TLabel;
    dbRgTipo: TDBRadioGroup;
    btnGravar: TButton;
    AcList: TActionList;
    acNovo: TAction;
    acEditar: TAction;
    acGravar: TAction;
    acCancelar: TAction;
    acExcluir: TAction;
    acPesquisar: TAction;
    edtTelefone: TDBEdit;
    Label2: TLabel;
    edtCelular: TDBEdit;
    Label3: TLabel;
    qryPessoas: TFDQuery;
    dsPessoas: TDataSource;
    Label4: TLabel;
    cbTipo: TComboBox;
    edtCadastro: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    shpRed: TShape;
    Label7: TLabel;
    edtLogradouro: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtCep: TDBEdit;
    Label10: TLabel;
    edtBairro: TDBEdit;
    Label11: TLabel;
    edtComplemento: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    qryPessoascod_pessoa: TFDAutoIncField;
    qryPessoasnome: TStringField;
    qryPessoasdt_nascimento: TDateField;
    qryPessoascpf: TStringField;
    qryPessoastelefone: TStringField;
    qryPessoascelular: TStringField;
    qryPessoastipo: TStringField;
    qryPessoasdt_cadastro: TDateTimeField;
    qryPessoaslogradouro: TStringField;
    qryPessoascomplemento: TStringField;
    qryPessoascep: TStringField;
    qryPessoasbairro: TStringField;
    qryPessoascod_uf: TIntegerField;
    qryPessoascod_cidade: TIntegerField;
    qryUF: TFDQuery;
    qryUFid: TFDAutoIncField;
    qryUFuf: TStringField;
    qryCidade: TFDQuery;
    qryCidadeid: TFDAutoIncField;
    qryCidadenome: TStringField;
    qryCidadeestado: TIntegerField;
    cbEstado: TDBLookupComboBox;
    dsUF: TDataSource;
    dsCidade: TDataSource;
    cbCidade: TDBLookupComboBox;
    qryPessoasinadimplente: TBooleanField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acNovoExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acGravarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure qryPessoasCalcFields(DataSet: TDataSet);
    procedure grdPessoasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
    procedure qryPessoasAfterOpen(DataSet: TDataSet);
    procedure qryPessoasAfterClose(DataSet: TDataSet);
    procedure qryPessoasAfterRefresh(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure qryPessoasAfterScroll(DataSet: TDataSet);
    procedure qryPessoascod_ufChange(Sender: TField);
  private
   FListaTpPes : TStringList;
   procedure confRgTiposPes;
   procedure confCbPsqTipo;
   procedure preenchEndereco;
    procedure FiltrarCidades;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPessoas: TfrmPessoas;

implementation

uses uDmprincipal,uConstantes, uEndereco;

{$R *.dfm}

procedure TfrmPessoas.acCancelarExecute(Sender: TObject);
begin
 acGravar.Enabled := False;
 acEditar.Enabled := True;
 acExcluir.Enabled := True;
 acNovo.Enabled := True;
 acCancelar.Enabled := False;
 qryPessoas.Cancel;
 grdPessoas.Enabled := True;
end;

procedure TfrmPessoas.acEditarExecute(Sender: TObject);
begin
 if not qryPessoas.Active then
 begin
   qryPessoas.Open();
 end;
 if not qryPessoas.IsEmpty then
 begin
   qryPessoas.Edit;
 end
 else
 begin
   MessageBox(0, 'Selecione um registro para editar!', 'Atenção', MB_ICONWARNING or MB_OK);
   Exit;
 end;
 acEditar.Enabled := False;
 acExcluir.Enabled := False;
 acNovo.Enabled := False;
 acGravar.Enabled := True;
 acCancelar.Enabled := True;
 grdPessoas.Enabled := False;
 if edtNome.CanFocus then
 begin
   edtNome.SetFocus;
 end;

end;

procedure TfrmPessoas.acExcluirExecute(Sender: TObject);
begin
  if not qryPessoas.IsEmpty then
  begin
   if MessageDlg('Deseja realmente excluir?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    acEditar.Enabled := True;
    acExcluir.Enabled := True;
    acNovo.Enabled := True;
    acGravar.Enabled := False;
    acCancelar.Enabled := False;
    qryPessoas.Delete;
    qryPessoas.Refresh;
    grdPessoas.Enabled := True;
   end;
  end;
end;

procedure TfrmPessoas.acGravarExecute(Sender: TObject);
begin
 if qryPessoas.State in dsEditModes then
 begin
   if Trim(qryPessoasnome.AsString).IsEmpty then
   begin
     MessageBox(0, 'Digite um nome!', 'Atenção', MB_ICONWARNING or MB_OK);
     if edtNome.CanFocus then
     begin
       edtNome.SetFocus;
     end;
     Abort;
   end;
   if qryPessoasdt_nascimento.AsDateTime >= date then
   begin
     MessageBox(0, 'A data de nascimento deve ser menor do que a data de hoje!',
                   'Atenção', MB_ICONWARNING or MB_OK);
     if edtDtNasc.CanFocus then
     begin
       edtDtNasc.SetFocus;
     end;
     Abort;
   end;

   if MessageDlg('Deseja realmente gravar?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    acGravar.Enabled := False;
    acEditar.Enabled := True;
    acExcluir.Enabled := True;
    acNovo.Enabled := True;
    acCancelar.Enabled := False;
    qryPessoas.Post;
    qryPessoas.Refresh;
    grdPessoas.Enabled := True;
   end;

 end;
end;

procedure TfrmPessoas.acNovoExecute(Sender: TObject);
begin
 acEditar.Enabled := False;
 acExcluir.Enabled := False;
 acNovo.Enabled := False;
 acGravar.Enabled := True;
 acCancelar.Enabled := True;
 grdPessoas.Enabled := False;
 if not qryPessoas.Active then
 begin
   qryPessoas.Open();
 end;
 qryPessoas.Append;
 qryPessoastipo.AsString := PES_COMUM;
 if edtNome.CanFocus then
 begin
  edtNome.SetFocus;
 end;
end;

procedure TfrmPessoas.acPesquisarExecute(Sender: TObject);
begin
 qryPessoas.Close;
 qryPessoas.SQL.Clear;
 qryPessoas.SQL.Add('SELECT COD_PESSOA');
 qryPessoas.SQL.Add('       ,NOME');
 qryPessoas.SQL.Add('       ,DT_NASCIMENTO');
 qryPessoas.SQL.Add('       ,DT_CADASTRO');
 qryPessoas.SQL.Add('       ,TIPO');
 qryPessoas.SQL.Add('       ,CPF');
 qryPessoas.SQL.Add('       ,TELEFONE');
 qryPessoas.SQL.Add('       ,CELULAR');
 qryPessoas.SQL.Add('       ,LOGRADOURO');
 qryPessoas.SQL.Add('       ,BAIRRO');
 qryPessoas.SQL.Add('       ,COMPLEMENTO');
 qryPessoas.SQL.Add('       ,COD_CIDADE');
 qryPessoas.SQL.Add('       ,COD_UF');
 qryPessoas.SQL.Add('       ,CEP');
 qryPessoas.SQL.Add('FROM PESSOAS');
 qryPessoas.SQL.Add('WHERE 1=1');
 if lblEdtCod.Text <> '' then
 begin
   qryPessoas.SQL.Add('AND COD_PESSOA = :COD_PESSOA');
   qryPessoas.ParamByName('COD_PESSOA').AsString := lblEdtCod.Text;
 end;
 if lblEdtNome.Text <> '' then
 begin
   qryPessoas.SQL.Add('AND LOWER(NOME)  LIKE '+ QuotedStr('%' + LowerCase(lblEdtNome.Text)+'%') );
 end;
 if cbTipo.ItemIndex > 0 then
 begin
   qryPessoas.SQL.Add('AND LOWER(TIPO) = ' + LowerCase(QuotedStr(cbTipo.Text)));
 end;
 qryPessoas.SQL.Add('ORDER BY NOME');
 qryPessoas.Open();

 if qryPessoas.IsEmpty then
 begin
   MessageBox(0, 'Nada encontrado', 'Informação', MB_ICONINFORMATION or MB_OK);
   Exit;
 end;
end;



procedure TfrmPessoas.confCbPsqTipo;
begin
 cbTipo.Items.Clear;
 cbTipo.Items.Add('Todos');
 cbTipo.Items.AddStrings(dmPrincipal.getListaTiposCli);
end;


procedure TfrmPessoas.confRgTiposPes;
begin
 dbRgTipo.Items.Clear;
 dbRgTipo.Items := FListaTpPes;
end;

procedure TfrmPessoas.edtCepExit(Sender: TObject);
begin
 preenchEndereco;
end;

procedure TfrmPessoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 FListaTpPes.Free;
 frmPessoas := nil;
 Action :=caFree;
end;


procedure TfrmPessoas.FormCreate(Sender: TObject);
begin
 FListaTpPes := dmPrincipal.getListaTiposCli;
 confRgTiposPes;
 confCbPsqTipo;
end;

procedure TfrmPessoas.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
 begin
   key := #0;
   Perform(WM_NEXTDLGCTL, 0, 0);

 end;
end;

procedure TfrmPessoas.grdPessoasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if qryPessoasinadimplente.AsBoolean then
 begin
   grdPessoas.Canvas.Font.Color := clRed;
   grdPessoas.DefaultDrawDataCell(Rect, grdPessoas.columns[datacol].field, State);
 end;
end;

procedure TfrmPessoas.preenchEndereco;
var
 lEnd : TEndereco;
 lCep : String;
begin
 if not qryPessoascep.AsString.IsEmpty then
 begin
   if dmPrincipal.ConectadoInternet then
   begin
     if qryPessoas.State in dsEditModes then
     begin
        lCep := dmPrincipal.RetirarChars(['-'],qryPessoascep.AsString);
        lEnd := dmPrincipal.GetEndereco(lCep);
        if lEnd = nil then
        begin
          MessageBox(0, 'CEP Inválido!', 'Erro', MB_ICONERROR or MB_OK);
          qryPessoascep.Clear;
          Abort;
        end;
        try
          qryPessoaslogradouro.AsString := lEnd.Logradouro;
          qryPessoascomplemento.AsString := lend.Complemento;
          qryPessoascep.AsString := lend.Cep;
          qryPessoasbairro.AsString := lEnd.Bairro;
          qryPessoascod_uf.AsInteger := dmPrincipal.getCodUF(lEnd.UF);
          qryPessoascod_cidade.AsInteger := dmPrincipal.getCodCidade(lEnd.Cidade);
        finally
          lEnd.Free;
        end;

     end;
   end;

 end;
end;

procedure TfrmPessoas.FiltrarCidades;
begin
  if qryCidade.Active and qryUF.Active and not qryPessoascod_uf.IsNull then
  begin
    qryCidade.Filtered := False;
    qryCidade.Filter := 'estado = ' + qryPessoascod_uf.AsString;
    qryCidade.Filtered := True;
  end;
end;

procedure TfrmPessoas.qryPessoasAfterClose(DataSet: TDataSet);
begin
 qryUF.close();
 qryCidade.close();
end;

procedure TfrmPessoas.qryPessoasAfterOpen(DataSet: TDataSet);
begin
 qryUF.Open();
 qryCidade.Filtered := False;
 qryCidade.Open();
end;

procedure TfrmPessoas.qryPessoasAfterRefresh(DataSet: TDataSet);
begin
 qryCidade.Filtered := false;
end;

procedure TfrmPessoas.qryPessoasAfterScroll(DataSet: TDataSet);
begin
  FiltrarCidades;
end;

procedure TfrmPessoas.qryPessoasCalcFields(DataSet: TDataSet);
begin
 if qryPessoastipo.AsString = PES_ALUNO then
 begin
   qryPessoasinadimplente.AsBoolean
    := dmPrincipal.isInadimp(qryPessoascod_pessoa.AsInteger);
 end;
end;

procedure TfrmPessoas.qryPessoascod_ufChange(Sender: TField);
begin
 FiltrarCidades;
 qryPessoascod_cidade.Clear;
end;

end.
