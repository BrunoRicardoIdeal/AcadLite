unit uFrmPrinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList;

type
  TfrmPrinc = class(TForm)
    pnlMenu: TPanel;
    btnPessoas: TButton;
    btnEquip: TButton;
    btnTpLanc: TButton;
    btnLancamentos: TButton;
    brunori: TImage;
    btnRelatorios: TButton;
    ActionList: TActionList;
    AcPes: TAction;
    acEquip: TAction;
    AcTpLanc: TAction;
    acLanc: TAction;
    acRel: TAction;
    btnLancFixos: TButton;
    acLancFixos: TAction;
    procedure btnEquipClick(Sender: TObject);
    procedure AcPesExecute(Sender: TObject);
    procedure acEquipExecute(Sender: TObject);
    procedure AcTpLancExecute(Sender: TObject);
    procedure acLancExecute(Sender: TObject);
    procedure acRelExecute(Sender: TObject);
    procedure acLancFixosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrinc: TfrmPrinc;

implementation
    uses ufrmPessoas,uFrmEquip, uFrmLancFixos
    ,uFrmTipoLanc, uFrmLancamentos, uFrmRelatorios;
{$R *.dfm}

procedure TfrmPrinc.acEquipExecute(Sender: TObject);
begin
 if frmEquip = nil then
 begin
   Application.CreateForm(TfrmEquip,frmEquip);
 end;
 frmEquip.Show;
end;

procedure TfrmPrinc.acLancExecute(Sender: TObject);
begin
 if frmLancamentos = nil then
 begin
   Application.CreateForm(TfrmLancamentos,frmLancamentos);
 end;
 frmLancamentos.Show;
end;

procedure TfrmPrinc.acLancFixosExecute(Sender: TObject);
begin
 if frmLancFixos = nil then
 begin
   Application.CreateForm(TfrmLancFixos,frmLancFixos);
 end;
 frmLancFixos.Show;
end;

procedure TfrmPrinc.AcPesExecute(Sender: TObject);
begin
 if frmPessoas = nil then
 begin
   Application.CreateForm(TFrmPessoas,frmPessoas);
 end;
 frmPessoas.Show;
end;

procedure TfrmPrinc.acRelExecute(Sender: TObject);
begin
  if frmRelatorios = nil then
  begin
   Application.CreateForm(TfrmRelatorios,frmRelatorios);
  end;
  frmRelatorios.Show;
end;

procedure TfrmPrinc.AcTpLancExecute(Sender: TObject);
begin
 if frmTiposLanc = nil then
 begin
   Application.CreateForm(TfrmTiposLanc,frmTiposLanc);
 end;
 frmTiposLanc.Show;
end;

procedure TfrmPrinc.btnEquipClick(Sender: TObject);
begin
 if frmEquip = nil then
 begin
   Application.CreateForm(TfrmEquip,frmEquip);
 end;
 frmEquip.Show;
end;

end.
