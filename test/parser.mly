%{

open Format

type d =
  | DInt of int
  | DStr of string
  | DVar of string
  | DCase of d
  | DAdd of d * d
  | DSub of d * d
  | DMul of d * d
  | DOr of d * d
  | Ds of d list
  | DPFun of (d * d) list
  | DCall of d * d
let rec print fp = function
  | DInt(i) -> fprintf fp "DInt(%d)@?" i 
  | DStr(i) -> fprintf fp "DStr(%s)@?" i 
  | DVar(i) -> fprintf fp "DVar(%s)@?" i 
  | DCase(a) -> fprintf fp "DCase(%a)@?" print a
  | DAdd(a,b) -> fprintf fp "DAdd(%a,%a)@?" print a print b
  | DSub(a,b) -> fprintf fp "DSub(%a,%a)@?" print a print b
  | DMul(a,b) -> fprintf fp "DMul(%a,%a)@?" print a print b
  | DOr(a,b) -> fprintf fp "DOr(%a,%a)@?" print a print b
  | Ds(ls) -> fprintf fp "Ds([%a])@?" (fun fp -> List.iter(fprintf fp "%a;" print)) ls
  | DPFun(ls) -> fprintf fp "DPFun([%a])@?"
    (fun fp ->
      List.iter(fun (l,r) -> fprintf fp "%a,%a;" print l print r)
    ) ls
  | DCall(l,r) -> fprintf fp "DCall(%a, %a)@?" print l print r
%}

%token <int> INT
%token <string> STR
%token <string> VAR
%token ADD SUB MUL OR CASE SEMI
%token LPAREN RPAREN
%token EOF

%right LIST
%left OR
%left ADD SUB
%left MUL
%left CALL

%type <d> prog
%start prog

%%

prog:
  | exps { Ds($1) }

exp1:
  | exp { $1 }
  | exp SEMI { $1 }

exp0:
  | SEMI exp0 { $2 }
  | exp { $1 }
  | exp SEMI { $1 }

exps:
  | exp1 { [$1] }
  | exp1 exps %prec LIST { $1 :: $2 }

lexps:
  | lexp { [$1] }
  | lexp lexps %prec LIST { $1 :: $2 }

lexp:
  | exp1 { $1 }
  | exp1 CASE { DCase $1 }

exp:
  | INT { DInt($1) }
  | STR { DStr($1) }
  | VAR { DVar($1) }
  | LPAREN RPAREN { Ds([]) }
  | LPAREN exps RPAREN { Ds($2) }
  | exp ADD exp { DAdd($1, $3) }
  | exp SUB exp { DSub($1, $3) }
  | exp MUL exp { DMul($1, $3) }
  | exp OR exp { DOr($1, $3) }
  | exp LPAREN RPAREN %prec CALL { DCall($1, Ds[])}
  | exp LPAREN exps RPAREN %prec CALL { DCall($1, Ds $3) }
  | LPAREN CASE RPAREN {
    DPFun([])
  }
  /*
     ( a? b c d ? e f )
  */
  | LPAREN exp0 CASE lexps RPAREN {
    (* (a) ? (b c d ? e f) *)
    let ls = List.fold_left (fun ls d ->
      match(ls,d) with
      | ls,(DCase _ as d) -> (d,[])::ls 
      | (c,l1)::ls, d -> (c, (d :: l1))::ls
      | _ -> assert false
    ) [] ((DCase $2)::$4) in (* a ? b c d ? e f *)

    (* (d ?, f e) (a ?, c b) *)
    (* reverse list *)
    let ls = List.fold_left (fun ls (d,l) ->
      (d,Ds(List.rev l))::ls
    ) [] ls in

    (* (a ?, b c) (d ? e f)  *)

    DPFun(ls)
  }
