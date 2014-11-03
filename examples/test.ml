open Printf;;
open List;;

# 4 "?"
let (variable:int) = 2;;

# 5 "?"
let a = 1;;

# 6 "?"
let b = 2882400009;;

# 7 "?"
let c = 2882400009;;

# 8 "?"
let d = 342391;;

# 9 "?"
let e = 342391;;

# 10 "?"
let f = 170;;

# 11 "?"
let g = 170;;

# 12 "?"
let _ = 3;;

# 15 "?"
let (block:unit) = 
# 18 "?"


# 17 "?"
printf ("test 1\n")
;;

# 20 "?"
let block = 
# 23 "?"


# 21 "?"
printf ("test 2\n");

# 22 "?"
printf ("test 2\n")
;;

# 25 "?"
let functions = (fun () -> 
# 28 "?"

  
# 27 "?"
printf ("test\n")
);;

# 28 "?"
functions (());;

# 30 "?"
let curry_function = 
# 121 "?"


# 32 "?"
let (f0:(unit)->(int)) = begin fun t1'  -> match t1' with
  | (()) -> (

    0
  )
 end  in

# 33 "?"
printf ("%d\n") (f0 (()));

# 34 "?"
let (f0:(unit)->(int)) = (fun () -> 
  0
) in

# 35 "?"
printf ("%d\n") (f0 (()));

# 36 "?"
let (f0:(unit)->(int)) = (fun () -> 0) in

# 37 "?"
printf ("%d\n") (f0 (()));

# 38 "?"
let f0 = (fun () -> 0) in

# 40 "?"
printf ("%d\n") (f0 (()));

# 41 "?"
printf  ("%d\n") (f0 (()));

# 42 "?"
printf  ("%d\n") (f0 (()));

# 44 "?"
let (f1:((int))->(int)) = begin fun t1'  -> match t1' with
  | (a) -> (

    a
  )
 end  in

# 45 "?"
printf  ("%d\n") (f1 (1));

# 46 "?"
let (f1:(int)->(int)) = (fun (a:int) -> 
  a
) in

# 47 "?"
printf  ("%d\n") (f1 (1));

# 48 "?"
let (f1:(int)->(int)) = (fun (a:int) -> a) in

# 49 "?"
printf  ("%d\n") (f1 (1));

# 50 "?"
let f1 = (fun (a:int) -> a) in

# 52 "?"
printf ("%d\n") (f1 (1));

# 53 "?"
printf  ("%d\n") (f1 (1));

# 54 "?"
printf  ("%d\n") (f1 (1));

# 56 "?"
let (f2:(int)->((int)->(int))) = begin fun t1' t2'  -> match t1',t2' with
  | (a),(b) -> (

    (a + b)
  )
 end  in

# 57 "?"
printf  ("%d\n") (f2  (1) (2));

# 58 "?"
let (f2:(int)->(((int))->(int))) = (fun (a:int) -> begin fun t1'  -> match t1' with
    | (b) -> (

      (a + b)
    )
   end ) in

# 59 "?"
printf  ("%d\n") (f2  (1) (2));

# 60 "?"
let (f2:(int)->((int)->(int))) = (fun (a:int) -> (fun (b:int) -> 
    (a + b)
  )) in

# 61 "?"
printf  ("%d\n") (f2  (1) (2));

# 62 "?"
let (f2:(int)->((int)->(int))) = (fun (a:int) (b:int) -> (a + b)) in

# 63 "?"
printf  ("%d\n") (f2  (1) (2));

# 64 "?"
let f2 = (fun (a:int) (b:int) -> (a + b)) in

# 66 "?"
printf ("%d\n") (f2 (1) (2));

# 67 "?"
printf  ("%d\n") (f2  (1) (2));

# 68 "?"
printf  ("%d\n") (f2  (1) (2));

# 70 "?"
let (f3:(int)->((int)->((int)->(int)))) = begin fun t1' t2' t3'  -> match t1',t2',t3' with
  | (a),(b),(c) -> (

    ((a + b) + c)
  )
 end  in

# 71 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 72 "?"
let (f3:(int)->((int)->((int)->(int)))) = (fun (a:int) -> begin fun t1' t2'  -> match t1',t2' with
    | (b),(c) -> (

      ((a + b) + c)
    )
   end ) in

# 73 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 74 "?"
let (f3:(int)->((int)->((int)->(int)))) = (fun (a:int) -> (fun (b:int) -> begin fun t1'  -> match t1' with
      | (c) -> (

        ((a + b) + c)
      )
     end   )) in

# 75 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 76 "?"
let (f3:(int)->((int)->((int)->(int)))) = (fun (a:int) -> (fun (b:int) -> (fun (c:int) -> 
      ((a + b) + c)
    )  )) in

# 77 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 78 "?"
let (f3:(int)->((int)->((int)->(int)))) = (fun (a:int) (b:int) (c:int) -> ((a + b) + c)) in

