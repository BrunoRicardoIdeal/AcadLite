unit uEndereco;

interface

 type TEndereco = class(TObject)

   private

   FLogradouro ,
   FBairro,
   FComplemento,
   FCEP,
   FUF,
   FCidade : String;

   public
   property Logradouro : String read FLogradouro write FLogradouro;
   property Bairro : String read FBairro write FBairro;
   property Complemento : String read FComplemento write FComplemento;
   property Cep : String read FCEP write FCEP;
   property UF : String read FUF write FUF;
   property Cidade : String read FCidade write FCidade;
 end;

implementation

end.
