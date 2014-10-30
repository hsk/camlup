open Printf;;

# 9 "?"
let rec fib = 
# 8 "?"
begin fun t1'  -> match t1' with
  | (
# 5 "?"
0) -> (

    0
  )
  | (
# 6 "?"
1) -> (

    1
  )
  | (
# 7 "?"
n) -> (

# 8 "?"

    (
# 7 "?"
fib ((n - 2)) + fib ((n - 1)))
  )
 end ;;

# 10 "?"
printf  ("fib 10 %d\n") (fib (10));;
class fib (x:int) = object

# 20 "?"
method apply = 
# 14 "?"
(match x with | (
# 15 "?"
0) -> (
  0

)| (
# 16 "?"
1) -> (
  1

)| (
# 17 "?"
n) -> (
# 19 "?"

  (
# 17 "?"
((new fib ((x - 2))) # apply) + 
# 19 "?"
(
# 18 "?"
(new fib ((x - 1))) # 
# 19 "?"
apply))

))
end;;

# 22 "?"
printf  ("object fib 10 = %d\n") (((new fib (10)) # apply))
