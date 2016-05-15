unit uFrmMensalidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, System.Actions, Vcl.ActnList, Vcl.DBCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,uDmPrincipal,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.uiTypes,uConstantes, Vcl.ComCtrls, System.Classes;


type TRecebimento = (trIndividual,trAgrupado);

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
    rgVencidas: TRadioGroup;
    qryMensalidadeVENCIDA: TBooleanField;
    shpREd: TShape;
    Label10: TLabel;
    acBtnReceber: TAction;
    btnReplicar: TButton;
    acReplicar: TAction;
    qryMensalidadeCOD_PLANO: TIntegerField;
    Label11: TLabel;
    lkpcbPlano: TDBLookupComboBox;
    qryPlanos: TFDQuery;
    dsPlanos: TDataSource;
    qryPlanosID: TFDAutoIncField;
    qryPlanosDESCRICAO: TStringField;
    cbPsqPlanos: TComboBox;
    Label12: TLabel;
    qryMensalidadePLANO_DESC: TStringField;
    edtNumMeses: TDBEdit;
    Label13: TLabel;
    qryMensalidadeNUM_MESES: TIntegerField;
    qryAgrupamento: TFDQuery;
    qryAgrupamentocod_agrupamento: TFDAutoIncField;
    qryAgrupamentodt_operacao: TDateTimeField;
    qryUpdateMesmoAgrup: TFDQuery;
    qryMensalidadeCOD_AGRUPAMENTO: TIntegerField;
    edtCodAgrup: TDBEdit;
    Label14: TLabel;
    qryReceber: TFDQuery;
    qryReceberCOD_MENSALIDADE: TFDAutoIncField;
    qryReceberDESCRICAO: TStringField;
    qryReceberCOD_ALUNO: TIntegerField;
    qryReceberNOME: TStringField;
    qryReceberDT_VENCIMENTO: TDateField;
    qryReceberDT_CADASTRO: TDateTimeField;
    qryReceberDT_RECEBIMENTO: TDateTimeField;
    qryReceberVALOR: TFloatField;
    qryReceberVALOR_RECEBIDO: TFloatField;
    qryReceberCOD_PLANO: TIntegerField;
    qryReceberCOD_AGRUPAMENTO: TIntegerField;
    qryReceberPLANO_DESC: TStringField;
    qryReceberNUM_MESES: TIntegerField;
    qryMensalidadeCOD_FORMA_PAGAMENTO: TIntegerField;
    lkpCbFormaPag: TDBLookupComboBox;
    Label15: TLabel;
    qryFormaPag: TFDQuery;
    qryFormaPagid: TFDAutoIncField;
    qryFormaPagdescricao: TStringField;
    dsFormaPag: TDataSource;
    qryReceberCOD_FORMA_PAGAMENTO: TIntegerField;
    qryMensalidadeFORMA_PAG_DESC: TStringField;
    cbPsqFormaPag: TComboBox;
    Label16: TLabel;
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
    procedure qryMensalidadeCOD_PLANOChange(Sender: TField);
  private
    var
     FTipoRecebimento : TRecebimento;
    procedure EfetuarRecebimento(pTipoRec : TRecebimento);
    procedure PreenCbAlunos;
    procedure PreenCbPlanos;
    procedure PreenCbFormaPag;
    procedure SalvarMensalidade;
    procedure CriarProxMensalidades(pDescricao: string; pCodAluno: Integer; pCodPlano: Integer
              ; pValor: Double; pDtVencLoop: TDate; pCodAgrup : integer);
    procedure UpdateMesmoAgrupamento(pDescricao: string; pCodAluno: Integer
                ; pCodPlano: Integer; pValor: Double;pCodAgrup : integer);
    function getProxCodAgrup : integer;
    procedure ValidarParaReceber;
    procedure GerarLancamento(pDescricao: string; pDtVenc: TDate; pValorRec: Double;
                                  pCodMensalidade: Integer; pCodTipoLanc: Integer);
    function ReceberMensalidades(pCodAgrup: Integer; pValorRec: Double; pDtRec: TDateTime;pCodFormaPag : integer):TStringList;
    procedure ValidarPreenchimento;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensalidades: TfrmMensalidades;

