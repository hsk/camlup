%{
open Ast

let e2t = function
  | EVar(e) -> TEmpty
  | ELet(_,t,_) -> t
  | ELetRec(_,t,_) -> t
  | EUnit -> TUnit
  | _ -> assert false

let e2id = function
  | EVar(i) -> i
  | ELet(i,_,_) -> i
  | ELetRec(i,_,_) -> i
  | _ -> assert false

let e2e = function
  | ELet(e,t,e2) -> ETy(false,e,t,e2)
  | ELetRec(e,t,e2) -> ETy(true,e,t,e2)
  | e -> e

let rec loop f = function 
  | EVar(id),t,b -> f(id, t, b)
  | ECall((e:e), ls), (t:t), b ->
    let (lt:t) = List.fold_left (fun (t:t) (l:e)  ->
      TFun(e2t l, t)
    ) (t:t) ls in
    let le = List.map (fun (l:e) ->
      e2e l
    ) ls in
    loop f (e, lt, EFun(le, TEmpty, b))
  | _ -> assert false

let rec loop1 f = function 
  | EVar(id),b -> f(id, TEmpty, b)
  | ECall((e:e), ls), b ->
    let le = List.map (fun (l:e) ->
      e2e l
    ) ls in
    loop1 f (e, EFun(le, TEmpty, b))
  | _ -> assert false

%}

%token <int> INT
%token <string> VAR


%token SEMI
%token LPAREN RPAREN LBRACE RBRACE LBRACK RBRACK
%token EOF
%token COLON COMMA COLONASSIGN REFASSIGN ARROWASSIGN
%token ASSIGN
%token RETURN
%token <string> OPEN
%token <string> STR
%token CLASS THIS DOT
%token IF ELSE
%token IMPLEMENT RIMPLEMENT TRAIT
%token ARROW MEMBER FARROW
%token CAST NEW AT DEF CASE MATCH TYPE MODULE
%token ADDLIST

%token HAT
%token LOR
%token LAMP
%token OR
%token XOR
%token AMP
%token EQ NE ENE EEQ
%token LT GT LE GE
%token SHL SHR
%token ADD SUB
%token MUL DIV MOD
%token INC DEC NOT
%token WHEN
%token FOR WHILE TO UNTIL DOWNTO
%right LIST
%nonassoc ELSE
%right ASSIGN COLONASSIGN REFASSIGN ARROWASSIGN
%left COMMA
%right CAST
%right ADDLIST

%left HAT
%left LOR
%left LAMP
%left OR
%left XOR
%left AMP
%left EQ NE EEQ ENE
%left LT GT LE GE
%left SHL SHR
%left ADD SUB
%left MUL DIV MOD

%left INC DEC NOT

%left prec_app
%left SEMI
%left MEMBER FARROW
%left NEW
%left DOT
%right ARROW
%left AT
%left LPAREN RPAREN LBRACE RBRACE LBRACK RBRACK
%left CALL
%left prec_name

%type <Ast.prog> prog
%start prog

%%

typ:
  | VAR { Ty $1 }
  | typ ARROW typ { TFun($1, $3) }
  | typ LPAREN typ2 RPAREN
    {
      let rec loop = function
        | TFun(a,b) -> TFun(a, loop b)
        | t -> TFun(t, $1)
      in loop $3
    }
  | typ LBRACK typs RBRACK { TGen($1, $3) }
  | LPAREN typs RPAREN { TTuple($2)}
  | LPAREN RPAREN { TUnit }

typ2:
  | typ { $1 }
  | typ typ2 { TFun($1, $2)}

typs:
  | typ { [$1]}
  | typ COMMA typs { $1 :: $3 }

exp1:
  | exp { $1 }
  | exp1 SEMI { $1 }

exps:
  | exp1 { [$1] }
  | exp1 exps %prec LIST { $1 :: $2 }

defrec:
  | VAR COLON typ { ($1, $3) }
  | VAR COLON typ SEMI { ($1, $3) }

