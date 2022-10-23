%{
%}

%%
inicia|crea|abre|ingresa|lista {printf("Es palabra reservada: %s \n ", yytext);}
[A-Z][a-z]+[ ][A-Z][a-z]+ {printf("Es un nombre: %s \n ", yytext);}
[A-Z][a-z]+[ ][0-9][0-9]* {printf("Es una direccion: %s \n ", yytext);}

. {printf("No identificado: %s \n", yytext);} /*mmmm*/
%%

yywrap() {}

int main() {
    printf("Enter string: ");
    yylex();
    return 0;
}