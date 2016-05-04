unit uFrmPrinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPrinc = class(TForm)
    pnlMenu: TPanel;
    btnPessoas: TButton;
    btnEquip: TButton;
    btnTpLanc: TButton;
    btnLancamentos: TButton;
    imgFundo: TImage;
    btnRelatorios: TButton;
    ActionList: TActionList;
    AcPes: TAction;
    acEquip: TAction;
    AcTpLanc: TAction;
    acLanc: TAction;
    acRel: TAction;
    btnLancFixos: TButton;
    acLancFixos: TAction;
    btnUsu: TButton;
    acUsuarios: TAction;
    procedure btnEquipClick(Sender: TObject);
    procedure AcPesExecute(Sender: TObject);
    procedure acEquipExecute(Sender: TObject);
    procedure AcTpLancExecute(Sender: TObject);
    procedure acLancExecute(Sender: TObject);
    procedure acRelExecute(Sender: TObject);
    procedure acLancFixosExecute(Sender: TObject);
    procedure acUsuariosExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
   procedure EfetuarLogin;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrinc: TfrmPrinc;

implementation
    uses ufrmPessoas,uFrmEquip,
         uFrmLancFixos,uDmPrincipal,
         uFrmTipoLanc,uFrmUsuarios,
         uFrmLancamentos, uFrmRelatorios,
         uFrmLogin;
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

procedure TfrmPrinc.acUsuariosExecute(Sender: TObject);
begin
 if dmPrincipal.isAdmin then
 begin
   if frmUsuarios = nil then
   begin
    Application.CreateForm(TfrmUsuarios,frmUsuarios);
   end;
  frmUsuarios.Show;
 end
 else
 begin
   ShowMessage('Faça login como Administrador Master para poder ter acesso!');
   Exit;
 end;
end;

procedure TfrmPrinc.btnEquipClick(Sender: TObject);
begin
 if frmEquip = nil then
 begin
   Application.CreateForm(TfrmEquip,frmEquip);
 end;
 frmEquip.Show;
end;



procedure TfrmPrinc.EfetuarLogin;
begin
 if frmLogin = nil then
 begin
   Application.CreateForm(TfrmLogin,frmLogin);
 end;
 frmLogin.ShowModal;
end;

procedure TfrmPrinc.FormShow(Sender: TObject);
begin
 EfetuarLogin;
end;

end.
