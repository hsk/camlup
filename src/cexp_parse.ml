open Dexp
open Cexp

module M = Map.Make (String)

let infixs =
  List.fold_left (fun m (k,prec,left) -> M.add k (prec,left) m) M.empty
    [
      ".",  1, true;
      "=>", 1, true;
      ",",  1, true;
      "match", 1, true;
      "=",  1, false;
      ":=",  1, false;
      "==", 2, true;
      "!=", 2, true;
      "<",  3, true;
      ">",  3, true;
      "<=", 4, true;
      ">=", 5, true;
      "+",  6, true;
      "-",  6, true;

      "/",  7, true;
      "*",  7, true;
      "else", 1, true
    ]

let prefixs =
  List.fold_left (fun m (k,prec,left) -> M.add k (prec,left) m ) M.empty
    [
      "def", 9, false;
      "open", 8, false;
      ("new"), 8, false;
      ("!"),   8, false;
      ("-"),   8, false
    ]

let postfixs =
  List.fold_left (fun m (k,prec,left) -> M.add k (prec,left) m ) M.empty
    [
      ("++"), 9, true;
      ("--"), 9, true
    ]

let sts =
  List.fold_left (fun m (k,prec,left) -> M.add k (prec,left) m ) M.empty
    [
      ("if"), 9, true;
      ("case"), 9, true;
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
  | (CUnit, DOp(x):: xs) -> exp p (COp(x), xs)
  | (CUnit, DInt(x):: xs) -> exp p (CInt(x), xs)
  | (CUnit, DStr(x):: xs) -> exp p (CStr(x), xs)
  | (CUnit, DPrn(l,d,r):: xs) -> exp p (CPrn(l,parse d,r), xs)
  | (CUnit, DList(ls)::xs) ->
    let rec exps cs ls =
      match exp 0 (CUnit, ls) with
      | x,[] -> (CList(List.rev (x::cs)), xs)
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
