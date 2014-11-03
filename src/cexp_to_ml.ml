open Cexp
open Ast

let p() = 0

let rec exp = function
  | CInt s ->
    EInt(p(),s)
  | CStr s ->
    EStr(p(),s)
  | CId id ->
    EVar(p(),id)

  | CBin(CMsg(CId(f),"(",prm,")"),COp("="), e) ->
    ELetRec(p(),EVar(p(),f), TEmpty, EFun(p(),addEmpty (exps prm),TEmpty,exp e))
  | CBin(CId(i),COp("="),b) ->
    ELet(p(),EVar(p(),i), TEmpty, exp b)
  | CBin(CId(i),COp("#="),b) ->
    ELet(p(),EVar(p(),i), TEmpty, EPre(p(),"ref", exp b))
  | CBin(CPre(COp("def"),CId(i)),COp("="),b) ->
    ELetRec(p(),EVar(p(),i), TEmpty, exp b)
  | CBin(e,COp("match"),b) ->
    begin match exp b with
    | EPFun(p,ls) ->
      EMatch(p,exp e, ls)
    | EBlock(p,ls) ->
      EMatch(p,exp e, ls)
    | _ ->
      Cexp.print Format.std_formatter b;
      assert false
    end

  | CBin(a,COp(","),b) ->
    begin match (exp b) with
      | ETuple(p,bs) -> ETuple(p,(exp a) :: bs)
      | b -> ETuple(p(),[exp a; b])
    end
  | CBin(a,COp(op),b) ->
    EBin(p(), exp a, op, exp b)

  | CPst(CPrn("(",es,")"),COp("?")) ->
    EFun(p(),exps es, TEmpty, EBlock(p(),[]))
  | CPst(e,COp("?")) ->
    EFun(p(),[exp e], TEmpty, EBlock(p(),[]))

  | CPre(COp("&"),b) ->
    EPre(p(),"ref", exp b)
  | CPre(COp("*"),b) ->
    EPre(p(),"!", exp b)
  | CPre(COp(op),b) ->
    EPre(p(),op, exp b)

  | CMsg(i,"(",CList(ls), ")") ->
    ECall(p(), exp i, addEmpty(List.map exp ls))
  | CMsg(i,"[",ls, "]") ->
    ECall(p(), exp i, [EList(p(), exps ls)])
  | CMsg(i,"{",ls, "}") ->
    ECall(p(), exp i, [exp (CPrn("{",ls,"}"))])

  | CSt(COp("if"),"(",CList[e],")",CBin(e2,COp("else"),e3)) ->
    EIf(p(), exp e, exp e2, exp e3)
  | CSt(COp("if"),"(",e,")",e2) ->
    EIf(p(), exp e, exp e2, EEmpty(p()))

  | CPrn("(",cs,")") ->
    EBlock(p(), exps cs)
  | CPrn("[",cs,"]") ->
    EList(p(), exps cs)
  | CPrn("{",cs,"}") ->
    begin match cs with
      | CList((_::COp("?")::_) as xs) ->
        let rec exps2 = function
          | [] -> []
          | x::(COp("?"))::xs -> exp(CPst(x,COp("?")))::(exps2 xs)
          | x::xs -> exp x :: exps2 xs
        in
        let ls = List.fold_left(fun ls e ->
          begin match (ls, e) with
            | ls,EFun _ ->
              e :: ls
            | EFun(p,p1,t, EBlock(bp,xs))::ls, e ->
              EFun(p,p1,t, EBlock(bp,xs@[e]))::ls
            | ls,e ->
              e::ls
          end
        ) [] (exps2 xs) in
        EPFun(p(), List.rev ls)
      | CList(cs) ->
        let cs = List.map(function
          | CBin(CId(x),COp("="), c) -> (x, exp c)
          | CId(x) -> (x, EEmpty(p()))
          | e ->
            Cexp.print Format.std_formatter e;
            assert false
        ) cs in
        ERecord(p(),cs)
      | _ ->
        EBlock(p(),exps cs)
    end

  | CList(ls) ->
    EList(p(), List.map exp ls)

  | CUnit ->
    EEmpty(p())

  | e ->
    Cexp.print Format.str_formatter e;
    EVar(p(),Format.flush_str_formatter())

and addEmpty e =
  match e with
  | [] -> [EEmpty(p())]
  | prm -> prm

and exps = function
  | CList ls -> List.map exp ls
  | _ -> assert false

and typ = function
  | CId(id) -> Ty id
  | _ -> assert false

and types = function
  | [] -> []
  | c::cs -> typ c :: types cs

and stmt = function
  | CPre(COp("open"),CId(id)) ->
    SOpen id
  | CBin(CId id,COp("type"),CPrn("(", CList(cs) ,")")) ->
    let cs = List.map(function
      | CId i ->
        (i, TEmpty)
      | (CMsg(CId(i),_,CList[c],_)) ->
        let rec f = function
          | CId a ->
            [Ty a]
          | CBin(a,COp(","),b) ->
            (f a) @ (f b) 
          | _ ->
            assert false
        in
        (i, TTuple (f c))
      | e ->
        Cexp.print Format.std_formatter e;
        ("error", TEmpty)
    ) cs in
    STypeVariant(id, cs)
  | CBin(CId id,COp("type"),CPrn("{", CList(cs) ,"}")) ->
    let cs = List.map(function
      | CBin(CId(i),COp(":"),c) ->
        (i, typ c)
      | e ->
        Cexp.print Format.std_formatter e;
        ("error", TEmpty)
    ) cs in
    STypeRec(id, cs)
  | CBin(a,COp("and"),b) ->
    SAnd(stmt a, stmt b)
  | ast ->
    SExp(exp ast)

and stmts = function
  | CList ls ->
    List.map stmt ls
  | _ ->
    assert false

and prog = function
  | ast ->
    Prog(stmts ast)


