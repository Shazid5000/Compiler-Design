digit [0-9]
letter [A-Za-z]
identifier {letter}({letter}|{digit})*
number ({digit})+((\.({digit})+)?("e^"[+-]?({digit})+)?)?
%{
#include <stdio.h>

int keyword_count = 0;
int operator_count = 0;
int function_count = 0;
int header_count = 0;
int additional_token_count = 0;
int idcount=0;
%}
%%


"#include <stdio.h>"|"#include <string.h>"|"#include <stdlib.h>"|"#include <math.h>" {printf("Header File:  %s\n",yytext);}
"#include <time.h>"|"#include <ctype.h>"|"#include <stdbool.h>" {printf("Header File:  %s\n",yytext);}
"#include <stdint.h>"|"#include <stddef.h>"|"#include <stdarg.h>" {printf("Header File:  %s\n",yytext);}
"#include <assert.h>"|"#include <errno.h>"|"#include <fcntl.h>" {printf("Header File:  %s\n",yytext);}
"#include <limits.h>"|"#include <locale.h>"|"#include <signal.h>" {printf("Header File:  %s\n",yytext);}
"#include <setjmp.h>"|"#include <unistd.h>"|"#include <wchar.h>" {printf("Header File:  %s\n",yytext);}
"#include <wctype.h>"|"#include <arpa/inet.h>"|"#include <dirent.h>" {printf("Header File:  %s\n",yytext);}
"#include <dlfcn.h>"|"#include <errno.h>"|"#include <fcntl.h>" {printf("Header File:  %s\n",yytext);}
"#include <grp.h>"|"#include <ifaddrs.h>"|"#include <netdb.h>" {printf("Header File:  %s\n",yytext);}
"#include <netinet/in.h>"|"#include <netinet/tcp.h>"|"#include <pthread.h>" {printf("Header File:  %s\n",yytext);}
"#include <pwd.h>"|"#include <sched.h>"|"#include <semaphore.h>" {printf("Header File:  %s\n",yytext);}
"#include <sys/ioctl.h>"|"#include <sys/mman.h>"|"#include <sys/msg.h>" {printf("Header File:  %s\n",yytext);}
"#include <sys/resource.h>"|"#include <sys/select.h>"|"#include <sys/socket.h>" {printf("Header File:  %s\n",yytext);}
"#include <sys/stat.h>"|"#include <sys/time.h>"|"#include <sys/epoll.h>" {printf("Header File:  %s\n",yytext);}
"#include <sys/wait.h>"|"#include <termios.h>"|"#include <unistd.h>" {printf("Header File:  %s\n",yytext);}
"#include <sys/types.h>"|"#include <sys/uio.h>"|"#include <sys/un.h>" {printf("Header File:  %s\n",yytext);}



"if"|"else"|"while"|"do"|"switch"|"case"|"for" {printf("Keyword:  %s\n",yytext);}
"char"|"const"|"continue"|"default"|"double"|"enum" {printf("Keyword:  %s\n",yytext);}
"extern"|"float"|"goto"|"int"|"long"|"register"|"return" {printf("Keyword:  %s\n",yytext);}
"short"|"signed"|"sizeof"|"static"|"struct"|"typedef" {printf("Keyword:  %s\n",yytext);}
"break"|"union"|"unsigned"|"void"|"volatile" {printf("Keyword:  %s\n",yytext);}


{identifier}  {idcount++; printf("Identifier:  %s, length of the identifier: %d\n", yytext, yyleng); }

{number} {printf("Number:  %s\n",yytext);}


"+"|"-"|"*"|"/"|"%"|"="|"=="|"!="|"<"|">" {printf("Arithmetic Operator: %s\n",yytext);}
"<="|">="|"++"|"--"|"&&"|"||"|"!"|"&"|"|" {printf("Arithmetic Operator: %s\n",yytext);}

"(" { printf("Left Parenthesis\n"); }
")" { printf("Right Parenthesis\n"); }
"{" { printf("Left Curly Brace\n"); }
"}" { printf("Right Curly Brace\n"); }
"[" { printf("Left Square Bracket\n"); }
"]" { printf("Right Square Bracket\n"); }
";" { printf("Semicolon\n"); }
":" { printf("Colon\n"); }
"," { printf("Comma\n"); }
"." { printf("Dot\n"); }
"->" { printf("Arrow Operator\n"); }
"..." { printf("Ellipsis\n"); }
"+=" { printf("Addition Assignment Operator\n"); }
"-=" { printf("Subtraction Assignment Operator\n"); }
"*=" { printf("Multiplication Assignment Operator\n"); }
"/=" { printf("Division Assignment Operator\n"); }
"%=" { printf("Modulus Assignment Operator\n"); }
"&=" { printf("Bitwise AND Assignment Operator\n"); }
"|=" { printf("Bitwise OR Assignment Operator\n"); }
"^=" { printf("Bitwise XOR Assignment Operator\n"); }
"<<=" { printf("Left Shift Assignment Operator\n"); }
">>=" { printf("Right Shift Assignment Operator\n"); }
"?" { printf("Question Mark\n"); }

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