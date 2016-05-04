unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDmPrincipal, Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    lblEdtUsu: TLabeledEdit;
    lblEdtSenha: TLabeledEdit;
    btnEntrar: TButton;
    btnFechar: TButton;
    imgLogo: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
   function TentarLogin(pLogin,pSenha : string) : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation
  uses
   uFrmPrinc;

 {$R *.dfm}

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
 if not TentarLogin(lblEdtUsu.Text,lblEdtSenha.Text) then
 begin
   ShowMessage('Usuário ou senha incorretos!');
   Abort;
 end
 else
 begin
   Close;
 end;
end;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
 Close;
 Application.Terminate;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmLogin := nil;
 Action := caFree;
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
      dmPrincipal.user := lQryLog.FieldByName('NOME').AsString;
      dmPrincipal.isAdmin := lQryLog.FieldByName('ADMIN').AsString = 'S';
    end;

  finally
    lQryLog.Free;
  end;
end;

end.
