unit uFrmMensalidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, System.Actions, Vcl.ActnList, Vcl.DBCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,uDmPrincipal,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.uiTypes,uConstantes, Vcl.ComCtrls;

type
  TfrmMensalidades = class(TForm)
    gbPsq: TGroupBox;
    lblEdtCod: TLabeledEdit;
    lblEdtDescricao: TLabeledEdit;
    btnPsq: TButton;
    AcList: TActionList;
    acNovo: TAction;
    acEditar: TAction;
    acGravar: TAction;
    acCancelar: TAction;
    acExcluir: TAction;
    acPesquisar: TAction;
    grdMens: TDBGrid;
    pnlBotoes: TPanel;
    btnNovo: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    btnEditar: TButton;
    btnGravar: TButton;
    edtCadastro: TDBEdit;
    Label5: TLabel;
    edtCodPes: TDBEdit;
    lblCodpes: TLabel;
    edtDescricao: TDBEdit;
    lblNome: TLabel;
    lkpCbAluno: TDBLookupComboBox;
    Label1: TLabel;
    edtValor: TDBEdit;
    Label6: TLabel;
    edtDtRecebimento: TDBEdit;
    Label2: TLabel;
    edtValorRecebido: TDBEdit;
    Label3: TLabel;
    btnReceber: TButton;
    edtDtVencimento: TDBEdit;
    Label7: TLabel;
    qryMensalidade: TFDQuery;
    dsMensalidade: TDataSource;
    qryMensalidadeCOD_MENSALIDADE: TFDAutoIncField;
    qryMensalidadeDESCRICAO: TStringField;
    qryMensalidadeCOD_ALUNO: TIntegerField;
    qryMensalidadeNOME: TStringField;
    qryMensalidadeDT_CADASTRO: TDateTimeField;
    qryMensalidadeDT_RECEBIMENTO: TDateTimeField;
    qryMensalidadeVALOR: TFloatField;
    qryMensalidadeVALOR_RECEBIDO: TFloatField;
    qryMensalidadeDT_VENCIMENTO: TDateField;
    qryAlunos: TFDQuery;
    qryAlunosCOD_PESSOA: TFDAutoIncField;
    qryAlunosNOME: TStringField;
    dsAluno: TDataSource;
    qryInsereLanc: TFDQuery;
    cbPsqAlunos: TComboBox;
    Label4: TLabel;
    qryMensalidadeAGGVLTOTAL: TAggregateField;
    qryMensalidadeAGGVLREC: TAggregateField;
    Label8: TLabel;
    edtAggTotal: TDBEdit;
    edtAggTotalRec: TDBEdit;
    Label9: TLabel;
    rgPsqRec: TRadioGroup;
    dtVencFim: TDateTimePicker;
    lblEDtVenc: TLabel;
    dtVencIni: TDateTimePicker;
    chkHabDtVenc: TCheckBox;
    rgInad: TRadioGroup;
    qryMensalidadeVENCIDA: TBooleanField;
    shpREd: TShape;
    Label10: TLabel;
    acBtnReceber: TAction;
    btnReplicar: TButton;
    acReplicar: TAction;
    procedure acNovoExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acGravarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure qryMensalidadeAfterOpen(DataSet: TDataSet);
    procedure qryMensalidadeAfterClose(DataSet: TDataSet);
    procedure edtValorRecebidoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkHabDtVencClick(Sender: TObject);
    procedure qryMensalidadeCalcFields(DataSet: TDataSet);
    procedure grdMensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure acBtnReceberExecute(Sender: TObject);
    procedure acReplicarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure EfetuarRecebimento;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensalidades: TfrmMensalidades;

implementation

 uses uFrmReplicarMens;

{$R *.dfm}

