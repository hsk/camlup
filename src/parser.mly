%{
open Ast

let lineno = ref 1

let p() = !lineno

let e2t = function
  | EVar(_,e) -> TEmpty
  | ELet(_,_,t,_) -> t
  | ELetRec(_,_,t,_) -> t
  | EUnit(_) -> TUnit
  | _ -> assert false

let e2id = function
  | EVar(_,i) -> i
  | ELet(_,i,_,_) -> i
  | ELetRec(_,i,_,_) -> i
  | _ -> assert false

let e2e = function
  | ELet(p,e,t,e2) -> ETy(p,false,e,t,e2)
  | ELetRec(p,e,t,e2) -> ETy(p,true,e,t,e2)
  | e -> e

let rec loop f = function 
  | EVar(p,id),t,b -> f(p,id, t, b)
  | ECall(p,(e:e), ls), (t:t), b ->
    let (lt:t) = List.fold_left (fun (t:t) (l:e)  ->
      TFun(e2t l, t)
    ) (t:t) ls in
    let le = List.map (fun (l:e) ->
      e2e l
    ) ls in
    loop f (e, lt, EFun(p,le, TEmpty, b))
  | _ -> assert false

let rec loop1 f = function 
  | EVar(p,id),b -> f(p,id, TEmpty, b)
  | ECall(p,(e:e), ls), b ->
    let le = List.map (fun (l:e) ->
      e2e l
    ) ls in
    loop1 f (e, EFun(p,le, TEmpty, b))
  | _ -> assert false

%}

%token <int> INT
%token <float> FLOAT
%token <string> VAR


%token <int> SEMI
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
%token REF

%token HAT
%token LOR
%token LAMP
%token OR
%token XOR
%token AMP
%token EQ NE ENE EEQ
%token LT GT LE GE
%token SHL SHR
%token ADD SUB FADD FSUB
%token MUL DIV MOD FMUL FDIV FPOW
%token INC DEC NOT
%token WHEN
%token FOR WHILE TO UNTIL DOWNTO
%token AS

%right LIST
%nonassoc ELSE
%right ASSIGN COLONASSIGN REFASSIGN ARROWASSIGN
%left AS
%left COMMA
%right CAST
%right ADDLIST

