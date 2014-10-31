open Printf;;

# 13 "?"
let variants = 
# 12 "?"


# 11 "?"
let rec eval = 
# 10 "?"
begin fun t1'  -> match t1' with
  | (
# 7 "?"
`int (n)) -> (

# 8 "?"

    n
  )
  | (`add (a , b)) -> (

# 9 "?"

    (
# 8 "?"
eval (a) + eval (b))
  )
  | (
# 9 "?"
`mul (a , b)) -> (

# 10 "?"

    (
# 9 "?"
eval (a) * eval (b))
  )
 end  in

# 11 "?"
printf  ("%d\n") (eval (`add (`mul (`int (10) , `int (20)) , `int (20))))

