unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL,uLancPadroes,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,uEndereco,
  FireDAC.DApt, FireDAC.Comp.DataSet,IniFiles, Datasnap.DBClient, Soap.InvokeRegistry,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Soap.Rio, Soap.SOAPHTTPClient,
  Xml.xmldom, Datasnap.Provider, Datasnap.Xmlxform, IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Xml.XMLIntf, Xml.adomxmldom, Xml.XMLDoc,
  Vcl.ComCtrls;

type
  TdmPrincipal = class(TDataModule)
    MySQLConn: TFDConnection;
    WaitCursor: TFDGUIxWaitCursor;
    qryLog: TFDQuery;
    qryLogid: TFDAutoIncField;
    qryLogcod_usuario: TIntegerField;
    qryLogcomputador: TStringField;
    qryLogoperacao: TStringField;
    cdsEndereco: TClientDataSet;
    XMLTransfProv: TXMLTransformProvider;
    TCPCStatusNet: TIdTCPClient;
    restReq: TRESTRequest;
    restClient: TRESTClient;
    restResp: TRESTResponse;
    cdsEnderecocep: TStringField;
    cdsEnderecologradouro: TStringField;
    cdsEnderecocomplemento: TStringField;
    cdsEnderecobairro: TStringField;
    cdsEnderecolocalidade: TStringField;
    cdsEnderecouf: TStringField;
    cdsEnderecounidade: TStringField;
    cdsEnderecoibge: TStringField;
    cdsEnderecogia: TStringField;
    qryInsertUF: TFDQuery;
    qryTabelas: TFDQuery;
    qryTabelasTables_in_acadlite: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
   procedure CriaUsuarioAdmin;
   function GetNomePC: String;
   function ConsultaEndereco(pCep : String):String;




    { Private declarations }

  public
   var
    NomeUsuario : string;
    CodUsuario : integer;
    isAdmin : boolean;
    nomePC : string;
    CaminhoEXE : String;

    ConfigINI : TINIFile;
    { Public declarations }
    procedure salvarLog(pCodUsu : integer; pOperacao : string;pComputador : string);
    procedure ConfiguraConn;
    procedure InserirTpLancPadroes(var pProgBar : TProgressBar);
    procedure CriaInsereUfCid(var pProgBar : TProgressBar);
    function getCodTpLanc(pDesc : String):integer;
    function isInadimp(pCodAluno : integer) : boolean;
    function getListaTiposCli:TStringList;
    function getListaUF:TStringList;
    function getListaCidades(pUf: String) : TStringList;
    function getCodUF(pUF : string):integer;
    function getCodCidade(pNome : string):integer;
    function GetEndereco(pCep : String) : TEndereco;
    function ConectadoInternet : boolean;
    function RetirarChars(pVChars : array of Char; pStr : String):String;
    function RemoverCharEsp(aTexto: string; aLimExt: boolean): string;
    function getVersaoEXE : string;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

uses
  Winapi.Windows, Vcl.Forms, uConstantes,Strutils;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdmPrincipal.ConectadoInternet: boolean;
begin
 if TCPCStatusNet.Connected then
 begin
  TCPCStatusNet.Disconnect;
 end;
 try
  TCPCStatusNet.Connect;
  Result := true;
 except
  on E : Exception do
  begin
    Result := False;
  end;

 end;
end;

procedure TdmPrincipal.ConfiguraConn;
var
 lserver : string;
begin
 MySQLConn.Params.Add('DriverID=MySQL');
 MySQLConn.Params.Add('Database=AcadLite');
 MySQLConn.Params.Add('User_Name=rise');
 MySQLConn.Params.Add('Password=#rise2015');
 lserver := ConfigINI.ReadString('CONEXAO','Server','localhost');
 MySQLConn.Params.Add('Server='+ lserver);
end;

function TdmPrincipal.ConsultaEndereco(pCep: String): String;
var
 lURL : String;
begin
  lURL := URL_CEP_CORREIOS + pCep + '/xml/';
  restClient.BaseURL := lURL;
  restReq.Execute;
  Result:= restResp.Content
end;
procedure TdmPrincipal.CriaInsereUfCid(var pProgBar : TProgressBar);
var
 lExiste : boolean;
 lUsaPB : boolean;
