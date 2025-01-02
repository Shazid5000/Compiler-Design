identifier {digit}
%%
"if"|"else"|"while"|"do"|"switch"|"case"|"for"|"return" {printf("Keyword: %s\n",yytext);}
"+"|"-"|"*"|"/" {printf(" Arithmaticop: %s\n",yytext);}
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