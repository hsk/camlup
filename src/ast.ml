type p = int

type t =
  | Ty of string

  | TFun of t * t
  | TTuple of t list
  | TEmpty
  | TGen of t * t list
  | TUnit

type e =
  | EEmpty of p
  | EInt of p * int
  | EFloat of p * float
  | EStr of p * string
  | EChr of p * string
  | EVar of p * string
  | EBin of p * e * string * e
  | EPre of p * string * e
  | ECall of p * e * e list
  | EIf of p * e * e * e
  | EFun of p * e list * t * e
  | EPFun of p * e list
  | EMatch of p * e * e list
  | EPtn of p * e list list * t * e * e
  | EList of p * e list
  | ELet of p * e * t * e
  | ELetRec of p * e * t * e
  | EUnit of p
  | EBlock of p * e list
  | ERecord of p * (string * e) list
  | ETuple of p * e list
  | EIndex of p * e * e list
  | EArray of p * e list
  | EFor of p * string * e * e * int * e
  | EWhile of p * e * e
  | ETy of p * bool * string * t * e

let e_pos = function
  | EEmpty(p) -> p
  | EInt(p,_) -> p
  | EFloat(p,_) -> p
  | EStr(p,_) -> p
  | EChr(p,_) -> p
  | EVar(p,_) -> p
  | EBin(p,_,_,_) -> p
  | EPre(p,_,_) -> p
  | ECall(p,_,_) -> p
  | EIf(p,_,_,_) -> p
  | EFun(p,_,_,_) -> p
  | EPFun(p,_) -> p
  | EMatch(p,_,_) -> p
  | EPtn(p,_,_,_,_) -> p
  | EList(p,_) -> p
  | ELet(p,_,_,_) -> p
  | ELetRec(p,_,_,_) -> p
  | EUnit(p) -> p
  | EBlock(p,_) -> p
  | ERecord(p,_) -> p
  | ETuple(p,_) -> p
  | EIndex(p,_,_) -> p
  | EArray(p,_) -> p
  | EFor(p,_,_,_,_,_) -> p
  | EWhile(p,_,_) -> p
  | ETy(p,_,_,_,_) -> p


type s = 
  | SOpen of string
(*  | SLet of string * t * e
  | SLetRec of string * t * e*)
  | SAnd of s * s
  | SExp of e
  | SModule of string * s list
  | SModuleExp of string * e
  | SClass of string * (string * t) list * s list
  | STypeRec of string * (string * t) list
  | STypeVariant of string * (string * t) list

type prog =
  | Prog of s list


(*
type p = int
*)

open Format

let rec print_t fp = function
  | Ty(s) -> fprintf fp "Ty(\"%s\")@?" s
  | TFun(t1,t2) ->
    fprintf fp "TFun(%a,%a)@?"
      print_t t1
      print_t t2
  | TTuple(ts) ->
    fprintf fp "TTuple([%a])@?"
      (fun fp ts -> List.iter(print_t fp) ts) ts
  | TEmpty -> fprintf fp "TEmpty@?"
  | TGen(t,ts) ->
    fprintf fp "TGen(%a,[%a])@?"
      print_t t
      (fun fp ts -> List.iter(print_t fp) ts) ts
  | TUnit -> fprintf fp "TUnit@?"


