program AcadLite;

uses
  Vcl.Forms,
  uFrmPrinc in 'uFrmPrinc.pas' {frmPrinc},
  uFrmPessoas in 'uFrmPessoas.pas' {frmPessoas},
  uDmPrincipal in 'uDmPrincipal.pas' {dmPrincipal: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  uFrmEquip in 'uFrmEquip.pas' {frmEquip},
  uFrmTipoLanc in 'uFrmTipoLanc.pas' {frmTiposLanc},
  uFrmLancamentos in 'uFrmLancamentos.pas' {frmLancamentos},
  uFrmRelatorios in 'uFrmRelatorios.pas' {frmRelatorios},
  uFrmRelPessoas in 'uFrmRelPessoas.pas' {frmRelPessoas},
  uFrmRelEquip in 'uFrmRelEquip.pas' {frmRelEquip},
  uFrmRelTpLanc in 'uFrmRelTpLanc.pas' {frmRelTpLanc};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Light');
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrinc, frmPrinc);
  Application.Run;
end.