procedure TfrmMensalidades.acBtnReceberExecute(Sender: TObject);
begin
  if not qryMensalidade.IsEmpty then
  begin
   if qryMensalidade.State in dsEditModes then
   begin
     MessageBox(0, 'Não é possível receber com a mensalidade em edição! Antes salve ou cancele!'
        , 'Erro', MB_ICONERROR or MB_OK);
     Abort;
   end;
   if qryMensalidadeVALOR_RECEBIDO.AsFloat > 0 then
   begin
     MessageBox(0, 'Essa mensalidade já foi recebida' , 'Erro', MB_ICONERROR or MB_OK);
     Abort;
   end;
   qryMensalidade.Edit;
   edtValorRecebido.Enabled := True;
   if edtValorRecebido.CanFocus then
   begin
    edtValorRecebido.SetFocus;
   end;
   btnReceber.Enabled := false;
  end
  else
  begin
    MessageBox(0, 'Selecione alguma mensalidade para receber', 'Atenção', MB_ICONWARNING or MB_OK);
    Abort;
  end;
end;

procedure TfrmMensalidades.acCancelarExecute(Sender: TObject);
begin
 acGravar.Enabled := False;
 acEditar.Enabled := True;
 acExcluir.Enabled := True;
 acNovo.Enabled := True;
 acCancelar.Enabled := False;
 qryMensalidade.Cancel;
 grdMens.Enabled := True;
end;

procedure TfrmMensalidades.acEditarExecute(Sender: TObject);
begin
 if not qryMensalidade.Active then
 begin
   qryMensalidade.Open();
 end;
 if not qryMensalidade.IsEmpty then
 begin
   qryMensalidade.Edit;
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
 grdMens.Enabled := False;
 if edtDescricao.CanFocus then
 begin
   edtDescricao.SetFocus;
 end;

end;

procedure TfrmMensalidades.acExcluirExecute(Sender: TObject);
begin
  if not qryMensalidade.IsEmpty then
  begin
   if qryMensalidadeVALOR_RECEBIDO.AsFloat > 0  then
   begin
     MessageBox(0, 'Não é possível excluir mensalidade já recebida', 'Erro', MB_ICONERROR or MB_OK);
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
    qryMensalidade.Delete;
    qryMensalidade.Refresh;
    grdMens.Enabled := True;
   end;
  end;
end;

procedure TfrmMensalidades.acGravarExecute(Sender: TObject);
begin
 if qryMensalidade.State in dsEditModes then
 begin
   if qryMensalidadeDT_VENCIMENTO.IsNull then
   begin
     MessageBox(0, 'Informe a data de vencimento', 'Atenção', MB_ICONWARNING or MB_OK);
     if edtDtVencimento.CanFocus then
     begin
       edtDtVencimento.SetFocus;
     end;
     abort;
   end;
   if qryMensalidadeDT_VENCIMENTO.AsDateTime < Date then
   begin
     MessageBox(0, 'A data de vencimento deve ser maior do que a data de hoje!',
      'Atenção', MB_ICONWARNING or MB_OK);
     if edtDtVencimento.CanFocus then
     begin
       edtDtVencimento.SetFocus;
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
    qryMensalidade.Post;
    qryMensalidade.Refresh;
    grdMens.Enabled := True;
   end;

 end;
end;

procedure TfrmMensalidades.acNovoExecute(Sender: TObject);
begin
 acEditar.Enabled := False;
 acExcluir.Enabled := False;
 acNovo.Enabled := False;
 acGravar.Enabled := True;
 acCancelar.Enabled := True;
 grdMens.Enabled := False;
 if not qryMensalidade.Active then
 begin
   qryMensalidade.Open();
 end;
 qryMensalidade.Append;
 if edtDescricao.CanFocus then
 begin
  edtDescricao.SetFocus;
 end;
end;