%left XOR
%left LOR
%left LAMP
%left OR
%left HAT
%left AMP
%left EQ NE EEQ ENE
%left LT GT LE GE
%left SHL SHR
%left ADD SUB FADD FSUB
%left MUL DIV MOD FMUL FDIV FPOW

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
  | VAR { ($1, EEmpty(p()))}

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
  | INT { EInt(p(),$1) }
  | FLOAT { EFloat(p(),$1) }
  | VAR { EVar(p(),$1) }
  | STR { EStr(p(),$1) }

  | LPAREN RPAREN { EUnit(p()) }
  | LPAREN exp RPAREN { $2 }

  | LBRACE fns RBRACE { EPFun(p(),$2) }
  | LBRACE exps RBRACE { EBlock(p(),$2) }
  | LBRACE COLON records RBRACE { ERecord(p(),$3) }

  | LBRACK RBRACK { EList(p(),[]) }
  | LBRACK exps RBRACK { EList(p(), $2) }
  | LBRACK OR RBRACK { EArray(p(),[]) }
  | LBRACK OR exps RBRACK { EArray(p(),$3) }

  | SEMI exp { $2 }
  | SUB exp {
      match $2 with
      | EFloat(p,f) -> EFloat(p,-. f)
      | e -> EPre(e_pos(e), "-", $2)
    }
  | DEC exp { ECall(p(), EVar(p(),"decr"), [$2]) }
  | INC exp { ECall(p(), EVar(p(),"incr"), [$2]) }

  | AMP exp { EPre(p(), "ref", $2) }
  | MUL exp { EPre(p(), "!", $2) }
  | NOT exp { EPre(p(), "not", $2) }
  | NEW exp { EPre(p(), "new", $2) }
  | exp XOR exp { EBin(p(), $1, "^", $3) }

  | exp LOR exp { EBin(p(), $1, "||", $3) }
  | exp LAMP exp { EBin(p(), $1, "&&", $3) }

  | exp OR exp { EBin(p(), $1, "lor", $3) }

  | exp HAT exp { EBin(p(), $1, "lxor", $3) }

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

  | exp FADD exp { EBin(p(), $1, "+.", $3) }
  | exp FSUB exp { EBin(p(), $1, "-.", $3) }

  | exp FMUL exp { EBin(p(), $1, "*.", $3) }
  | exp FDIV exp { EBin(p(), $1, "/.", $3) }
  | exp FPOW exp { EBin(p(), $1, "**", $3) }

  | exp SHL exp { EBin(p(), $1, "asl", $3) }
  | exp SHR exp { EBin(p(), $1, "asr", $3) }
  | exp AS exp { EBin(p(), $1, "as", $3) }

  | exp DOT exp { EBin(p(), $1, ".", $3) }
  | exp COMMA exp { EBin(p(), $1, ",", $3) }
  | exp ADDLIST exp { EBin(p(), $1, "::", $3) }
  | exp MEMBER exp { EBin(p(), $1, "#", $3) }
  | exp ARROWASSIGN exp { EBin(p(), $1, "<-", $3) }
  | exp FARROW exp { ECall(p(), $3, [$1]) }

  | exp COLONASSIGN exp
    {
      match $1 with
        | EPre(p, "!", a) -> EBin(p, a, ":=", $3)
        | _ -> EBin(e_pos($1), $1, ":=", $3)
    }

  | exp MATCH LBRACE fns RBRACE { EMatch(e_pos($1), $1, $4) }
  | IF LPAREN exp RPAREN exp1 ELSE exp1 { EIf(p(),$3, $5, $7) }
  | IF LPAREN exp RPAREN exp1 %prec LIST { EIf(p(),$3, $5, EEmpty(p())) }

  | FOR LPAREN VAR ARROWASSIGN exp TO exp RPAREN exp
    {
      EFor(p(),$3, $5, $7, 1, $9)
    }
  | FOR LPAREN VAR ARROWASSIGN exp DOWNTO exp RPAREN exp
    {
      EFor(p(),$3, $5, $7, -1, $9)
    }
  | FOR LPAREN VAR ARROWASSIGN exp UNTIL exp RPAREN exp
    {
      EFor(p(),$3, $5, EBin(e_pos($7), $7, "-", EInt(e_pos($7), 1)), 1, $9)
    }
  | WHILE LPAREN exp RPAREN exp { EWhile(p(), $3, $5) }

  | exp LBRACE fns RBRACE %prec CALL { ECall(p(),$1, [EPFun(p(),$3)]) }
  | exp LBRACE exps RBRACE %prec CALL { ECall(p(),$1, [EBlock(p(),$3)]) }

  | exp LBRACK RBRACK %prec CALL { EIndex(p(),$1, []) }
  | exp LBRACK exps RBRACK %prec CALL { EIndex(p(),$1, $3) }

  | exp LPAREN exps RPAREN %prec CALL { ECall(p(),$1, $3) }
  | exp LPAREN RPAREN %prec CALL { ECall(p(),$1, [EUnit(e_pos($1))]) }

  |     VAR ASSIGN exp { ELet(p(),$1, TEmpty, $3) }
  | DEF VAR ASSIGN exp { ELetRec(p(),$2, TEmpty, $4) }

  |     exp ASSIGN exp { loop1 (fun(p,a,b,c)->ELet(p,a,b,c)) ($1, $3) }
  | DEF exp ASSIGN exp { loop1 (fun(p,a,b,c)->ELetRec(p,a,b,c)) ($2, $4) }
  |     exp REFASSIGN exp { loop1 (fun(p,a,b,c)->ELet(p,a,b,c)) ($1,EPre(p(),"ref", $3)) }

  |     exp COLON typ ASSIGN exp { loop(fun(p,a,b,c)->ELet(p,a,b,c)) ($1,$3,$5) }
  | DEF exp COLON typ ASSIGN exp { loop(fun(p,a,b,c)->ELetRec(p,a,b,c)) ($2,$4,$6) }
  |     exp COLON typ
    {
      match $1 with
      | ELetRec(p,id,_,e) -> ELetRec(p, id, $3, e)
      | _ -> ELet(e_pos($1), e2id $1, $3, EEmpty(e_pos($1)))
    }
  | XOR exp
    {
      match $2 with
      | ELetRec(p,id,t,e) -> ELetRec(p,id, t, e)
      | ELet(p,id,t,e) -> ELetRec(p,id, t, e)
      | _ -> ELetRec(e_pos($2),e2id $2, TEmpty, EEmpty(e_pos($2)))
    }
  | REF exp
    {
      match $2 with
      | ELetRec(p,id,t,e) -> ELetRec(p,id, t, e)
      | ELet(p,id,t,e) -> ELetRec(p,id, t, e)
      | _ -> ELetRec(e_pos($2), e2id $2, TEmpty, EEmpty(e_pos($2)))
    }



fn:
  | OR exps ARROW exps { EFun(e_pos(List.hd $2), $2, TEmpty, EBlock(e_pos(List.hd $4),$4)) }
  | OR exps WHEN exp ARROW exps { EPtn(e_pos(List.hd $2), $2, TEmpty, $4, EBlock(e_pos(List.hd $6), $6)) }

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
  | error { failwith (Printf.sprintf "parse error line %d" !lineno) }
