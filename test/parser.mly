%{

open Format

type t =
  | DInt of int
  | DCase of t
  | DAdd of t * t
  | DMul of t * t
  | DList of t list
  | DPFun of (t * t) list

let rec print fp = function
  | DInt(i) -> fprintf fp "DInt(%d)@?" i 
  | DCase(t) -> fprintf fp "DCase(%a)@?" print t
  | DAdd(a,b) -> fprintf fp "DAdd(%a,%a)@?" print a print b
  | DMul(a,b) -> fprintf fp "DMul(%a,%a)@?" print a print b
  | DList(ls) -> fprintf fp "DList([%a])@?" (fun fp -> List.iter(fprintf fp "%a;" print)) ls
  | DPFun(ls) -> fprintf fp "DPFun([%a])@?"
    (fun fp ->
      List.iter(fun (l,r) -> fprintf fp "%a,%a;" print l print r)
    ) ls
%}

%token <int> INT
%token ADD MUL CASE MATCH
%token LPAREN RPAREN
%token EOF

%right LIST
%left ADD
%left MUL

%type <t> prog
%start prog

%%

prog:
  | exps { DList($1) }

exps:
  | exp { [$1] }
  | exp exps %prec LIST { $1 :: $2 }

lexps:
  | lexp { [$1] }
  | lexp lexps %prec LIST { $1 :: $2 }

lexp:
  | exp { $1 }
  | exp CASE { DCase $1 }

exp:
  | LPAREN RPAREN { DList([]) }
  | LPAREN exps RPAREN { DList($2) }
  | exp ADD exp { DAdd($1, $3) }
  | exp MUL exp { DMul($1, $3) }
  | INT { DInt($1) }
  | LPAREN lexps RPAREN {
    let ls = List.fold_left (fun ls d ->
      match(ls,d) with
      | ls,(DCase _ as d) ->
        (d,DList[])::ls 
      | (c,DList l1)::ls, d ->
        (c, DList (l1@[d]))::ls
      | _ -> assert false
    ) [] $2 in
    DPFun(List.rev ls)
  }
