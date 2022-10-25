%{
%}

/*Seccion tokens*/
DIGITO      [0-9]
LETRA_MIN   [a-z]
LETRA_MAY   [A-Z]
ESPACIO     [" "]

/*Expresiones regulares*/
NOMBRE {LETRA_MAY}{LETRA_MIN}+{ESPACIO}{LETRA_MAY}{LETRA_MIN}+
DIRECCION {LETRA_MAY}{LETRA_MIN}+{ESPACIO}{DIGITO}{DIGITO}*

/*Simbolos*/
PAR_ABRE    ["("]
PAR_CIERRA  [")"]
CHAR_COMA   [","]

/*Palabras reservadas*/
INICIA  "inicia"
CREA    "crea"
ABRE    "abre"
INGRESA "ingresa"
LISTA   "lista"

PR {INICIA}|{CREA}|{ABRE}|{INGRESA}|{LISTA}

/*yytext es un array con la cadena de entrada podemos acceder atraves de indices*/

%%
[\t ]+
{PR}            {printf("\nPalabra reservada: %s", yytext);}

{NOMBRE}        {printf("\nEs un nombre: %s", yytext);} 
{DIRECCION}     {printf("\nEs una direccion: %s", yytext);}

{PAR_ABRE}      {printf("\nPAR_ABRE: %s", yytext);}
{PAR_CIERRA}    {printf("\nPAR_CIERRA: %s", yytext);}
{CHAR_COMA}     {printf("\nCHAR_COMA: %s", yytext);}
[a-zA-Z]+        {printf("\nNo reconocido: %s", yytext);}
%%

yywrap() {}

int main() {
    printf("Ingrese una cadena: ");
    yylex();
    return 0;
}
