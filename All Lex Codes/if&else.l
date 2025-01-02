%{
#include<stdio.h>
int idcount=0;
%}
%%
{identifier}  {idcount++;printf("Identifier:  %s\n, length of the identifier %d",yytext,yyleng);}
"if"|"else" {printf("Keyword:  %s\n",yytext);}
{number} {printf("Number:  %s\n",yytext);}
%%
int yywrap()
{
return 1;
}
int main()
{
yylex();
return 0;
}