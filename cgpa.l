d1 [0-3]
d2 [0-9]
CGPA1 ({d1}\.{d2}{d2})
%{
#include<stdio.h>
%}
%%
CGPA {CGPA1}|"4.00"
{CGPA1}|"4.00" {printf("CGPA: %s\n",yytext);}
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