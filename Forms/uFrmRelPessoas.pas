unit uFrmRelPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Mask, System.Actions, Vcl.ActnList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TfrmRelPessoas = class(TForm)
    lblEdtNome: TLabeledEdit;
    lblEdtCod: TLabeledEdit;
    cbTipo: TComboBox;
    Label4: TLabel;
    dtNascFim: TDateTimePicker;
    lblEData: TLabel;
    dtNascIni: TDateTimePicker;
    chkHabDtNasc: TCheckBox;
    pnlBotoes: TPanel;
    btnEmitir: TButton;
    btnLimpar: TButton;
    ActionList: TActionList;
    acLimpar: TAction;
    acEmitir: TAction;
    qryPessoas: TFDQuery;
    frxPessoas: TfrxReport;
    frxDBPessoas: TfrxDBDataset;
    qryPessoascod_pessoa: TFDAutoIncField;
    qryPessoasnome: TStringField;
    qryPessoasdt_nascimento: TDateField;
    qryPessoascpf: TStringField;
    qryPessoastelefone: TStringField;
    qryPessoascelular: TStringField;
    qryPessoastipo: TStringField;
    qryPessoasdt_cadastro: TDateTimeField;
    Label1: TLabel;
    maskEdtTel: TMaskEdit;
    maskEdtCel: TMaskEdit;
    Label2: TLabel;
    procedure chkHabDtNascClick(Sender: TObject);
    procedure acLimparExecute(Sender: TObject);
    procedure acEmitirExecute(Sender: TObject);
    procedure frxPessoasBeforePrint(Sender: TfrxReportComponent);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

   procedure Limpar;
   procedure Emitir;
   procedure confCbTipo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPessoas: TfrmRelPessoas;

implementation

 uses uDmPrincipal,uConstantes;

{$R *.dfm}

procedure TfrmRelPessoas.acEmitirExecute(Sender: TObject);
begin
 Emitir;
end;

procedure TfrmRelPessoas.acLimparExecute(Sender: TObject);
begin
 Limpar;
end;

procedure TfrmRelPessoas.chkHabDtNascClick(Sender: TObject);
begin
 dtNascIni.Enabled := chkHabDtNasc.Checked;
 dtNascFim.Enabled := chkHabDtNasc.Checked;
 lblEData.Enabled := chkHabDtNasc.Checked;
end;

procedure TfrmRelPessoas.confCbTipo;
begin
 cbTipo.Items.Clear;
 cbTipo.Items.Add('Todos');
 cbTipo.Items.AddStrings(dmPrincipal.getListaTiposCli);
end;

procedure TfrmRelPessoas.Emitir;
begin
 qryPessoas.Close;
 qryPessoas.SQL.Clear;
 qryPessoas.SQL.Add('SELECT COD_PESSOA');
 qryPessoas.SQL.Add('       ,NOME');
 qryPessoas.SQL.Add('       ,DT_NASCIMENTO');
 qryPessoas.SQL.Add('       ,DT_CADASTRO');
 qryPessoas.SQL.Add('       ,TIPO');
 qryPessoas.SQL.Add('       ,CPF');
 qryPessoas.SQL.Add('       ,TELEFONE');
 qryPessoas.SQL.Add('       ,CELULAR');
 qryPessoas.SQL.Add('FROM PESSOAS');
 qryPessoas.SQL.Add('WHERE 1=1');
 if lblEdtCod.Text <> '' then
 begin
   qryPessoas.SQL.Add('AND COD_PESSOA = :COD_PESSOA');
   qryPessoas.ParamByName('COD_PESSOA').AsString := lblEdtCod.Text;
 end;
 if lblEdtNome.Text <> '' then
 begin
   qryPessoas.SQL.Add('AND LOWER(NOME)  LIKE '+ QuotedStr('%' + LowerCase(lblEdtNome.Text)+'%') );
 end;
  if cbTipo.ItemIndex > 0 then
 begin
   qryPessoas.SQL.Add('AND LOWER(TIPO) = ' + LowerCase(QuotedStr(cbTipo.Text)));
 end;
 if chkHabDtNasc.Checked then
 begin
   qryPessoas.SQL.Add('AND DT_NASCIMENTO BETWEEN :DTINI AND :DTFIM');
   qryPessoas.ParamByName('DTINI').AsDate := dtNascIni.Date;
   qryPessoas.ParamByName('DTFIM').AsDate := dtNascFim.Date;
 end;
 if trim(maskEdtTel.Text) <> TRIM_MASK_TEL then
 begin
   qryPessoas.SQL.Add('AND TELEFONE =' + QuotedStr(maskEdtTel.Text));
 end;
 if trim(maskEdtCel.Text) <> TRIM_MASK_TEL then
 begin
   qryPessoas.SQL.Add('AND CELULAR =' + QuotedStr(maskEdtCel.Text));
 end;
 qryPessoas.SQL.Add('ORDER BY NOME');
 qryPessoas.Open();
 if qryPessoas.IsEmpty then
 begin
   MessageBox(0, 'Nada encontrado', 'Informação', MB_ICONINFORMATION or MB_OK);
   Exit;
 end
 else
 begin
   frxPessoas.PrepareReport(true);
   frxPessoas.ShowReport;
 end;
end;

procedure TfrmRelPessoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmRelPessoas := nil;
 Action := caFree;
end;

procedure TfrmRelPessoas.FormCreate(Sender: TObject);
begin
 confCbTipo;
end;

procedure TfrmRelPessoas.FormShow(Sender: TObject);
begin
 limpar;
end;

procedure TfrmRelPessoas.frxPessoasBeforePrint(Sender: TfrxReportComponent);
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
   if lnome = 'memofiltronome'then
   begin
      if lblEdtNome.Text <> '' then
      begin
        lMemo.Text := lblEdtNome.Text;
      end;
   end
   else
   if lnome = 'memofiltrodtnasc'then
   begin
      if chkHabDtNasc.Checked then
      begin
        lMemo.Text := FormatDateTime('dd/mm/yyyy',dtNascIni.Date) +
                      ' e ' + FormatDateTime('dd/mm/yyyy',dtNascFim.Date)
      end;
   end
   else
   if lnome = 'memofiltrotipo'then
   begin
     lMemo.Text := cbTipo.Text;
   end
   else
   if lnome = 'memofiltrotel'then
   begin
      if Trim(maskEdtTel.Text) <> TRIM_MASK_TEL then
      begin
        lMemo.Text := maskEdtTel.Text;
      end;
   end;
   if lnome = 'memofiltrocel'then
   begin
      if Trim(maskEdtCel.Text) <> TRIM_MASK_TEL then
      begin
        lMemo.Text := maskEdtCel.Text;
      end;
   end;
 end;


end;

procedure TfrmRelPessoas.Limpar;
begin
 lblEdtCod.Clear;
 lblEdtNome.Clear;
 maskEdtCel.Clear;
 maskEdtTel.Clear;
 chkHabDtNasc.Checked := False;
 dtNascFim.Enabled := False;
 dtNascIni.Enabled := False;
 dtNascIni.Date := Date;
 dtNascFim.Date := Date;
 lblEData.Enabled := False;
 cbTipo.ItemIndex := 0;
end;

end.
