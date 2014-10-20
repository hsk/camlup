%{
open Dexp

%}

%token <int> INT
%token <string> ID
%token <string> OP
%token <string> STRING
%token <string> LPAREN
%token <string> RPAREN
%token EOF

%right LIST

%left prec_app
%left LPAREN RPAREN
%left CALL

%type <Dexp.d> prog
%start prog

%%

prog:
  | exps { DList($1) }

exps:
  | exp { [$1] }
  | exp exps %prec LIST { $1 :: $2 }

exp:
  | LPAREN RPAREN { DPrn($1,DList([]),$2) }
  | LPAREN exps RPAREN { DPrn($1,DList($2),$3) }
  | INT { DInt($1) }
  | ID { DId($1) }
  | STRING { DStr($1) }
  | OP { DOp($1) }