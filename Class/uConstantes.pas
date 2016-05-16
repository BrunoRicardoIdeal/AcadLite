unit uConstantes;

interface

 const
     {Lancamentos padroes}
    LANC_MENS_ALUNO = 'Mensalidade de Aluno';
    LANC_AGUA = 'Conta de �gua';
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
    FORMA_PG_CARTAO_CREDITO = 'Cart�o de Cr�dito';
    FORMA_PG_CARTAO_DEBITO = 'Cart�o de D�bito';
    FORMA_PG_CHEQUE = 'Cheque';
    FORMA_PG_TRANSFERENCIA = 'Transfer�ncia';

    {mask}
    TRIM_MASK_TEL = '(  )';

    {usuario e senha}
    USER_ADMIN = 'Admin';
    PAS_ADMIN = '#Admin123';

    {Permiss�es}
    PERM_PESSOAS='Acesso � tela de Pessoas';
    PERM_EQUIPAMENTOS = 'Acesso � tela de Equipamentos';
    PERM_TIPOS_DE_LANC = 'Acesso � tela de Tipos de Lan�amento';
    PERM_LANC = 'Acesso � tela de Lan�amentos';
    PERM_LANC_FIXOS = 'Acesso � tela de Lan�amentos Fixos';
    PERM_MENSALIDADES = 'Acesso � tela de Mensalidades';
    PERM_USUARIOS = 'Acesso � tela de Usu�rios';
    PERM_PLANOS ='Acesso � tela de Planos';
    PERM_REL = 'Acesso � tela de Relat�rios';
    PERM_REL_PESSOAS = 'Acesso � tela de Relat�rios de Pessoas';
    PERM_REL_EQUIPAMENTOS = 'Acesso � tela de Relat�rios de Equipamentos';
    PERM_REL_TIPOS_LANC= 'Acesso � tela de Relat�rios de Tipos de Lan�amento';
    PERM_REL_LANC ='Acesso � tela de Relat�rios de Lan�amentos';
    PERM_REL_MENS= 'Acesso � tela de Relat�rios de Mensalidades';





    {URL}
    URL_CEP_CORREIOS = 'viacep.com.br/ws/';

      //Lista de caracteres especiais
    xCarEsp: array[1..38] of String = ('�', '�', '�', '�', '�','�', '�', '�', '�', '�',
                                     '�', '�','�', '�','�', '�','�', '�',
                                     '�', '�', '�','�', '�','�', '�', '�', '�', '�',
                                     '�', '�', '�','�','�', '�','�','�','�','�');
     //Lista de caracteres para troca
    xCarTro: array[1..38] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N');
    //Lista de Caracteres Extras
    xCarExt: array[1..48] of string = ('<','>','!','@','#','$','%','�','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','�','`',
                                     '�','�','�','�','�','�','�','�','�','�',
                                     '�','�','�','�','�','�','�','�');

implementation

end.
