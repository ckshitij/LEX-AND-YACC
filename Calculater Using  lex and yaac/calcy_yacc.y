//calculator
//Calc.y
%{
#include<stdio.h>
#include<math.h>
%}
%union
{  
    double dval;
}
%token <dval> NUMBER;
%left '-' '+'
%left '*' '/'
%right '^'
%type <dval> expr
%%
result:
'=' expr
| expr        {printf("%f", $1);}
;
expr:
	       expr '+' expr		{$$=$1+$3;}
	|     expr '*' expr    	{$$=$1*$3;}
	|   expr '-' expr		{$$=$1-$3;}
	|   expr  '^' expr		{ $$=pow($1,$3);}
	|  expr  '/' expr	       {     if($3==0)
                                                yyerror("divide by zero");
							else
								$$=$1/$3;}
	|  '-' expr	{ $$=-$2;}
	| '(' expr  ')'	{$$=$2;}
	|  NUMBER	{$$=$1;}
	;
%%
void  yyerror(char *s)
{
	fprintf(stdout, "%s/n", s);
}
int main()
{
	yyparse();
	return 0;
}
