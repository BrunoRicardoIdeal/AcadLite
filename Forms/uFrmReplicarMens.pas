unit uFrmReplicarMens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.Samples.Spin ,System.Generics.Collections,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls;

type
  TfrmRepMens = class(TForm)
    lblEdtAluno: TLabeledEdit;
    lblEdtDtVencIni: TLabeledEdit;
    spinEdtNumRep: TSpinEdit;
    Label1: TLabel;
    ListBoxProxVenc: TListBox;
    Label2: TLabel;
    pnlBotoes: TPanel;
    btnGerar: TButton;
    btnCancelar: TButton;
    ActionList: TActionList;
    acCancelar: TAction;
    acGerar: TAction;
    lblEdtValor: TLabeledEdit;
    qryInsere: TFDQuery;
    pgReplicar: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spinEdtNumRepChange(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acGerarExecute(Sender: TObject);
  private
   var
    FListaDatas : TList<TDate>;
    FCodAluno : integer;
    FNomeAluno :string;
    FDescricaoMens : String;
    Fvalor : double;
    FDtVenc : TDate;

    procedure MontarLista(pNRep : integer ; pDtIni : TDate);
    procedure ValidarPrench;
    { Private declarations }
  public
    { Public declarations }
    property Descricao : String read FDescricaoMens write FDescricaoMens;
    property NomeAluno : String read FNomeAluno write FNomeAluno;
    property CodAluno : integer read FCodAluno write FCodAluno;
    property Valor : double read Fvalor write Fvalor;
    property DtVenc : TDate read FDtVenc write FDtVenc;
  end;

var
  frmRepMens: TfrmRepMens;

implementation

 uses uDmPrincipal, DateUtils;

{$R *.dfm}

procedure TfrmRepMens.acCancelarExecute(Sender: TObject);
begin
 Close;
end;

procedure TfrmRepMens.acGerarExecute(Sender: TObject);
var
 ldtVenc : TDate;
begin
 ValidarPrench;
 pgReplicar.Position := 0;
 pgReplicar.Min := 0;
 pgReplicar.Max := FListaDatas.Count;
 pgReplicar.Step := 1;
 for ldtVenc in FListaDatas do
 begin
   pgReplicar.StepIt;
   qryInsere.ParamByName('DESCRICAO').AsString := FDescricaoMens;
   qryInsere.ParamByName('COD_ALUNO').AsInteger := FCodAluno;
   qryInsere.ParamByName('VALOR').AsFloat := Fvalor;
   qryInsere.ParamByName('DT_VENCIMENTO').AsDate := ldtVenc;
   dmPrincipal.MySQLConn.StartTransaction;
   qryInsere.ExecSQL;
   try
    dmPrincipal.MySQLConn.Commit;
   except
    on E:Exception do
    begin
      dmPrincipal.MySQLConn.Rollback;
      MessageBox(0, 'Houve um erro inesperado ao tentar replicar a mensalidade!'
          , 'Erro', MB_ICONERROR or MB_OK);
      Abort;
    end;

   end;

 end;
 MessageBox(0, 'Mensalidade replicada com sucesso!'
              , 'Sucesso', MB_ICONASTERISK or MB_OK);
 Close;
end;

procedure TfrmRepMens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FListaDatas.Free;
end;

procedure TfrmRepMens.FormCreate(Sender: TObject);
begin
 FListaDatas := TList<TDate>.Create;

end;

procedure TfrmRepMens.FormShow(Sender: TObject);
begin
 lblEdtAluno.Text := FNomeAluno;
 lblEdtDtVencIni.Text := DateToStr(FDtVenc);
 lblEdtValor.Text := FloatToStrF(Fvalor,ffCurrency,18,2);
end;

procedure TfrmRepMens.MontarLista(pNRep: integer; pDtIni: TDate);
var
 i : integer;
 lNovaData,lDtMesSeg : tdate;
 lDia,lNovoDia,lDiaFimMes, lNovoMes,lNovoAno : Integer;
begin
 FListaDatas.Clear;
 ListBoxProxVenc.Items.Clear;
 lDia := DayOf(pDtini);
 for i := 1 to pNRep do
 begin
   lDtMesSeg := IncMonth(pDtIni,i);
   lDiaFimMes := DayOf(endOfTheMonth(lDtMesSeg));
   if lDia > lDiaFimMes then
   begin
     lNovoDia := lDiaFimMes;
   end
   else
   begin
     lNovoDia := lDia;
   end;
   lNovoMes := MonthOf(lDtMesSeg);
   lNovoAno := YearOf(lDtMesSeg);
   lNovaData := EncodeDate(lNovoAno,lNovoMes,lNovoDia);
   FListaDatas.Add(lNovaData);
   ListBoxProxVenc.Items.Add(FormatDateTime('dd/mm/yyyy',lNovaData));
 end;

end;

procedure TfrmRepMens.spinEdtNumRepChange(Sender: TObject);
begin
 if spinEdtNumRep.Value >= 1 then
 begin
    MontarLista(spinEdtNumRep.Value,StrToDate(lblEdtDtVencIni.Text));
 end
 else
 begin
   FListaDatas.Clear;
   ListBoxProxVenc.Clear;
 end;

end;

procedure TfrmRepMens.ValidarPrench;
begin
 if spinEdtNumRep.Value <= 0 then
 begin
   MessageBox(0, 'O número de réplicas deve ser maior do que 0'
          , 'Atenção', MB_ICONWARNING or MB_OK);
   Abort;
 end;


end;



end.