begin
   lUsaPB := pProgBar <> nil;
   if not qryTabelas.Active then
   begin
    qryTabelas.Open();
   end;
   lExiste := qryTabelas.Locate('Tables_in_acadlite','pais',[loCaseInsensitive]);
   if not lExiste then
   begin
     if lUsaPB then
     begin
       pProgBar.Position := 0;
       pProgBar.Min := 0;
       pProgBar.Max := 3;
     end;

     MySQLConn.StartTransaction;
     try
      Application.ProcessMessages;
      pProgBar.StepIt;
      qryInsertUF.ExecSQL;
      pProgBar.StepIt;
      Application.ProcessMessages;
      MySQLConn.Commit;
      pProgBar.StepIt;
     except
      MySQLConn.Rollback;
     end;

   end;
   qryTabelas.Close;
end;

procedure TdmPrincipal.CriaUsuarioAdmin;
var
 lQryCria : TFdQuery;
begin
  lQryCria := TFDQuery.Create(nil);
  try
   lQryCria.Connection := dmPrincipal.MySQLConn;
   lQryCria.SQL.Add('SELECT ID,NOME,SENHA,ADMIN FROM USUARIOS WHERE ADMIN = ''S''');
   lQryCria.Open();
   if lQryCria.IsEmpty then
   begin
     lQryCria.Append;
     lQryCria.FieldByName('NOME').AsString := USER_ADMIN;
     lQryCria.FieldByName('SENHA').AsString := PAS_ADMIN;
     lQryCria.FieldByName('ADMIN').AsString := 'S';
     lQryCria.Post;
   end;
  finally
    lQryCria.Free;
  end;
end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
var
 CaminhoConfig : String;
begin
 CaminhoEXE := ExtractFilePath(Application.ExeName) ;
 CaminhoConfig := CaminhoEXE + 'Config.ini';
 ConfigINI := TIniFile.Create(CaminhoConfig);
 ConfiguraConn;
 CriaUsuarioAdmin;
 nomePC := GetNomePC;
end;

procedure TdmPrincipal.DataModuleDestroy(Sender: TObject);
begin
 ConfigINI.Free;
end;

function TdmPrincipal.getCodCidade(pNome: string): integer;
var
 lQrySelect : TFdQuery;
begin
  lQrySelect := TFdQuery.Create(self);
  try
   lQrySelect.Connection := MySQLConn;
   lQrySelect.SQL.Add('SELECT ID FROM CIDADE');
   lQrySelect.SQL.Add('WHERE LOWER(NOME)=' + QuotedStr(LowerCase(pNome)));
   lQrySelect.Open();
   result := lQrySelect.FieldByName('ID').AsInteger;
  finally
   lQrySelect.Free;
  end;
end;

function TdmPrincipal.getCodTpLanc(pDesc: String): integer;
var
 lQrySelect : TFdQuery;
begin
  lQrySelect := TFdQuery.Create(self);
  try
   lQrySelect.Connection := MySQLConn;
   lQrySelect.SQL.Add('SELECT COD_TIPO_LANC FROM TIPOS_LANCAMENTOS');
   lQrySelect.SQL.Add('WHERE LOWER(DESCRICAO)=' + QuotedStr(LowerCase(pDesc)));
   lQrySelect.Open();
   result := lQrySelect.FieldByName('COD_TIPO_LANC').AsInteger;
  finally
   lQrySelect.Free;
  end;
end;

function TdmPrincipal.getCodUF(pUF: string): integer;
var
 lQrySelect : TFdQuery;
begin
  lQrySelect := TFdQuery.Create(self);
  try
   lQrySelect.Connection := MySQLConn;
   lQrySelect.SQL.Add('SELECT ID FROM ESTADO');
   lQrySelect.SQL.Add('WHERE LOWER(UF)=' + QuotedStr(LowerCase(pUF)));
   lQrySelect.Open();
   result := lQrySelect.FieldByName('ID').AsInteger;
  finally
   lQrySelect.Free;
  end;
end;

function TdmPrincipal.GetEndereco(pCep: String): TEndereco;
var
 lXml : TStringList;
 lCaminhoTemp : String;
 lEnd : Tendereco;
 lValidaXML : String;
begin
  lCaminhoTemp := CaminhoEXE + 'xml_end_temp.XML';
  lXml := TStringList.Create;
  lEnd := TEndereco.Create;
  try
    lXml.Text := ConsultaEndereco(pCep);
