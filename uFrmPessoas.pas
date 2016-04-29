unit uFrmPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, System.Actions,
  Vcl.ActnList, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    qryPessoascod_pessoa: TFDAutoIncField;
    qryPessoasnome: TStringField;
    qryPessoasdt_nascimento: TDateField;
    qryPessoascpf: TStringField;
    qryPessoastelefone: TStringField;
    qryPessoascelular: TStringField;
    qryPessoastipo: TStringField;
    Label4: TLabel;
    cbTipo: TComboBox;
    edtCadastro: TDBEdit;
    Label5: TLabel;
    qryPessoasdt_cadastro: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acNovoExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acGravarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPessoas: TfrmPessoas;

implementation

uses uDmprincipal;

{$R *.dfm}

procedure TfrmPessoas.acCancelarExecute(Sender: TObject);
begin
 btnGravar.Enabled := False;
 btnEditar.Enabled := True;
 btnExcluir.Enabled := True;
 btnNovo.Enabled := True;
 btnCancelar.Enabled := False;
 qryPessoas.Cancel;
end;

procedure TfrmPessoas.acEditarExecute(Sender: TObject);
begin
 btnEditar.Enabled := False;
 btnExcluir.Enabled := False;
 btnNovo.Enabled := False;
 btnGravar.Enabled := True;
 btnCancelar.Enabled := True;
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
   ShowMessage('Selecione algu�m pra editar');
   Exit;
 end;
end;

procedure TfrmPessoas.acExcluirExecute(Sender: TObject);
begin
  if not qryPessoas.IsEmpty then
  begin
   if MessageDlg('Deseja realmente excluir?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    btnEditar.Enabled := True;
    btnExcluir.Enabled := True;
    btnNovo.Enabled := True;
    btnGravar.Enabled := False;
    btnCancelar.Enabled := False;
    qryPessoas.Delete;
    qryPessoas.Refresh;
   end;
  end;
end;

procedure TfrmPessoas.acGravarExecute(Sender: TObject);
begin
 if qryPessoas.State in dsEditModes then
 begin
   if MessageDlg('Deseja realmente gravar?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    btnGravar.Enabled := False;
    btnEditar.Enabled := True;
    btnExcluir.Enabled := True;
    btnNovo.Enabled := True;
    btnCancelar.Enabled := False;
    qryPessoas.Post;
   end;

 end;
end;

procedure TfrmPessoas.acNovoExecute(Sender: TObject);
begin
 btnEditar.Enabled := False;
 btnExcluir.Enabled := False;
 btnNovo.Enabled := False;
 btnGravar.Enabled := True;
 btnCancelar.Enabled := True;
 if not qryPessoas.Active then
 begin
   qryPessoas.Open();
 end;
 qryPessoas.Append;
 qryPessoastipo.AsString := 'Comum';
 edtNome.SetFocus;
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
 qryPessoas.Open();
 if qryPessoas.IsEmpty then
 begin
   ShowMessage('Nada encontrado');
   Exit;
 end;
end;

procedure TfrmPessoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmPessoas := nil;
 Action :=caFree;
end;

end.