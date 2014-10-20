open Printf

type c =
    (* 識別子 *)
    | CId of string
    | COp of string
    (* シンボル *)
    | CInt of int
    (* 文字列 *)
    | CStr of string
    | CPre of c * c
    | CPst of c * c
    | CPrn of string * c * string
    | CBin of c * c * c
    | CMsg of c * string * c * string
    | CSt of c * string * c * string * c
    | CUnit
    | CList of c list

let rec print = function
  | CId(id) -> printf "CId(\"%s\")" id
  | COp(id) -> printf "COp(\"%s\")" id
  | CInt(i) -> printf "CInt(%d)" i
  | CStr(s) -> printf "CStr(%s)" s
  | CPrn(l,d,r) ->
    printf "CPrn(\"%s\"," l;
    print d;
    printf ",\"%s\")" r
  | CList(ls) ->
    printf "CList(";
    print_ls ls;
    printf ")"
  | CPre(op,e) ->
    printf "CPre(";
    print op;
    printf ",";
    print e;
    printf ")"
  | CPst(e,op) ->
    printf "CPst(";
    print e;
    printf ",";
    print op;
    printf ")"
  | CBin(e1,op,e) ->
    printf "CBin(";
    print e1;
    printf ",";
    print op;
    printf ",";
    print e;
    printf ")"
  | CMsg(op,l,e,r) ->
    printf "CMsg(";
    print op;
    printf ",";
    printf "%s," l;
    print e;
    printf ",%s" r;
    printf ")"
  | CSt(i,l,e,r,e2) ->
    printf "CSt(";
    print i;
    printf ",%s," l;
    print e;
    printf ",%s," r;
    print e2;
    printf ")"
  | CUnit ->
    printf "CUnit"

and print_ls ls = 
  
  let rec print_ls = function
    | [] -> ()
    | [x] -> print x
    | x::xs -> print x; printf ";"; print_ls xs
  in
  printf "[";
  print_ls ls;
  printf "]"
