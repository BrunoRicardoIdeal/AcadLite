unit uTelas;

interface

uses
  FireDAC.Comp.Client;

 type TTelas = class(TObject)

  private
   FConexao : TFDConnection;
   FQuery : TFDQuery;
   procedure CriarTela(pDescricao : String);


  public
   constructor Create(pConexao : TFDConnection);
   destructor Destroy;
   procedure CriarTodasTelas;
 end;



implementation

uses
  System.SysUtils;

{ TPermissoes }

constructor TTelas.Create(pConexao: TFDConnection);
begin
  FConexao:= pConexao;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConexao;
end;

procedure TTelas.CriarTela(pDescricao: String);
begin
 FQuery.SQL.Clear;
 FQuery.SQL.Add('SELECT COD_TELA,DESCRICAO FROM TELAS');
 FQuery.SQL.Add('WHERE LOWER(DESCRICAO) = :DESCRICAO');
 FQuery.ParamByName('DESCRICAO').AsString := lowerCase(pDescricao);
 FQuery.Open();
 if FQuery.IsEmpty then
 begin
   FQuery.Append;
   FQuery.FieldByName('DESCRICAO').AsString := pDescricao;
   FQuery.Post;
 end;
end;

procedure TTelas.CriarTodasTelas;
begin
 CriarTela('Pessoas');
 CriarTela('Equipamentos');
 CriarTela('Tipos de Lan�amento');
 CriarTela('Lan�amentos');
 CriarTela('Lan�amentos Fixos');
 CriarTela('Mensalidades');
 CriarTela('Usu�rios');
 CriarTela('Planos');
 CriarTela('Relat�rios');
 CriarTela('Relat�rios de Pessoas');
 CriarTela('Relat�rios de Equipamentos');
 CriarTela('Relat�rios de Tipos de Lan�amentos');
 CriarTela('Relat�rios de Lan�amentos');
 CriarTela('Relat�rios de Mensalidades');
end;

destructor TTelas.Destroy;
begin
 FQuery.Free;
end;

end.

