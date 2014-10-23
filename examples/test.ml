open Printf;;
printf  ("%s\n") ("hoge");;
let a = (1 + 1);;
printf  ("a=%d\n") (a);;
let block = 
printf ("test\n");
printf ("test\n");
printf ("test\n");
printf ("test\n");
let a = (1 + 1) in
printf  ("a=%d\n") (a)
;;
let rec functions = (fun (a) (b) -> 
  printf  ("test %d\n") ((a + b));
  let rec fib = (fun (n) -> (if (n == 0) then (0    )else((if (n == 1) then (1      )else((fib ((n - 2)) + fib ((n - 1)))))))  ) in
  printf  ("fib %d %d\n")  ((a + b)) (fib ((a + b)))
);;
functions  (10) (11);;
let rec pattern_match = (fun () -> 
  let rec fib = (fun (n) -> 
    (match n with | (0) -> (
      let a = 0 in
      a
    
)| (1) -> (
      1
    
)| (n) -> (
      (fib ((n - 2)) + fib ((n - 1)))
    
))
  ) in
  printf  ("fib 21 %d\n") (fib (21))
);;
pattern_match ();;
let rec parcial_function = (fun () -> 
  let rec fib = begin fun t1'  -> match t1' with
    | (0) -> (

      let a = 1 in
      a
    )
    | (1) -> (

      1
    )
    | (n) -> (

      (fib ((n - 2)) + fib ((n - 1)))
    )
   end  in
  printf  ("fib 10 = %d\n") (fib (10));
  let llor = begin fun t1'  -> match t1' with
  | ((0, 0)) -> (

    let a = 1 in
    let b = 2 in
    (a + b)
  )
  | ((a, b)) -> (

    (a + b)
  )
 end  in
  printf  ("llor %d\n") (llor ((1, 2)))
);;
parcial_function ();;
let rec tuple = (fun () -> 
  let rec add = (fun ((a, b)) -> (a + b)  ) in
  printf  ("1+2=%d\n") (add ((1, 2)));
  let rec add = (fun ((a, b, c)) -> ((a + b) + c)  ) in
  printf  ("1+2+3=%d\n") (add ((1, 2, 3)));
  let rec add = (fun ((
(a, b)
, c)) -> ((a + b) + c)  ) in
  let x = 
(1, 2)
 in
  printf  ("1+2+3=%d\n") (add ((x, 3)));
  let rec add = (fun ((a, 
(b, c)
)) -> ((a + b) + c)  ) in
  printf  ("1+2+3=%d\n") (add ((3, x)))
);;
tuple ();;
open List;;
let rec list = (fun () -> 
  (Printf . printf  ("%d\n") (10));
  iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) ([1; 2; 3]);
  iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) ([1; 2; 3]);
  iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) ([1; 2; 3]);
  let rec sum = begin fun t1' t2'  -> match t1',t2' with
    | (n),([]) -> (

      n
    )
    | (n),((x :: xs)) -> (

      sum  ((n + x)) (xs)
    )
   end  in
  printf  ("%d") (sum (0) ([1; 2; 3]))
);;
list ();;
type e = EUnit|EInt of (int)|EAdd of (e * e);;
let rec variant = (fun () -> 
  let rec eval = begin fun t1'  -> match t1' with
    | (EUnit) -> (

      0
    )
    | (EInt (i)) -> (

      i
    )
    | (EAdd ((a, b))) -> (

      (eval (a) + eval (b))
    )
   end  in
  printf  ("10+2=%d\n") (eval (EAdd ((EInt (10), EInt (2)))))
);;
variant ();;
let rec eval = begin fun t1'  -> match t1' with
  | (EUnit) -> (

    0
  )
  | (EInt (i)) -> (

    i
  )
  | (EAdd ((a, b))) -> (

    (eval (a) + eval (b))
  )
 end ;;
printf  ("10+2=%d\n") (eval (EAdd ((EInt (10), EInt (2)))));;
let rec reference = (fun () -> 
  let a = (ref 1) in
  (a := 2);
  printf  ("%d\n") ((! a));
  let b = (ref 1) in
  (b := 3);
  printf  ("%d\n") ((! b))
);;
reference ();;
type a = {x:int;y:int};;
let rec record = (fun () -> 
  let a = {x=1;y=2} in
  printf  ("%d\n") ((a . x));
  printf  ("%d\n") (({x=(1 + (2 * 3));y=
let a = 1 in
a
} . x));
  let px = begin fun t1'  -> match t1' with
  | ({x}) -> (

    printf  ("x=%d\n") (x)
  )
 end  in
  let py = begin fun t1'  -> match t1' with
  | ({y}) -> (

    printf  ("y=%d\n") (y)
  )
 end  in
  px (a);
  py (a)
);;
record ()
