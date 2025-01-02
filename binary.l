%%
[01]+(\.[01]+)? {printf("Binary number: %s\n",yytext);}
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