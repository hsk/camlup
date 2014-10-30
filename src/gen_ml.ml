open Format
open Ast

let rec print_ls sp sep p ppf = function
  | [] -> ()
  | [x] -> p sp ppf x
  | x::xs ->
    fprintf ppf "%a%s%a" (p sp) x sep (print_ls sp sep p) xs

let rec print_t pp sp ppf = function
  | TEmpty -> ()
  | Ty(s) ->
    fprintf ppf "%s%s"
      sp
      s
    
  | TTuple(ls) ->
    fprintf ppf "%s(%a)" 
      sp
      (print_ls sp " * " (print_t "")) ls
    
  | TFun(t1,t2) ->
    fprintf ppf "(%a)->(%a)" 
      (print_t "" sp) t1
      (print_t "" sp) t2
  | TUnit ->
    fprintf ppf "unit"
  | TGen(t,ts) ->
    fprintf ppf "%s(%a) %a"
      sp
      (print_ls sp " * " (print_t "")) ts
      (print_t "" "") t

let rec print_e sp ppf e = 
    fprintf ppf "\n# 111 \"lexer.nml\"\n";

  match e with
  | EEmpty ->

    ()
  | EUnit ->

    fprintf ppf "()"
  | EInt i ->
    fprintf ppf "%d"
      i
  | EFloat i ->
    fprintf ppf "%f"
      i
  | EStr i ->
    fprintf ppf "%s"
      i
  | EVar i ->
    fprintf ppf "%s"
      i
  | ETy(named,i,t,e) ->
    (match e with
    | EEmpty ->
      if named then fprintf ppf "~";
      fprintf ppf "(%s%s%a)"
        i
        (if t=TEmpty then "" else ":")
        (print_t "" "") t
    | _ ->
      if named then fprintf ppf "?";
      fprintf ppf "(%s%s%a=(%a))"
        i
        (if t=TEmpty then "" else ":")
        (print_t "" "") t
        (print_e "") e
    )


  | EBin(e1,",",e2) ->
    fprintf ppf "%a %s %a"
      (print_e sp) e1
      ","
      (print_e sp) e2
  | ETuple(ls) ->
    fprintf ppf "(%a)"
      (print_ls "" ", " print_e) ls
  | EBin(e1,op,e2) ->
    fprintf ppf "(%a %s %a)"
      (print_e sp) e1
      op
      (print_e sp) e2
  | EPre(op,e1) ->
    fprintf ppf "(%s %a)" 
      op
      (print_e "") e1
  | ECall(e1,es) ->
    let rec print_ls sp sep p ppf = function
      | [] -> ()
      | [x] -> fprintf ppf "%a" (p sp) x
      | x::xs ->
        fprintf ppf " %a%s%a"
          (p sp) x
          sep
          (print_ls sp sep p) xs
    in
    let print_e2 sp ppf = function
      | ELet (id, _, e) ->
        fprintf ppf "~%s:(%a)"
          id
          (print_e "") e
      | e ->
        fprintf ppf "(%a)" (print_e sp) e
    in
    fprintf ppf "%a %a"
      (print_e sp) e1
      (print_ls sp " " (print_e2)) es
  | EIndex(e1,es) ->
    let rec print_ls sp sep p ppf = function
      | [] -> ()
      | [x] -> fprintf ppf ".(%a)" (p sp) x
      | x::xs ->
        fprintf ppf " .(%a)%s%a"
          (p sp) x
          sep
          (print_ls sp sep p) xs
    in
    fprintf ppf "%a %a"
      (print_e sp) e1
      (print_ls sp " " (print_e)) es

  | EIf(e1, e2, EEmpty) ->
    fprintf ppf "(if %a then (%a)%s)"
      (print_e "") e1
      (print_e_block sp "\n") e2
      sp
  | EIf(e1, e2, e3) ->
    fprintf ppf "(if %a then (%a%s)else(%a))"
      (print_e "" ) e1
      (print_e_block sp "\n") e2 
      sp
      (print_e_block sp "") e3 
  | EFun (its, t, e) ->
    let rec print_ls sep p ppf = function
      | [] -> ()
      | [x] -> fprintf ppf "%a" (p sp) x
      | x::xs ->
        fprintf ppf "%a%s%a"
          (p sp) x
          sep
          (print_ls sep p) xs
    in
    fprintf ppf "(fun %a%a -> %a%s)"
      (print_ls " " print_e) its
      (print_t (if t=TEmpty then "" else ":") "") t
      (print_e_block sp "\n") e
      sp
  | EPtn _ -> assert false
  | EPFun (ls) ->
    fprintf ppf "begin fun ";

    begin match List.hd ls with
      | EFun(its, t, e)
      | EPtn(its, t, _, e) ->
        let _ = List.fold_left(fun n b ->
            fprintf ppf "t%d' " n;
            n + 1
          ) 1 its
        in
        fprintf ppf " -> match ";
        let rec f n ppf = function
          | [] -> ()
          | [a] -> fprintf ppf "t%d'" n
          | a::b -> fprintf ppf "t%d',%a" n (f (n+1)) b
        in f 1 ppf its
      | _ -> assert false
    end;
    fprintf ppf " with\n";
    List.iter begin function
      | EFun(its, t, e) ->
        let rec print_ls sp sep p ppf = function
          | [] -> ()
          | [x] -> fprintf ppf "(%a)" (p sp) x
          | x::xs ->
            fprintf ppf "(%a)%s%a"
              (p sp) x
              sep
              (print_ls sp sep p) xs
        in
        let sp = sp ^ "  " in
        fprintf ppf "%s| %a%a -> (\n%a%s)\n"
          sp
          (print_ls "" "," print_e) its
          (print_t (if t=TEmpty then "" else ":") "") t
          (print_e_block sp "\n") e
          sp
      | EPtn(its, t, w, e) ->
        let rec print_ls sp sep p ppf = function
          | [] -> ()
          | [x] -> fprintf ppf "(%a)" (p sp) x
          | x::xs ->
            fprintf ppf "(%a)%s%a"
              (p sp) x
              sep
              (print_ls sp sep p) xs
        in
        let sp = sp ^ "  " in
        fprintf ppf "%s| %a%a when %a -> (\n%a%s)\n"
          sp
          (print_ls "" "," print_e) its
          (print_t (if t=TEmpty then "" else ":") "") t
          (print_e_block sp "\n") w
          (print_e_block sp "\n") e
          sp

      | _ -> assert false
    end ls;
    fprintf ppf "%s end " sp
  | EMatch (e,ls) ->
    fprintf ppf "(match %a with "
      (print_e "") e
      ;
    List.iter begin function
      | EFun(its, t, e) ->
        let rec print_ls sep p ppf = function
          | [] -> ()
          | [x] -> fprintf ppf "(%a)" p x
          | x::xs ->
            fprintf ppf "(%a)%s%a"
              p x
              sep
              (print_ls sep p) xs
        in
        fprintf ppf "| %a%a -> (%a%s\n)"
          (print_ls " " (print_e " ")) its
          (print_t (if t=TEmpty then "" else ":") "") t
          (print_e_block sp "\n") e
          sp
      | EPtn(its, t, w, e) ->
        let rec print_ls sep p ppf = function
          | [] -> ()
          | [x] -> fprintf ppf "(%a)" p x
          | x::xs ->
            fprintf ppf "(%a)%s%a"
              p x
              sep
              (print_ls sep p) xs
        in
        fprintf ppf "| %a%a when %a -> (%a%s\n)"
          (print_ls " " (print_e " ")) its
          (print_t (if t=TEmpty then "" else ":") "") t
          (print_e_block sp "\n") w
          (print_e_block sp "\n") e
          sp
      | e ->
        fprintf std_formatter "%a\n" (print_e " ") e;
        assert false
    end ls;
    fprintf ppf ")"
  | ERecord(ls) ->
    fprintf ppf "{%a}"
      (print_ls sp ";"
        (fun sp ppf -> function
          | (s,EEmpty) -> fprintf ppf "%s" s
          | (s,e) -> fprintf ppf "%s=%a" s (print_e "") e
        )
      )
      ls
  | EBlock ls ->
    let rec loop e = match e with
      | [] -> ()
      | [ELetRec _ as e] | [ELet _ as e] ->
        fprintf ppf "%s%a in ()@." sp (print_e sp) e
      | (ELetRec _ as e)::xs | (ELet _ as e)::xs ->
        fprintf ppf "%s%a in@." sp (print_e sp) e;
        loop xs
      | [e] ->
        fprintf ppf "%s%a@." sp (print_e sp) e
      | e::xs ->
        fprintf ppf "%s%a;@." sp (print_e sp) e;
        loop xs
    in
    fprintf ppf "\n";
    loop ls
  | EList ls ->
    fprintf ppf "[%a]"
      (print_ls "" "; " (print_e)) ls
  | EArray ls ->
    fprintf ppf "[|%a|]"
      (print_ls "" "; " (print_e)) ls
  | ELet (id, TEmpty, e) ->
    fprintf ppf "let %s = %a"
      id
      (print_e "") e
  | ELet (id, t, e) ->
    fprintf ppf "let (%s:%a) = %a"
      id
      (print_t "" "") t
      (print_e "") e
  | ELetRec (id, TEmpty, e) ->
    fprintf ppf "let rec %s = %a"
      id
      (print_e sp) e
  | ELetRec (id, t, e) ->
    fprintf ppf "let rec (%s:%a) = %a"
      id
      (print_t "" "") t
      (print_e sp) e

  | EFor(id, start, end1, step1, e) ->
    if(step1 < 0) then
      fprintf ppf "for %s = %a downto %a do %a done@?"
        id
        (print_e sp) start
        (print_e sp) end1
        (print_e sp) e
    else
      fprintf ppf "for %s = %a to %a do %a done@?"
        id
        (print_e sp) start
        (print_e sp) end1
        (print_e sp) e
  | EWhile(e1,e2) ->
    fprintf ppf "while %a do %a done@?"
        (print_e sp) e1
        (print_e sp) e2

