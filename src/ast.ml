type t =
  | Ty of string

  | TFun of t * t
  | TTuple of t list
  | TEmpty
  | TGen of t * t list
  | TUnit

type e =
  | EEmpty
  | EInt of int
  | EStr of string
  | EVar of string
  | EBin of e * string * e
  | EPre of string * e
  | ECall of e * e list
  | EIf of e * e * e
  | EFun of e list * t * e
  | EPFun of e list
  | EMatch of e * e list
  | EPtn of e list * t * e * e
  | EList of e list
  | ELet of string * t * e
  | ELetRec of string * t * e
  | EUnit 
  | EBlock of e list
  | ERecord of (string * e) list
  | ETuple of e list
  | EIndex of e * e list
  | EArray of e list
  | EFor of string * e * e * int * e
  | EWhile of e * e
type s = 
  | SOpen of string
  | SLet of string * t * e
  | SLetRec of string * t * e
  | SAnd of s * s
  | SExp of e
  | SModule of string * s list
  | SClass of string * (string * t) list * s list
  | STypeRec of string * (string * t) list
  | STypeVariant of string * (string * t) list

type prog =
  | Prog of s list
