open Printf;;

# 14 "?"
let match_fib = 
# 13 "?"


# 5 "?"
let rec fib = (fun n -> 
# 11 "?"

  
# 6 "?"
(match n with | (
# 7 "?"
0) -> (
    0
  
)| (
# 8 "?"
1) -> (
    1
  
)| (
# 9 "?"
n) -> (
# 10 "?"

    (
# 9 "?"
fib ((n - 2)) + fib ((n - 1)))
  
))
) in

# 12 "?"
printf  ("fib 10=%d\n") (fib (10))
;;

# 27 "?"
let match_block = 
# 26 "?"


# 24 "?"
let x = 
# 17 "?"
(match 1 with | (
# 18 "?"
0) -> (
  0

)| (
# 19 "?"
n) -> (
# 21 "?"

  let a = (
# 20 "?"
n * 
# 21 "?"
n) in
  
# 22 "?"
let b = (
# 21 "?"
n + 
# 22 "?"
n) in
  
# 23 "?"
(
# 22 "?"
a + 
# 23 "?"
b)

)) in

# 25 "?"
printf  ("x=%d\n") (x)
;;

# 37 "?"
let match_whens = 
# 36 "?"


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

# 34 "?"

    (
# 33 "?"
fib ((n - 2)) + fib ((n - 1)))
  )
 end  in

# 35 "?"
printf  ("fib 10 %d\n") (fib (10))
;;

# 47 "?"
let match_tuple = 
# 46 "?"


# 44 "?"
let x = 
# 40 "?"
(match 1 , 2 with | (
# 41 "?"
a , b) when (a = 1) -> (
# 42 "?"

  (
# 41 "?"
a + 
# 42 "?"
b)

)| (a , b) -> (
# 43 "?"

  (
# 42 "?"
a * 
# 43 "?"
b)

)) in

# 45 "?"
printf  ("x=%d\n") (x)
;;

# 57 "?"
let match_as = 
# 56 "?"


# 55 "?"
let x = 
# 49 "?"
(match "add" , 1 , 2 with | (
# 50 "?"
("add" as id , a , b)) -> (
# 51 "?"

  printf  ("%s") (id);
  
# 53 "?"
(
# 52 "?"
a + 
# 53 "?"
b)

)| (id , a , b) -> (
# 54 "?"

  (
# 53 "?"
a + 
# 54 "?"
b)

)) in

# 55 "?"
printf  ("add 1 + 2 = %d\n") (x)

