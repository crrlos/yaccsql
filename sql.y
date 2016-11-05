%{
 	#include "head.h"
    void yyerror(char *);
    int yylex(void);

%}

%token ID NUMBER LT GT EQ SELECT FROM WHERE AND OR
%start program
%%
program
	:program  line ';' {printf("linea aceptada");}
	|
	;

line
	:SELECT expr FROM expr
	|SELECT expr FROM expr WHERE condition
	|SELECT '*' FROM expr
	|SELECT '*' FROM expr WHERE condition
	;
expr
	:ID expr
	|ID
	|ID ',' expr
	|ID '.'expr
	|NUMBER
	|'('expr')'
	;
	
condition
	:expr comparing expr
	|condition logic condition
	|expr
	|'('condition')'
	;
comparing
	: '=' 
	| '<''=' 
	| '>''=' 
	| '!''=' 
	| '<' 
	| '>' 
	;
logic
	:AND
	|OR
	;
	
	
%%
void yyerror(char *s)
{
  extern int yylineno;	// predefinida en lex.c
  extern char *yytext;	// predefinida en lex.c

  printf("ERROR: %s en simbolo \"%s\" en linea %d \n",s,yytext,yylineno); 
  exit(1);
}