and print_e_block sp b ppf = print_e (sp ^ "  ") ppf

let rec print_s sp ppf (s:s):unit = 
  let rec print sp ppf = function
    | SLet (id, TEmpty, e) ->
      fprintf ppf "(%s)let %s = %a"
        sp
        id
        (print_e sp) e
    | SLet (id, t, e) ->
      fprintf ppf "(%s)let (%s:%a) = %a"
        sp
        id
        (print_t sp "") t
        (print_e sp) e
    | SLetRec (id, TEmpty, e) ->
      fprintf ppf "(%s)let rec %s = %a"
        sp
        id
        (print_e (sp^"  ")) e
    | SLetRec (id, t, e) ->
      fprintf ppf "(%s)let rec (%s:%a) = %a"
        sp
        id
        (print_t sp "") t
        (print_e sp) e
    | SAnd(e1, SExp(ELetRec(id, TEmpty, e)))
    | SAnd(e1, SExp(ELet(id, TEmpty, e))) ->
      fprintf ppf "%a\n"
        (print_s sp) e1;
      fprintf ppf "\n%sand %s = %a"
        sp
        id
        (print_e (sp^"  ")) e

    | SAnd(e1, e2) ->
      fprintf ppf "%a\nand %a"
        (print_s sp) e1
        (print_s sp) e2

    | SExp e ->
      fprintf ppf "%s%a"
        sp
        (print_e sp) e
    | SOpen s ->
      fprintf ppf "%sopen %s"
        sp
        s
    | STypeRec(id, ls) ->
      fprintf ppf "%stype %s = {%a}"
        sp
        id
        (print_ls "" ";"
          (fun sp ppf (s,t) -> fprintf ppf "%s:%a" s (print_t "" "") t)
        )
        ls
    | STypeVariant(id, ls) ->
      fprintf ppf "%stype %s = %a"
        sp
        id
        (print_ls sp "|"
          (fun sp ppf -> function
            |(s,TEmpty) -> fprintf ppf "%s" s
            |(s,t) -> fprintf ppf "%s of %a" s (print_t "" "") t
          )
        )
        ls
    | SModule(name, ss) ->
      fprintf ppf "%smodule %s = struct\n"
        sp
        name
      ;

      print_ls sp ";;\n" print ppf ss;
      fprintf ppf "\n%send" sp

    | SClass(name, [], ss) ->
      fprintf ppf "%sclass %s = object\n"
        sp
        name
      ;
      print_ls sp "\n" print_member ppf ss;
      fprintf ppf "\n%send" sp

    | SClass(name, sts, ss) ->
      fprintf ppf "%sclass %s (%a) = object\n"
        sp
        name
        (print_ls "" ")("
          (fun sp ppf (s,t) -> fprintf ppf "%s:%a" s (print_t "" "") t)
        ) sts
      ;
      print_ls sp "\n" print_member ppf ss;
      fprintf ppf "\n%send" sp

  and print_member sp ppf s = 
    let print_e2 sp ppf = function
      | ELet (id, TEmpty, e) ->
        fprintf ppf "val %s = %a"
          id
          (print_e "") e
      | ELet (id, t, e) ->
        fprintf ppf "val (%s:%a) = %a"
          id
          (print_t "" "") t
          (print_e "") e
      | ELetRec (id, TEmpty, e) ->
        fprintf ppf "method %s = %a"
          id
          (print_e sp) e
      | ELetRec (id, t, e) ->
        fprintf ppf "method (%s:%a) = %a"
          id
          (print_t "" "") t
          (print_e sp) e
      | _ ->
        assert false
    in
    match s with
    | SExp e ->
      fprintf ppf "%s%a"
        sp
        (print_e2 sp) e
    | s ->
      assert false
  in
    print sp ppf s

let print_prog ppf (Prog(ss)) =
  print_ls "" ";;\n" print_s ppf ss;
  fprintf ppf "@."

