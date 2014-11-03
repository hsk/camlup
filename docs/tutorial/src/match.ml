open Printf;;

# 13 "?"
let match_fib = 

# 5 "?"
let rec fib = (fun n -> 
# 11 "?"

  
# 6 "?"
(match n with | (
# 7 "?"
0)-> (
    0
  
)| (
# 8 "?"
1)-> (
    1
  
)| (
# 9 "?"
n)-> (
    (fib ((n - 2)) + fib ((n - 1)))
  
))
) in

# 12 "?"
printf  ("fib 10=%d\n") (fib (10))
;;

# 26 "?"
let match_block = 

# 17 "?"
let x = (match 1 with | (
# 18 "?"
0)-> (
  0

)| (
# 19 "?"
n)-> (
# 20 "?"

  let a = (n * 
# 21 "?"
n) in
  let b = (n + 
# 22 "?"
n) in
  (a + 
# 23 "?"
b)

)) in

# 25 "?"
printf  ("x=%d\n") (x)
;;

# 36 "?"
let match_whens = 

# 30 "?"
let rec (fib:((int))->(int)) = 
# 34 "?"
begin fun t1'  -> match t1' with
  | (
# 31 "?"
n) when (n = 0) -> (

    0
  )
  | (
# 32 "?"
n) when (n = 1) -> (

    1
  )
  | (
# 33 "?"
n) -> (

    (fib ((n - 2)) + fib ((n - 1)))
  )
 end  in

# 35 "?"
printf  ("fib 10 %d\n") (fib (10))
;;

# 46 "?"
let match_tuple = 

# 40 "?"
let x = (match 1 , 2 with | (
# 41 "?"
a , b) when (a = 1)-> (
  (a + 
# 42 "?"
b)

)| (a , b)-> (
  (a * 
# 43 "?"
b)

)) in

# 45 "?"
printf  ("x=%d\n") (x)
;;

# 56 "?"
let match_as = 

# 49 "?"
let x = (match "add" , 1 , 2 with | (
# 50 "?"
("add" as id , a , b))-> (
# 51 "?"

  printf  ("%s") (id);
  
# 52 "?"
(a + 
# 53 "?"
b)

)| (id , a , b)-> (
  (a + 
# 54 "?"
b)

)) in

# 55 "?"
printf  ("add 1 + 2 = %d\n") (x)
;;

# 59 "?"
let x = (match 1 with | (
# 60 "?"
1)| (
# 61 "?"
2)-> (
  1

)| (
# 62 "?"
_)-> (
  3

));;

# 64 "?"
(Printf . printf  ("x=%d\n") (x))
