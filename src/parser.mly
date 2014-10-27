%{
open Ast

let e2t = function
| EVar(e) -> TEmpty
| ELet(_,t,EEmpty) -> t
| EUnit -> TUnit
| _ -> assert false

let e2id = function
| EVar(i) -> i
| ELet(i,t,EEmpty) -> i
| _ -> assert false

let e2e = function
| ELet(e,_,EEmpty) -> EVar(e)
| ELet(e,_,e2) -> assert false
| e -> e

%}

%token <int> INT
%token <string> ID


%token SEMICOLON
%token LPAREN RPAREN LBRACE RBRACE LBRACK RBRACK
%token PRINT
%token EOF
%token COLON COMMA COLONASSIGN REFASSIGN
%token ASSIGN
%token RETURN
%token <string> OPEN
%token <string> STRING
%token STRUCT THIS DOT
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
%token WHEN

%right LIST
%nonassoc ELSE
%right ASSIGN COLONASSIGN REFASSIGN
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

%left NEW
%left prec_app
%left MEMBER
%left DOT
%right ARROW
%left AT
%left LPAREN RPAREN LBRACE RBRACE LBRACK RBRACK
%left CALL

%type <Ast.prog> prog
%start prog

%%

typ:
  | ID { Ty $1 }
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
  | SEMICOLON exp1 { $2 }
  | exp1 SEMICOLON { $1 }

exp2:
  | exp { $1 }
  | SEMICOLON exp { $2 }

exps:
  | exp1 { [$1] }
  | exp1 exps %prec LIST { $1 :: $2 }

defrec:
  | ID COLON typ { ($1, $3) }
  | ID COLON typ SEMICOLON { ($1, $3) }

defrecs:
  | defrec { [$1] }
  | defrec defrecs %prec LIST { $1::$2 }

record:
  | ID ASSIGN exp1 { ($1, $3) }
  | ID { ($1, EEmpty)}

records:
  | record { [$1] }
  | record records  %prec LIST { $1::$2 }

variant:
  | ID typ { ($1,$2) }
  | ID { ($1,TEmpty) }

variants:
  | variant { [$1] }
  | variant OR variants { $1::$3 }