procedure TfrmMensalidades.acPesquisarExecute(Sender: TObject);
begin
 qryMensalidade.Close;
 qryMensalidade.SQL.Clear;
 qryMensalidade.SQL.Add('SELECT M.COD_MENSALIDADE');
 qryMensalidade.SQL.Add('       ,M.DESCRICAO');
 qryMensalidade.SQL.Add('       ,M.COD_ALUNO');
 qryMensalidade.SQL.Add('       ,P.NOME');
 qryMensalidade.SQL.Add('       ,M.DT_VENCIMENTO');
 qryMensalidade.SQL.Add('       ,M.DT_CADASTRO');
 qryMensalidade.SQL.Add('       ,M.DT_RECEBIMENTO');
 qryMensalidade.SQL.Add('       ,M.VALOR');
 qryMensalidade.SQL.Add('       ,M.VALOR_RECEBIDO');
 qryMensalidade.SQL.Add('FROM MENSALIDADES M, PESSOAS P');
 qryMensalidade.SQL.Add('WHERE M.COD_ALUNO = P.COD_PESSOA');

 if lblEdtCod.Text <> '' then
 begin
   qryMensalidade.SQL.Add('AND M.COD_MENSALIDADE = :COD_MENSALIDADE');
   qryMensalidade.ParamByName('COD_MENSALIDADE').AsString := lblEdtCod.Text;
 end;
 if lblEdtDescricao.Text <> '' then
 begin
   qryMensalidade.SQL.Add('AND LOWER(M.DESCRICAO)  LIKE '+ QuotedStr('%' + LowerCase(lblEdtDescricao.Text)+'%') );
 end;
 if cbPsqAlunos.ItemIndex > 0  then
 begin
   qryMensalidade.SQL.Add('AND P.NOME = ' + QuotedStr(cbPsqAlunos.Text));
 end;
 if rgPsqRec.ItemIndex > 0 then
 begin
   case rgPsqRec.ItemIndex  of
    1 : qryMensalidade.SQL.Add('AND M.DT_RECEBIMENTO IS NOT NULL');
    2 : qryMensalidade.SQL.Add('AND M.DT_RECEBIMENTO IS NULL');
   end;
 end;
 if rgInad.ItemIndex > 0 then
 begin
   case rgInad.ItemIndex  of
    1 : qryMensalidade.SQL.Add('AND ( ( M.DT_RECEBIMENTO IS NULL) AND (M.DT_VENCIMENTO < CURDATE()) )');
    2 : qryMensalidade.SQL.Add('AND ( ( M.DT_RECEBIMENTO IS NOT NULL) OR (M.DT_VENCIMENTO >= CURDATE()) )');
   end;
 end;
 if chkHabDtVenc.Checked then
 begin
   qryMensalidade.SQL.Add('and m.dt_vencimento between :dtini and :dtfim');
   qryMensalidade.ParamByName('dtini').AsDate := dtVencIni.Date;
   qryMensalidade.ParamByName('dtfim').AsDate := dtVencFim.Date;
 end;

 qryMensalidade.SQL.Add('ORDER BY P.NOME,M.DESCRICAO');
 qryMensalidade.Open();

 if qryMensalidade.IsEmpty then
 begin
   MessageBox(0, 'Nada encontrado', 'Informação', MB_ICONINFORMATION or MB_OK);
   Exit;
 end;
end;

procedure TfrmMensalidades.acReplicarExecute(Sender: TObject);
begin
 if qryMensalidade.State in dsEditModes then
 begin
   MessageBox(0, 'Não é possível replicar com a mensalidade em edição! Antes salve ou cancele!'
      , 'Erro', MB_ICONERROR or MB_OK);
   Abort;
 end;
 if not qryMensalidade.IsEmpty then
 begin
 Application.CreateForm(TfrmRepMens,frmRepMens);
 frmRepMens.CodAluno  := qryMensalidadeCOD_ALUNO.AsInteger;
 frmRepMens.NomeAluno := qryMensalidadeNOME.AsString;
 frmRepMens.Descricao := qryMensalidadeDESCRICAO.AsString;
 frmRepMens.Valor     := qryMensalidadeVALOR.AsFloat;
 frmRepMens.DtVenc    := qryMensalidadeDT_VENCIMENTO.AsDateTime;
 frmRepMens.ShowModal;
 FreeAndNil(frmRepMens);
 end
 else
 begin
   MessageBox(0, 'Selecione alguma mensalidade para replicar', 'Atenção'
                    , MB_ICONWARNING or MB_OK);
   Abort;
 end;
end;

procedure TfrmMensalidades.chkHabDtVencClick(Sender: TObject);
begin
 dtVencIni.Enabled := chkHabDtVenc.Checked;
 dtVencFim.Enabled := chkHabDtVenc.Checked;
 lblEDtVenc.Enabled := chkHabDtVenc.Checked;
end;

