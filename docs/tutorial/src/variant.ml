open Printf;;

# 12 "?"
let variants = 

# 10 "?"
let rec eval = begin fun t1'  -> match t1' with
  | (
# 7 "?"
`int (n)) -> (

# 8 "?"

    n
  )
  | (`add (a , b)) -> (

    (eval (a) + eval (b))
  )
  | (
# 9 "?"
`mul (a , b)) -> (

    (eval (a) * eval (b))
  )
 end  in

# 11 "?"
printf  ("%d\n") (eval (`add (`mul (`int (10) , `int (20)) , `int (20))))

