all:
	lex lex.l
	gcc lex.yy.c
limpiar:
	rm ./a.out && rm lex.yy.c