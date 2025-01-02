digit [0-9]
letter [A-Za-z]
identifier {letter}({letter}|{digit})*
number ({digit})+((\.({digit})+)?("e^"[+-]?({digit})+)?)?
%{
#include<stdio.h>
int idcount=0;
%}
%%
{identifier}  {idcount++;printf("Identifier:  %s\n, length of the identifier %d",yytext,yyleng);}
"if"|"else"|"then"|"while"|"do"|"switch"|"case"|"for"|"return" {printf("Keyword:  %s\n",yytext);}
{number} {printf("Number:  %s\n",yytext);}
"<"|"<="|">"|">="|"="|"<>" {printf("Relop: %s\n",yytext);}
%%
int yywrap()
{
return 1;
}
int main()
{
yyin= fopen("myfile.txt","r");
printf("Here in file:\n");
yylex();
printf("Number of id: %d",idcount);
return 0;
}