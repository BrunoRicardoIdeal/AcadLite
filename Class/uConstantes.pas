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

    {mask}
    TRIM_MASK_TEL = '(  )';

    {usuario e senha}
    USER_ADMIN = 'Admin';
    PAS_ADMIN = '#Admin123';

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
