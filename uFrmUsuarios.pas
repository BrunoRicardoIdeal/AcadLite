unit uFrmUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.Actions,System.UITypes,
  Vcl.ActnList, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmUsuarios = class(TForm)
    GroupBox1: TGroupBox;
    lblEdtCod: TLabeledEdit;
    lblEdtNome: TLabeledEdit;
    btnPsq: TButton;
    AcList: TActionList;
    acNovo: TAction;
    acEditar: TAction;
    acGravar: TAction;
    acCancelar: TAction;
    acExcluir: TAction;
    acPesquisar: TAction;
    pnlBotoes: TPanel;
    btnNovo: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    btnEditar: TButton;
    btnGravar: TButton;
    grdUsuarios: TDBGrid;
    edtNome: TDBEdit;
    lblNome: TLabel;
    lblCodpes: TLabel;
    edtCodUsu: TDBEdit;
    qryUsuarios: TFDQuery;
    dsPessoas: TDataSource;
    qryUsuariosid: TFDAutoIncField;
    qryUsuariosnome: TStringField;
    qryUsuariossenha: TStringField;
    lblEdtNovaSenha: TLabeledEdit;
    lblEdtConfNovaSenha: TLabeledEdit;
    qryUsuariosadmin: TStringField;
    procedure acNovoExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acGravarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure ValidaPreench;
    procedure ValidaAdmin(pUser,pPas : string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

 uses uDmPrincipal;

{$R *.dfm}

procedure TfrmUsuarios.acCancelarExecute(Sender: TObject);
begin

 lblEdtNovaSenha.Enabled := False;
 lblEdtConfNovaSenha.Enabled := False;
 lblEdtNovaSenha.clear;
 lblEdtConfNovaSenha.clear;
 acGravar.Enabled := False;
 acEditar.Enabled := True;
 acExcluir.Enabled := True;
 acNovo.Enabled := True;
 acCancelar.Enabled := False;
 qryUsuarios.Cancel
end;

procedure TfrmUsuarios.acEditarExecute(Sender: TObject);
begin
 if not qryUsuarios.Active then
 begin
   qryUsuarios.Open();
 end;
 if not qryUsuarios.IsEmpty then
 begin
   qryUsuarios.Edit;
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
 lblEdtNovaSenha.Enabled := True;
 lblEdtConfNovaSenha.Enabled := True;
end;

procedure TfrmUsuarios.acExcluirExecute(Sender: TObject);
begin
  if not qryUsuarios.IsEmpty then
  begin
   if MessageDlg('Deseja realmente excluir?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    ValidaAdmin(qryUsuariosnome.AsString,lblEdtNovaSenha.Text);
    acEditar.Enabled := True;
    acExcluir.Enabled := True;
    acNovo.Enabled := True;
    acGravar.Enabled := False;
    acCancelar.Enabled := False;
    lblEdtNovaSenha.clear;
    lblEdtConfNovaSenha.clear;
    lblEdtNovaSenha.Enabled := False;
    lblEdtConfNovaSenha.Enabled := False;
    qryUsuarios.Delete;
    qryUsuarios.Refresh;
   end;
  end;
end;

procedure TfrmUsuarios.acGravarExecute(Sender: TObject);
begin
 if qryUsuarios.State in dsEditModes then
 begin
   if MessageDlg('Deseja realmente gravar?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    ValidaPreench;
    ValidaAdmin(qryUsuariosnome.AsString,lblEdtNovaSenha.Text);
    acGravar.Enabled := False;
    acEditar.Enabled := True;
    acExcluir.Enabled := True;
    acNovo.Enabled := True;
    acCancelar.Enabled := False;
    qryUsuariossenha.AsString := lblEdtNovaSenha.Text;
    lblEdtNovaSenha.Enabled := False;
    lblEdtConfNovaSenha.Enabled := False;
    lblEdtNovaSenha.clear;
    lblEdtConfNovaSenha.clear;
    qryUsuarios.Post;
    qryUsuarios.Refresh;
   end;

 end;
end;

procedure TfrmUsuarios.acNovoExecute(Sender: TObject);
begin
 acEditar.Enabled := False;
 acExcluir.Enabled := False;
 acNovo.Enabled := False;
 acGravar.Enabled := True;
 acCancelar.Enabled := True;
 lblEdtNovaSenha.Enabled := True;
 lblEdtConfNovaSenha.Enabled := True;
 if not qryUsuarios.Active then
 begin
   qryUsuarios.Open();
 end;
 qryUsuarios.Append;
 edtNome.SetFocus;
end;
procedure TfrmUsuarios.acPesquisarExecute(Sender: TObject);
begin
 qryUsuarios.Close;
 qryUsuarios.SQL.Clear;
 qryUsuarios.SQL.Add('SELECT ID');
 qryUsuarios.SQL.Add('       ,NOME');
 qryUsuarios.SQL.Add('       ,ADMIN');
 qryUsuarios.SQL.Add('       ,SENHA');
 qryUsuarios.SQL.Add('FROM USUARIOS');
 qryUsuarios.SQL.Add('WHERE 1=1');
 if lblEdtCod.Text <> '' then
 begin
   qryUsuarios.SQL.Add('AND ID = :ID');
   qryUsuarios.ParamByName('ID').AsString := lblEdtCod.Text;
 end;
 if lblEdtNome.Text <> '' then
 begin
   qryUsuarios.SQL.Add('AND LOWER(NOME)  LIKE '+ QuotedStr('%' + LowerCase(lblEdtNome.Text)+'%') );
 end;
 qryUsuarios.SQL.Add('ORDER BY NOME');
 qryUsuarios.Open();

 if qryUsuarios.IsEmpty then
 begin
   MessageBox(0, 'Nada encontrado', 'Informação', MB_ICONINFORMATION or MB_OK);
   Exit;
 end;
end;

procedure TfrmUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmUsuarios := nil;
 action := caFree;
end;

procedure TfrmUsuarios.FormCreate(Sender: TObject);
begin
 lblEdtNovaSenha.Enabled := False;
 lblEdtConfNovaSenha.Enabled := False;
end;

procedure TfrmUsuarios.ValidaAdmin(pUser, pPas: string);
var
 lisAdm : boolean;
begin
 lisAdm := qryUsuariosadmin.AsString = 'S';
 if lisAdm then
 begin
   MessageBox(0, 'Credenciais de Administrador Master não podem ser alteradas'
      , 'Atenção', MB_ICONWARNING or MB_OK);
   Abort;
 end;
end;

procedure TfrmUsuarios.ValidaPreench;
begin
  if LowerCase(lblEdtNovaSenha.Text) <> LowerCase(lblEdtConfNovaSenha.Text) then
  begin
    MessageBox(0, 'As senhas não conferem', 'Erro', MB_ICONERROR or MB_OK);
    if lblEdtNovaSenha.CanFocus then
    begin
      lblEdtNovaSenha.SetFocus;
    end;
    Abort;
  end;

end;

end.
