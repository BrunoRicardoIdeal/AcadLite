unit uFrmLancamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmLancamentos = class(TForm)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    lblEdtCod: TLabeledEdit;
    lblEdtDesc: TLabeledEdit;
    btnPsq: TButton;
    cbCategoria: TComboBox;
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
    grLanc: TDBGrid;
    edtCodLanc: TDBEdit;
    lblCodpes: TLabel;
    edtDtLanc: TDBEdit;
    Label5: TLabel;
    edtDescricao: TDBEdit;
    lblDesc: TLabel;
    dbRgCat: TDBRadioGroup;
    Label1: TLabel;
    edtDtVenc: TDBEdit;
    Label2: TLabel;
    qryLanc: TFDQuery;
    dsLanc: TDataSource;
    qryLanccod_lanc: TFDAutoIncField;
    qryLancdescricao: TStringField;
    qryLancdt_lanc: TDateTimeField;
    qryLancdt_vencimento: TDateField;
    qryLanccod_tipo_lanc: TIntegerField;
    qryLanctipo_lanc_desc: TStringField;
    qryLanccategoria: TStringField;
    cbLkpTipoLanc: TDBLookupComboBox;
    qryTipoLanc: TFDQuery;
    qryTipoLanccod_tipo_lanc: TFDAutoIncField;
    qryTipoLancdescricao: TStringField;
    dsTipoLanc: TDataSource;
    chkExcluidos: TCheckBox;
    procedure acNovoExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acGravarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure qryLancAfterOpen(DataSet: TDataSet);
    procedure qryLancAfterClose(DataSet: TDataSet);
    procedure qryLanccod_tipo_lancChange(Sender: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancamentos: TfrmLancamentos;

implementation

 uses uDmPrincipal;

{$R *.dfm}

procedure TfrmLancamentos.acCancelarExecute(Sender: TObject);
begin
 btnGravar.Enabled := False;
 btnEditar.Enabled := True;
 btnExcluir.Enabled := True;
 btnNovo.Enabled := True;
 btnCancelar.Enabled := False;
 qryLanc.Cancel;
end;

procedure TfrmLancamentos.acEditarExecute(Sender: TObject);
begin
 btnEditar.Enabled := False;
 btnExcluir.Enabled := False;
 btnNovo.Enabled := False;
 btnGravar.Enabled := True;
 btnCancelar.Enabled := True;
 if not qryLanc.Active then
 begin
   qryLanc.Open();
 end;
 if not qryLanc.IsEmpty then
 begin
   qryLanc.Edit;
 end
 else
 begin
   ShowMessage('Selecione algu�m pra editar');
   Exit;
 end;
end;

procedure TfrmLancamentos.acExcluirExecute(Sender: TObject);
begin
  if not qryLanc.IsEmpty then
  begin
   if MessageDlg('Deseja realmente excluir?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    btnEditar.Enabled := True;
    btnExcluir.Enabled := True;
    btnNovo.Enabled := True;
    btnGravar.Enabled := False;
    btnCancelar.Enabled := False;
    qryLanc.Edit;
    qryLancdt_lanc.AsDateTime := now;
    qryLanc.Post;
    qryLanc.Refresh;
   end;
  end;
end;

procedure TfrmLancamentos.acGravarExecute(Sender: TObject);
begin
 if qryLanc.State in dsEditModes then
 begin
   if MessageDlg('Deseja realmente gravar?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    btnGravar.Enabled := False;
    btnEditar.Enabled := True;
    btnExcluir.Enabled := True;
    btnNovo.Enabled := True;
    btnCancelar.Enabled := False;
    qryLanc.Post;
   end;

 end;
end;

procedure TfrmLancamentos.acNovoExecute(Sender: TObject);
begin
 btnEditar.Enabled := False;
 btnExcluir.Enabled := False;
 btnNovo.Enabled := False;
 btnGravar.Enabled := True;
 btnCancelar.Enabled := True;
 if not qryLanc.Active then
 begin
   qryLanc.Open();
 end;
 qryLanc.Append;
 cbLkpTipoLanc.SetFocus;

end;

procedure TfrmLancamentos.acPesquisarExecute(Sender: TObject);
begin
qryLanc.Close();
qryLanc.Open();

end;

procedure TfrmLancamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmLancamentos := nil;
 Action := caFree;
end;

procedure TfrmLancamentos.qryLancAfterClose(DataSet: TDataSet);
begin
 qryTipoLanc.Close;
end;

procedure TfrmLancamentos.qryLancAfterOpen(DataSet: TDataSet);
begin
   qryTipoLanc.Open();

end;

procedure TfrmLancamentos.qryLanccod_tipo_lancChange(Sender: TField);
var
 lqry : TFDQuery;
begin
 if qryLanc.State in dsEditModes then
 begin
  lqry := TFDQuery.Create(self);
  lqry.Connection := dmPrincipal.MySQLConn;
  try
    lqry.SQL.Add('select categoria from tipos_lancamentos where cod_tipo_lanc = '
                      + qryLanccod_tipo_lanc.AsString);
    lqry.Open();
    qryLanccategoria.AsString := lqry.FieldByName('categoria').AsString;
  finally
    lqry.Free;
  end;
 end;

end;

end.
