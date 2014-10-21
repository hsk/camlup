open Format

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

let rec print fp c =
  (match c with
  | CId(id) -> fprintf fp "CId(\"%s\")" id
  | COp(id) -> fprintf fp "COp(\"%s\")" id
  | CInt(i) -> fprintf fp "CInt(%d)" i
  | CStr(s) -> fprintf fp "CStr(%s)" s
  | CPrn(l,d,r) ->
    fprintf fp "CPrn(\"%s\"," l;
    print fp d;
    fprintf fp ",\"%s\")" r
  | CList(ls) ->
    fprintf fp "CList(";
    print_ls fp ls;
    fprintf fp ")"
  | CPre(op,e) ->
    fprintf fp "CPre(";
    print fp op;
    fprintf fp ",";
    print fp e;
    fprintf fp ")"
  | CPst(e,op) ->
    fprintf fp "CPst(";
    print fp e;
    fprintf fp ",";
    print fp op;
    fprintf fp ")"
  | CBin(e1,op,e) ->
    fprintf fp "CBin(";
    print fp e1;
    fprintf fp ",";
    print fp op;
    fprintf fp ",";
    print fp e;
    fprintf fp ")"
  | CMsg(op,l,e,r) ->
    fprintf fp "CMsg(";
    print fp op;
    fprintf fp ",";
    fprintf fp "%s," l;
    print fp e;
    fprintf fp ",%s" r;
    fprintf fp ")"
  | CSt(i,l,e,r,e2) ->
    fprintf fp "CSt(";
    print fp i;
    fprintf fp ",%s," l;
    print fp e;
    fprintf fp ",%s," r;
    print fp e2;
    fprintf fp ")"
  | CUnit ->
    fprintf fp "CUnit"
  ); fprintf fp "@?"

and print_ls fp ls = 
  
  let rec print_ls fp = function
    | [] -> ()
    | [x] -> print fp x
    | x::xs -> print fp x; fprintf fp ";"; print_ls fp xs
  in
  fprintf fp "[";
  print_ls fp ls;
  fprintf fp "]@?"
