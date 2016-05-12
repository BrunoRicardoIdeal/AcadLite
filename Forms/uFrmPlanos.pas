unit uFrmPlanos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, System.Actions, Vcl.ActnList,uDmPrincipal, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPlanos = class(TForm)
    GroupBox1: TGroupBox;
    lblEdtCod: TLabeledEdit;
    lblEdtDesc: TLabeledEdit;
    btnPsq: TButton;
    AcList: TActionList;
    acNovo: TAction;
    acEditar: TAction;
    acGravar: TAction;
    acCancelar: TAction;
    acExcluir: TAction;
    acPesquisar: TAction;
    grdPlanos: TDBGrid;
    pnlBotoes: TPanel;
    btnNovo: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    btnEditar: TButton;
    btnGravar: TButton;
    edtCodigo: TDBEdit;
    Label5: TLabel;
    edtCadastro: TDBEdit;
    edtDescricao: TDBEdit;
    lblDesc: TLabel;
    lblCodpes: TLabel;
    Label1: TLabel;
    edtNumMeses: TDBEdit;
    edtValor: TDBEdit;
    Label2: TLabel;
    dsPlanos: TDataSource;
    qryPlanos: TFDQuery;
    qryPlanosid: TFDAutoIncField;
    qryPlanosdescricao: TStringField;
    qryPlanosdt_cadastro: TDateTimeField;
    qryPlanosvalor: TFloatField;
    qryPlanosnum_meses: TIntegerField;
    procedure acNovoExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acGravarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
   function ExisteMens(pCodPlano:integer):Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanos: TfrmPlanos;

implementation

{$R *.dfm}

procedure TfrmPlanos.acCancelarExecute(Sender: TObject);
begin
  acGravar.Enabled := False;
 acEditar.Enabled := True;
 acExcluir.Enabled := True;
 acNovo.Enabled := True;
 acCancelar.Enabled := False;
 qryPlanos.Cancel;
 grdPlanos.Enabled := True;
end;

procedure TfrmPlanos.acEditarExecute(Sender: TObject);
begin
 if not qryPlanos.Active then
 begin
   qryPlanos.Open();
 end;
 if not qryPlanos.IsEmpty then
 begin
   qryPlanos.Edit;
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
 grdPlanos.Enabled := False;
 if edtDescricao.CanFocus then
 begin
   edtDescricao.SetFocus;
 end;

end;

procedure TfrmPlanos.acExcluirExecute(Sender: TObject);
begin
  if not qryPlanos.IsEmpty then
  begin
   if ExisteMens(qryPlanosid.AsInteger) then
   begin
      MessageBox(0, 'Não é possível excluir pois existem mensalidades com esse plano'
              , 'Atenção', MB_ICONWARNING or MB_OK);
      Abort;
   end;


   if MessageDlg('Deseja realmente excluir?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    acEditar.Enabled := True;
    acExcluir.Enabled := True;
    acNovo.Enabled := True;
    acGravar.Enabled := False;
    acCancelar.Enabled := False;
    qryPlanos.Delete;
    qryPlanos.Refresh;
    grdPlanos.Enabled := True;
   end;
  end;
end;

procedure TfrmPlanos.acGravarExecute(Sender: TObject);
begin
 if qryPlanos.State in dsEditModes then
 begin
   if Trim(qryPlanosDESCRICAO.AsString).IsEmpty then
   begin
     MessageBox(0, 'Digite um nome!', 'Atenção', MB_ICONWARNING or MB_OK);
     if edtDescricao.CanFocus then
     begin
       edtDescricao.SetFocus;
     end;
     Abort;
   end;

   if qryPlanosvalor.AsFloat <= 0  then
   begin
     MessageBox(0, 'O valor deve ser maior do que 0', 'Atenção', MB_ICONWARNING or MB_OK);
     if edtValor.CanFocus then
     begin
       edtValor.SetFocus;
     end;
     Abort;
   end;

   if qryPlanosnum_meses.AsFloat <= 0  then
   begin
     MessageBox(0, 'O número de meses deve ser maior do que 0', 'Atenção', MB_ICONWARNING or MB_OK);
     if edtNumMeses.CanFocus then
     begin
       edtNumMeses.SetFocus;
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
    qryPlanos.Post;
    qryPlanos.Refresh;
    grdPlanos.Enabled := True;
   end;
 end;
end;

procedure TfrmPlanos.acNovoExecute(Sender: TObject);
begin
 acEditar.Enabled := False;
 acExcluir.Enabled := False;
 acNovo.Enabled := False;
 acGravar.Enabled := True;
 acCancelar.Enabled := True;
 grdPlanos.Enabled := False;
 if not qryPlanos.Active then
 begin
   qryPlanos.Open();
 end;
 qryPlanos.Append;
 if edtDescricao.CanFocus then
 begin
  edtDescricao.SetFocus;
 end;
end;

procedure TfrmPlanos.acPesquisarExecute(Sender: TObject);
begin
 qryPlanos.Close;
 qryPlanos.SQL.Clear;
 qryPlanos.SQL.Add('SELECT ID');
 qryPlanos.SQL.Add('       ,DESCRICAO');
 qryPlanos.SQL.Add('       ,DT_CADASTRO');
 qryPlanos.SQL.Add('       ,VALOR');
 qryPlanos.SQL.Add('       ,NUM_MESES');
 qryPlanos.SQL.Add('FROM PLANOS');
 qryPlanos.SQL.Add('WHERE 1=1');
 if lblEdtCod.Text <> '' then
 begin
   qryPlanos.SQL.Add('AND ID = :ID');
   qryPlanos.ParamByName('ID').AsString := lblEdtCod.Text;
 end;
 if lblEdtDesc.Text <> '' then
 begin
   qryPlanos.SQL.Add('AND LOWER(DESCRICAO)  LIKE '+ QuotedStr('%' + LowerCase(lblEdtDesc.Text)+'%') );
 end;
 qryPlanos.SQL.Add('ORDER BY DESCRICAO');
 qryPlanos.Open();

 if qryPlanos.IsEmpty then
 begin
   MessageBox(0, 'Nada encontrado', 'Informação', MB_ICONINFORMATION or MB_OK);
   Exit;
 end;
end;

function TfrmPlanos.ExisteMens(pCodPlano: integer): Boolean;
var
 qryExiste : TFDQuery;
begin
 qryExiste := TFDQuery.Create(Self);
 try
  qryExiste.Connection :=dmPrincipal.MySQLConn;
  qryExiste.SQL.Add('SELECT COD_MENSALIDADE FROM MENSALIDADES');
  qryExiste.SQL.Add('WHERE COD_PLANO = :COD_PLANO');
  qryExiste.ParamByName('COD_PLANO').AsInteger := qryPlanosid.AsInteger;
  qryExiste.Open();
  result := not qryExiste.IsEmpty;
 finally
   qryExiste.Free;
 end;
end;

procedure TfrmPlanos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmPlanos := nil;
 Action := caFree;
end;

procedure TfrmPlanos.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
 begin
   key := #0;
   Perform(WM_NEXTDLGCTL, 0, 0);

 end;
end;

end.