defrecs:
  | defrec { [$1] }
  | defrec defrecs %prec LIST { $1::$2 }

record:
  | VAR ASSIGN exp1 { ($1, $3) }
  | VAR { ($1, EEmpty)}

records:
  | record { [$1] }
  | record records  %prec LIST { $1::$2 }

variant:
  | VAR typ { ($1,$2) }
  | VAR { ($1,TEmpty) }

variants:
  | variant { [$1] }
  | variant OR variants { $1::$3 }

exp:
  | INT { EInt($1) }
  | VAR { EVar($1) }
  | STR { EStr($1) }

  | LPAREN RPAREN { EUnit }
  | LPAREN exp RPAREN { $2 }

  | LBRACE fns RBRACE { EPFun($2) }
  | LBRACE exps RBRACE { EBlock($2) }
  | LBRACE COLON records RBRACE { ERecord($3) }

  | LBRACK RBRACK { EList[] }
  | LBRACK exps RBRACK { EList $2 }
  | LBRACK OR RBRACK { EArray[] }
  | LBRACK OR exps RBRACK { EArray $3 }

  | SEMI exp { $2 }
  | SUB exp { EPre("-", $2) }
  | DEC exp { ECall(EVar("decr"), [$2]) }
  | INC exp { ECall(EVar("incr"), [$2]) }

  | AMP exp { EPre("ref", $2) }
  | MUL exp { EPre("!", $2) }
  | NOT exp { EPre("not", $2) }
  | NEW exp { EPre("new", $2) }
  | exp HAT exp { EBin($1, "^", $3) }

  | exp LOR exp { EBin($1, "||", $3) }
  | exp LAMP exp { EBin($1, "&&", $3) }

  | exp OR exp { EBin($1, "lor", $3) }

