unit uFrmLancFixos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,System.UITypes,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.DBCtrls, Vcl.Mask, System.Actions,
  Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmLancFixos = class(TForm)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    lblEdtCod: TLabeledEdit;
    lblEdtDesc: TLabeledEdit;
    btnPsq: TButton;
    cbCategoria: TComboBox;
    grLancFixos: TDBGrid;
    cbLkpTipoLanc: TDBLookupComboBox;
    Label1: TLabel;
    qryTipoLanc: TFDQuery;
    qryTipoLanccod_tipo_lanc: TFDAutoIncField;
    qryTipoLancdescricao: TStringField;
    dsTipoLanc: TDataSource;
    AcList: TActionList;
    acNovo: TAction;
    acEditar: TAction;
    acGravar: TAction;
    acCancelar: TAction;
    acExcluir: TAction;
    acPesquisar: TAction;
    lblCodpes: TLabel;
    edtCodLanc: TDBEdit;
    edtDescricao: TDBEdit;
    lblDesc: TLabel;
    dbRgCat: TDBRadioGroup;
    edtDtIni: TDBEdit;
    Label2: TLabel;
    edtDia: TDBEdit;
    Label3: TLabel;
    qryLancFixos: TFDQuery;
    dsLancFixos: TDataSource;
    pnlBotoes: TPanel;
    btnNovo: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    btnEditar: TButton;
    btnGravar: TButton;
    qryLancFixoscod_lanc_fixo: TFDAutoIncField;
    qryLancFixosdescricao: TStringField;
    qryLancFixoscod_tipo_lanc: TIntegerField;
    qryLancFixosdt_ini: TDateField;
    qryLancFixosdia: TIntegerField;
    qryLancFixosdesc_lanc: TStringField;
    Label5: TLabel;
    qryLancFixoscategoria: TStringField;
    qryLancFixosvalor: TFloatField;
    edtValor: TDBEdit;
    Label6: TLabel;
    edtValorTotal: TDBEdit;
    Label7: TLabel;
    qryLancFixosAggValorTotal: TAggregateField;
    procedure acNovoExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acGravarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure qryLancFixosAfterClose(DataSet: TDataSet);
    procedure qryLancFixosAfterOpen(DataSet: TDataSet);
    procedure qryLancFixoscod_tipo_lancChange(Sender: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
   procedure validarPreench;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancFixos: TfrmLancFixos;

implementation

 uses uDmPrincipal;

{$R *.dfm}

procedure TfrmLancFixos.acCancelarExecute(Sender: TObject);
begin
 acGravar.Enabled := False;
 acEditar.Enabled := True;
 acExcluir.Enabled := True;
 acNovo.Enabled := True;
 acCancelar.Enabled := False;
 qryLancFixos.Cancel;
end;

procedure TfrmLancFixos.acEditarExecute(Sender: TObject);
begin
 acEditar.Enabled := False;
 acExcluir.Enabled := False;
 acNovo.Enabled := False;
 acGravar.Enabled := True;
 acCancelar.Enabled := True;
 if not qryLancFixos.Active then
 begin
   qryLancFixos.Open();
 end;
 if not qryLancFixos.IsEmpty then
 begin
   qryLancFixos.Edit;
 end
 else
 begin
   MessageBox(0, 'Selecione um registro para editar!', 'Atenção', MB_ICONWARNING or MB_OK);
   acCancelarExecute(Sender);
   Exit;
 end;
end;

procedure TfrmLancFixos.acExcluirExecute(Sender: TObject);
begin
  if not qryLancFixos.IsEmpty then
  begin
   if MessageDlg('Deseja realmente excluir?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    acEditar.Enabled := True;
    acExcluir.Enabled := True;
    acNovo.Enabled := True;
    acGravar.Enabled := False;
    acCancelar.Enabled := False;
    qryLancFixos.Delete;
    qryLancFixos.Refresh;
   end;
  end;
end;

procedure TfrmLancFixos.acGravarExecute(Sender: TObject);
begin
 if qryLancFixos.State in dsEditModes then
 begin
   if MessageDlg('Deseja realmente gravar?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    ValidarPreench;
    acGravar.Enabled := False;
    acEditar.Enabled := True;
    acExcluir.Enabled := True;
    acNovo.Enabled := True;
    acCancelar.Enabled := False;
    qryLancFixos.Post;
    qryLancFixos.Refresh;
   end;

 end;
end;

procedure TfrmLancFixos.acNovoExecute(Sender: TObject);
begin
 acEditar.Enabled := False;
 acExcluir.Enabled := False;
 acNovo.Enabled := False;
 acGravar.Enabled := True;
 acCancelar.Enabled := True;
 if not qryLancFixos.Active then
 begin
   qryLancFixos.Open();
 end;
 qryLancFixos.Append;
 cbLkpTipoLanc.SetFocus;
end;

procedure TfrmLancFixos.acPesquisarExecute(Sender: TObject);
begin
 qryLancFixos.Close();
 qryLancFixos.SQL.Clear;
 qryLancFixos.SQL.Add(' select lf.cod_lanc_fixo,');
 qryLancFixos.SQL.Add('       lf.descricao,');
 qryLancFixos.SQL.Add('       lf.cod_tipo_lanc,');
 qryLancFixos.SQL.Add('       lf.dt_ini,');
 qryLancFixos.SQL.Add('       lf.valor,');
 qryLancFixos.SQL.Add('       lf.dia,');
 qryLancFixos.SQL.Add('       tl.descricao desc_lanc,');
 qryLancFixos.SQL.Add('       tl.categoria');
 qryLancFixos.SQL.Add('from lancamentos_fixos lf, tipos_lancamentos tl');
 qryLancFixos.SQL.Add('where lf.cod_tipo_lanc = tl.cod_tipo_lanc');

 if lblEdtCod.Text <> '' then
 begin
   qryLancFixos.SQL.Add('AND lf.cod_lanc = :cod_lanc');
   qryLancFixos.ParamByName('cod_lanc').AsString := lblEdtCod.Text;
 end;
 if lblEdtDesc.Text <> '' then
 begin
   qryLancFixos.SQL.Add('AND LOWER(lf.descricao)  LIKE '+ QuotedStr('%' + LowerCase(lblEdtDesc.Text)+'%') );
 end;
 if cbCategoria.ItemIndex > 0 then
 begin
  qryLancFixos.SQL.Add('AND LOWER(tl.categoria) = ' + LowerCase(QuotedStr(cbCategoria.Text)));
 end;
 qryLancFixos.SQL.Add('order by lf.descricao');
 qryLancFixos.Open();
 if qryLancFixos.IsEmpty then
 begin
   MessageBox(0, 'Nada encontrado', 'Informação', MB_ICONINFORMATION or MB_OK);
   Exit;
 end;

end;

procedure TfrmLancFixos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmLancFixos := nil;
 action := cafree;
end;

procedure TfrmLancFixos.qryLancFixosAfterClose(DataSet: TDataSet);
begin
 qryTipoLanc.Close;
end;

procedure TfrmLancFixos.qryLancFixosAfterOpen(DataSet: TDataSet);
begin
 qryTipoLanc.Open();
end;

procedure TfrmLancFixos.qryLancFixoscod_tipo_lancChange(Sender: TField);
var
 lqry : TFDQuery;
begin
 if qryLancFixos.State in dsEditModes then
 begin
  lqry := TFDQuery.Create(self);
  lqry.Connection := dmPrincipal.MySQLConn;
  try
    lqry.SQL.Add('select categoria from tipos_lancamentos where cod_tipo_lanc = '
                      + qryLancFixoscod_tipo_lanc.AsString);
    lqry.Open();
    qryLancFixoscategoria.AsString := lqry.FieldByName('categoria').AsString;
  finally
    lqry.Free;
  end;
 end;

end;


procedure TfrmLancFixos.validarPreench;
begin
 if qryLancFixosdt_ini.IsNull then
 begin
   MessageBox(0, 'Preencha a data de início', 'Atenção', MB_ICONWARNING or MB_OK);
   if edtDtIni.CanFocus then
   begin
     edtDtIni.SetFocus;
   end;
   Abort;
 end
 else if qryLancFixosdt_ini.AsDateTime <= date then
 begin
   MessageBox(0, 'A data inicial deve ser maior do que hoje', 'Atenção', MB_ICONWARNING or MB_OK);
   if edtDtIni.CanFocus then
   begin
     edtDtIni.SetFocus;
   end;
   Abort;
 end
 else if qryLancFixosdia.IsNull then
 begin
   MessageBox(0, 'Especifique em qual dia do mês serão gerados os lançamentos', 'Atenção', MB_ICONWARNING or MB_OK);
   if edtDia.CanFocus then
   begin
     edtDia.SetFocus;
   end;
   Abort;
 end
 else if (qryLancFixosdia.AsInteger <= 0) or (qryLancFixosdia.AsInteger > 31) then
 begin
   MessageBox(0, 'O dia deve estar entre 1 e 31', 'Atenção', MB_ICONWARNING or MB_OK);
   if edtDia.CanFocus then
   begin
     edtDia.SetFocus;
   end;
   Abort;
 end
 else if qryLancFixosvalor.AsFloat <= 0 then
 begin
  MessageBox(0, 'O valor do lançamento deve ser maior do que 0', 'Atenção', MB_ICONWARNING or MB_OK);
  if edtValor.CanFocus then
  begin
    edtValor.SetFocus;
  end;
  Abort;

 end;

end;

end.
