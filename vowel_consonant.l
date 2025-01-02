%{
#include <stdio.h>
%}

digit [0-9]
vowel [aeiouAEIOU]
consonant [bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]

%%

{vowel}     { printf("Vowel: %c\n", yytext[0]); }
{consonant} { printf("Consonant: %c\n", yytext[0]); }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