implementation

 uses uFrmReplicarMens,Generics.Collections;

{$R *.dfm}

procedure TfrmMensalidades.acBtnReceberExecute(Sender: TObject);
begin
  if not qryMensalidade.IsEmpty then
  begin
   ValidarParaReceber;
   if MessageBox(0, 'Deseja receber todas as mensalidades desse agrupamento?'
        , 'Recebimento Agrupado', MB_ICONQUESTION or MB_YESNO) = mrYes then
   begin
    FTipoRecebimento := trAgrupado;

   end
   else
   begin
    FTipoRecebimento := trIndividual;
   end;
   qryMensalidade.Edit;
   edtValorRecebido.Enabled := True;
   lkpCbFormaPag.Enabled := True;
   if lkpCbFormaPag.CanFocus then
   begin
    lkpCbFormaPag.SetFocus;
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
    ValidarPreenchimento;

   if MessageDlg('Deseja realmente gravar?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    acGravar.Enabled := False;
    acEditar.Enabled := True;
    acExcluir.Enabled := True;
    acNovo.Enabled := True;
    acCancelar.Enabled := False;
    SalvarMensalidade;
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
 qryMensalidade.SQL.Add('       ,M.COD_PLANO');
 qryMensalidade.SQL.Add('       ,M.COD_AGRUPAMENTO');
 qryMensalidade.SQL.Add('       ,M.COD_FORMA_PAGAMENTO');
 qryMensalidade.SQL.Add('       ,FP.DESCRICAO FORMA_PAG_DESC');
 qryMensalidade.SQL.Add('       ,PL.NUM_MESES');
 qryMensalidade.SQL.Add('       ,PL.DESCRICAO PLANO_DESC');
 qryMensalidade.SQL.Add('FROM MENSALIDADES M');
 qryMensalidade.SQL.Add('INNER JOIN PESSOAS P ON M.COD_ALUNO = P.COD_PESSOA');
 qryMensalidade.SQL.Add('LEFT JOIN PLANOS PL ON M.COD_PLANO = PL.ID');
 qryMensalidade.SQL.Add('LEFT JOIN FORMAS_PAGAMENTO FP ON M.COD_FORMA_PAGAMENTO = FP.ID');
 qryMensalidade.SQL.Add('WHERE 1 = 1');
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
 if cbPsqPlanos.ItemIndex > 0  then
 begin
   qryMensalidade.SQL.Add('AND PL.DESCRICAO= ' + QuotedStr(cbPsqPlanos.Text));
 end;
 if cbPsqFormaPag.ItemIndex > 0  then
 begin
   qryMensalidade.SQL.Add('AND FP.DESCRICAO= ' + QuotedStr(cbPsqFormaPag.Text));
 end;
 if rgPsqRec.ItemIndex > 0 then
 begin
   case rgPsqRec.ItemIndex  of
    1 : qryMensalidade.SQL.Add('AND M.DT_RECEBIMENTO IS NOT NULL');
    2 : qryMensalidade.SQL.Add('AND M.DT_RECEBIMENTO IS NULL');
   end;
 end;
 if rgVencidas.ItemIndex > 0 then
 begin
   case rgVencidas.ItemIndex  of
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

 qryMensalidade.SQL.Add('ORDER BY P.NOME,M.DESCRICAO,M.DT_VENCIMENTO');
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
 frmRepMens.CodPlano  := qryMensalidadeCOD_PLANO.AsInteger;
 frmRepMens.CodformaPag := qryMensalidadeCOD_FORMA_PAGAMENTO.AsInteger;
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
  EfetuarRecebimento(FTipoRecebimento);
  edtValorRecebido.Enabled := False;
  lkpCbFormaPag.Enabled := False;
  qryMensalidade.Cancel;
end;

procedure TfrmMensalidades.EfetuarRecebimento(pTipoRec : TRecebimento);
var
  lStrAux: string;
  lCodAgrup : integer;
  lValorRec : double;
  lDescricao : string;
  lDtVenc : TDate;
  lCodMensalidade : integer;
  lCodTipoLanc : integer;
  lCodFormaPag : integer;
  lDtRec : TDateTime;
  lMsg : string;
  lListaNaoRec : TStringList;
  i : integer;
begin

  lStrAux := '';
  if qryMensalidadeVALOR_RECEBIDO.AsFloat > 0 then
  begin
    if qryMensalidadeCOD_FORMA_PAGAMENTO.AsInteger <= 0  then
    begin
      MessageBox(0, 'Informe uma forma de recebimento', 'Atenção', MB_ICONWARNING or MB_OK);
      if lkpCbFormaPag.CanFocus then
      begin
        lkpCbFormaPag.SetFocus;
      end;
      Abort;
    end;

    if MessageDlg('Confirma o recebimento?'+#13#10+'As mensalidades já recebidas não serão alteradas!'
            , mtConfirmation, [mbNo, mbYes], 0) = mrYes then
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
        if MessageDlg('O valor recebido é ' + lStrAux + ' do que o valor a receber! Deseja continuar?'
              , mtWarning, [mbYes, mbNo], 0) = mrNo then
        begin
          Exit;
        end;
      end;

      lDescricao := qryMensalidadeDESCRICAO.AsString;
      lDtVenc := qryMensalidadeDT_VENCIMENTO.AsDateTime;
      lCodAgrup := qryMensalidadeCOD_AGRUPAMENTO.AsInteger;
      lValorRec := qryMensalidadeVALOR_RECEBIDO.AsFloat;
      lCodMensalidade := qryMensalidadeCOD_MENSALIDADE.AsInteger;
      lCodFormaPag := qryMensalidadeCOD_FORMA_PAGAMENTO.AsInteger;
      lCodTipoLanc := dmPrincipal.getCodTpLanc(LANC_MENS_ALUNO);
      lDtRec := now;
      qryMensalidadeDT_RECEBIMENTO.AsDateTime := lDtRec;


      if pTipoRec = trIndividual then
      begin
        qryMensalidade.Post;
        GerarLancamento(lDescricao, lDtVenc, lValorRec, lCodMensalidade, lCodTipoLanc);
      end
      else if FTipoRecebimento = trAgrupado then
      begin
       lListaNaoRec := ReceberMensalidades(lCodAgrup, lValorRec, lDtRec,lCodFormaPag);
      end;
      lListaNaoRec := TStringList.Create;
      try
        if (Assigned(lListaNaoRec) and (lListaNaoRec.Count > 0) )then
        begin
          if lListaNaoRec.Count > 0 then
          begin
            lMsg := 'As seguintes mensalidades (Código || Dt.Vencimento) já estavam recebidas, e permaneceram inalteradas:';
            for i := 0 to lListaNaoRec.Count - 1 do
            begin
              lMsg := lMsg + #13#10 + lListaNaoRec[i];
            end;
          end;
        end
        else
        begin
          lMsg := 'Mensalidade(s) Recebida(s).'+#13#10+'Lançamento(s) de Receita gerado(s) com sucesso.';
        end;
      finally
        lListaNaoRec.Free;
      end;
      qryMensalidade.Refresh;

      MessageBox(0, pChar(lMsg) , 'Concluído', MB_ICONINFORMATION or MB_OK);
    end
    else
    begin
      qryMensalidadeCOD_FORMA_PAGAMENTO.Clear;
    end;
  end;
end;

procedure TfrmMensalidades.PreenCbAlunos;
begin
  cbPsqAlunos.Items.Clear;
  cbPsqAlunos.Items.Add('Todos');
  cbPsqAlunos.ItemIndex := 0;
  qryAlunos.DisableControls;
  qryAlunos.Open;
  qryAlunos.First;
  while not qryAlunos.Eof do
  begin
    cbPsqAlunos.Items.Add(qryAlunosNOME.AsString);
    qryAlunos.Next;
  end;
  qryAlunos.Close;
  qryAlunos.EnableControls;
end;

procedure TfrmMensalidades.PreenCbFormaPag;
begin
  cbPsqFormaPag.Items.Clear;
  cbPsqFormaPag.Items.Add('Todos');
  cbPsqFormaPag.ItemIndex := 0;
  qryFormaPag.DisableControls;
  qryFormaPag.Open;
  qryFormaPag.First;
  while not qryFormaPag.Eof do
  begin
    cbPsqFormaPag.Items.Add(qryFormaPagdescricao.AsString);
    qryFormaPag.Next;
  end;
  qryFormaPag.Close;
  qryFormaPag.EnableControls;
end;

procedure TfrmMensalidades.PreenCbPlanos;
begin
  cbPsqPlanos.Items.Clear;
  cbPsqPlanos.Items.Add('Todos');
  cbPsqPlanos.ItemIndex := 0;
  qryPlanos.DisableControls;
  qryPlanos.Open;
  qryPlanos.First;
  while not qryPlanos.Eof do
  begin
    cbPsqPlanos.Items.Add(qryPlanosDESCRICAO.AsString);
    qryPlanos.Next;
  end;
  qryPlanos.Close;
  qryPlanos.EnableControls;
end;

procedure TfrmMensalidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmMensalidades := nil;
 Action := CaFree;
end;

procedure TfrmMensalidades.FormCreate(Sender: TObject);
begin
  PreenCbAlunos;
  PreenCbPlanos;
  PreenCbFormaPag;
  dtVencIni.Date :=Date;
  dtVencFim.Date :=Date;
end;

procedure TfrmMensalidades.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
 begin
   key := #0;
   Perform(WM_NEXTDLGCTL, 0, 0);

 end;
end;

function TfrmMensalidades.getProxCodAgrup: integer;
begin
 if not qryAgrupamento.Active then
 begin
   qryAgrupamento.Open();
 end;
 qryAgrupamento.Append;
 qryAgrupamento.Post;
 result := qryAgrupamentocod_agrupamento.AsInteger;
end;

procedure TfrmMensalidades.ValidarParaReceber;
begin
  if qryMensalidade.State in dsEditModes then
  begin
    MessageBox(0, 'Não é possível receber com a mensalidade em edição! Antes salve ou cancele!', 'Erro', MB_ICONERROR or MB_OK);
    Abort;
  end;
  if qryMensalidadeVALOR_RECEBIDO.AsFloat > 0 then
  begin
    MessageBox(0, 'Essa mensalidade já foi recebida', 'Erro', MB_ICONERROR or MB_OK);
    Abort;
  end;
end;

procedure TfrmMensalidades.GerarLancamento(pDescricao: string; pDtVenc: TDate; pValorRec: Double;
            pCodMensalidade: Integer; pCodTipoLanc: Integer);
begin
  qryInsereLanc.ParamByName('DESCRICAO').AsString := pDescricao;
  qryInsereLanc.ParamByName('DT_VENCIMENTO').AsDate := pDtVenc;
  qryInsereLanc.ParamByName('VALOR').AsFloat := pValorRec;
  qryInsereLanc.ParamByName('COD_MENSALIDADE').AsInteger := pCodMensalidade;
  qryInsereLanc.ParamByName('COD_TIPO_LANC').AsInteger := pCodTipoLanc;
  dmPrincipal.MySQLConn.StartTransaction;
  try
    qryInsereLanc.ExecSQL;
    dmPrincipal.MySQLConn.Commit;
  except
    on E: Exception do
    begin
      dmPrincipal.MySQLConn.Rollback;
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TfrmMensalidades.ReceberMensalidades(pCodAgrup: Integer; pValorRec: Double
                ; pDtRec: TDateTime; pCodFormaPag : integer):TStringList;
var
 lListaNRecebidas : TStringList;
begin
  lListaNRecebidas  := TStringList.Create;
  qryReceber.Close;
  qryReceber.ParamByName('COD_AGRUPAMENTO').AsInteger := pCodAgrup;
  qryReceber.Open;
  qryReceber.First;
  while not qryReceber.Eof do
  begin
    if qryReceberDT_RECEBIMENTO.IsNull then
    begin
      qryReceber.Edit;
      qryReceberDT_RECEBIMENTO.AsDateTime := pDtRec;
      qryReceberVALOR_RECEBIDO.AsFloat := pValorRec;
      qryReceberCOD_FORMA_PAGAMENTO.AsInteger :=pCodFormaPag;
      qryReceber.Post;
      GerarLancamento(qryReceberDESCRICAO.AsString
                      ,qryReceberDT_VENCIMENTO.AsDateTime
                      ,pValorRec
                      ,qryMensalidadeCOD_MENSALIDADE.AsInteger
                      ,dmPrincipal.getCodTpLanc(LANC_MENS_ALUNO));
    end
    else
    begin
      lListaNRecebidas.Add(qryReceberCOD_MENSALIDADE.AsString + ' || ' + qryReceberDT_VENCIMENTO.AsString);
    end;
    qryReceber.Next;
  end;
  Result := lListaNRecebidas;
end;

procedure TfrmMensalidades.ValidarPreenchimento;
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
    MessageBox(0, 'A data de vencimento deve ser maior do que a data de hoje!', 'Atenção', MB_ICONWARNING or MB_OK);
    if edtDtVencimento.CanFocus then
    begin
      edtDtVencimento.SetFocus;
    end;
    Abort;
  end;
  if qryMensalidadeCOD_PLANO.AsInteger <= 0 then
  begin
    MessageBox(0, 'Informe um plano', 'Atenção', MB_ICONWARNING or MB_OK);
    if lkpcbPlano.CanFocus then
    begin
      lkpcbPlano.SetFocus;
    end;
    Abort;
  end;
  if qryMensalidadeCOD_ALUNO.AsInteger <= 0 then
  begin
    MessageBox(0, 'Informe um aluno', 'Atenção', MB_ICONWARNING or MB_OK);
    if lkpCbAluno.CanFocus then
    begin
      lkpCbAluno.SetFocus;
    end;
    Abort;
  end;
end;

procedure TfrmMensalidades.CriarProxMensalidades(pDescricao: string; pCodAluno: Integer;
                          pCodPlano: Integer; pValor: Double; pDtVencLoop: TDate;
                          pCodAgrup:integer);

begin
  if qryMensalidade.State <> dsInsert then
  begin
    qryMensalidade.Append;
  end;
  qryMensalidade.FieldByName('DESCRICAO').AsString := pDescricao;
  qryMensalidade.FieldByName('COD_ALUNO').AsInteger := pCodAluno;
  qryMensalidade.FieldByName('COD_PLANO').AsInteger := pCodPlano;
  qryMensalidade.FieldByName('VALOR').AsFloat := pValor;
  qryMensalidade.FieldByName('DT_VENCIMENTO').AsDateTime := pDtVencLoop;
  qryMensalidade.FieldByName('COD_AGRUPAMENTO').AsInteger := pCodAgrup;
  qryMensalidade.Post;
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
 qryPlanos.Close;
 qryFormaPag.Close();
end;

procedure TfrmMensalidades.qryMensalidadeAfterOpen(DataSet: TDataSet);
begin
 qryAlunos.Open();
 qryPlanos.Open();
 qryFormaPag.Open();
end;

procedure TfrmMensalidades.qryMensalidadeCalcFields(DataSet: TDataSet);
begin
  qryMensalidadeVENCIDA.AsBoolean
      := (qryMensalidadeDT_VENCIMENTO.AsDateTime < Date) and
         (qryMensalidadeDT_RECEBIMENTO.IsNull);
end;

procedure TfrmMensalidades.qryMensalidadeCOD_PLANOChange(Sender: TField);
 var
 lQrySelect : TFdQuery;
begin
 if qryMensalidade.State in dsEditModes then
 begin
    lQrySelect := TFdQuery.Create(self);
    try
       lQrySelect.Connection := dmPrincipal.MySQLConn;
       lQrySelect.SQL.Add('SELECT VALOR,NUM_MESES FROM PLANOS');
       lQrySelect.SQL.Add('WHERE ID = ' + InTtoStr(qryMensalidadeCOD_PLANO.AsInteger));
       lQrySelect.SQL.Add('LIMIT 1');
       lQrySelect.Open();
       qryMensalidadeVALOR.AsFloat := lQrySelect.FieldByName('VALOR').AsFloat;
       qryMensalidadeNUM_MESES.AsInteger := lQrySelect.FieldByName('NUM_MESES').AsInteger;
    finally
     lQrySelect.Free;
    end;
 end;
end;

procedure TfrmMensalidades.SalvarMensalidade;
var
 lNumMeses : integer;
 lListaVenc : TList<TDate>;
 lDtVencLoop,lDtVenc : TDate;
 lDescricao : string;
 lCodAluno,lCodPlano : integer;
 lValor : double;
 lOperacao : TDataSetState;
 lCodAgrup : Integer;
begin
 lDescricao := qryMensalidadeDESCRICAO.AsString;
 lCodAluno := qryMensalidadeCOD_ALUNO.AsInteger;
 lCodPlano := qryMensalidadeCOD_PLANO.AsInteger;
 lValor := qryMensalidadeVALOR.AsFloat;
 lNumMeses := qryMensalidadeNUM_MESES.AsInteger;
 lDtVenc := qryMensalidadeDT_VENCIMENTO.AsDateTime;
 lOperacao := qryMensalidade.State;
 if lOperacao = dsInsert then
 begin
   lCodAgrup := getProxCodAgrup;
   qryMensalidadeCOD_AGRUPAMENTO.AsInteger := lCodAgrup;
   qryMensalidade.Post;
   dec(lNumMeses);
   lListaVenc := dmPrincipal.getProxVencimentos(lNumMeses,lDtVenc);
   for lDtVencLoop in lListaVenc do
   begin
      CriarProxMensalidades(lDescricao, lCodAluno, lCodPlano, lValor, lDtVencLoop,lCodAgrup);
   end;
 end
 else if lOperacao = dsEdit then
 begin
   if MessageBox(0, 'Deseja replicar a alteração para todas as mensalidades desse agrupamento?' + #13#10
                + 'A data de vencimento não será replicada!'
          , 'Atenção', MB_ICONWARNING or MB_YESNO) = mrYes then
   begin

     lCodAgrup := qryMensalidadeCOD_AGRUPAMENTO.AsInteger;
     qryMensalidade.Post;
     UpdateMesmoAgrupamento(lDescricao, lCodAluno, lCodPlano, lValor,lCodAgrup);
   end;
 end;





end;

procedure TfrmMensalidades.UpdateMesmoAgrupamento(pDescricao: string; pCodAluno,
      pCodPlano: Integer; pValor: Double; pCodAgrup : integer);
begin
 qryUpdateMesmoAgrup.ParamByName('DESCRICAO').AsString := pDescricao;
 qryUpdateMesmoAgrup.ParamByName('COD_ALUNO').Asinteger := pCodAluno;
 qryUpdateMesmoAgrup.ParamByName('COD_PLANO').Asinteger := pCodPlano;
 qryUpdateMesmoAgrup.ParamByName('VALOR').AsFloat := pValor;
 qryUpdateMesmoAgrup.ParamByName('COD_AGRUPAMENTO').AsInteger := pCodAgrup;
 dmPrincipal.MySQLConn.StartTransaction;
 try
  qryUpdateMesmoAgrup.ExecSQL;
  dmPrincipal.MySQLConn.Commit;

 except
   on E: Exception do
   begin
     dmPrincipal.MySQLConn.Rollback;
     raise Exception.Create(E.Message);
   end;

 end;
end;

end.
