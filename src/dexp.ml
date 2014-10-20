open Printf

type d =
    | DId of string
    | DOp of string
    | DInt of int
    | DStr of string
    | DPrn of string * d * string
    | DList of d list

let rec print = function
  | DId(id) -> printf "DId(\"%s\")" id
  | DOp(id) -> printf "DOp(\"%s\")" id
  | DInt(i) -> printf "DInt(%d)" i
  | DStr(s) -> printf "DStr(%s)" s
  | DPrn(l,d,r) ->
  	printf "DPrn(\"%s\"," l;
  	print d;
  	printf ",\"%s\")" r
  | DList(ls) ->
    printf "DList(";
    print_ls ls;
    printf ")"

and print_ls ls = 
	
  let rec print_ls = function
    | [] -> ()
    | [x] -> print x
    | x::xs -> print x; printf ";"; print_ls xs
  in
  printf "[";
  print_ls ls;
  printf "]"
