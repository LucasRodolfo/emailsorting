%{

#include <stdio.h>
#include <string.h>
int flag =0, total=0, feec=0, unicamp=0;
%}

%%

([a-z.0-9]+)@[a-z.0-9]*(fee.unicamp.)/(br) { feec++; unicamp++; total++; }

([a-z.0-9]+)@[a-z.0-9]*(unicamp.)/(br) {  unicamp++; total++; }

([a-z.0-9]+)@[a-z.0-9]+(.com)?(.br)? {  total++; }

[[:space:]]+ ;
[[:^space:]]+ ;

[.\n]* ;

%%

int main() {
  yylex();

  printf("%d %d %d\n", total, unicamp, feec);

  return 0;
}
