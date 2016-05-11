unit uFrmLancamentos;

interface

uses
  Winapi.Windows,System.UITypes, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls;

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
    grdLanc: TDBGrid;
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
    qryLancdt_exclusao: TDateTimeField;
    edtDtExclusao: TDBEdit;
    Label3: TLabel;
    chkHabDtVenc: TCheckBox;
    dtVencIni: TDateTimePicker;
    dtVencFim: TDateTimePicker;
    lblEDtVenc: TLabel;
    edtValor: TDBEdit;
    Label6: TLabel;
    qryLancvalor: TFloatField;
    qryLancfixo: TStringField;
    DBCheckBox1: TDBCheckBox;
    edtValorTotal: TDBEdit;
    Label7: TLabel;
    qryLancAggValorTotal: TAggregateField;
    edtTotReceita: TDBEdit;
    Label8: TLabel;
    edtTotDesp: TDBEdit;
    Label9: TLabel;
    qryLancvalor_receita: TFloatField;
    qryLancvalor_despesa: TFloatField;
    qryLancAggTotalRec: TAggregateField;
    qryLancAggTotalDesp: TAggregateField;
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
    procedure chkHabDtVencClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
   procedure ValidarPreench;
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
 acGravar.Enabled := False;
 acEditar.Enabled := True;
 acExcluir.Enabled := True;
 acNovo.Enabled := True;
 acCancelar.Enabled := False;
 qryLanc.Cancel;
 grdLanc.Enabled := True;
end;

procedure TfrmLancamentos.acEditarExecute(Sender: TObject);
begin
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
   MessageBox(0, 'Selecione um registro para editar!', 'Atenção', MB_ICONWARNING or MB_OK);
   Exit;
 end;
 acEditar.Enabled := False;
 acExcluir.Enabled := False;
 acNovo.Enabled := False;
 acGravar.Enabled := True;
 acCancelar.Enabled := True;
 grdLanc.Enabled := False;
end;