exp:
  | SUB exp { EPre("-", $2) }
  | AMP exp { EPre("ref", $2) }
  | MUL exp { EPre("!", $2) }

  | exp HAT exp2 { EBin($1, "^", $3) }

  | exp LOR exp2 { EBin($1, "||", $3) }
  | exp LAMP exp2 { EBin($1, "&&", $3) }

  | exp OR exp2 { EBin($1, "lor", $3) }

  | exp XOR exp2 { EBin($1, "lxor", $3) }

  | exp AMP exp2 { EBin($1, "land", $3) }

  | exp EEQ exp2 { EBin($1, "==", $3) }
  | exp ENE exp2 { EBin($1, "!=", $3) }
  | exp EQ exp2 { EBin($1, "=", $3) }
  | exp NE exp2 { EBin($1, "<>", $3) }

  | exp LT exp2 { EBin($1, "<", $3) }
  | exp GT exp2 { EBin($1, ">", $3) }
  | exp LE exp2 { EBin($1, "<=", $3) }
  | exp GE exp2 { EBin($1, ">=", $3) }

  | exp ADD exp2 { EBin($1, "+", $3) }
  | exp SUB exp2 { EBin($1, "-", $3) }

  | exp MUL exp2 { EBin($1, "*", $3) }
  | exp DIV exp2 { EBin($1, "/", $3) }
  | exp MOD exp2 { EBin($1, "mod", $3) }

  | exp SHL exp2 { EBin($1, "asl", $3) }
  | exp SHR exp2 { EBin($1, "asr", $3) }

  | exp DOT exp2 { EBin($1, ".", $3) }
  | exp COMMA exp2 { EBin($1, ",", $3) }
  | exp ADDLIST exp2 { EBin($1, "::", $3) }
  | exp ASSIGN exp2
    {
      match $1 with
        | EPre("!", a) -> EBin(a, ":=", $3)
        | _ -> EBin($1, ":=", $3)
    }
  | exp MATCH LBRACE fns RBRACE { EMatch($1, $4) }
  | IF LPAREN exp RPAREN exp1 ELSE exp1 { EIf($3, $5, $7) }
  | IF LPAREN exp RPAREN exp1 %prec LIST { EIf($3, $5, EEmpty) }
  | LBRACE fns RBRACE { EPFun($2) }
  | LBRACE exps RBRACE { EBlock($2) }
  | LBRACK RBRACK { EList[]}
  | LBRACK exps RBRACK { EList $2 }
  | LPAREN RPAREN { EUnit }
  | LPAREN exp RPAREN { $2 }
  | LBRACE COLON records RBRACE { ERecord($3) }
  | exp LBRACE fns RBRACE %prec CALL { ECall($1, [EPFun($3)]) }
  | exp LBRACE exps RBRACE %prec CALL { ECall($1, [EBlock($3)]) }
  | exp LBRACK RBRACK %prec CALL { ECall($1, [EList[]]) }
  | exp LBRACK exps RBRACK %prec CALL { ECall($1, [EList $3]) }
  | exp LPAREN exps RPAREN %prec CALL { ECall($1, $3) }
  | exp LPAREN RPAREN %prec CALL { ECall($1, [EUnit]) }

  | ID COLONASSIGN exp2 { ELet($1, TEmpty, $3) }
  | exp COLONASSIGN exp2
    {
      let rec loop = function 
        | EVar(id),b -> ELet(id, TEmpty, b)
        | ECall((e:e), ls), b ->
          let le = List.map begin fun (l:e) ->
            e2e l
          end ls in
          loop(e, EFun(le, TEmpty, b))
        | _ -> assert false
      in
      loop($1, $3)
    }
  | exp COLON typ ASSIGN exp2
    {
      let rec loop = function 
        | EVar(id),t,b -> ELet(id, t, b)
        | ECall((e:e), ls), (t:t), b ->

          let (lt:t) = List.fold_left begin fun (t:t) (l:e)  ->
            TFun(e2t l, t)
          end (t:t) ls in
          let le = List.map begin fun (l:e) ->
            e2e l
          end ls in
          loop(e, lt, EFun(le, TEmpty, b))
        | _ -> assert false
      in
      loop($1,$3,$5)
    }
  | exp REFASSIGN exp2
    {
      let rec loop = function 
        | EVar(id),b -> ELet(id, TEmpty, b)
        | ECall((e:e), ls), b ->
          let le = List.map begin fun (l:e) ->
            e2e l
          end ls in
          loop(e, EFun(le, TEmpty, b))
        | _ -> assert false
      in
      loop($1,EPre("ref", $3))
    }
  | exp COLON typ { ELet(e2id $1, $3, EEmpty) }
  | INT { EInt($1) }
  | ID { EVar($1) }
  | STRING { EString($1) }
  | DEF ID COLONASSIGN exp2 { ELetRec($2, TEmpty, $4) }
  | DEF exp COLONASSIGN exp2
    {
      let rec loop = function 
        | EVar(id),b -> ELetRec(id, TEmpty, b)
        | ECall((e:e), ls), b ->
          let le = List.map begin fun (l:e) ->
            e2e l
          end ls in
          loop(e, EFun(le, TEmpty, b))
        | _ -> assert false
      in
      loop($2,$4)
    }
  | DEF exp COLON typ ASSIGN exp2
    {
      let rec loop = function 
        | EVar(id),t,b -> ELetRec(id, t, b)
        | ECall((e:e), ls), (t:t), b ->
          let (lt:t) = List.fold_left begin fun (t:t) (l:e)  ->
            TFun(e2t l, t)
          end (t:t) ls in
          let le = List.map begin fun (l:e) ->
            e2e l
          end ls in
          loop(e, lt, EFun(le, TEmpty, b))
        | _ -> assert false
      in
      loop($2,$4,$6)
    }
  | exp MEMBER exp { ECall($3, [$1]) }

fn:
  | OR exps ARROW exps { EFun($2, TEmpty, EBlock($4)) }
  | OR exps WHEN exp ARROW exps { EPtn($2, TEmpty, $4, EBlock($6)) }

fn1:
  | fn { $1 }
  | SEMICOLON fn1 { $2 }
  | fn1 SEMICOLON { $1 }

fns:
  | fn1 { [$1] }
  | fn1 fns { $1 :: $2 }

stmt:
  | exp { SExp($1) }
  | ID COLONASSIGN exp2 { SLet($1, TEmpty, $3) }
  | DEF ID COLONASSIGN exp2 { SLetRec($2, TEmpty, $4) }
  | OPEN { SOpen($1) }
  | ID TYPE LBRACE defrecs RBRACE { STypeRec($1, $4)}
  | ID MODULE LBRACE stmts RBRACE { SModule($1, $4) }
  | ID TYPE OR variants { STypeVariant($1, $4)}

stmt1:
  | stmt { $1 }
  | stmt1 SEMICOLON { $1 }

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
