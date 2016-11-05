sql: y.tab.c lex.yy.c main.c head.h
	gcc y.tab.c lex.yy.c main.c -o sql
	
y.tab.c: sql.y
	yacc -d sql.y -o y.tab.c
	
lex.yy.c: sql.l
	lex sql.l
	
clean:
	rm sql
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h