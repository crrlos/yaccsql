%{
	#include "head.h"
    #include "y.tab.h"
    void yyerror(char *);
%}
ID [a-zA-Z_]+
NUMBER [+-]?[0-9]+(.[0-9]+)?
%%
"select"	return SELECT;
"from"		return FROM;
"where"		return WHERE;
"and"		return AND;
"or"		return OR;
{NUMBER}	{yylval = atoi(yytext); return NUMBER;}
{ID}		{yylval = *yytext; return ID;}
[;,.*=<>_]			return *yytext;
[ \t\n]		;
%%
int yywrap(void) {
    return 1;
}
