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
  | EVar of p * string
  | EBin of p * e * string * e
  | EPre of p * string * e
  | ECall of p * e * e list
  | EIf of p * e * e * e
  | EFun of p * e list * t * e
  | EPFun of p * e list
  | EMatch of p * e * e list
  | EPtn of p * e list * t * e * e
  | EList of p * e list
  | ELet of p * string * t * e
  | ELetRec of p * string * t * e
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
  | SLet of string * t * e
  | SLetRec of string * t * e
  | SAnd of s * s
  | SExp of e
  | SModule of string * s list
  | SModuleExp of string * e
  | SClass of string * (string * t) list * s list
  | STypeRec of string * (string * t) list
  | STypeVariant of string * (string * t) list

type prog =
  | Prog of s list