/*  | exp XOR exp { EBin($1, "lxor", $3) }*/

  | exp AMP exp { EBin($1, "land", $3) }

  | exp EEQ exp { EBin($1, "==", $3) }
  | exp ENE exp { EBin($1, "!=", $3) }
  | exp EQ exp { EBin($1, "=", $3) }
  | exp NE exp { EBin($1, "<>", $3) }

  | exp LT exp { EBin($1, "<", $3) }
  | exp GT exp { EBin($1, ">", $3) }
  | exp LE exp { EBin($1, "<=", $3) }
  | exp GE exp { EBin($1, ">=", $3) }

  | exp ADD exp { EBin($1, "+", $3) }
  | exp SUB exp { EBin($1, "-", $3) }

  | exp MUL exp { EBin($1, "*", $3) }
  | exp DIV exp { EBin($1, "/", $3) }
  | exp MOD exp { EBin($1, "mod", $3) }

  | exp SHL exp { EBin($1, "asl", $3) }
  | exp SHR exp { EBin($1, "asr", $3) }

  | exp DOT exp { EBin($1, ".", $3) }
  | exp COMMA exp { EBin($1, ",", $3) }
  | exp ADDLIST exp { EBin($1, "::", $3) }
  | exp MEMBER exp { EBin($1, "#", $3) }
  | exp FARROW exp { ECall($3, [$1]) }

  | exp COLONASSIGN exp
    {
      match $1 with
        | EPre("!", a) -> EBin(a, ":=", $3)
        | _ -> EBin($1, ":=", $3)
    }

  | exp MATCH LBRACE fns RBRACE { EMatch($1, $4) }
  | IF LPAREN exp RPAREN exp1 ELSE exp1 { EIf($3, $5, $7) }
  | IF LPAREN exp RPAREN exp1 %prec LIST { EIf($3, $5, EEmpty) }
  | FOR LPAREN VAR ARROWASSIGN exp TO exp RPAREN exp
    {
      EFor($3, $5, $7, 1, $9)
    }
  | FOR LPAREN VAR ARROWASSIGN exp DOWNTO exp RPAREN exp
    {
      EFor($3, $5, $7, -1, $9)
    }
  | FOR LPAREN VAR ARROWASSIGN exp UNTIL exp RPAREN exp
    {
      EFor($3, $5, EBin($7, "-", EInt 1), 1, $9)
    }
  | WHILE LPAREN exp RPAREN exp { EWhile($3, $5) }

  | exp LBRACE fns RBRACE %prec CALL { ECall($1, [EPFun($3)]) }
  | exp LBRACE exps RBRACE %prec CALL { ECall($1, [EBlock($3)]) }

  | exp LBRACK RBRACK %prec CALL { EIndex($1, []) }
  | exp LBRACK exps RBRACK %prec CALL { EIndex($1, $3) }

  | exp LPAREN exps RPAREN %prec CALL { ECall($1, $3) }
  | exp LPAREN RPAREN %prec CALL { ECall($1, [EUnit]) }

  |     VAR ASSIGN exp { ELet($1, TEmpty, $3) }
  | DEF VAR ASSIGN exp { ELetRec($2, TEmpty, $4) }

  |     exp ASSIGN exp { loop1 (fun(a,b,c)->ELet(a,b,c)) ($1, $3) }
  | DEF exp ASSIGN exp { loop1 (fun(a,b,c)->ELetRec(a,b,c)) ($2,$4) }
  |     exp REFASSIGN exp { loop1 (fun(a,b,c)->ELet(a,b,c)) ($1,EPre("ref", $3)) }

  |     exp COLON typ ASSIGN exp { loop(fun(a,b,c)->ELet(a,b,c)) ($1,$3,$5) }
  | DEF exp COLON typ ASSIGN exp { loop(fun(a,b,c)->ELetRec(a,b,c)) ($2,$4,$6) }
  |     exp COLON typ
    {
      match $1 with
      | ELetRec(id,_,e) -> ELetRec(id, $3, e)
      | _ -> ELet(e2id $1, $3, EEmpty)
    }
  | XOR exp
    {
      match $2 with
      | ELetRec(id,t,e) -> ELetRec(id, t, e)
      | ELet(id,t,e) -> ELetRec(id, t, e)
      | _ -> ELetRec(e2id $2, TEmpty, EEmpty)
    }



fn:
  | OR exps ARROW exps { EFun($2, TEmpty, EBlock($4)) }
  | OR exps WHEN exp ARROW exps { EPtn($2, TEmpty, $4, EBlock($6)) }

fn1:
  | fn { $1 }
  | SEMI fn1 { $2 }
  | fn1 SEMI { $1 }

fns:
  | fn1 { [$1] }
  | fn1 fns { $1 :: $2 }

stmt:
  | VAR MODULE LBRACE stmts RBRACE { SModule($1, $4) }
  | VAR CLASS LBRACE stmts RBRACE { SClass($1, [], $4) }
  | VAR CLASS LPAREN RPAREN LBRACE stmts RBRACE { SClass($1, [], $6) }
  | VAR CLASS LPAREN defrecs RPAREN LBRACE stmts RBRACE { SClass($1, $4, $7) }
  | exp { SExp($1) }
  | VAR ASSIGN exp { SLet($1, TEmpty, $3) }
  | DEF VAR ASSIGN exp { SLetRec($2, TEmpty, $4) }
  | OPEN { SOpen($1) }
  | VAR TYPE LBRACE defrecs RBRACE { STypeRec($1, $4) }
  | VAR TYPE OR variants { STypeVariant($1, $4)}

stmt1:
  | stmt { $1 }
  | SEMI stmt { $2 }
  | stmt1 SEMI { $1 }

stmts:
  | stmt1 { [$1] }
  | stmt1 stmts { $1 :: $2 }

prog:
  | stmts { Prog $1 }
  | error
      { failwith
        (Printf.sprintf "parse error near characters %d-%d"
          (Parsing.symbol_start ())
          (Parsing.symbol_end ())) }
