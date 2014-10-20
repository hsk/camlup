open Compact
open Ast

let rec exp = function
	| CMsg(i,"(",CList(ls), ")") -> ECall(exp i, List.map exp ls)
	| CId id -> EVar(id)
	| CStr s -> EString(s)
	| CInt s -> EInt(s)
	| CBin(CId(i),COp(":="),b) -> ELet(i, TEmpty, exp b)
	| CBin(a,COp(op),b) -> EBin(exp a, op, exp b)
	| COp(";") -> EVar("")
	| CPrn("{",ls,"}") -> EBlock(exps ls) 
	| _ -> EVar("error")
and exps = function
	| CList ls -> List.map exp ls
	| _ -> assert false

and stmt = function
	| CPre(COp("open"),CId(id)) -> SOpen id
	| ast -> SExp(exp ast)

and stmts = function
	| CList ls -> List.map stmt ls
	| _ -> assert false

and f = function
	| ast -> Prog(stmts ast)


