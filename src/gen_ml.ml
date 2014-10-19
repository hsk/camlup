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
    fprintf ppf "%s%s" <|_2(
      sp,
      s
    )
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

let rec print_e sp ppf = function

  | EEmpty ->
    ()
  | EUnit ->
    fprintf ppf "()"
  | EInt i ->
    fprintf ppf "%d"
      i
    
  | EString i ->
    fprintf ppf "%s"
      i

  | EVar i ->
    fprintf ppf "%s"
      i

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
      | [x] -> fprintf ppf "(%a)" (p sp) x
      | x::xs ->
        fprintf ppf " (%a)%s%a"
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
      | [x] -> fprintf ppf "(%a)" (p sp) x
      | x::xs ->
        fprintf ppf "(%a)%s%a"
          (p sp) x
          sep
          (print_ls sep p) xs
    in
    fprintf ppf "(fun %a%a -> %a%s)"
      (print_ls " " print_e) its
      (print_t (if t=TEmpty then "" else ":") "") t
      (print_e_block sp "\n") e
      sp
  | EPFun (ls) ->
    fprintf ppf "(function\n";
    ls|>List.iter begin function
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
          (print_ls "" " " print_e) its
          (print_t (if t=TEmpty then "" else ":") "") t
          (print_e_block sp "\n") e
          sp

      | _ -> assert false
    end;
    fprintf ppf "%s)" sp
  | EMatch (e,ls) ->
    fprintf ppf "(match %a with "
      (print_e "") e
      ;
    ls|>List.iter begin function
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
      | _ -> assert false
    end;
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
      | e::xs ->
        fprintf ppf "%s%a;@." sp (print_e sp) e;
        loop xs
    in
    fprintf ppf "\n";
    loop ls

  | EList ls ->
    fprintf ppf "[%a]"
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

      print_ls (sp ^ "(*s*)") ";;\n" print ppf ss;
      fprintf ppf "\n%send" sp
  in
    print sp ppf s

let print_prog ppf (Prog(ss)) =
  print_ls "" ";;\n" print_s ppf ss;
  fprintf ppf "@."
