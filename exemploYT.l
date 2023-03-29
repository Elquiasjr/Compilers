%{

int counter = 0;

%}

%%

[a-z]* {printf("Is a word\n"); counter++;}
[ ] {counter++;}
. {printf("Is not a word\n"); counter++;}
\n {return 0;}

%%

yywrap(){}

int main(){
    printf("Enter String: \n");
    yylex();
    printf("%d\n", counter);
    
    return 0;
}