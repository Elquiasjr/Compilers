%{

    /* Exemplo 1 :: Flex
    reconhecimento simples de digitos e palavras
    com reconhecimento de espaços também */

int numPalavras = 0;

%}

DIGITO      [0-9]
PALAVRA     [a-zA-Z]+
ESPACO      " "
%%

{DIGITO}+   { printf("Digito: \"%s\"\n", yytext); }
{PALAVRA}   { printf("Palavra: \"%s\"\n", yytext); numPalavras++;}
{ESPACO}    { printf("Espaço\n"); }
.          { printf("Não reconhecido: \"%s\"\n", yytext); }   
%%

int main(int nArgs, char *szArgs[])
{
    yylex();
    printf("Número palavras: %d\n", numPalavras);
    return 0;
}