procedure TfrmLancamentos.acExcluirExecute(Sender: TObject);
begin
  if not qryLanc.IsEmpty then
  begin
   if MessageDlg('Deseja realmente excluir?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    acEditar.Enabled := True;
    acExcluir.Enabled := True;
    acNovo.Enabled := True;
    acGravar.Enabled := False;
    acCancelar.Enabled := False;
    qryLanc.Edit;
    qryLancdt_exclusao.AsDateTime := now;
    qryLanc.Post;
    qryLanc.Refresh;
    grdLanc.Enabled := True;
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
    ValidarPreench;
    acGravar.Enabled := False;
    acEditar.Enabled := True;
    acExcluir.Enabled := True;
    acNovo.Enabled := True;
    acCancelar.Enabled := False;
    qryLanc.Post;
    qryLanc.Refresh;
    grdLanc.Enabled := True;
   end;

 end;
end;

procedure TfrmLancamentos.acNovoExecute(Sender: TObject);
begin
 acEditar.Enabled := False;
 acExcluir.Enabled := False;
 acNovo.Enabled := False;
 acGravar.Enabled := True;
 acCancelar.Enabled := True;
 grdLanc.Enabled := False;
 if not qryLanc.Active then
 begin
   qryLanc.Open();
 end;
 qryLanc.Append;
 if cbLkpTipoLanc.CanFocus then
 begin
  cbLkpTipoLanc.SetFocus;
 end;


end;

procedure TfrmLancamentos.acPesquisarExecute(Sender: TObject);
begin
 qryLanc.Close();
 qryLanc.SQL.Clear;
 qryLanc.SQL.Add('select l.cod_lanc');
 qryLanc.SQL.Add('       ,l.descricao');
 qryLanc.SQL.Add('       ,l.dt_lanc');
 qryLanc.SQL.Add('       ,l.dt_vencimento');
 qryLanc.SQL.Add('       ,l.dt_exclusao');
 qryLanc.SQL.Add('       ,l.cod_tipo_lanc');
 qryLanc.SQL.Add('       ,l.valor');
 qryLanc.SQL.Add('       ,l.fixo');
 qryLanc.SQL.Add('       ,tl.descricao tipo_lanc_desc');
 qryLanc.SQL.Add('       ,tl.categoria');
 qryLanc.SQL.Add('       ,case tl.categoria');
 qryLanc.SQL.Add('          when  ''Receita'' then l.valor');
 qryLanc.SQL.Add('          else  0');
 qryLanc.SQL.Add('        end valor_receita');
 qryLanc.SQL.Add('       ,case tl.categoria');
 qryLanc.SQL.Add('          when  ''Despesa'' then l.valor');
 qryLanc.SQL.Add('          else  0');
 qryLanc.SQL.Add('        end valor_despesa');
 qryLanc.SQL.Add('from lancamentos l , tipos_lancamentos tl');
 qryLanc.SQL.Add('where l.cod_tipo_lanc = tl.cod_tipo_lanc');
 if lblEdtCod.Text <> '' then
 begin
   qryLanc.SQL.Add('AND l.cod_lanc = :cod_lanc');
   qryLanc.ParamByName('cod_lanc').AsString := lblEdtCod.Text;
 end;
 if lblEdtDesc.Text <> '' then
 begin
   qryLanc.SQL.Add('AND LOWER(l.descricao)  LIKE '+ QuotedStr('%' + LowerCase(lblEdtDesc.Text)+'%') );
 end;
 if cbCategoria.ItemIndex > 0 then
 begin
  qryLanc.SQL.Add('AND LOWER(tl.categoria) = ' + LowerCase(QuotedStr(cbCategoria.Text)));
 end;
 if chkHabDtVenc.Checked then
 begin
   qryLanc.SQL.Add('and l.dt_vencimento between :dtini and :dtfim');
   qryLanc.ParamByName('dtini').AsDate := dtVencIni.Date;
   qryLanc.ParamByName('dtfim').AsDate := dtVencFim.Date;
 end;
 if chkExcluidos.Checked then
 begin
  qryLanc.SQL.Add('and l.dt_exclusao is not null');
 end
 else
 begin
  qryLanc.SQL.Add('and l.dt_exclusao is null');
 end;
 qryLanc.SQL.Add('order by l.descricao');
 qryLanc.Open();
 if qryLanc.IsEmpty then
 begin
   MessageBox(0, 'Nada encontrado', 'Informação', MB_ICONWARNING or MB_OK);
   Exit;
 end;


end;

procedure TfrmLancamentos.chkHabDtVencClick(Sender: TObject);
begin
 dtVencIni.Enabled := chkHabDtVenc.Checked;
 dtVencFim.Enabled := chkHabDtVenc.Checked;
 lblEDtVenc.Enabled := chkHabDtVenc.Checked;
end;

procedure TfrmLancamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmLancamentos := nil;
 Action := caFree;
end;

procedure TfrmLancamentos.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
 begin
   key := #0;
   Perform(WM_NEXTDLGCTL, 0, 0);

 end;
end;

procedure TfrmLancamentos.FormShow(Sender: TObject);
begin
 dtVencIni.Date := date;
 dtVencFim.Date := date;
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

procedure TfrmLancamentos.ValidarPreench;
begin
 if qryLanccod_tipo_lanc.IsNull   then
 begin
   MessageBox(0, 'Informe um tipo de lançamento', 'Atenção', MB_ICONWARNING or MB_OK);
   if cbLkpTipoLanc.CanFocus then
   begin
     cbLkpTipoLanc.SetFocus;
   end;
   Abort;
 end
 else if qryLancdt_vencimento.IsNull then
 begin
   MessageBox(0, 'Informe uma data de vencimento', 'Atenção', MB_ICONWARNING or MB_OK);
   if edtDtVenc.CanFocus then
   begin
     edtDtVenc.SetFocus;
   end;
   Abort;
 end
 else if qryLancdt_vencimento.AsDateTime <= date then
 begin
   MessageBox(0, 'A data de vencimento deve ser maior do que hoje', 'Atenção', MB_ICONWARNING or MB_OK);
   if edtDtVenc.CanFocus then
   begin
     edtDtVenc.SetFocus;
   end;
   Abort;
 end
 else if qryLancvalor.AsFloat <= 0 then
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
