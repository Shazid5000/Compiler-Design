integer [0-9]
letter [A-Za-z]
identifier {letter}({letter}|{digit})*
number ({digit})+((\.({digit})+)?("e^"[+-]?({digit})+)?)?
%{
#include<stdio.h>
int idcount=0;
%}
%%
"if"|"include"|"int"|"return" {printf("Keyword:  %s\n",yytext);}
"<"|"=" {printf("Comperative_Operator: %s\n",yytext);}
"main"|"printf"|"scanf"|"ture"|"number" {printf("identifier:  %s\n",yytext);}
"("|")"|"{"|"}" {printf("Parenthesis:  %s\n",yytext);}
","|";" {printf("Punctuation:  %s\n",yytext);}
"0" {printf("literal_integer:  %s\n",yytext);}
"stdio.h" {printf("header_file:  %s\n",yytext);}
"Enter an integer"|"You entered %d\n"|"The if statement is easy" {printf("literal_string:  %s\n",yytext);}
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