# 79 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 80 "?"
let f3 = (fun (a:int) (b:int) (c:int) -> ((a + b) + c)) in

# 82 "?"
printf ("%d\n") (f3 (1) (2) (3));

# 83 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 84 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 86 "?"
printf (
# 87 "?"
"%d %d %d %d\n") (
# 89 "?"
f0 (())) (
# 91 "?"
f1 (1)) (
# 93 "?"
f2 (1) (2)) (
# 95 "?"
f3 (1) (2) (3));

# 98 "?"
printf  (
# 99 "?"
"%d %d %d %d\n")  (
# 100 "?"
f0 (()))  (
# 101 "?"
f1 (1))  (
# 102 "?"
f2  (1) (2)) (
# 103 "?"
f3  (1)  (2) (3));

# 106 "?"
printf  (
# 107 "?"
"%d %d %d %d\n")  (
# 108 "?"
f0 (()))  (
# 109 "?"
f1 (1))  (
# 110 "?"
f2  (1) (2)) (
# 111 "?"
f3  (1)  (2) (3));

# 114 "?"
printf ("%d\n") (f3 ((- 1)) ((- 2)) ((- 3)));

# 115 "?"
printf  ("%d\n") (f3  ((- 1))  ((- 2)) ((- 3)));

# 116 "?"
printf  ("%d\n") (f3  ((- 1))  ((- 2)) ((- 3)));

# 118 "?"
printf ("%d+%d=%d\n") (a) (b) ((a + b));

# 119 "?"
printf  ("%d+%d=%d\n")  (a)  (b) ((a + b));

# 120 "?"
printf  ("%d+%d=%d\n")  (a)  (b) ((a + b))
;;

# 123 "?"
let if_else = (fun () -> 
# 131 "?"

  
# 125 "?"
(if (a < 10) then (printf ("b1\n"))  );
  
# 126 "?"
(if (a < 10) then (
    printf ("b2\n")
)  );
  
# 127 "?"
(if (a < 10) then (
    printf ("b2\n");
    printf ("b3\n")
)  );
  
# 128 "?"
(if (a > 10) then (printf ("a\n")  )else(printf ("b3\n")));
  
# 130 "?"
printf ((if (a < 1) then ("a\n"  )else("b1\n")))
);;

# 131 "?"
if_else (());;

# 133 "?"
let recursive_function = (fun () -> 
# 152 "?"

  
# 136 "?"
let rec (fib:((int))->(int)) = 
# 141 "?"
begin fun t1'  -> match t1' with
    | (
# 136 "?"
n) -> (

# 137 "?"

      (if (n = 0) then (0      )else(
# 138 "?"
(if (n = 1) then (1        )else(
# 139 "?"
(fib ((n - 2)) + fib ((n - 1)))))))
    )
   end  in
  
# 151 "?"
printf  ("fib 10 %d\n") (fib (10))
);;

# 152 "?"
recursive_function (());;

# 154 "?"
let tuple = (fun () -> 
# 237 "?"

  
# 156 "?"
let (addt:((int * int))->(int)) = 
# 158 "?"
begin fun t1'  -> match t1' with
  | (
# 156 "?"
a , b) -> (

# 157 "?"

    (a + b)
  )
 end  in
  
# 159 "?"
printf  ("%d\n") (addt (1 , 2));
  
# 161 "?"
let x , y = 1 , 2 in
  
# 162 "?"
printf  ("%d %d\n")  (x) (y);
  
# 164 "?"
let x , y = ( ( 1 , 2) , ( 3 , 4)) in
  
# 166 "?"
printf  ("%d %d\n")  (addt (x)) (addt (y));
  
# 227 "?"
let (f2:((int * int))->(((int * int))->(int))) = 
# 229 "?"
begin fun t1' t2'  -> match t1',t2' with
  | (
# 228 "?"
a , b),(c , d) -> (

    ((a * b) + (c * d))
  )
 end  in
  
# 235 "?"
printf ("%d\n") (f2 (1 , 2) (3 , 4));
  
# 236 "?"
printf  ("%d\n") (f2  (1 , 2) (3 , 4))
);;

# 237 "?"
tuple (());;

# 239 "?"
let pattern_match = (fun () -> 
# 260 "?"

  
# 241 "?"
let rec (fib:((int))->(int)) = 
# 247 "?"
begin fun t1'  -> match t1' with
    | (
# 241 "?"
n) -> (

# 242 "?"

      (match n with | (
# 243 "?"
0)-> (
        0
      
)| (
# 244 "?"
1)-> (
        1
      
)| (
# 245 "?"
n)-> (
        (fib ((n - 2)) + fib ((n - 1)))
      
))
    )
   end  in
  
# 249 "?"
printf  ("fib 10 %d\n") (fib (10))
);;

# 260 "?"
pattern_match (())