procedure TfrmMensalidades.edtValorRecebidoExit(Sender: TObject);
begin
  btnReceber.Enabled := True;
  EfetuarRecebimento;
  edtValorRecebido.Enabled := False;
  qryMensalidade.Cancel;
end;

procedure TfrmMensalidades.EfetuarRecebimento;
var
  lStrAux: string;
begin

  lStrAux := '';
  if qryMensalidadeVALOR_RECEBIDO.AsFloat > 0 then
  begin
    if MessageDlg('Confirma o recebimento?', mtConfirmation, [mbNo, mbYes], 0) = mrYes then
    begin
      if qryMensalidadeVALOR_RECEBIDO.AsFloat < qryMensalidadeVALOR.AsFloat then
      begin
        lStrAux := 'menor';
      end
      else if qryMensalidadeVALOR_RECEBIDO.AsFloat > qryMensalidadeVALOR.AsFloat then
      begin
        lStrAux := 'maior';
      end;
      if not lStrAux.IsEmpty then
      begin
        if MessageDlg('O valor recebido é ' + lStrAux + ' do que o valor a receber! Deseja continuar?', mtWarning, [mbYes, mbNo], 0) = mrNo then
        begin
          Exit;
        end;
      end;
      qryMensalidadeDT_RECEBIMENTO.AsDateTime := now;
      qryMensalidade.Post;
      qryInsereLanc.ParamByName('DESCRICAO').AsString := qryMensalidadeDESCRICAO.AsString;
      qryInsereLanc.ParamByName('DT_VENCIMENTO').AsDate := qryMensalidadeDT_VENCIMENTO.AsDateTime;
      qryInsereLanc.ParamByName('VALOR').AsFloat := qryMensalidadeVALOR.AsFloat;
      qryInsereLanc.ParamByName('COD_MENSALIDADE').AsInteger := qryMensalidadeCOD_MENSALIDADE.AsInteger;
      qryInsereLanc.ParamByName('COD_TIPO_LANC').AsInteger := dmPrincipal.getCodTpLanc(LANC_MENS_ALUNO);
      dmPrincipal.MySQLConn.StartTransaction;
      qryInsereLanc.ExecSQL;
      dmPrincipal.MySQLConn.Commit;
      MessageBox(0, 'Mensalidade Recebida.'+#13+#10+'Lançamento de Receita gerado com sucesso.', 'Informação', MB_ICONINFORMATION or MB_OK);
    end;
  end;
end;

procedure TfrmMensalidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmMensalidades := nil;
 Action := CaFree;
end;

procedure TfrmMensalidades.FormCreate(Sender: TObject);
begin
 cbPsqAlunos.Items.Clear;
 cbPsqAlunos.Items.Add('Todos');
 cbPsqAlunos.ItemIndex := 0;
 qryAlunos.DisableControls;
 qryAlunos.Open();
 qryAlunos.First;
 while not qryAlunos.Eof do
 begin
   cbPsqAlunos.Items.Add(qryAlunosNOME.AsString);
   qryAlunos.Next;
 end;
 qryAlunos.Close;
 qryAlunos.EnableControls;
end;

procedure TfrmMensalidades.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
 begin
   key := #0;
   Perform(WM_NEXTDLGCTL, 0, 0);

 end;
end;

procedure TfrmMensalidades.grdMensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if qryMensalidadeVENCIDA.AsBoolean then
 begin
   grdMens.Canvas.Font.Color := clRed;
   grdMens.DefaultDrawDataCell(Rect, grdMens.columns[datacol].field, State);
 end;
end;

procedure TfrmMensalidades.qryMensalidadeAfterClose(DataSet: TDataSet);
begin
 qryAlunos.Close;
end;

procedure TfrmMensalidades.qryMensalidadeAfterOpen(DataSet: TDataSet);
begin
 qryAlunos.Open();
end;

procedure TfrmMensalidades.qryMensalidadeCalcFields(DataSet: TDataSet);
begin
  qryMensalidadeVENCIDA.AsBoolean
      := (qryMensalidadeDT_VENCIMENTO.AsDateTime < Date) and
         (qryMensalidadeDT_RECEBIMENTO.IsNull);
end;

end.