//    lXml.Text := RemoverCharEsp(lxml.Text,false);
    lValidaXML := lowerCase(lXml.Text);

    if not ((lValidaXML.Contains('erro')) or (lValidaXML.Contains('bad request')) ) then
    begin
      lXml.SaveToFile(lCaminhoTemp,TEncoding.UTF8);
      cdsEndereco.Close;
      XMLTransfProv.XMLDataFile := lCaminhoTemp;
      cdsEndereco.Open;
      lEnd.Cep := cdsEndereco.FieldByName('cep').AsString;
      lEnd.UF := cdsEndereco.FieldByName('uf').AsString;
      lEnd.Cidade := UTF8ToString(cdsEndereco.FieldByName('localidade').AsString);
      lEnd.Logradouro := UTF8ToString(cdsEndereco.FieldByName('logradouro').AsString);
      lEnd.Bairro := UTF8ToString(cdsEndereco.FieldByName('bairro').AsString);
      lEnd.Complemento := UTF8ToString(cdsEndereco.FieldByName('complemento').AsString);
      DeleteFile(Pchar(lCaminhoTemp));
      Result := lEnd;
    end
    else
    begin
      result := nil;
    end;
  finally
    lXml.Free;
  end;


end;

function TdmPrincipal.getListaCidades(pUf: String): TStringList;
var
 lListaCid : TStringList;
 lQry : TFDQuery;
begin
  lListaCid := TStringList.Create;
  lQry := TFDQuery.Create(nil);
  try
    lQry.Connection := MySQLConn;
    lQry.SQL.Add('select c.nome ');
    lQry.SQL.Add('from cidade c , estado e');
    lQry.SQL.Add('where c.estado = e.id');
    lQry.SQL.Add('and e.uf = :uf ');
    lQry.SQL.Add('or :uf is null');
    lQry.ParamByName('uf').AsString := pUf;
    lQry.Open();
    if not lQry.IsEmpty then
    begin
       lQry.First;
       while not lQry.Eof do
       begin
        lListaCid.Add(RemoverCharEsp(lQry.FieldByName('nome').AsString,false));
        lQry.Next;
       end;
    end;
    Result := lListaCid;
  finally
    lQry.Free;
  end;
end;

function TdmPrincipal.getListaTiposCli: TStringList;
var
 lLista : TStringList;
begin
 lLista := TStringList.Create;
 lLista.Add(PES_COMUM);
 lLista.Add(PES_ALUNO);
 lLista.Add(PES_PROFESSOR);
 Result := lLista;
end;

function TdmPrincipal.getListaUF: TStringList;
var
 lListaUF : TStringList;
 lQry : TFDQuery;
begin
  lListaUF := TStringList.Create;
  lQry := TFDQuery.Create(nil);
  try
    lQry.Connection := MySQLConn;
    lQry.SQL.Add('select uf from estado');
    lQry.Open();
    if not lQry.IsEmpty then
    begin
       lQry.First;
       while not lQry.Eof do
       begin
        lListaUF.Add(lQry.FieldByName('uf').AsString);
        lQry.Next;
       end;
    end;
    Result := lListaUF;
  finally
    lQry.Free;
  end;
end;

procedure TdmPrincipal.InserirTpLancPadroes(var pProgBar : TProgressBar );
var
 lQrySelect : TFdQuery;
 lExiste: boolean;
 lLancPad : TListLancPad;
 i : integer;
 lUsaPB : Boolean;
 lCountLista : integer;
begin
  lUsaPB := pProgBar <> nil;
  lQrySelect := TFDQuery.Create(nil);
  lLancPad := TListLancPad.Create;
  try
   lQrySelect.Connection := dmPrincipal.MySQLConn;
   lQrySelect.SQL.Add('SELECT DESCRICAO,');
   lQrySelect.SQL.Add('       CATEGORIA,');
   lQrySelect.SQL.Add('       PADRAO');
   lQrySelect.SQL.Add('FROM TIPOS_LANCAMENTOS');
   lQrySelect.SQL.Add('WHERE PADRAO = ''S''');
   lQrySelect.Open();

   lCountLista := lLancPad.GetLista.Count;
   if lUsaPB then
   begin
       pProgBar.Position := 0;
       pProgBar.Min := 0;
       pProgBar.Max := lCountLista - 1;
   end;
   for i := 0 to  lCountLista - 1 do
   begin
     pProgBar.StepIt;
     Application.ProcessMessages;
     lQrySelect.First;
     lExiste := False;
     while not lQrySelect.Eof do
     begin
       if LowerCase(lQrySelect.FieldByName('DESCRICAO').AsString) = LowerCase(lLancPad.GetLista[i].descricao) then
       begin
         lExiste := true;
         break;
       end;
       lQrySelect.Next;
     end;
     if not lExiste then
     begin
       lQrySelect.Append;
       lQrySelect.FieldByName('DESCRICAO').AsString := lLancPad.GetLista[i].descricao;
       lQrySelect.FieldByName('CATEGORIA').AsString := lLancPad.GetLista[i].categoria;
       lQrySelect.FieldByName('PADRAO').AsString := 'S';
       lQrySelect.Post;
     end;
   end;
   if lQrySelect.IsEmpty then
   begin
     lQrySelect.Append;
     lQrySelect.FieldByName('NOME').AsString := USER_ADMIN;
     lQrySelect.FieldByName('SENHA').AsString := PAS_ADMIN;
     lQrySelect.FieldByName('ADMIN').AsString := 'S';
     lQrySelect.Post;
   end;
  finally
    lQrySelect.Free;
    lLancPad.Free;
  end;
