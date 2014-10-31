open Printf;;
module A = struct

# 7 "?"
let a = 
# 6 "?"
1234;;

# 7 "?"
let inc = (fun k -> 
# 8 "?"
(
# 7 "?"
k + 1))
end;;

# 14 "?"
let _ = 
# 13 "?"


# 12 "?"
printf  ("A.a = %d A.inc(10) = %d\n")  ((A . a)) ((A . inc (10)))
;;
module M = 
# 16 "?"
(
# 15 "?"
Map . Make (String));;

# 24 "?"
let module_map = 
# 23 "?"


# 19 "?"
let dic = (
# 18 "?"
M . 
# 19 "?"
empty) in

# 20 "?"
let dic = (
# 19 "?"
M . add  ("a")  (1) (dic)) in

# 21 "?"
let dic = (
# 20 "?"
M . add  ("b")  (2) (dic)) in

# 21 "?"
printf  ("a %d\n") ((M . find  ("a") (dic)));

# 22 "?"
printf  ("b %d\n") ((M . find  ("b") (dic)))

