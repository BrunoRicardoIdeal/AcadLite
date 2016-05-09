unit uFrmRelMens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Actions, Vcl.ActnList, frxClass, frxDBSet;

type
  TfrmRelMens = class(TForm)
    lblEDataVenc: TLabel;
    Label1: TLabel;
    lblEdtCod: TLabeledEdit;
    lblEdtDesc: TLabeledEdit;
    chkHabDtVenc: TCheckBox;
    dtVencIni: TDateTimePicker;
    dtVencFim: TDateTimePicker;
    cbAlunos: TComboBox;
    rgPsqRec: TRadioGroup;
    rgInad: TRadioGroup;
    qryAlunos: TFDQuery;
    qryAlunosCOD_PESSOA: TFDAutoIncField;
    qryAlunosNOME: TStringField;
    ActionList: TActionList;
    acLimpar: TAction;
    acEmitir: TAction;
    pnlBotoes: TPanel;
    btnEmitir: TButton;
    btnLimpar: TButton;
    qryMensalidade: TFDQuery;
    qryMensalidadeCOD_MENSALIDADE: TFDAutoIncField;
    qryMensalidadeDESCRICAO: TStringField;
    qryMensalidadeCOD_ALUNO: TIntegerField;
    qryMensalidadeNOME: TStringField;
    qryMensalidadeDT_CADASTRO: TDateTimeField;
    qryMensalidadeDT_RECEBIMENTO: TDateTimeField;
    qryMensalidadeVALOR: TFloatField;
    qryMensalidadeVALOR_RECEBIDO: TFloatField;
    qryMensalidadeDT_VENCIMENTO: TDateField;
    qryMensalidadeVENCIDA: TBooleanField;
    frxMens: TfrxReport;
    frxDBMens: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure acLimparExecute(Sender: TObject);
    procedure acEmitirExecute(Sender: TObject);
    procedure chkHabDtVencClick(Sender: TObject);
    procedure frxMensBeforePrint(Sender: TfrxReportComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelMens: TfrmRelMens;

implementation

{$R *.dfm}

procedure TfrmRelMens.acEmitirExecute(Sender: TObject);
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
 if lblEdtDesc.Text <> '' then
 begin
   qryMensalidade.SQL.Add('AND LOWER(M.DESCRICAO)  LIKE '+ QuotedStr('%' + LowerCase(lblEdtDesc.Text)+'%') );
 end;
 if cbAlunos.ItemIndex > 0  then
 begin
   qryMensalidade.SQL.Add('AND P.NOME = ' + QuotedStr(cbAlunos.Text));
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

 qryMensalidade.SQL.Add('ORDER BY M.DT_VENCIMENTO DESC, P.NOME,M.DESCRICAO');
 qryMensalidade.Open();

 if qryMensalidade.IsEmpty then
 begin
   MessageBox(0, 'Nada encontrado', 'Informação', MB_ICONINFORMATION or MB_OK);
   Exit;
 end
 else
 begin
   frxMens.PrepareReport(True);
   frxMens.ShowReport();
 end;
end;

procedure TfrmRelMens.acLimparExecute(Sender: TObject);
begin
 lblEdtCod.Clear;
 lblEdtDesc.Clear;
 cbAlunos.ItemIndex := 0;
 chkHabDtVenc.Checked := False;
 dtVencIni.Date := date;
 dtVencFim.Date := date;
 lblEDataVenc.Enabled := False;
 rgPsqRec.ItemIndex := 0;
 rgInad.ItemIndex := 0;
end;

procedure TfrmRelMens.chkHabDtVencClick(Sender: TObject);
begin
 dtVencIni.Enabled := chkHabDtVenc.Checked;
 dtVencFim.Enabled := chkHabDtVenc.Checked;
 lblEDataVenc.Enabled := chkHabDtVenc.Checked;
end;

procedure TfrmRelMens.FormCreate(Sender: TObject);
begin
 cbAlunos.Items.Clear;
 cbAlunos.Items.Add('Todos');
 cbAlunos.ItemIndex := 0;
 qryAlunos.DisableControls;
 qryAlunos.Open();
 qryAlunos.First;
 while not qryAlunos.Eof do
 begin
   cbAlunos.Items.Add(qryAlunosNOME.AsString);
   qryAlunos.Next;
 end;
 qryAlunos.Close;
 qryAlunos.EnableControls;
end;

procedure TfrmRelMens.frxMensBeforePrint(Sender: TfrxReportComponent);
var
 lnome : string;
 lMemo : TfrxMemoView;
begin
 if Sender is TfrxMemoView then
 begin
   lMemo := Sender as TfrxMemoView;
   lnome := LowerCase(Sender.Name);
   if lnome = 'memofiltrocod'then
   begin
      if lblEdtCod.Text <> '' then
      begin
        lMemo.Text := lblEdtCod.Text;
      end;
   end
   else
   if lnome = 'memofiltrodesc'then
   begin
      if lblEdtDesc.Text <> '' then
      begin
        lMemo.Text := lblEdtDesc.Text;
      end;
   end
   else
   if lnome = 'memofiltroinad'then
   begin
     lMemo.Text := rgInad.Items[rgInad.ItemIndex];
   end
   else
   if lnome = 'memofiltroaluno'then
   begin
     lMemo.Text := cbAlunos.Text;
   end
   else
   if lnome = 'memofiltroreceb'then
   begin
     lMemo.Text := rgPsqRec.Items[rgPsqRec.ItemIndex];
   end
   else
   if lnome = 'memofiltrodtvenc'then
   begin
    if chkHabDtVenc.Checked then
    begin
     lMemo.Text := FormatDateTime('dd/mm/yyyy',dtVencIni.Date) + ' a '
                    + FormatDateTime('dd/mm/yyyy',dtVencFim.Date) ;
    end;
   end;

 end;

end;

end.
