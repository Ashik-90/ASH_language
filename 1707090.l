char [a-zA-Z]
digit [0-9]
special [$_@]
space " "
newline "\n"

%{
	#include "1707090.tab.h"
	#include <string.h>
%}



%%
"$$". {/*This is comment*/}

{space}|{newline} {}

"s:" {return SM;}
".." {return CM;}
{digit}+ 	{
				yylval.val = atoi(yytext);
				return NUM;
			}

"ASH_main" { return MAIN;}
"ShowNum" { return PRINTVAR;}
"ShowStr" {return PRINTSTR;}
"Enter" {return PRINTLN;}

"ASH_def#"({char}|{digit}|{special})+ {return FUNCTION;}

"Var#"({char}|{digit}|{special})+ { strcpy(yylval.text,yytext);return ID;}

"Int" {  return INT;}
"Flt" { return FLOAT;}
"Chr" { return CHAR;}

"{(" { return PB;}
")}" { return PE;}

"[" { return BB;}
"]" { return BE;}

"=>" {return ASGN;}

"+:" {return PLUS;}
"-:" {return MINUS;}
"x:" {return MULT;}
"/:" {return DIV;}
"%:" {return REM;}
"Ceil" {return CEIL;}
"Floor" {return FLOOR;}

"Kom" {return LT;}
"Beshi" {return GT;}
"Kom=" {return LE;}
"Beshi=" {return GE;}

"If" { return IF;}
"Againif" {return ELSEIF;}
"Fi" {return ELSE;}

"Rep" {return FOR;}
"Inc:" {return INC;}
"Limit:" {return TO;}

"Match" {return SWITCH;}
"None" {return DEFAULT;}
")=" {return COL;}

"Until" {return UNT;}

. {}


"\""(.)*"\"" {strcpy(yylval.text,yytext);return STR;}




%%


int yywrap()
{
	return 1;
}


int main(){
	yyin = freopen("input.txt","r",stdin);
	//freopen("output.txt","w",stdout);
	yyparse();
}