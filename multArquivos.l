/* Exemplo de Multiplos Arquivo no Flex (contagem de palavras) */
%option noyywrap 
/* desabilita o analisador léxico */
%{
    int chars = 0;
    int words = 0;
    int lines = 0;

    int totchars = 0;
    int totwords = 0;
    int totlines = 0;
%}

%%

[a-zA-Z]+       { words++; chars += strlen(yytext); }
\n              { chars++; lines++; }    
.               { chars++; }

%%

int main(int argc, char *argv[]){
    int i;

    if (argc < 2){  /* stdin é lida */
        yylex();
        printf("%8d %8d %8d\n", lines, words, chars);
        return(0);
    }
    for(i = 1; i < argc; i++){
        FILE *f = fopen(argv[i], "r");

        if(!f){
            perror(argv[i]);
            return(1);
        }
        yyrestart(f);  /* reinicia o analisador léxico */
        yylex();
        fclose(f);
        printf("%8d %8d %8d %s\n", lines, words, chars, argv[i]);
        totchars += chars;
        totwords += words;
        totlines += lines;
        chars = words = lines = 0;
    }
    if (argc > 2) /* imprime valores totais, no caso de mais de um arquivo */
        printf("%8d %8d %8d total\n", totlines, totwords, totchars);
    return(0);
}