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
  uFrmLancamentos in 'uFrmLancamentos.pas' {frmLancamentos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Light');
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrinc, frmPrinc);
  Application.CreateForm(TfrmEquip, frmEquip);
  Application.CreateForm(TfrmTiposLanc, frmTiposLanc);
  Application.CreateForm(TfrmLancamentos, frmLancamentos);
  Application.Run;
end.
