program AcadLite;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  uConstantes in 'Class\uConstantes.pas',
  uLancPadroes in 'Class\uLancPadroes.pas',
  uDmPrincipal in 'Forms\uDmPrincipal.pas' {dmPrincipal: TDataModule},
  uFrmPrinc in 'Forms\uFrmPrinc.pas' {frmPrinc},
  uFrmEquip in 'Forms\uFrmEquip.pas' {frmEquip},
  uFrmLancamentos in 'Forms\uFrmLancamentos.pas' {frmLancamentos},
  uFrmLancFixos in 'Forms\uFrmLancFixos.pas' {frmLancFixos},
  uFrmLogin in 'Forms\uFrmLogin.pas' {frmLogin},
  uFrmMensalidades in 'Forms\uFrmMensalidades.pas' {frmMensalidades},
  uFrmPessoas in 'Forms\uFrmPessoas.pas' {frmPessoas},
  uFrmRelatorios in 'Forms\uFrmRelatorios.pas' {frmRelatorios},
  uFrmRelEquip in 'Forms\uFrmRelEquip.pas' {frmRelEquip},
  uFrmRelLanc in 'Forms\uFrmRelLanc.pas' {frmRelLanc},
  uFrmRelMens in 'Forms\uFrmRelMens.pas' {frmRelMens},
  uFrmRelPessoas in 'Forms\uFrmRelPessoas.pas' {frmRelPessoas},
  uFrmRelTpLanc in 'Forms\uFrmRelTpLanc.pas' {frmRelTpLanc},
  uFrmReplicarMens in 'Forms\uFrmReplicarMens.pas' {frmRepMens},
  uFrmTipoLanc in 'Forms\uFrmTipoLanc.pas' {frmTiposLanc},
  uFrmUsuarios in 'Forms\uFrmUsuarios.pas' {frmUsuarios},
  uEndereco in 'Class\uEndereco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrinc, frmPrinc);
  TStyleManager.TrySetStyle('Tablet Light');
  Application.Run;
end.
