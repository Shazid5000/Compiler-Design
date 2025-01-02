w [A-Za-z]
word {w}+

%{
#include<stdio.h>
int wc=0;
%}

%%
{word} {wc++;printf("word: %s",yytext);}
%%

int yywrap()
{
return 1;
}
int main()
{
yylex();
printf("word count: %d",wc);
return 0;
}