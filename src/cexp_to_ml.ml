open Cexp
open Ast

let rec exp = function
	| CInt s -> EInt(s)
	| CStr s -> EString(s)
	| CId id -> EVar(id)
	| CBin(CMsg(CId(f),"(",prm,")"),COp(":="), e) -> ELetRec(f, TEmpty, EFun(exps prm,TEmpty,exp e))
	| CBin(CId(i),COp(":="),b) -> ELet(i, TEmpty, exp b)
	| CBin(CPre(COp("def"),CId(i)),COp(":="),b) -> ELetRec(i, TEmpty, exp b)
	| CBin(e,COp("match"),b) ->
		begin match exp b with
		| EPFun ls
		| EBlock ls -> EMatch(exp e, ls)
		| _ ->

			Cexp.print Format.std_formatter b;
			assert false
		end
	| CBin(a,COp("=>"),b) -> EFun([exp a], TEmpty, exp b)
	| CBin(a,COp(op),b) -> EBin(exp a, op, exp b)
	| CPre(COp(op),b) -> EPre(op, exp b)
	| CMsg(i,"(",CList(ls), ")") -> ECall(exp i, List.map exp ls)
	| CSt(COp("if"),"(",CList[e],")",CBin(e2,COp("else"),e3)) -> EIf(exp e, exp e2, exp e3)
	| CSt(COp("if"),"(",e,")",e2) -> EIf(exp e, exp e2, EEmpty)
	| CSt(COp("case"),"(",e,")",e2) -> EFun(exps e, TEmpty, exp e2)
	| COp(";") -> EVar("")
	| CPrn("{",ls,"}") ->
		begin match ls with
			| CList((CSt(COp("case"),_,_,_,_))::xs) ->
				let ls = List.fold_left(fun ls e ->
					match (ls,e) with
					| ls,EFun _ -> e :: ls
					| EFun(p,t, EBlock(xs))::ls, e -> EFun(p,t, EBlock(xs@[e]))::ls
					| EFun(p,t, e1)::ls, e -> EFun(p,t, EBlock([e1;e]))::ls
					| _ -> assert false
				) [] (exps ls) in

				EPFun(List.rev ls)
			| _ -> EBlock(exps ls)
		end
	| CList(ls) -> EList(List.map exp ls)
	| CUnit -> EEmpty
	| e ->
		Cexp.print Format.str_formatter e;
		EVar(Format.flush_str_formatter())

and exps = function
	| CList ls -> List.map exp ls
	| _ -> assert false

and stmt = function
	| CPre(COp("open"),CId(id)) -> SOpen id
	| ast -> SExp(exp ast)

and stmts = function
	| CList ls -> List.map stmt ls
	| _ -> assert false

and prog = function
	| ast -> Prog(stmts ast)


