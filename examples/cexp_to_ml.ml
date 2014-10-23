open Cexp;;
open Ast;;
let rec exp = begin fun t1'  -> match t1' with
  | (CInt (s)) -> (

    EInt (s);
  )
  | (CStr (s)) -> (

    EString (s);
  )
  | (CId (id)) -> (

    EVar (id);
  )
  | (CBin (((CMsg ((((CId (f) , "(") , prm) , ")")) , COp ("=")) , e))) -> (

    ELetRec (((f , TEmpty) , EFun (((addEmpty (exps (prm)) , TEmpty) , exp (e)))));
  )
  | (CBin (((CId (i) , COp ("=")) , b))) -> (

    ELet (((i , TEmpty) , exp (b)));
  )
  | (CBin (((CPre ((COp ("def") , CId (i))) , COp ("=")) , b))) -> (

    ELetRec (((i , TEmpty) , exp (b)));
  )
  | (CBin (((e , COp ("match")) , b))) -> (

    (match exp (b) with | (EPFun (ls)) -> (
      EMatch ((exp (e) , ls));
      EBlock;
    
)| (ls) -> (
      EMatch ((exp (e) , ls));
    
)| (_) -> (
      (Cexp . print  ((Format . std_formatter)) (b));
      assert (false);
    
));
  )
  | (CBin (((a , COp (op)) , b))) -> (

    EBin (((exp (a) , op) , exp (b)));
  )
  | (CPst ((CPrn ((("(" , es) , ")")) , COp ("?")))) -> (

    EFun (((exps (es) , TEmpty) , EBlock ([])));
  )
  | (CPst ((e , COp ("?")))) -> (

    EFun ((([exp (e)] , TEmpty) , EBlock ([])));
  )
  | (CPre ((COp (op) , b))) -> (

    EPre ((op , exp (b)));
  )
  | (CMsg ((((i , "(") , CList (ls)) , ")"))) -> (

    ECall ((exp (i) , addEmpty ((List . map  (exp) (ls)))));
  )
  | (CMsg ((((i , "[") , ls) , "]"))) -> (

    ECall ((exp (i) , [EList (exps (ls))]));
  )
  | (CMsg ((((i , "{") , ls) , "}"))) -> (

    ECall ((exp (i) , [exp (CPrn ((("{" , ls) , "}")))]));
  )
  | (CSt (((((COp ("if") , "(") , CList ([e])) , ")") , CBin (((e2 , COp ("else")) , e3))))) -> (

    EIf (((exp (e) , exp (e2)) , exp (e3)));
  )
  | (CSt (((((COp ("if") , "(") , e) , ")") , e2))) -> (

    EIf (((exp (e) , exp (e2)) , EEmpty));
  )
  | (CPrn ((("(" , cs) , ")"))) -> (

    EBlock (exps (cs));
  )
  | (CPrn ((("[" , cs) , "]"))) -> (

    EList (exps (cs));
  )
  | (CPrn ((("{" , cs) , "}"))) -> (

    (match cs with | (CList ((CPst ((_ , COp ("?"))) :: xs))) -> (
      let ls = (List . fold_left (begin fun t1' t2'  -> match t1',t2' with
  | (ls),(e) -> (

    (ls , (match e with | ((ls , EFun (_))) -> (
      (e :: ls);
    
)| (((EFun (((p , t) , EBlock (xs))) :: ls) , e)) -> (
      (EFun (((p , t) , EBlock ((xs @ [e])))) :: ls);
    
)| ((ls , e)) -> (
      (e :: ls);
    
)));
  )
 end ) ([]) (exps (cs))) in
      EPFun ((List . rev (ls)));
    
)| (_) -> (
      EBlock (exps (cs));
    
));
  )
  | (CList (ls)) -> (

    EList ((List . map  (exp) (ls)));
  )
  | (CUnit) -> (

    EEmpty;
  )
  | (e) -> (

    (Cexp . print  ((Format . str_formatter)) (e));
    EVar ((Format . flush_str_formatter ()));
  )
 end 

and addEmpty = (fun (e) -> (match e with | ([]) -> (
      [EEmpty];
    
)| (prm) -> (
      prm;
    
))  )

and exps = begin fun t1'  -> match t1' with
    | (CList (ls)) -> (

      (List . map  (exp) (ls));
    )
    | (_) -> (

      assert (false);
    )
   end 

and stmt = begin fun t1'  -> match t1' with
    | (CPre ((COp ("open") , CId (id)))) -> (

      SOpen (id);
    )
    | (CBin (((CId (id) , COp ("type")) , CPrn (((_ , CList (cs)) , _))))) -> (

      let cs = (List . map (begin fun t1'  -> match t1' with
  | (CId (i)) -> (

    (i , TEmpty);
  )
  | (CMsg ((((CId (i) , _) , CList ([c])) , _))) -> (

    let rec f = begin fun t1'  -> match t1' with
      | (CId (a)) -> (

        [Ty (a)];
      )
      | (CBin (((a , COp (",")) , b))) -> (

        (f (a) @ f (b));
      )
      | (_) -> (

        assert (false);
      )
     end  in
    (i , TTuple (f (c)));
  )
  | (e) -> (

    (Cexp . print  ((Format . std_formatter)) (e));
    ("error" , TEmpty);
  )
 end ) (cs)) in
      STypeVariant ((id , cs));
    )
    | (ast) -> (

      SExp (exp (ast));
    )
   end 

and stmts = begin fun t1'  -> match t1' with
    | (CList (ls)) -> (

      (List . map  (stmt) (ls));
    )
    | (_) -> (

      assert (false);
    )
   end 

and prog = begin fun t1'  -> match t1' with
    | (ast) -> (

      Prog (stmts (ast));
    )
   end 
