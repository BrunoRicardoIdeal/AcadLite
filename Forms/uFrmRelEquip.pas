unit uFrmRelEquip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TfrmRelEquip = class(TForm)
    pnlBotoes: TPanel;
    btnEmitir: TButton;
    btnLimpar: TButton;
    ActionList: TActionList;
    acLimpar: TAction;
    acEmitir: TAction;
    lblEdtNome: TLabeledEdit;
    lblEdtCod: TLabeledEdit;
    cbTipo: TComboBox;
    Label4: TLabel;
    qryEquip: TFDQuery;
    qryEquipcod_equip: TFDAutoIncField;
    qryEquipnome: TStringField;
    qryEquiptipo: TStringField;
    qryEquipdt_cadastro: TDateTimeField;
    frxEquip: TfrxReport;
    frxDBEquip: TfrxDBDataset;
    procedure acLimparExecute(Sender: TObject);
    procedure frxEquipBeforePrint(Sender: TfrxReportComponent);
    procedure acEmitirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
   procedure Limpar;
   procedure Emitir;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEquip: TfrmRelEquip;

implementation

 uses uDmPrincipal, System.UITypes;

{$R *.dfm}

{ TfrmRelEquip }

procedure TfrmRelEquip.acEmitirExecute(Sender: TObject);
begin
 Emitir;
end;

procedure TfrmRelEquip.acLimparExecute(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmRelEquip.Emitir;
begin
 qryEquip.Close;
 qryEquip.SQL.Clear;
 qryEquip.SQL.Add('SELECT COD_EQUIP');
 qryEquip.SQL.Add('       ,NOME');
 qryEquip.SQL.Add('       ,DT_CADASTRO');
 qryEquip.SQL.Add('       ,TIPO');
 qryEquip.SQL.Add('FROM EQUIPAMENTOS');
 qryEquip.SQL.Add('WHERE 1=1');
 if lblEdtCod.Text <> '' then
 begin
   qryEquip.SQL.Add('AND COD_EQUIP = :COD_EQUIP');
   qryEquip.ParamByName('COD_EQUIP').AsString := lblEdtCod.Text;
 end;
 if lblEdtNome.Text <> '' then
 begin
   qryEquip.SQL.Add('AND LOWER(NOME)  LIKE '+ QuotedStr('%' + LowerCase(lblEdtNome.Text)+'%') );
 end;
 if cbTipo.ItemIndex > 0 then
 begin
   qryEquip.SQL.Add('AND LOWER(TIPO) = ' + LowerCase(QuotedStr(cbTipo.Text)));
 end;
 qryEquip.SQL.Add('ORDER BY NOME');
 qryEquip.Open();

 if qryEquip.IsEmpty then
 begin
   MessageBox(0, 'Nada encontrado', 'Informação', MB_ICONINFORMATION or MB_OK);
   Exit;
 end
 else
 begin
   frxEquip.PrepareReport(True);
   frxEquip.ShowReport();
 end;
end;

procedure TfrmRelEquip.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmRelEquip := nil;
 Action := CaFree;
end;

procedure TfrmRelEquip.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
 begin
   key := #0;
   Perform(WM_NEXTDLGCTL, 0, 0);

 end;
end;

procedure TfrmRelEquip.FormShow(Sender: TObject);
begin
 Limpar;
end;

procedure TfrmRelEquip.frxEquipBeforePrint(Sender: TfrxReportComponent);
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
   if lnome = 'memofiltrotipo'then
   begin
     lMemo.Text := cbTipo.Text;
   end

 end;
end;

procedure TfrmRelEquip.Limpar;
begin
  lblEdtNome.Clear;
  lblEdtCod.Clear;
  cbTipo.ItemIndex := 0;
end;

end.
