open Cexp
open Ast

let rec exp = function
  | CInt s -> EInt(s)
  | CStr s -> EString(s)
  | CId id -> EVar(id)
  | CBin(CMsg(CId(f),"(",prm,")"),COp("="), e) ->
    ELetRec(f, TEmpty, EFun(addEmpty (exps prm),TEmpty,exp e))

  | CBin(CId(i),COp("="),b) -> ELet(i, TEmpty, exp b)
  | CBin(CPre(COp("def"),CId(i)),COp("="),b) -> ELetRec(i, TEmpty, exp b)
  | CBin(e,COp("match"),b) ->
    begin match exp b with
    | EPFun ls
    | EBlock ls -> EMatch(exp e, ls)
    | _ ->

      Cexp.print Format.std_formatter b;
      assert false
    end

  | CBin(a,COp(op),b) -> EBin(exp a, op, exp b)

  | CPst(CPrn("(",es,")"),COp("?")) -> EFun(exps es, TEmpty, EBlock[])
  | CPst(e,COp("?")) -> EFun([exp e], TEmpty, EBlock[])


  | CPre(COp(op),b) -> EPre(op, exp b)
  | CMsg(i,"(",CList(ls), ")") -> ECall(exp i, addEmpty(List.map exp ls))

  | CMsg(i,"[",ls, "]") -> ECall(exp i, [EList(exps ls)])
  | CMsg(i,"{",ls, "}") -> ECall(exp i, [exp (CPrn("{",ls,"}"))])

  | CSt(COp("if"),"(",CList[e],")",CBin(e2,COp("else"),e3)) -> EIf(exp e, exp e2, exp e3)
  | CSt(COp("if"),"(",e,")",e2) -> EIf(exp e, exp e2, EEmpty)
  | CPrn("(",cs,")") -> EBlock(exps cs)
  | CPrn("[",cs,"]") -> EList(exps cs)

  | CPrn("{",cs,"}") ->
    begin match cs with
      | CList((CPst(_,COp("?")))::xs) ->
        let ls = List.fold_left(fun ls e ->
          match (ls,e) with
          | ls,EFun _ -> e :: ls
          | EFun(p,t, EBlock(xs))::ls, e -> EFun(p,t, EBlock(xs@[e]))::ls
          | ls,e -> e::ls

        ) [] (exps cs) in

        EPFun(List.rev ls)
      | _ -> EBlock(exps cs)
    end
  | CList(ls) -> EList(List.map exp ls)
  | CUnit -> EEmpty
  | e ->
    Cexp.print Format.str_formatter e;
    EVar(Format.flush_str_formatter())

and addEmpty e =
  match e with
  | [] -> [EEmpty]
  | prm -> prm


and exps = function
  | CList ls -> List.map exp ls
  | _ -> assert false

(*
and typ = function
  | 
and types = function
  | [] -> []
  | c::cs -> typ c :: types cs
*)
and stmt = function
  | CPre(COp("open"),CId(id)) -> SOpen id
  | CBin(CId id,COp("type"),CPrn(_, CList(cs) ,_)) ->
    let cs = List.map(function
      | CId i -> (i, TEmpty)
      | (CMsg(CId(i),_,CList[c],_)) ->
        let rec f = function
        | CId a -> [Ty a]
        | CBin(a,COp(","),b) -> (f a) @ (f b) 
        | _ -> assert false
        in
        (i, TTuple (f c))
      | e ->
        Cexp.print Format.std_formatter e;
        ("error", TEmpty)
      
    ) cs in
    STypeVariant(id, cs)
  | CBin(a,COp("and"),b) -> SAnd(stmt a, stmt b)
  | ast -> SExp(exp ast)

and stmts = function
  | CList ls -> List.map stmt ls
  | _ -> assert false

and prog = function
  | ast -> Prog(stmts ast)

