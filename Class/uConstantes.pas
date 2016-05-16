unit uConstantes;

interface

 const
     {Lancamentos padroes}
    LANC_MENS_ALUNO = 'Mensalidade de Aluno';
    LANC_AGUA = 'Conta de Água';
    LANC_LUZ = 'Conta de Luz';

    {operacoes}
    OP_LOGIN = 'Login';
    OP_LOGOUT = 'Logout';

    {Tipos Pessoas}
    PES_COMUM = 'Comum';
    PES_ALUNO = 'Aluno';
    PES_PROFESSOR = 'Professor';

    {Formas Pagamento}
    FORMA_PG_DINHEIRO = 'Dinheiro';
    FORMA_PG_CARTAO_CREDITO = 'Cartão de Crédito';
    FORMA_PG_CARTAO_DEBITO = 'Cartão de Débito';
    FORMA_PG_CHEQUE = 'Cheque';
    FORMA_PG_TRANSFERENCIA = 'Transferência';

    {mask}
    TRIM_MASK_TEL = '(  )';

    {usuario e senha}
    USER_ADMIN = 'Admin';
    PAS_ADMIN = '#Admin123';

    {Permissões}
    PERM_PESSOAS='Acesso à tela de Pessoas';
    PERM_EQUIPAMENTOS = 'Acesso à tela de Equipamentos';
    PERM_TIPOS_DE_LANC = 'Acesso à tela de Tipos de Lançamento';
    PERM_LANC = 'Acesso à tela de Lançamentos';
    PERM_LANC_FIXOS = 'Acesso à tela de Lançamentos Fixos';
    PERM_MENSALIDADES = 'Acesso à tela de Mensalidades';
    PERM_USUARIOS = 'Acesso à tela de Usuários';
    PERM_PLANOS ='Acesso à tela de Planos';
    PERM_REL = 'Acesso à tela de Relatórios';
    PERM_REL_PESSOAS = 'Acesso à tela de Relatórios de Pessoas';
    PERM_REL_EQUIPAMENTOS = 'Acesso à tela de Relatórios de Equipamentos';
    PERM_REL_TIPOS_LANC= 'Acesso à tela de Relatórios de Tipos de Lançamento';
    PERM_REL_LANC ='Acesso à tela de Relatórios de Lançamentos';
    PERM_REL_MENS= 'Acesso à tela de Relatórios de Mensalidades';





    {URL}
    URL_CEP_CORREIOS = 'viacep.com.br/ws/';

      //Lista de caracteres especiais
    xCarEsp: array[1..38] of String = ('á', 'à', 'ã', 'â', 'ä','Á', 'À', 'Ã', 'Â', 'Ä',
                                     'é', 'è','É', 'È','í', 'ì','Í', 'Ì',
                                     'ó', 'ò', 'ö','õ', 'ô','Ó', 'Ò', 'Ö', 'Õ', 'Ô',
                                     'ú', 'ù', 'ü','Ú','Ù', 'Ü','ç','Ç','ñ','Ñ');
     //Lista de caracteres para troca
    xCarTro: array[1..38] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N');
    //Lista de Caracteres Extras
    xCarExt: array[1..48] of string = ('<','>','!','@','#','$','%','¨','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','´','`',
                                     '¨','æ','Æ','ø','£','Ø','ƒ','ª','º','¿',
                                     '®','½','¼','ß','µ','þ','ý','Ý');

implementation

end.
