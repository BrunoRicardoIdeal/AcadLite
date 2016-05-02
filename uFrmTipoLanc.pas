unit uFrmTipoLanc;

interface

uses
  Winapi.Windows,system.UITypes, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmTiposLanc = class(TForm)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    lblEdtCod: TLabeledEdit;
    lblEdtDesc: TLabeledEdit;
    btnPsq: TButton;
    cbCategoria: TComboBox;
    grTipoLanc: TDBGrid;
    edtCodTpLanc: TDBEdit;
    lblCodpes: TLabel;
    edtCadastro: TDBEdit;
    Label5: TLabel;
    edtDescricao: TDBEdit;
    lblDesc: TLabel;
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
    qryTpLanc: TFDQuery;
    dsTpLanc: TDataSource;
    dbRgCat: TDBRadioGroup;
    qryTpLanccod_tipo_lanc: TFDAutoIncField;
    qryTpLancdescricao: TStringField;
    qryTpLanccategoria: TStringField;
    qryTpLancdt_cadastro: TDateTimeField;
    procedure acNovoExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acGravarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
   function ExisteLancamento(pCodTipo : integer):boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTiposLanc: TfrmTiposLanc;

implementation
 uses uDmPrincipal;
{$R *.dfm}

procedure TfrmTiposLanc.acCancelarExecute(Sender: TObject);
begin
 acGravar.Enabled := False;
 acEditar.Enabled := True;
 acExcluir.Enabled := True;
 acNovo.Enabled := True;
 acCancelar.Enabled := False;
 qryTpLanc.Cancel;
end;

procedure TfrmTiposLanc.acEditarExecute(Sender: TObject);
begin
 acEditar.Enabled := False;
 acExcluir.Enabled := False;
 acNovo.Enabled := False;
 acGravar.Enabled := True;
 acCancelar.Enabled := True;
 if not qryTpLanc.Active then
 begin
   qryTpLanc.Open();
 end;
 if not qryTpLanc.IsEmpty then
 begin
   qryTpLanc.Edit;
 end
 else
 begin
   ShowMessage('Selecione alguém pra editar');
   Exit;
 end;
end;

procedure TfrmTiposLanc.acExcluirExecute(Sender: TObject);
begin
  if not qryTpLanc.IsEmpty then
  begin
   if MessageDlg('Deseja realmente excluir?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    if ExisteLancamento(qryTpLanccod_tipo_lanc.AsInteger) then
    begin
      ShowMessage('Não pode ser excluído pois existem lançamentos com esse tipo!');
      Exit;
    end;
    acEditar.Enabled := True;
    acExcluir.Enabled := True;
    acNovo.Enabled := True;
    acGravar.Enabled := False;
    acCancelar.Enabled := False;
    qryTpLanc.Delete;
    qryTpLanc.Refresh;
   end;
  end;
end;

procedure TfrmTiposLanc.acGravarExecute(Sender: TObject);
begin
 if qryTpLanc.State in dsEditModes then
 begin
   if MessageDlg('Deseja realmente gravar?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    acGravar.Enabled := False;
    acEditar.Enabled := True;
    acExcluir.Enabled := True;
    acNovo.Enabled := True;
    acCancelar.Enabled := False;
    qryTpLanc.Post;
   end;

 end;
end;

procedure TfrmTiposLanc.acNovoExecute(Sender: TObject);
begin
 acEditar.Enabled := False;
 acExcluir.Enabled := False;
 acNovo.Enabled := False;
 acGravar.Enabled := True;
 acCancelar.Enabled := True;
 if not qryTpLanc.Active then
 begin
   qryTpLanc.Open();
 end;
 qryTpLanc.Append;
 qryTpLanccategoria.AsString := 'Receita';
 edtDescricao.SetFocus;
end;

procedure TfrmTiposLanc.acPesquisarExecute(Sender: TObject);
begin
 qryTpLanc.Close;
 qryTpLanc.SQL.Clear;
 qryTpLanc.SQL.Add('SELECT COD_TIPO_LANC');
 qryTpLanc.SQL.Add('       ,DESCRICAO');
 qryTpLanc.SQL.Add('       ,DT_CADASTRO');
 qryTpLanc.SQL.Add('       ,CATEGORIA');
 qryTpLanc.SQL.Add('FROM TIPOS_LANCAMENTOS');
 qryTpLanc.SQL.Add('WHERE 1=1');
 if lblEdtCod.Text <> '' then
 begin
   qryTpLanc.SQL.Add('AND COD_TIPO_LANC = :COD_TIPO_LANC');
   qryTpLanc.ParamByName('COD_TIPO_LANC').AsString := lblEdtCod.Text;
 end;
 if lblEdtDesc.Text <> '' then
 begin
   qryTpLanc.SQL.Add('AND LOWER(DESCRICAO)  LIKE '+ QuotedStr('%' + LowerCase(lblEdtDesc.Text)+'%') );
 end;
 if cbCategoria.ItemIndex > 0 then
 begin
   qryTpLanc.SQL.Add('AND LOWER(CATEGORIA) = ' + LowerCase(QuotedStr(cbCategoria.Text)));
 end;
 qryTpLanc.SQL.Add('ORDER BY DESCRICAO');
 qryTpLanc.Open();
 if qryTpLanc.IsEmpty then
 begin
   ShowMessage('Nada encontrado');
   Exit;
 end;
end;

function TfrmTiposLanc.ExisteLancamento(pCodTipo: integer): boolean;
var
 lQry : TFDQuery;
begin
  lQry := TFDQuery.Create(Self);
  try
    lQry.Connection := dmPrincipal.MySQLConn;
    lQry.SQL.Add('SELECT COD_LANC');
    lQry.SQL.Add('FROM LANCAMENTOS');
    lQry.SQL.Add('WHERE COD_TIPO_LANC = ' + IntToStr(pCodTipo));
    lQry.SQL.Add('LIMIT 1');
    lQry.Open();
    result := not lQry.IsEmpty;
  finally
    lQry.Free;
  end;
end;

procedure TfrmTiposLanc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmTiposLanc := nil;
 Action := caFree;
end;

end.

