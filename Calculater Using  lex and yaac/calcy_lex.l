%{
#include<stdio.h>
#include"y.tab.h"
%}
%%
[0-9]+(\.[0-9]+)?   {yylval.dval=atof(yytext);   return NUMBER;}
[ \t]   ; 
\n   {return  0;}
.   return  yytext[0];
%%
int yywrap(void)
{
return 1;
}


