%{
open Ast

let p() = 0
let e2t = function
| EVar(_,e) -> TEmpty
| ELet(_,_,t,EEmpty(_)) -> t
| EUnit(_) -> TUnit
| _ -> assert false

let e2id = function
| EVar(_,_) as i -> i
| ELet(_,i,t,EEmpty(_)) -> i
| _ -> assert false

let e2e = function
| ELet(p,e,_,EEmpty(_)) -> e
| ELet(_,e,_,e2) -> assert false
| e -> e

%}

%token <int> INT
%token <string> ID


%token SEMICOLON
%token LPAREN RPAREN LBRACE RBRACE LBRACK RBRACK
%token BEGIN DO END
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
%token CAST NEW AT DEF CASE WHEN TYPE MODULE
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

%right LIST SEMICOLON
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
  /*
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
*/
exp1:
  | exp { $1 }
  | exp SEMICOLON { $1 }

exps:
  | exp1 { [$1] }
  | exp1 exps %prec LIST { $1 :: $2 }
/*
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
*/
exp:

  | SUB exp { EPre(p(),"-", $2) }
  | AMP exp { EPre(p(),"ref", $2) }
  | MUL exp { EPre(p(),"!", $2) }

  | exp HAT exp { EBin(p(),$1, "^", $3) }

  | exp LOR exp { EBin(p(), $1, "||", $3) }
  | exp LAMP exp { EBin(p(), $1, "&&", $3) }

  | exp OR exp { EBin(p(), $1, "lor", $3) }

  | exp XOR exp { EBin(p(), $1, "lxor", $3) }

  | exp AMP exp { EBin(p(), $1, "land", $3) }

  | exp EEQ exp { EBin(p(), $1, "==", $3) }
  | exp ENE exp { EBin(p(), $1, "!=", $3) }
  | exp EQ exp { EBin(p(), $1, "=", $3) }
  | exp NE exp { EBin(p(), $1, "<>", $3) }

  | exp LT exp { EBin(p(), $1, "<", $3) }
  | exp GT exp { EBin(p(), $1, ">", $3) }
  | exp LE exp { EBin(p(), $1, "<=", $3) }
  | exp GE exp { EBin(p(), $1, ">=", $3) }

  | exp ADD exp { EBin(p(), $1, "+", $3) }
  | exp SUB exp { EBin(p(), $1, "-", $3) }

  | exp MUL exp { EBin(p(), $1, "*", $3) }
  | exp DIV exp { EBin(p(), $1, "/", $3) }
  | exp MOD exp { EBin(p(), $1, "mod", $3) }

  | exp SHL exp { EBin(p(), $1, "asl", $3) }
  | exp SHR exp { EBin(p(), $1, "asr", $3) }

  | exp DOT exp { EBin(p(), $1, ".", $3) }
  | exp COMMA exp { EBin(p(), $1, ",", $3) }
  | exp ADDLIST exp { EBin(p(), $1, "::", $3) }
  | exp ASSIGN exp {
      match $1 with
        | EPre(p, "!", a) -> EBin(p, a, ":=", $3)
        | _ -> EBin(e_pos($1), $1, ":=", $3)
    }
  
  | CASE exp WHEN fns END { EMatch(p(), $2, $4) }
  
  /*
  | IF LPAREN exp RPAREN exp ELSE exp { EIf($3, $5, $7) }
  | IF LPAREN exp RPAREN exp %prec LIST { EIf($3, $5, EEmpty) }
*/

/*  | LBRACE fn RBRACE { $2 }*/
  | DO fns END { EPFun(p(), $2) }
  | LBRACE fns RBRACE { EPFun(p(),$2) }
  | LBRACE exps RBRACE { EFun(p(), [EUnit(p())], TEmpty, EBlock(p(), $2)) }
  | BEGIN exps END { EBlock(p(), $2) }
  | LBRACK RBRACK { EList(p(),[])}
  | LBRACK exps RBRACK { EList(p(),$2) }
  | LPAREN RPAREN { EUnit(p()) }

  | LPAREN exp RPAREN { $2 }
/*
  | LBRACE COLON records RBRACE { ERecord($3) }

  | exp LBRACE fn RBRACE %prec CALL { ECall($1, [$3]) }
  | exp LBRACE CASE fns RBRACE %prec CALL { ECall($1, [EPFun($4)]) }
  | exp LBRACE exps RBRACE %prec CALL { ECall($1, [EBlock($3)]) }*/
