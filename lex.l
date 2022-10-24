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

%%
{INICIA}        {printf("\nPalabra reservadas: (%s)", yytext);}
{CREA}          {printf("\nPalabra reservadas: (%s)", yytext);}
{ABRE}          {printf("\nPalabra reservadas: (%s)", yytext);}
{INGRESA}       {printf("\nPalabra reservadas: (%s)", yytext);}
{LISTA}         {printf("\nPalabra reservadas: (%s)", yytext);}

{NOMBRE}        {printf("\nEs un nombre: %s", yytext);}
{DIRECCION}     {printf("\nEs una direccion: %s", yytext);}

{PAR_ABRE}      {printf("\nPAR_ABRE: (%s)", yytext);}
{PAR_CIERRA}    {printf("\nPAR_CIERRA: (%s)", yytext);}
{CHAR_COMA}     {printf("\nCHAR_COMA: (%s)", yytext);}

. yyerror();

%%

yywrap() {}

int main() {
    printf("Enter string: ");
    yylex();
    return 0;
}
int yyerror(void){
    printf("\n No existe regla valida: %s.\n", yytext);
    exit(1);
}