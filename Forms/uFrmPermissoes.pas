unit uFrmPermissoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDmPrincipal, FireDAC.Stan.Intf,uPermissoes, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

//type TConcePermissao = (cpPermitir, cpRetirar);

type
  TfrmPermissoes = class(TForm)
    qryPermissoes: TFDQuery;
    qryPermissoesnome: TStringField;
    qryPermissoesdescricao: TStringField;
    grdPermissao: TDBGrid;
    dsPermissoes: TDataSource;
    qryPermissoesid_pu: TIntegerField;
    Label2: TLabel;
    edtFiltrar: TEdit;
    pnlBotoes: TPanel;
    btnConceder: TButton;
    btnRetirar: TButton;
    qryPermissoescod_permissao: TIntegerField;
    qryConceder: TFDQuery;
    qryConcederid: TFDAutoIncField;
    qryConcedercod_usuario: TIntegerField;
    qryConcedercod_permissao: TIntegerField;
    edtNomeUsu: TEdit;
    Label1: TLabel;
    btnConcederTodas: TButton;
    btnRetirarTodas: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdPermissaoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure edtFiltrarChange(Sender: TObject);
    procedure btnConcederClick(Sender: TObject);
    procedure btnRetirarClick(Sender: TObject);
    procedure btnConcederTodasClick(Sender: TObject);
    procedure btnRetirarTodasClick(Sender: TObject);
  private
  var
    FCodUsu : integer;
    FNomeUsu: string;
    FPermissao : TPermissoes;
  procedure AlterarPermissao(pConceder : TConcePermissao);
    procedure RetirarPermissoes;
    procedure ConcederPermissoes;
    { Private declarations }
  public
   property CodUsu : integer read FCodUsu write FCodUsu;
   property NomeUsu : string read FNomeUsu write FNomeUsu;
    { Public declarations }
  end;

var
  frmPermissoes: TfrmPermissoes;

implementation


{$R *.dfm}

procedure TfrmPermissoes.AlterarPermissao(pConceder : TConcePermissao);
var
 lMsg : String;
begin
   lMsg:= FPermissao.ConcederPermissao(FCodUsu,qryPermissoescod_permissao.AsInteger,pConceder);
   qryPermissoes.Refresh();
   MessageBox(0, Pchar(lMsg), 'Informação', MB_ICONINFORMATION or MB_OK);

end;

procedure TfrmPermissoes.RetirarPermissoes;
begin
  if MessageBox(0, 'Deseja realmente retirar todas as permissões?', 'Atenção', MB_ICONWARNING or MB_YESNO) = mrYes then
  begin
    FPermissao.RetirarTodasPermissoes(FCodUsu);
  end;
  qryPermissoes.Refresh;
  MessageBox(0, 'Permissões retiradas!', 'Informação', MB_ICONINFORMATION or MB_OK);
end;

procedure TfrmPermissoes.ConcederPermissoes;
begin
  if MessageBox(0, 'Deseja realmente conceder todas as permissões?', 'Atenção', MB_ICONWARNING or MB_YESNO) = mrYes then
  begin
    FPermissao.ConcederTodasPermissoes(FCodUsu);
  end;
  qryPermissoes.Refresh;
  MessageBox(0, 'Permissões concedidas!', 'Informação', MB_ICONINFORMATION or MB_OK);

end;

procedure TfrmPermissoes.btnConcederClick(Sender: TObject);
begin
 AlterarPermissao(cpPermitir);
end;

procedure TfrmPermissoes.btnConcederTodasClick(Sender: TObject);
begin
  ConcederPermissoes;
end;

procedure TfrmPermissoes.btnRetirarClick(Sender: TObject);
begin
 AlterarPermissao(cpRetirar);
end;

procedure TfrmPermissoes.btnRetirarTodasClick(Sender: TObject);
begin
  RetirarPermissoes;
end;

procedure TfrmPermissoes.edtFiltrarChange(Sender: TObject);
var
 lStr : String;
begin
   lStr := Trim(edtFiltrar.Text);
   qryPermissoes.DisableControls;
   qryPermissoes.Filtered := False;
   if not lStr.IsEmpty then
    begin
     qryPermissoes.Filter := 'descricao like ' + QuotedStr( '%' + (lStr) + '%');
     qryPermissoes.Filtered := True;
    end;
    qryPermissoes.EnableControls;
end;

procedure TfrmPermissoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 FPermissao.Free;
 frmPermissoes := nil;
 Action := caFree;
end;

procedure TfrmPermissoes.FormShow(Sender: TObject);
begin
 FPermissao := TPermissoes.Create(dmPrincipal.MySQLConn);
 qryPermissoes.ParamByName('cod_usuario').AsInteger := FCodUsu;
 qryPermissoes.Open();
 edtNomeUsu.Text := FNomeUsu;
end;

procedure TfrmPermissoes.grdPermissaoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if qryPermissoesid_pu.AsInteger <= 0 then
 begin
   grdPermissao.Canvas.Font.Color := clInactiveCaption;
   grdPermissao.DefaultDrawDataCell(Rect, grdPermissao.columns[datacol].field, State);
 end;

end;

end.