/*
  | exp LBRACK RBRACK %prec CALL { ECall($1, [EList[]]) }
  | exp LBRACK exps RBRACK %prec CALL { ECall($1, [EList $3]) }}*/
  | exp LPAREN exps RPAREN %prec CALL { ECall(p(),$1, $3) }
  | exp LPAREN RPAREN %prec CALL { ECall(p(),$1, [EUnit(p())]) }

  | ID COLONASSIGN exp { ELet(p(),EVar(p(),$1), TEmpty, $3) }
  /*
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
  */
  | exp COLON typ ASSIGN exp {
      let rec loop = function 
        | EVar(p,_) as id,t,b -> ELet(p,id, t, b)
        | ECall(p,(e:e), ls), (t:t), b ->

          let (lt:t) = List.fold_left (fun (t:t) (l:e)  ->
            TFun(e2t l, t)
          ) (t:t) ls in
          let le = List.map (fun (l:e) ->
            e2e l
          ) ls in
          loop(e, lt, EFun(p, le, TEmpty, b))
        | _ -> assert false
      in
      loop($1,$3,$5)
    }
  /*
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
    */
    /*
  | exp COLON typ {
      ELet(e2id $1, $3, EEmpty)
    }*/
  | INT { EInt(p(),$1) }
  | ID { EVar(p(),$1) }
  | STRING { EStr(p(),$1) }
  | DEF ID COLONASSIGN exp { ELetRec(p(),EVar(p(),$2), TEmpty, $4) }

  | DEF ID fns END { ELetRec(p(),EVar(p(),$2), TEmpty, EPFun(p(),$3)) }

  | DEF prm exps END {
      let rec loop = function 
        | EVar(p,_) as id,b -> ELetRec(p,id, TEmpty, b)
        | ECall(p,(e:e), ls), b ->
          let le = List.map (fun (l:e) ->
            e2e l
          ) ls in
          loop(e, EFun(p,le, TEmpty, b))
        | _ -> assert false
      in
      loop($2,EBlock(p(),$3))
    }

  | DEF prm COLON typ exps END {
      let rec loop = function 
        | EVar(p,_) as id,t,b -> ELetRec(p,id, t, b)
        | ECall(p,(e:e), ls), (t:t), b ->
          let (lt:t) = List.fold_left begin fun (t:t) (l:e)  ->
            TFun(e2t l, t)
          end (t:t) ls in
          let le = List.map begin fun (l:e) ->
            e2e l
          end ls in
          loop(e, lt, EFun(p,le, TEmpty, b))
        | _ -> assert false
      in
      loop($2,$4,EBlock(e_pos(List.hd $5),$5))
    }
  /*
  | exp MEMBER exp { ECall(e_pos($3),$3, [$1]) }
  */
fn:
  | OR patterns OR exps { EFun(e_pos(List.hd $2), $2, TEmpty, EBlock(e_pos(List.hd $4), $4)) }

fns:
  | fn { [$1] }
  | fn fns { $1 :: $2 }

stmt:
  | exp { SExp($1) }
  | ID COLONASSIGN exp { SLet($1, TEmpty, $3) }
  /*| DEF ID COLONASSIGN exp { SLetRec($2, TEmpty, $4) }*/
  | OPEN { SOpen($1) }
  /*
  | TYPE ID defrecs END { STypeRec($2, $3)}
  | MODULE ID stmts END { SModule($2, $3) }
  | TYPE ID OR variants END { STypeVariant($2, $4)}
  */
stmts:
  | stmt { [$1] }
  | stmt stmts { $1 :: $2 }

prm:
  | ID LPAREN RPAREN %prec CALL { ECall(p(),EVar(p(), $1),[EUnit(p())])}
  | ID LPAREN prms RPAREN %prec CALL { ECall(p(), EVar(p(), $1),$3)}
  | prm LPAREN prms RPAREN %prec CALL { ECall(p(), $1,$3)}
  | prm LPAREN RPAREN %prec CALL { ECall(p(),$1,[EUnit(p())])}
prms:
  | ID { [EVar(p(),$1)] }
  | ID prms { EVar(p(),$1)::$2}
  | ID COLON typ { [ELet(p(),EVar(p(), $1),$3,EEmpty(p()))] }
  | ID COLON typ prms { ELet(p(),EVar(p(),$1),$3,EEmpty(p()))::$4}
patterns:
  | pattern { [$1] }
  | pattern patterns { $1::$2 }
pattern:
  | ID { EVar(p(), $1) }
  | INT { EInt(p(), $1) }
  | STRING { EStr(p(), $1) }
prog:
  | stmts { Prog $1 }
  | error
      { failwith
        (Printf.sprintf "parse error near characters %d-%d"
          (Parsing.symbol_start ())
          (Parsing.symbol_end ())) }
