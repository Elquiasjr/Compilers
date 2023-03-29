%{

/*  Exemplo 4:: Flex
    realiza o escaneamento e o reconhecimento 
    de tags (e.g., HTML) */

int linhas = 0, qtdTags = 0;

%}

TAG \<(.)*\>
WHITESPACE [\ \t]
LINHA [\n]
lett1 [a-z]+
lett2 [A-Z]+
word  [A-Z][a-z]+

%%

{lett1} { printf("min: %s\n", yytext); } 
{lett2} { printf("mai: %s\n", yytext); }
{word}  { printf("Word: %s\n", yytext); }
{TAG}   {qtdTags++; printf("Tag: %s\n", yytext);}
{LINHA}         {linhas++;}
{WHITESPACE}    ;
.               ;

%%

int main(int nArgs, char *szArgs[]){
    yylex();
    printf("\nTotal de linhas processasdas: %d\n", linhas);
    printf("\nQuantidade de tags reconhecidas: %d\n", qtdTags);
    return 0;
}