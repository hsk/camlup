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
  | typ LPAREN typ2 RPAREN {
      let rec loop = function
        | TFun(a,b) -> TFun(a, loop b)
        | t -> TFun(t, $1)
      in loop $3
    }
  | typ LBRACK typs RBRACK {
      TGen($1, $3)
    }
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
  | exp SEMICOLON { $1 }

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

  | exp HAT exp { EBin($1, "^", $3) }

  | exp LOR exp { EBin($1, "||", $3) }
  | exp LAMP exp { EBin($1, "&&", $3) }

  | exp OR exp { EBin($1, "lor", $3) }

  | exp XOR exp { EBin($1, "lxor", $3) }

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
  | exp ASSIGN exp {
      match $1 with
        | EPre("!", a) -> EBin(a, ":=", $3)
        | _ -> EBin($1, ":=", $3)
    }
  | exp MATCH LBRACE CASE fns RBRACE { EMatch($1, $5) }
  | IF LPAREN exp RPAREN exp ELSE exp { EIf($3, $5, $7) }
  | IF LPAREN exp RPAREN exp %prec LIST { EIf($3, $5, EEmpty) }
  | LBRACE fn RBRACE { $2 }
  | LBRACE CASE fns RBRACE { EPFun($3) }
  | LBRACE exps RBRACE { EBlock($2) }
  | LBRACK RBRACK { EList[]}
  | LBRACK exps RBRACK { EList $2 }
  | LPAREN RPAREN { EUnit }
  | LPAREN exp RPAREN { $2 }
  | LBRACE COLON records RBRACE { ERecord($3) }
  | exp LBRACE fn RBRACE %prec CALL { ECall($1, [$3]) }
  | exp LBRACE CASE fns RBRACE %prec CALL { ECall($1, [EPFun($4)]) }
  | exp LBRACE exps RBRACE %prec CALL { ECall($1, [EBlock($3)]) }
  | exp LBRACK RBRACK %prec CALL { ECall($1, [EList[]]) }
  | exp LBRACK exps RBRACK %prec CALL { ECall($1, [EList $3]) }
  | exp LPAREN exps RPAREN %prec CALL { ECall($1, $3) }
  | exp LPAREN RPAREN %prec CALL { ECall($1, [EUnit]) }

  | ID COLONASSIGN exp { ELet($1, TEmpty, $3) }
  | exp COLONASSIGN exp {
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
  | exp COLON typ ASSIGN exp {
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
  | exp REFASSIGN exp {
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
  | exp COLON typ {
      ELet(e2id $1, $3, EEmpty)
    }
  | INT { EInt($1) }
  | ID { EVar($1) }
  | STRING { EString($1) }
  | DEF ID COLONASSIGN exp { ELetRec($2, TEmpty, $4) }
  | DEF exp COLONASSIGN exp {
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
  | DEF exp COLON typ ASSIGN exp {
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
  | exps ARROW exps { EFun($1, TEmpty, EBlock($3)) }

fns:
  | fn { [$1] }
  | fn CASE fns { $1 :: $3 }

stmt:
  | exp { SExp($1) }
  | ID COLONASSIGN exp { SLet($1, TEmpty, $3) }
  | DEF ID COLONASSIGN exp { SLetRec($2, TEmpty, $4) }
  | OPEN { SOpen($1) }
  | ID TYPE LBRACE defrecs RBRACE { STypeRec($1, $4)}
  | ID MODULE LBRACE stmts RBRACE { SModule($1, $4) }
  | ID TYPE OR variants { STypeVariant($1, $4)}

stmts:
  | stmt { [$1] }
  | stmt stmts { $1 :: $2 }

prog:
  | stmts { Prog $1 }
  | error
      { failwith
        (Printf.sprintf "parse error near characters %d-%d"
          (Parsing.symbol_start ())
          (Parsing.symbol_end ())) }
