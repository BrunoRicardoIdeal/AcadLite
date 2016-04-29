unit uFrmRelLanc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, frxClass,
  frxDBSet;

type
  TfrmRelLanc = class(TForm)
    ActionList: TActionList;
    acLimpar: TAction;
    acEmitir: TAction;
    pnlBotoes: TPanel;
    btnEmitir: TButton;
    btnLimpar: TButton;
    lblEdtCod: TLabeledEdit;
    lblEdtDesc: TLabeledEdit;
    chkExcluidos: TCheckBox;
    chkHabDtVenc: TCheckBox;
    dtVencIni: TDateTimePicker;
    lblEDataVenc: TLabel;
    dtVencFim: TDateTimePicker;
    Label4: TLabel;
    cbCategoria: TComboBox;
    dsTipoLanc: TDataSource;
    qryTipoLanc: TFDQuery;
    qryTipoLanccod_tipo_lanc: TFDAutoIncField;
    qryTipoLancdescricao: TStringField;
    Label1: TLabel;
    chkAtivarTpLanc: TCheckBox;
    cbTpLanc: TComboBox;
    qryLanc: TFDQuery;
    qryLanccod_lanc: TFDAutoIncField;
    qryLancdescricao: TStringField;
    qryLancdt_lanc: TDateTimeField;
    qryLancdt_vencimento: TDateField;
    qryLanccod_tipo_lanc: TIntegerField;
    qryLanctipo_lanc_desc: TStringField;
    qryLanccategoria: TStringField;
    qryLancdt_exclusao: TDateTimeField;
    DtLancFim: TDateTimePicker;
    lblEDataLanc: TLabel;
    DtLAncIni: TDateTimePicker;
    chkHabDtLanc: TCheckBox;
    frxLancamentos: TfrxReport;
    frxDBLancamentos: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure chkAtivarTpLancClick(Sender: TObject);
    procedure acLimparExecute(Sender: TObject);
    procedure chkHabDtLancClick(Sender: TObject);
    procedure chkHabDtVencClick(Sender: TObject);
    procedure acEmitirExecute(Sender: TObject);
  private
    procedure PreenCbTpLanc;
    procedure Limpar;
    procedure Emitir;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelLanc: TfrmRelLanc;

implementation

 uses uDmPrincipal;

{$R *.dfm}

procedure TfrmRelLanc.acEmitirExecute(Sender: TObject);
begin
 Emitir;
end;

procedure TfrmRelLanc.acLimparExecute(Sender: TObject);
begin
 Limpar;
end;

procedure TfrmRelLanc.chkAtivarTpLancClick(Sender: TObject);
begin
  cbTpLanc.Enabled := chkAtivarTpLanc.Checked;
end;

procedure TfrmRelLanc.chkHabDtLancClick(Sender: TObject);
begin
 DtLAncIni.Enabled := chkHabDtLanc.Checked;
 DtLancFim.Enabled := chkHabDtLanc.Checked;
 lblEDataLanc.Enabled := chkHabDtLanc.Checked;
end;

procedure TfrmRelLanc.chkHabDtVencClick(Sender: TObject);
begin
 dtVencIni.Enabled := chkHabDtVenc.Checked;
 dtVencFim.Enabled := chkHabDtVenc.Checked;
 lblEDataVenc.Enabled := chkHabDtVenc.Checked;
end;

procedure TfrmRelLanc.Emitir;
begin
 qryLanc.Close();
 qryLanc.SQL.Clear;
 qryLanc.SQL.Add('select l.cod_lanc');
 qryLanc.SQL.Add('       ,l.descricao');
 qryLanc.SQL.Add('       ,l.dt_lanc');
 qryLanc.SQL.Add('       ,l.dt_vencimento');
 qryLanc.SQL.Add('       ,l.dt_exclusao');
 qryLanc.SQL.Add('       ,l.cod_tipo_lanc');
 qryLanc.SQL.Add('       ,tl.descricao tipo_lanc_desc');
 qryLanc.SQL.Add('       ,tl.categoria');
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
 if cbTpLanc.ItemIndex > 0 then
 begin
  qryLanc.SQL.Add('AND LOWER(tl.descricao) = ' + LowerCase(QuotedStr(cbTpLanc.Text)));
 end;
 if chkHabDtVenc.Checked then
 begin
   qryLanc.SQL.Add('and l.dt_vencimento between :dtini and :dtfim');
   qryLanc.ParamByName('dtini').AsDate := dtVencIni.Date;
   qryLanc.ParamByName('dtfim').AsDate := dtVencFim.Date;
 end;
 if chkHabDtLanc.Checked then
 begin
   qryLanc.SQL.Add('and l.dt_lanc between :dtinilanc and :dtfimlanc');
   qryLanc.ParamByName('dtinilanc').AsDate := DtLAncIni.Date;
   qryLanc.ParamByName('dtfimlanc').AsDate := DtLancFim.Date;
 end;
 if chkExcluidos.Checked then
 begin
  qryLanc.SQL.Add('and l.dt_exclusao is not null');
 end
 else
 begin
  qryLanc.SQL.Add('and l.dt_exclusao is null');
 end;
 qryLanc.Open();
 if qryLanc.IsEmpty then
 begin
   ShowMessage('Nada encontrado');
   Exit;
 end
 else
 begin
   frxLancamentos.PrepareReport();
   frxLancamentos.ShowReport();
 end;

end;

procedure TfrmRelLanc.FormCreate(Sender: TObject);
begin
  PreenCbTpLanc;
  Limpar;
end;

procedure TfrmRelLanc.Limpar;
begin
 lblEdtCod.Clear;
 lblEdtDesc.Clear;
 chkExcluidos.Checked := False;
 chkHabDtVenc.Checked := False;
 cbCategoria.ItemIndex := 0;
 cbTpLanc.ItemIndex := 0;
 dtVencIni.Date := date;
 dtVencFim.Date := date;
 DtLancFim.Date := date;
 DtLAncIni.Date := date;
 chkHabDtLanc.Checked := False;
 dtVencIni.Enabled := False;
 dtVencFim.Enabled := False;
 DtLancFim.Enabled := False;
 DtLAncIni.Enabled := False;
 lblEDataVenc.Enabled := False;
 lblEDataLanc.Enabled := False;
end;

procedure TfrmRelLanc.PreenCbTpLanc;
begin
  cbTpLanc.Items.Clear;
  cbTpLanc.Items.Add('Todos');
  qryTipoLanc.Open;
  if not qryTipoLanc.IsEmpty then
  begin
    qryTipoLanc.First;
    while not qryTipoLanc.Eof do
    begin
      cbTpLanc.Items.Add(qryTipoLancdescricao.AsString);
      qryTipoLanc.Next;
    end;
  end;
  cbTpLanc.ItemIndex := 0;
end;

end.
