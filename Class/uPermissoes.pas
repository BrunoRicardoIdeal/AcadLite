unit uPermissoes;

interface

uses
  FireDAC.Comp.Client,StrUtils;


  type TConcePermissao = (cpPermitir, cpRetirar);

 type TPermissoes = class(TObject)

  private
   FConexao : TFDConnection;
   FQuery : TFDQuery;
   procedure CriaPermissao(pDescricao : string; pCodTela : Integer);


  public
   constructor Create(pConexao : TFDConnection);
   destructor Destroy;
   procedure CriarTodasPermissoes;
   procedure ConcederTodasPermissoes(pCodUsuario : integer);
   procedure RetirarTodasPermissoes(pCodUsuario : integer);
   function GetCodPermissao(pDescricao : String):integer;
   function PossuiPermissao(pCodUsu,pCodPermissao : integer):boolean;overload;
   function PossuiPermissao(pCodUsu : integer; pDescPermissao : string):boolean;overload;
   function ConcederPermissao(pCodUsu,pCodPermissao : integer ; pConceder : TConcePermissao) :string;


 end;



implementation

uses
  System.SysUtils,uConstantes;

{ TPermissoes }

function TPermissoes.ConcederPermissao(pCodUsu, pCodPermissao: integer; pConceder : TConcePermissao):string;
var
 lMsg : String;
begin
 FQuery.Close;
 FQuery.SQL.Clear;
 FQuery.SQL.Add('SELECT ID,COD_PERMISSAO,COD_USUARIO FROM PERMISSOES_USUARIOS');
 FQuery.SQL.Add('WHERE COD_USUARIO = :COD_USUARIO');
 FQuery.SQL.Add('AND COD_PERMISSAO = :COD_PERMISSAO');
 FQuery.ParamByName('COD_USUARIO').AsInteger := pCodUsu;
 FQuery.ParamByName('COD_PERMISSAO').AsInteger := pCodPermissao;
 FQuery.Open();
 case pConceder of
   cpPermitir: begin
                if FQuery.IsEmpty then
                begin
                  FQuery.Append;
                  FQuery.FieldByName('COD_PERMISSAO').AsInteger := pCodPermissao;
                  FQuery.FieldByName('COD_USUARIO').AsInteger := pCodUsu;
                  FQuery.Post();
                  lMsg := 'Permissão concedida!';
                end
                else
                begin
                  lMsg := 'Essa pessoa já possui a permissão selecionada!';
                end;
               end;
   cpRetirar: begin
               if not FQuery.IsEmpty then
               begin
                 FQuery.Delete;
                 lMsg := 'Permissão retirada!'
               end
               else
               begin
                 lMsg := 'Essa pessoa ainda não possui a permissão selecionada!';
               end;

 end;         end;
 Result := lMsg;
end;

procedure TPermissoes.ConcederTodasPermissoes(pCodUsuario: integer);
var
 lQryPerm : TFDQuery;
begin
 lQryPerm := TFDQuery.Create(nil);
 try
  lQryPerm.Connection := FConexao;
  lQryPerm.SQL.Add('SELECT COD_PERMISSAO FROM PERMISSOES');
  lQryPerm.Open();
  lQryPerm.First;
  while not lQryPerm.Eof do
  begin
    ConcederPermissao(pCodUsuario,lQryPerm.FieldByName('COD_PERMISSAO').AsInteger,cpPermitir);
    lQryPerm.Next;
  end;
 finally
  lQryPerm.Free;
 end;
end;

constructor TPermissoes.Create(pConexao: TFDConnection);
begin
  FConexao:= pConexao;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConexao;
end;

procedure TPermissoes.CriaPermissao(pDescricao: string; pCodTela: Integer);
begin
 FQuery.Close;
 FQuery.SQL.Clear;
 FQuery.SQL.Add('SELECT COD_PERMISSAO,DESCRICAO,COD_TELA FROM PERMISSOES');
 FQuery.SQL.Add('WHERE LOWER(DESCRICAO) = :DESCRICAO');
 FQuery.SQL.Add('AND COD_TELA = :COD_TELA');
 FQuery.ParamByName('DESCRICAO').AsString := lowerCase(pDescricao);
 FQuery.ParamByName('COD_TELA').AsInteger := pCodTela;
 FQuery.Open();
 if FQuery.IsEmpty then
 begin
   FQuery.Append;
   FQuery.FieldByName('DESCRICAO').AsString := pDescricao;
   FQuery.FieldByName('COD_TELA').AsInteger := pCodTela;
   FQuery.Post;
 end;
end;

procedure TPermissoes.CriarTodasPermissoes;
begin
 CriaPermissao(PERM_PESSOAS,1);
 CriaPermissao(PERM_EQUIPAMENTOS,2);
 CriaPermissao(PERM_TIPOS_DE_LANC,3);
 CriaPermissao(PERM_LANC,4);
 CriaPermissao(PERM_LANC_FIXOS,5);
 CriaPermissao(PERM_MENSALIDADES,6);
 CriaPermissao(PERM_USUARIOS,7);
 CriaPermissao(PERM_PLANOS,8);
 CriaPermissao(PERM_REL,9);
 CriaPermissao(PERM_REL_PESSOAS,10);
 CriaPermissao(PERM_REL_EQUIPAMENTOS,11);
 CriaPermissao(PERM_REL_TIPOS_LANC,12);
 CriaPermissao(PERM_REL_LANC,13);
 CriaPermissao(PERM_REL_MENS,14);
end;

destructor TPermissoes.Destroy;
begin
 FQuery.Free;
end;

function TPermissoes.GetCodPermissao(pDescricao: String): integer;
begin
 FQuery.Close;
 FQuery.SQL.Clear;
 FQuery.SQL.Add('SELECT COD_PERMISSAO FROM PERMISSOES');
 FQuery.SQL.Add('WHERE LOWER(DESCRICAO) = :DESCRICAO');
 FQuery.ParamByName('DESCRICAO').AsString := LowerCase(pDescricao);
 FQuery.Open();
 Result := FQuery.FieldByName('COD_PERMISSAO').AsInteger;
end;

function TPermissoes.PossuiPermissao(pCodUsu: integer; pDescPermissao: string): boolean;
begin
 result := PossuiPermissao(pCodUsu,GetCodPermissao(pDescPermissao));
end;

procedure TPermissoes.RetirarTodasPermissoes(pCodUsuario: integer);
begin
 FQuery.Close;
 FQuery.SQL.Clear;
 FQuery.SQL.Add('DELETE FROM PERMISSOES_USUARIOS');
 FQuery.SQL.Add('WHERE COD_USUARIO = :COD_USUARIO');
FQuery.ParamByName('COD_USUARIO').AsInteger:= pCodUsuario;
 FConexao.StartTransaction;
 FQuery.ExecSQL;
 FConexao.Commit;
 end;

function TPermissoes.PossuiPermissao(pCodUsu, pCodPermissao: integer): boolean;
begin
 FQuery.Close;
 FQuery.SQL.Clear;
 FQuery.SQL.Add('SELECT ID,COD_PERMISSAO,COD_USUARIO FROM PERMISSOES_USUARIOS');
 FQuery.SQL.Add('WHERE COD_USUARIO = :COD_USUARIO');
 FQuery.SQL.Add('AND COD_PERMISSAO = :COD_PERMISSAO');
 FQuery.ParamByName('COD_USUARIO').AsInteger := pCodUsu;
 FQuery.ParamByName('COD_PERMISSAO').AsInteger := pCodPermissao;
 FQuery.Open();
 Result := not FQuery.IsEmpty;
end;

end.
