unit uFrmPrinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls;

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
    btnMensalidades: TButton;
    acMensalidades: TAction;
    SBPrinc: TStatusBar;
    procedure btnEquipClick(Sender: TObject);
    procedure AcPesExecute(Sender: TObject);
    procedure acEquipExecute(Sender: TObject);
    procedure AcTpLancExecute(Sender: TObject);
    procedure acLancExecute(Sender: TObject);
    procedure acRelExecute(Sender: TObject);
    procedure acLancFixosExecute(Sender: TObject);
    procedure acUsuariosExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acMensalidadesExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
   procedure EfetuarLogin;
   procedure ConfStatusBar;
   procedure DesAtivAc(pEnabled : boolean);
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
         uFrmLogin,ufrmMensalidades,
         uConstantes;
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

procedure TfrmPrinc.acMensalidadesExecute(Sender: TObject);
begin
 if frmMensalidades = nil then
 begin
   Application.CreateForm(TfrmMensalidades,frmMensalidades);
 end;
 frmMensalidades.Show;
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
   MessageBox(0, 'Faça login como Administrador Master para poder ter acesso!'
      , 'Atenção', MB_ICONWARNING or MB_OK);
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



procedure TfrmPrinc.ConfStatusBar;
begin
 SBPrinc.Panels[0].Text := 'Usuário: ' + UpperCase(dmPrincipal.NomeUsuario);
 SBPrinc.Panels[1].Text := 'Computador: ' + dmPrincipal.nomePC;
 SBPrinc.Panels[2].Text := 'Versão: ' + dmPrincipal.getVersaoEXE;
end;

procedure TfrmPrinc.DesAtivAc(pEnabled: boolean);
var
 i : integer;
begin
 for I := 0 to ActionList.ActionCount - 1 do
 begin
  ActionList.Actions[i].Enabled := pEnabled;
 end;



end;

procedure TfrmPrinc.EfetuarLogin;
begin
 if frmLogin = nil then
 begin
   Application.CreateForm(TfrmLogin,frmLogin);
 end;
 frmLogin.ShowModal;
 if dmPrincipal.CodUsuario <= 0  then
 begin
   Close;
 end;
end;

procedure TfrmPrinc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if dmPrincipal.CodUsuario > 0 then
 begin
  dmPrincipal.salvarLog(dmPrincipal.CodUsuario,OP_LOGOUT,dmPrincipal.nomePC);
 end;
end;

procedure TfrmPrinc.FormCreate(Sender: TObject);
begin

  DesAtivAc(False);
end;

procedure TfrmPrinc.FormShow(Sender: TObject);
begin
 EfetuarLogin;
 ConfStatusBar;
 DesAtivAc(True);
end;

end.
