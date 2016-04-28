unit uFrmPrinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.pngimage;

type
  TfrmPrinc = class(TForm)
    pnlMenu: TPanel;
    btnPessoas: TButton;
    btnEquip: TButton;
    btnTpLanc: TButton;
    Button1: TButton;
    imgFundo: TImage;
    procedure btnPessoasClick(Sender: TObject);
    procedure btnEquipClick(Sender: TObject);
    procedure btnTpLancClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrinc: TfrmPrinc;

implementation
    uses ufrmPessoas,uFrmEquip, uFrmTipoLanc, uFrmLancamentos;
{$R *.dfm}

procedure TfrmPrinc.btnEquipClick(Sender: TObject);
begin
 if frmEquip = nil then
 begin
   Application.CreateForm(TfrmEquip,frmEquip);
 end;
 frmEquip.Show;
end;

procedure TfrmPrinc.btnPessoasClick(Sender: TObject);
begin
 if frmPessoas = nil then
 begin
   Application.CreateForm(TFrmPessoas,frmPessoas);
 end;
 frmPessoas.Show;
end;

procedure TfrmPrinc.btnTpLancClick(Sender: TObject);
begin
 if frmTiposLanc = nil then
 begin
   Application.CreateForm(TfrmTiposLanc,frmTiposLanc);
 end;
 frmTiposLanc.Show;
end;

procedure TfrmPrinc.Button1Click(Sender: TObject);
begin
 if frmLancamentos = nil then
 begin
   Application.CreateForm(TfrmLancamentos,frmLancamentos);
 end;
 frmLancamentos.Show;
end;

end.
