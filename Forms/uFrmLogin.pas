unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDmPrincipal, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  System.UITypes;

type
  TfrmLogin = class(TForm)
    lblEdtUsu: TLabeledEdit;
    lblEdtSenha: TLabeledEdit;
    btnEntrar: TButton;
    btnFechar: TButton;
    imgLogo: TImage;
    pbLogin: TProgressBar;
    lblProcesso: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
   function TentarLogin(pLogin,pSenha : string) : boolean;
   procedure ConfigurarPermissoes;
    procedure Entrar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation
  uses
   uFrmPrinc,uConstantes, uPermissoes;

 {$R *.dfm}

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
  Entrar;
end;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
 Close;
 Application.Terminate;
end;

procedure TfrmLogin.ConfigurarPermissoes;
var
 lPerm : TPermissoes;
begin
 lPerm := TPermissoes.Create(dmPrincipal.MysqlConn);
 try
  frmPrinc.AcPes.Enabled := lPerm.PossuiPermissao(dmPrincipal.CodUsuario,PERM_PESSOAS);
  frmPrinc.acEquip.Enabled := lPerm.PossuiPermissao(dmPrincipal.CodUsuario,PERM_EQUIPAMENTOS);
  frmPrinc.AcTpLanc.Enabled := lPerm.PossuiPermissao(dmPrincipal.CodUsuario,PERM_TIPOS_DE_LANC);
  frmPrinc.acLanc.Enabled := lPerm.PossuiPermissao(dmPrincipal.CodUsuario,PERM_LANC);
  frmPrinc.acRel.Enabled := lPerm.PossuiPermissao(dmPrincipal.CodUsuario,PERM_REL);
  frmPrinc.acLancFixos.Enabled := lPerm.PossuiPermissao(dmPrincipal.CodUsuario,PERM_LANC_FIXOS);
  frmPrinc.acUsuarios.Enabled := lPerm.PossuiPermissao(dmPrincipal.CodUsuario,PERM_USUARIOS);
  frmPrinc.acMensalidades.Enabled := lPerm.PossuiPermissao(dmPrincipal.CodUsuario,PERM_MENSALIDADES);
  frmPrinc.acPlanos.Enabled := lPerm.PossuiPermissao(dmPrincipal.CodUsuario,PERM_PLANOS);
 finally
   lPerm.Free;
 end;

end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmLogin := nil;
 Action := caFree;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
 pbLogin.Position := 0;
 pbLogin.Step := 1;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
 begin
   key := #0;
   Perform(WM_NEXTDLGCTL, 0, 0);

 end;
end;

function TfrmLogin.TentarLogin(pLogin, pSenha: string): boolean;
var
 lQryLog : TFDQuery;
begin
  lQryLog := TFDQuery.Create(nil);
  try
    lQryLog.Connection := dmPrincipal.MySQLConn;
    lQryLog.SQL.Add('SELECT ID,ADMIN,NOME FROM USUARIOS');
    lQryLog.SQL.Add('WHERE LOWER(NOME) = :NOME');
    lQryLog.SQL.Add('AND SENHA = :SENHA');
    lQryLog.ParamByName('NOME').AsString := LowerCase(pLogin);
    lQryLog.ParamByName('SENHA').AsString := pSenha;
    lQryLog.Open();
    if lQryLog.IsEmpty then
    begin
      result := False;
    end
    else
    begin
      result := True;
      dmPrincipal.NomeUsuario := lQryLog.FieldByName('NOME').AsString;
      dmPrincipal.isAdmin := lQryLog.FieldByName('ADMIN').AsString = 'S';
      dmPrincipal.CodUsuario := lQryLog.FieldByName('ID').AsInteger;
      if dmPrincipal.CodUsuario > 0 then
      begin
       dmPrincipal.salvarLog(dmPrincipal.CodUsuario,OP_LOGIN,dmPrincipal.nomePC);
      end;
    end;

  finally
    lQryLog.Free;
  end;
end;

procedure TfrmLogin.Entrar;
begin
  if not TentarLogin(lblEdtUsu.Text, lblEdtSenha.Text) then
  begin
    MessageBox(0, 'Usuário ou senha incorretos', 'Erro', MB_ICONERROR or MB_OK);
    Abort;
  end
  else
  begin
    pbLogin.Position := 0;
    pbLogin.Step := 1;
    pbLogin.Min := 1;
    pbLogin.Max := 5;
    lblProcesso.Enabled := True;
    Application.ProcessMessages;
    lblProcesso.Caption := 'Conferindo telas...';
    dmPrincipal.CriarTelas;
    pbLogin.StepIt;
    lblProcesso.Caption := 'Conferindo tipos de lançamentos padrões...';
    dmPrincipal.InserirTpLancPadroes;
    pbLogin.StepIt;
    lblProcesso.Caption := 'Conferindo formas de pagamento padrões...';
    dmPrincipal.InserirFormaPGPadroes;
    pbLogin.StepIt;
    lblProcesso.Caption := 'Conferindo informações de UFs e Cidades brasileiras...';
    dmPrincipal.CriaInsereUfCid;
    pbLogin.StepIt;
    lblProcesso.Caption := 'Conferindo permissões...';
    dmPrincipal.CriarPermissoes;
    ConfigurarPermissoes;
    pbLogin.StepIt;
    Close;
  end;
end;

end.
