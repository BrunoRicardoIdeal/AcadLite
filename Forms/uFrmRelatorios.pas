unit uFrmRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmRelatorios = class(TForm)
    pnlMenu: TPanel;
    btnPessoas: TButton;
    btnEquip: TButton;
    btnTpLanc: TButton;
    btnLancamentos: TButton;
    btnMens: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPessoasClick(Sender: TObject);
    procedure btnEquipClick(Sender: TObject);
    procedure btnTpLancClick(Sender: TObject);
    procedure btnLancamentosClick(Sender: TObject);
    procedure btnMensClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

 uses uFrmRelPessoas, uFrmRelMens
        ,uFrmRelEquip,uFrmRelTpLanc,uFrmRelLanc;

{$R *.dfm}

procedure TfrmRelatorios.btnEquipClick(Sender: TObject);
begin
   if frmRelEquip = nil then
  begin
    Application.CreateForm(TfrmRelEquip,frmRelEquip);
  end;
  frmRelEquip.Show;
end;

procedure TfrmRelatorios.btnPessoasClick(Sender: TObject);
begin
  if frmRelPessoas = nil then
  begin
    Application.CreateForm(TfrmRelPessoas,frmRelPessoas);
  end;
  frmRelPessoas.Show;
end;

procedure TfrmRelatorios.btnTpLancClick(Sender: TObject);
begin
  if frmRelTpLanc = nil then
  begin
    Application.CreateForm(TfrmRelTpLanc,frmRelTpLanc);
  end;
  frmRelTpLanc.Show;
end;

procedure TfrmRelatorios.btnLancamentosClick(Sender: TObject);
begin
 if frmRelLanc = nil then
 begin
   Application.CreateForm(TfrmRelLanc,frmRelLanc);
 end;
 frmRelLanc.Show;

end;

procedure TfrmRelatorios.btnMensClick(Sender: TObject);
begin
 if FrmRelMens = nil then
 begin
   Application.CreateForm(TFrmRelMens,frmRelMens);
 end;
 frmRelMens.Show;
end;

procedure TfrmRelatorios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmRelatorios := nil;
 Action := caFree;
end;

end.
