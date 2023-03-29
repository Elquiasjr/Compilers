/* Exemplo  de Arquivo no Flez (contagem de palavras) */
%option noyywrap 
/* desabilita o analisador léxico */
%{
    int chars = 0;
    int words = 0;
    int lines = 0;
%}

%%

[a-zA-Z]+       { words++; chars += strlen(yytext); }
\n              { chars++; lines++; }    
.               { chars++; }

%%

int main(int argc, char *argv[]){
    if (argc > 1){
        if(!(yyin = fopen(argv[1], "r"))){
            perror(argv[1]);
            return(1);
        }
    }
    yylex();
    printf("%d %d %d\n", lines, words, chars);
}