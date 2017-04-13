%{
#include "y.tab.h"
extern char yyval;
%}

NUMBER [0-9]+
LETTER [a-zA-Z]+

%%


{NUMBER} {yylval.sym=(char)yytext[0]; return NUMBER;}
{LETTER} {yylval.sym=(char)yytext[0];return LETTER;}

\n {return 0;}
. {return yytext[0];}

%%
yywrap()
{
return 1;
}
