open Dexp
open Cexp

module M = Map.Make (String)

let infixs =
  List.fold_left (fun m (k,prec,left) -> M.add k (prec,left) m) M.empty
    [
      "=>", 2, true;
      ",",  2, true;
      "=",  2, false;
      ":=", 2, false;
      "match", 3, true;
      ".",  3, true;
      "==", 4, true;
      "!=", 4, true;
      "<",  5, true;
      ">",  5, true;
      "<=", 6, true;
      ">=", 7, true;
      "+",  8, true;
      "-",  8, true;

      "/",  9, true;
      "*",  9, true;
      "::", 10, false;
      "@", 10, false;
      "and", 1, true;
      "else", 2, true;
      "type", 1, true
    ]

let prefixs =
  List.fold_left (fun m (k,prec,left) -> M.add k (prec,left) m ) M.empty
    [
      "def", 11, false;
      "open", 10, false;
      "new",  10, false;
      "!",    10, false;
      "-",    10, false;
      "|",    1, false;
    ]

let postfixs =
  List.fold_left (fun m (k,prec,left) -> M.add k (prec,left) m ) M.empty
    [
      "++", 11, true;
      "--", 11, true;
      "?", 0, false
    ]

let sts =
  List.fold_left (fun m (k,prec,left) -> M.add k (prec,left) m ) M.empty
    [
      "if", 11, true;
    ]

let _p = ref 0

let prec k m p =
  if M.mem k m then
    let (p1, left) = M.find k m in
    _p := p1;
    p1 > p || (not left && p1 == p)
  else
    false

let prec2 k =
  match k with
  | COp(k)
  | CId(k) when M.mem k postfixs || M.mem k infixs -> false
  | _ -> true

let rec exp p = function

  (* prefix *)
  | (CUnit, DId(op)::xs)
  | (CUnit, DOp(op)::xs) when prec op prefixs p ->
    let (y, ys) = exp !_p (CUnit, xs) in
    exp p (CPre(COp(op), y), ys)

  (* token *)
  | (CUnit, DId(x):: xs) -> exp p (CId(x), xs)
  | (CUnit, DOp(";"):: xs) -> exp p (CUnit, xs)
  | (CUnit, DOp(x):: xs) -> exp p (COp(x), xs)

  | (CUnit, DInt(x):: xs) -> exp p (CInt(x), xs)
  | (CUnit, DStr(x):: xs) -> exp p (CStr(x), xs)
  | (CUnit, DPrn(l,d,r):: xs) -> exp p (CPrn(l,parse d,r), xs)
  | (CUnit, DList(ls)::xs) ->
    let rec exps cs ls =
      match exp 0 (CUnit, ls) with
      | CUnit,[] -> (CList(List.rev cs), xs) 
      | x,[] -> (CList(List.rev (x::cs)), xs)
      | CUnit,ls -> exps (cs) ls
      | x,ls -> exps (x::cs) ls
    in 
    exps [] ls

  (* sts *)
  | (CId(op), DPrn(l, d, r)::xs) when prec op sts p ->
    let (y, xs) = exp 0 (CUnit, xs) in
    exp p (CSt(COp(op), l, parse d, r, y), xs)

  (* infixs *)
  | (x, DId(op)::xs)
  | (x, DOp(op)::xs) when prec op infixs p ->
    let (y, ys) = exp !_p (CUnit, xs) in
    exp p (CBin(x, COp(op), y), ys)

  (* postfix *)
  | (x, DId(op)::xs)
  | (x, DOp(op)::xs) when prec op postfixs p ->
    exp p (CPst(x, COp(op)), xs)

  (* msg *)
  | (x, DPrn(l, d, r)::xs) when prec2 x ->
    exp p (CMsg(x, l, parse d, r), xs)

  | (x,ys) -> (x,ys)

and parse(d) =
  let (c,_) = exp 0 (CUnit, [d]) in
  c
