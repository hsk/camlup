open Printf;;
class ab = object

# 8 "?"
val a = 
# 7 "?"
123

# 10 "?"
method c = a
end;;

# 20 "?"
let _ = 
# 19 "?"


# 18 "?"
printf  ("ab.a = %d\n") (((new ab) # c))
;;
class abc (b:int)(c:int) = object

# 24 "?"
method c = b
end;;

# 30 "?"
let _ = 
# 29 "?"


# 28 "?"
printf  ("ab.a = %d\n") (((new abc  (10) (20)) # c))
;;
class fib (x:int) = object

# 39 "?"
method apply = 
# 33 "?"
(match x with | (
# 34 "?"
0) -> (
  0

)| (
# 35 "?"
1) -> (
  1

)| (
# 36 "?"
n) -> (
# 38 "?"

  (
# 36 "?"
((new fib ((x - 2))) # apply) + 
# 38 "?"
(
# 37 "?"
(new fib ((x - 1))) # 
# 38 "?"
apply))

))
end;;

# 46 "?"
let _ = 
# 45 "?"


# 43 "?"
printf  ("A.a = %d\n") (((new fib (10)) # apply))