end;

function TdmPrincipal.isInadimp(pCodAluno: integer): boolean;
var
 lQrySelect : TFdQuery;
begin
  lQrySelect := TFdQuery.Create(self);
  try
   lQrySelect.Connection := MySQLConn;
   lQrySelect.SQL.Add('SELECT COD_MENSALIDADE FROM MENSALIDADES');
   lQrySelect.SQL.Add('WHERE COD_ALUNO = ' + InTtoStr(pCodAluno));
   lQrySelect.SQL.Add('AND ( ( DT_RECEBIMENTO IS NULL) AND (DT_VENCIMENTO < CURDATE()) )');
   lQrySelect.SQL.Add('LIMIT 1');
   lQrySelect.Open();
   result := not lQrySelect.IsEmpty;
  finally
   lQrySelect.Free;
  end;
end;

function TdmPrincipal.RetirarChars(pVChars: array of Char; pStr: String): String;
var
 lChar : Char;
 lStrRes : String;
begin
  for lChar in pVChars do
  begin
    lStrRes := StringReplace(pStr,lChar,'',[rfReplaceAll]);
  end;
  Result := lStrRes;
end;

function TdmPrincipal.GetNomePC: String;
var
  lpBuffer : PChar;
  nSize : DWord;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer,nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;

Function TdmPrincipal.getVersaoExe: String;
type
PFFI = ^vs_FixedFileInfo;
var
	F : PFFI;
	Handle : Dword;
	Len : Longint;
	Data : Pchar;
	Buffer : Pointer;
	Tamanho : Dword;
	Parquivo: Pchar;
	Arquivo : String;
begin
	Arquivo := Application.ExeName;
	Parquivo := StrAlloc(Length(Arquivo) + 1);
	StrPcopy(Parquivo, Arquivo);
	Len := GetFileVersionInfoSize(Parquivo, Handle);
	Result := '';
	if Len > 0 then
	begin
		Data:=StrAlloc(Len+1);
		if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
		begin
			VerQueryValue(Data, '\',Buffer,Tamanho);
			F := PFFI(Buffer);
			Result := Format('%d.%d.%d.%d',
								[HiWord(F^.dwFileVersionMs),
								LoWord(F^.dwFileVersionMs),
								HiWord(F^.dwFileVersionLs),
								Loword(F^.dwFileVersionLs)]
							);
		end;
		StrDispose(Data);
	end;
	StrDispose(Parquivo);
end;

function TdmPrincipal.RemoverCharEsp(aTexto : string; aLimExt : boolean) : string;
var
  xTexto : string;
  i : Integer;
begin
   xTexto := aTexto;
   for i:=1 to 38 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfreplaceall]);
   //De acordo com o parâmetro aLimExt, elimina caracteres extras.
   if (aLimExt) then
     for i:=1 to 48 do
       xTexto := StringReplace(xTexto, xCarExt[i], '', [rfreplaceall]);
   Result := xTexto;
end;




procedure TdmPrincipal.salvarLog( pCodUsu: integer; pOperacao, pComputador: string);
begin
 if not qryLog.Active then
 begin
   qryLog.Open();
 end;
 qryLog.Append;
 qryLogcod_usuario.AsInteger := pCodUsu;
 qryLogcomputador.AsString := pComputador;
 qryLogoperacao.AsString := pOperacao;
 qryLog.Post;

end;

end.

