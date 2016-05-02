unit uFrmEquip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Data.DB, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmEquip = class(TForm)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    lblEdtCod: TLabeledEdit;
    lblEdtNome: TLabeledEdit;
    btnPsq: TButton;
    cbTipo: TComboBox;
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
    grdEquip: TDBGrid;
    edtCodEquip: TDBEdit;
    lblCodpes: TLabel;
    lblNome: TLabel;
    edtNome: TDBEdit;
    dbRgTipo: TDBRadioGroup;
    qryEquip: TFDQuery;
    qryEquipcod_equip: TFDAutoIncField;
    qryEquipnome: TStringField;
    qryEquiptipo: TStringField;
    dsEquip: TDataSource;
    qryEquipdt_cadastro: TDateTimeField;
    edtCadastro: TDBEdit;
    Label5: TLabel;
    procedure acGravarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acNovoExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEquip: TfrmEquip;

implementation

uses uDmPrincipal;

{$R *.dfm}

procedure TfrmEquip.acCancelarExecute(Sender: TObject);
begin
 acGravar.Enabled := False;
 acEditar.Enabled := True;
 acExcluir.Enabled := True;
 acNovo.Enabled := True;
 acCancelar.Enabled := False;
 qryEquip.Cancel;
end;

procedure TfrmEquip.acEditarExecute(Sender: TObject);
begin
 acEditar.Enabled := False;
 acExcluir.Enabled := False;
 acNovo.Enabled := False;
 acGravar.Enabled := True;
 acCancelar.Enabled := True;
 if not qryEquip.Active then
 begin
   qryEquip.Open();
 end;
 if not qryEquip.IsEmpty then
 begin
   qryEquip.Edit;
 end
 else
 begin
   ShowMessage('Selecione alguém pra editar');
   Exit;
 end;
end;

procedure TfrmEquip.acExcluirExecute(Sender: TObject);
begin
  if not qryEquip.IsEmpty then
  begin
   if MessageDlg('Deseja realmente excluir?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    acEditar.Enabled := True;
    acExcluir.Enabled := True;
    acNovo.Enabled := True;
    acGravar.Enabled := False;
    acCancelar.Enabled := False;
    qryEquip.Delete;
    qryEquip.Refresh;
   end;
  end;
end;

procedure TfrmEquip.acGravarExecute(Sender: TObject);
begin
 if qryEquip.State in dsEditModes then
 begin
   if MessageDlg('Deseja realmente gravar?',TMsgDlgType.mtConfirmation
   ,mbYesNo,0) = mrYes then
   begin
    acGravar.Enabled := False;
    acEditar.Enabled := True;
    acExcluir.Enabled := True;
    acNovo.Enabled := True;
    acCancelar.Enabled := False;
    qryEquip.Post;
   end;

 end;
end;

procedure TfrmEquip.acNovoExecute(Sender: TObject);
begin
 acEditar.Enabled := False;
 acExcluir.Enabled := False;
 acNovo.Enabled := False;
 acGravar.Enabled := True;
 acCancelar.Enabled := True;
 if not qryEquip.Active then
 begin
   qryEquip.Open();
 end;
 qryEquip.Append;
 qryEquiptipo.AsString := 'Ergometria';
 edtNome.SetFocus;
end;

procedure TfrmEquip.acPesquisarExecute(Sender: TObject);
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
   ShowMessage('Nada encontrado');
   Exit;
 end;
end;

procedure TfrmEquip.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmEquip := nil;
 Action := caFree;
end;

end.
