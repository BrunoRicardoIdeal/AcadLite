unit uLancPadroes;

interface

 uses sysutils, Types, System.Generics.Collections,uConstantes;



 type TLanc = class(tObject)

  public
   descricao : string;
   categoria : String;
 end;

 type TListLancPad = class(TObject)

  private
    var
     FLista : TList<TLanc>;

  public
   function GetLista : TList<TLanc>;
   constructor Create;
   destructor Destroy;override;

 end;


implementation

{ TLanc }


{ TListLancPad }

constructor TListLancPad.Create;
var
 lLanc : TLanc;
begin
 FLista := TList<TLanc>.Create;

 lLanc := TLanc.Create;
 lLanc.descricao := LANC_MENS_ALUNO;
 lLanc.categoria := 'Receita';
 FLista.Add(lLanc);

 lLanc := TLanc.Create;
 lLanc.descricao := LANC_LUZ;
 lLanc.categoria := 'Despesa';
 FLista.Add(lLanc);

 lLanc := TLanc.Create;
 lLanc.descricao := LANC_AGUA;
 lLanc.categoria := 'Despesa';
 FLista.Add(lLanc);





end;

destructor TListLancPad.Destroy;
begin
 FLista.Free;
end;

function TListLancPad.GetLista: TList<TLanc>;
begin
 result := FLista;
end;

end.