let rec print_e fp = function
  | EEmpty(_) -> fprintf fp "EEmpty()@?"
  | EInt(_, i) -> fprintf fp "EInt(%d)@?" i
  | EFloat(_, f) -> fprintf fp "EFloat(%f)@?" f
  | EStr(_, s) -> fprintf fp "EStr(\"%s\")@?" s
  | EChr(_, s) -> fprintf fp "EChr(\"%s\")@?" s
  | EVar(_, s) -> fprintf fp "EVar(\"%s\")@?" s
  | EBin(_, e1, s, e2) ->
    fprintf fp "EBin(%a,\"%s\",%a)@?"
      print_e e1
      s
      print_e e2
  | EPre(_, s, e) ->
    fprintf fp "EPre(\"%s\",%a)@?"
      s
      print_e e
  | ECall(_, e, es) ->
    fprintf fp "ECall(%a,[%a])@?"
      print_e e
      (fun fp -> List.iter(print_e fp)) es
  | EIf(_, e1, e2, e3) ->
    fprintf fp "EIf(%a,%a,%a)@?"
      print_e e1
      print_e e2
      print_e e3
  | EFun(_, es, t, e) ->
    fprintf fp "EFun([%a],%a,%a)@?"
      (fun fp -> List.iter(print_e fp)) es
      print_t t
      print_e e
  | EPFun(_, es) ->
    fprintf fp "EPFun([%a])@?"
      (fun fp -> List.iter(print_e fp)) es
  | EMatch(_, e, es) ->
    fprintf fp "EMatch(%a,[%a])@?"
      print_e e
      (fun fp -> List.iter(print_e fp)) es
  | EPtn(_, ess, t, e1, e2) ->
    fprintf fp "EPtn([%a],%a,%a,%a)@?"
      (fun fp -> List.iter(
        fun es ->
          fprintf fp "[%a]@?"
            (fun fp -> List.iter(fun e-> fprintf fp "%a;@?" print_e e)) es
      )) ess
      print_t t
      print_e e1
      print_e e2
  | EList(_, es) ->
    fprintf fp "EList([%a])@?"
      (fun fp -> List.iter(print_e fp)) es
  | ELet(_, e1, t, e2) ->
    fprintf fp "ELet(%a,%a,%a)@?"
      print_e e1
      print_t t
      print_e e2
  | ELetRec(_, e1, t, e2) ->
    fprintf fp "ELetRec(%a,%a,%a)@?"
      print_e e1
      print_t t
      print_e e2
  | EUnit(_) ->
    fprintf fp "EUnit()@?"
  | EBlock(_, es) ->
    fprintf fp "EBlock([%a])@?"
      (fun fp -> List.iter(print_e fp)) es
  | ERecord(_, ses) ->
    fprintf fp "ERecord([%a])@?"
      (fun fp -> List.iter(fun (s,e) -> fprintf fp "\"%s\",%a;@?" s print_e e)) ses
  | ETuple(_, es) ->
    fprintf fp "ETuple([%a])@?"
      (fun fp -> List.iter(print_e fp)) es
  | EIndex(_, e, es) ->
    fprintf fp "EIndex(%a,%a)@?"
      print_e e
      (fun fp -> List.iter(print_e fp)) es
  | EArray(_, es) ->
    fprintf fp "EArray([%a])@?"
      (fun fp -> List.iter(print_e fp)) es
  | EFor(_, s, e1, e2, i, e3) ->
    fprintf fp "EFor(\"%s\",%a,%a,%d,%a)@?"
      s
      print_e e1
      print_e e2
      i
      print_e e3
  | EWhile(_, e1, e2) ->
    fprintf fp "EWhile(%a,%a)@?"
      print_e e1
      print_e e2
  | ETy(_, b, s, t, e) ->
    fprintf fp "ETy(%b,%s,%a,%a)@?"
      b
      s
      print_t t
      print_e e

let rec print_s fp = function
  | SOpen(s) ->
    fprintf fp "SOpen(\"%s\")@?"
      s
(*  | SLet(s,t,e) ->
    fprintf fp "SLet(\"%s\",%a,%a)@?"
      s
      print_t t
      print_e e
  | SLetRec(s,t,e) ->
    fprintf fp "SLetRec(\"%s\", %a, %a)@?"
      s
      print_t t
      print_e e*)
  | SAnd(s1,s2) ->
    fprintf fp "SAnd(%a,%a)@?"
      print_s s1
      print_s s2
  | SExp(e) ->
    fprintf fp "SExp(%a)@?"
      print_e e
  | SModule(s,ss) ->
    fprintf fp "SModule(\"%s\",[%a])@?"
      s
      (fun fp -> List.iter(print_s fp)) ss
  | SModuleExp(s,e) ->
    fprintf fp "SModuleExp(\"%s\",%a)@?"
      s
      print_e e
  | SClass(s,sts,ss) ->
    fprintf fp "SClass(\"%s\",[%a],[%a])@?"
      s
      (fun fp -> List.iter(fun (s,t) -> fprintf fp "\"%s\",%a;@?" s print_t t)) sts
      (fun fp -> List.iter(print_s fp)) ss
  | STypeRec(s,sts) ->
    fprintf fp "STypeRec(\"%s\",[%a])@?"
      s
      (fun fp -> List.iter(fun (s,t) -> fprintf fp "\"%s\",%a;@?" s print_t t)) sts
  | STypeVariant(s,sts) ->
    fprintf fp "STypeVariant(\"%s\",[%a])@?"
      s
      (fun fp -> List.iter(fun (s,t) -> fprintf fp "\"%s\",%a;@?" s print_t t)) sts

let print fp (Prog(ss)) =
  fprintf fp "Prog([%a])@?"
      (fun fp -> List.iter(print_s fp)) ss
