unit uFrmRelTpLanc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TfrmRelTpLanc = class(TForm)
    lblEdtCod: TLabeledEdit;
    lblEdtDesc: TLabeledEdit;
    cbCategoria: TComboBox;
    pnlBotoes: TPanel;
    btnEmitir: TButton;
    btnLimpar: TButton;
    ActionList: TActionList;
    acLimpar: TAction;
    acEmitir: TAction;
    Label4: TLabel;
    qryTpLanc: TFDQuery;
    qryTpLanccod_tipo_lanc: TFDAutoIncField;
    qryTpLancdescricao: TStringField;
    qryTpLanccategoria: TStringField;
    qryTpLancdt_cadastro: TDateTimeField;
    frxTpLanc: TfrxReport;
    frxDBTpLanc: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
    procedure acLimparExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acEmitirExecute(Sender: TObject);
    procedure frxTpLancBeforePrint(Sender: TfrxReportComponent);
  private
   procedure Limpar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTpLanc: TfrmRelTpLanc;

implementation

 uses uDmPrincipal;
{$R *.dfm}

procedure TfrmRelTpLanc.acEmitirExecute(Sender: TObject);
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
 qryTpLanc.Open();
 if qryTpLanc.IsEmpty then
 begin
   MessageBox(0, 'Nada encontrado', 'Informação', MB_ICONINFORMATION or MB_OK);
   Exit;
 end
 else
 begin
   frxTpLanc.PrepareReport();
   frxTpLanc.ShowReport();
 end;
end;

procedure TfrmRelTpLanc.acLimparExecute(Sender: TObject);
begin
 Limpar;
end;

procedure TfrmRelTpLanc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmRelTpLanc := nil;
 Action := caFree;
end;

procedure TfrmRelTpLanc.FormShow(Sender: TObject);
begin
 Limpar;
end;

procedure TfrmRelTpLanc.frxTpLancBeforePrint(Sender: TfrxReportComponent);
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
   if lnome = 'memofiltrocat'then
   begin
     lMemo.Text := cbCategoria.Text;
   end

 end;
end;

procedure TfrmRelTpLanc.Limpar;
begin
 lblEdtCod.Clear;
 lblEdtDesc.Clear;
 cbCategoria.ItemIndex := 0;
end;

end.
