%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
void ThreeAddressCode();
void triple();
void qudraple();
char AddToTable(char ,char, char);
int ind=0;
char temp='A';
struct incod
{
char opd1;
char opd2;
char opr;
char res;
};
%}
%union
{
char sym;
}
%token <sym> LETTER NUMBER
%type <sym> expr
%left '-''+'
%left '*''/'
%%
statement: LETTER '=' expr ';' {AddToTable((char)$1,(char)$3,'=');}
| expr ';'
;
expr: expr '+' expr {$$ = AddToTable((char)$1,(char)$3,'+');}
| expr '-' expr {$$ = AddToTable((char)$1,(char)$3,'-');}
| expr '*' expr {$$ = AddToTable((char)$1,(char)$3,'*');}
| expr '/' expr {$$ = AddToTable((char)$1,(char)$3,'/');}
| '(' expr ')' {$$ = (char)$2;}
| NUMBER {$$ = (char)$1;}
| LETTER {$$ = (char)$1;}
;
%%
yyerror(char *s)
{
	printf("%s",s);
	exit(0);
}
struct incod code[20];
int id=0;
char AddToTable(char opd1,char opd2,char opr)
{
	if(opr=='=')
	{
		code[ind].res=opd1;	
		code[ind].opr='=';
		code[ind].opd1=opd2;
		code[ind].opd2='\0';
	}
	else
	{
		code[ind].opd1=opd1;
		code[ind].opd2=opd2;
		code[ind].opr=opr;
		code[ind].res=temp++;
	}
	ind++;
return code[ind-1].res;
}
void ThreeAddressCode()
{
	int cnt=0;
	printf("\n\n\t THREE ADDRESS CODE\n\n");
	while(cnt<ind)
	{
		printf("%c : = \t",code[cnt].res);
		if(code[cnt].opr=='=')
			printf("%c\t",code[cnt].opd1);
		
		else
		{
			printf("%c\t",code[cnt].opd1);
			printf("%c\t",code[cnt].opr);
			printf("%c\t",code[cnt].opd2);
		}
		printf("\n");
		cnt++;
	}
}
void quadraple()
{
	int cnt=0;
	printf("\n\n\t QUADRAPLE CODE\n\n");
	while(cnt<ind)
	{
		printf("%d",id);
		printf("\t");
		printf("%c",code[cnt].opr);
		printf("\t");
		printf("%c\t",code[cnt].opd1);
		printf("%c\t",code[cnt].opd2);
		printf("%c",code[cnt].res);
		printf("\n");
		cnt++;
		id++;
	}
}
void triple()
{
	int cnt=0,cnt1,id1=0;
	temp++;
	printf("\n\n\t TRIPLE CODE\n\n");
	while(cnt<ind)
	{
		
			printf("%d",id1);
			printf("\t");
			printf("%c",code[cnt].opr);
			printf("\t");
			if(islower(code[cnt].opd1))
				printf("%c\t",code[cnt].opd1);
			else
			{
				if(code[cnt].opd1!='\0')
				printf("%d\t",code[cnt].opd1-'A');
			}
			if(islower(code[cnt].opd2))
				printf("%c\t",code[cnt].opd2);
			else
			{
				if(code[cnt].opd2!='\0')
					printf("%d\t",code[cnt].opd2-'A');
			}
			printf("\n");
			cnt++;
			id1++;
	}
}
main()
{
	printf("\nEnter the Expression: ");
	yyparse();
	temp='A';
	ThreeAddressCode();
	quadraple();
	triple();
}
