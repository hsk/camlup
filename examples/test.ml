open Printf;;
open List;;
let (variable:int) = 2;;
let a = 1;;
let b = 2;;
let _ = 3;;
let (block:unit) = 
printf ("test 1\n")
;;
let block = 
printf ("test 2\n");
printf ("test 2\n")
;;
let functions = (fun (()) -> 
  printf ("test\n")
);;
functions (());;
let curry_function = 
let (f0:(unit)->(int)) = begin fun t1'  -> match t1' with
  | (()) -> (

    0
  )
 end  in
let (f0:(unit)->(int)) = (fun (()) -> 
  0
) in
let (f0:(unit)->(int)) = (fun (()) -> 0) in
let f0 = (fun (()) -> 0) in
printf ("%d\n") (f0 (()));
printf  ("%d\n") (f0 (()));
printf  ("%d\n") (f0 (()));
let (f1:((int))->(int)) = begin fun t1'  -> match t1' with
  | (a) -> (

    a
  )
 end  in
let (f1:(int)->(int)) = (fun (a) -> 
  a
) in
let (f1:(int)->(int)) = (fun (a) -> a) in
let f1 = (fun (a) -> a) in
printf ("%d\n") (f1 (1));
printf  ("%d\n") (f1 (1));
printf  ("%d\n") (f1 (1));
let (f2:(int)->((int)->(int))) = begin fun t1' t2'  -> match t1',t2' with
  | (a),(b) -> (

    (a + b)
  )
 end  in
let (f2:(int)->(((int))->(int))) = (fun (a) -> begin fun t1'  -> match t1' with
    | (b) -> (

      (a + b)
    )
   end ) in
let (f2:(int)->((int)->(int))) = (fun (a) -> (fun (b) -> 
    (a + b)
  )) in
let (f2:(int)->((int)->(int))) = (fun (a) (b) -> (a + b)) in
let f2 = (fun (a) (b) -> (a + b)) in
printf ("%d\n") (f2 (1) (2));
printf  ("%d\n") (f2  (1) (2));
printf  ("%d\n") (f2  (1) (2));
let (f3:(int)->((int)->((int)->(int)))) = begin fun t1' t2' t3'  -> match t1',t2',t3' with
  | (a),(b),(c) -> (

    ((a + b) + c)
  )
 end  in
let (f3:(int)->((int)->((int)->(int)))) = (fun (a) -> begin fun t1' t2'  -> match t1',t2' with
    | (b),(c) -> (

      ((a + b) + c)
    )
   end ) in
let (f3:(int)->((int)->((int)->(int)))) = (fun (a) -> (fun (b) -> begin fun t1'  -> match t1' with
      | (c) -> (

        ((a + b) + c)
      )
     end   )) in
let (f3:(int)->((int)->((int)->(int)))) = (fun (a) -> (fun (b) -> (fun (c) -> 
      ((a + b) + c)
    )  )) in
let (f3:(int)->((int)->((int)->(int)))) = (fun (a) (b) (c) -> ((a + b) + c)) in
let f3 = (fun (a) (b) (c) -> ((a + b) + c)) in
printf ("%d\n") (f3 (1) (2) (3));
printf  ("%d\n") (f3  (1)  (2) (3));
printf  ("%d\n") (f3  (1)  (2) (3));
printf;
"%d %d %d %d\n";
f0 (());
f1 (1);
f2 (1) (2);
f3 (1) (2) (3);
printf  ("%d %d %d %d\n")  (f0 (()))  (f1 (1))  (f2  (1) (2)) (f3  (1)  (2) (3));
printf  ("%d %d %d %d\n")  (f0 (()))  (f1 (1))  (f2  (1) (2)) (f3  (1)  (2) (3));
printf ("%d\n") (f3 ((- 1)) ((- 2)) ((- 3)));
printf  ("%d\n") (f3  ((- 1))  ((- 2)) ((- 3)));
printf  ("%d\n") (f3  ((- 1))  ((- 2)) ((- 3)));
printf ("%d+%d=%d\n") (a) (b) ((a + b));
printf  ("%d+%d=%d\n")  (a)  (b) ((a + b));
printf  ("%d+%d=%d\n")  (a)  (b) ((a + b))
;;
let if_else = (fun (()) -> 
  (if (a < 10) then (printf ("b1\n"))  );
  (if (a < 10) then (
    printf ("b2\n")
)  );
  (if (a < 10) then (
    printf ("b2\n");
    printf ("b3\n")
)  );
  (if (a > 10) then (printf ("a\n")  )else(printf ("b3\n")));
  printf ((if (a < 1) then ("a\n"  )else("b1\n")))
);;
if_else (());;
let recursive_function = (fun (()) -> 
  let rec (fib:((int))->(int)) = begin fun t1'  -> match t1' with
    | (n) -> (

      (if (n = 0) then (0      )else((if (n = 1) then (1        )else((fib ((n - 2)) + fib ((n - 1)))))))
    )
   end  in
  printf  ("fib 10 %d\n") (fib (10))
);;
recursive_function (());;
let tuple = (fun (()) -> 
  let (addt:((int * int))->(int)) = begin fun t1'  -> match t1' with
  | (a , b) -> (

    (a + b)
  )
 end  in
  let (f2:((int * int))->(((int * int))->(int))) = begin fun t1' t2'  -> match t1',t2' with
  | (a , b),(c , d) -> (

    ((a * b) + (c * d))
  )
 end  in
  printf ("%d\n") (f2 (1 , 2) (3 , 4));
  printf  ("%d\n") (f2  (1 , 2) (3 , 4))
);;
tuple (());;
let pattern_match = (fun (()) -> 
  let rec (fib:((int))->(int)) = begin fun t1'  -> match t1' with
    | (n) -> (

      (match n with | (0) -> (
        0
      
)| (1) -> (
        1
      
)| (n) -> (
        (fib ((n - 2)) + fib ((n - 1)))
      
))
    )
   end  in ()
);;
pattern_match (());;
let parcial_function = (fun (()) -> 
  let rec (fib:((int))->(int)) = begin fun t1'  -> match t1' with
    | (0) -> (

      0
    )
    | (1) -> (

      1
    )
    | (n) -> (

      (fib ((n - 2)) + fib ((n - 1)))
    )
   end  in
  printf  ("fib 10 = %d\n") (fib (10));
  let (llor:((int * int))->(int)) = begin fun t1'  -> match t1' with
  | (0 , 0) -> (

    let a = 1 in
    let b = 2 in
    (a lor b)
  )
  | (a , b) -> (

    (a lor b)
  )
 end  in
  printf  ("llor %d\n") (llor (1 , 2))
);;
parcial_function (());;
let list = (fun (()) -> 
  iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf ("%d\n") (x)
    )
   end ) ([1; 2; 3; 4]);
  iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) ([1; 2; 3; 4]);
  iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) ([1; 2; 3; 4]);
  iter  (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) ([1; 2; 3; 4]);
  iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) ([1; 2; 3; 4]);
  iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) ([1; 2; 3; 4]);
  iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) ([1; 2; 3; 4]);
  iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) (map (begin fun t1'  -> match t1' with
    | (x) -> (

      (x * 10)
    )
   end ) ([1; 2; 3; 4]))
);;
list (());;
type a = {x:int;y:int};;
let record = (fun (()) -> 
  let (a:a) = {x=1;y=2} in
  printf  ("%d\n") ((a . x));
  printf  ("%d\n") (({x=(1 + (2 * 3));y=
let a = 1 in
a
} . x));
  let aa = begin fun t1'  -> match t1' with
  | ({x}) -> (

    printf  ("%d\n") (x)
  )
 end  in ()
);;
record (());;
type e = EUnit|EInt of (int)|EAdd of (e * e);;
let variant = (fun (()) -> 
  let rec (eval:(e)->(int)) = begin fun t1'  -> match t1' with
    | (EUnit) -> (

      0
    )
    | (EInt (i)) -> (

      i
    )
    | (EAdd (a , b)) -> (

      (eval (a) + eval (b))
    )
   end  in
  printf  ("1+2=%d\n") (eval (EAdd (EInt (1) , EInt (2))))
);;
variant (());;
let reference = (fun (()) -> 
  let a = (ref 1) in
  (a := 2);
  printf  ("%d\n") ((! a));
  let b = (ref 1) in
  incr (b);
  printf  ("++ %d\n") ((! b));
  decr (b);
  printf  ("-- %d\n") ((! b))
);;
reference (());;
let closure = (fun (()) -> 
  let block = (fun (sp) -> (fun (f) -> 
    printf ("{\n");
    f ((sp ^ "  "));
    printf  ("%s}\n") (sp)
  )) in
  let p = printf in
  p  ("def %s() ") ("a");
  block ("") (begin fun t1'  -> match t1' with
    | (sp) -> (

      p  ("%sdef %s() ")  (sp) ("b");
      block (sp) (begin fun t1'  -> match t1' with
        | (sp) -> (

          p  ("%sprogram2()\n") (sp);
          p  ("%sprogram2()\n") (sp)
        )
       end );
      p  ("%sprogram()\n") (sp)
    )
   end );
  let block = (fun (sp) -> (fun (f) -> 
    printf ("{\n");
    f ((sp ^ "  "));
    printf  ("%s}\n") (sp)
  )) in
  let p = printf in
  p  ("def %s() ") ("a");
  block ("") (begin fun t1'  -> match t1' with
    | (sp) -> (

      p  ("%sdef %s() ")  (sp) ("b");
      block (sp) (begin fun t1'  -> match t1' with
        | (sp) -> (

          p  ("%sprogram2()\n") (sp);
          p  ("%sprogram2()\n") (sp)
        )
       end );
      p  ("%sprogram()\n") (sp)
    )
   end )
);;
closure (());;
let list_type = 
let ls = [1; 2; 3] in
iter (begin fun t1'  -> match t1' with
  | (l) -> (

    printf  ("%d,") (l)
  )
 end ) (ls);
printf ("\n");
let (ls:(int) list) = [1; 2; 3] in
iter (begin fun t1'  -> match t1' with
  | (l) -> (

    printf  ("%d,") (l)
  )
 end ) (ls);
printf ("\n");
let (ls:((int * int)) list) = [1 , 2; 3 , 4] in
iter (begin fun t1'  -> match t1' with
  | (l , r) -> (

    printf  ("(%d,%d);")  (l) (r)
  )
 end ) (ls);
printf ("\n");
let rec f = begin fun t1'  -> match t1' with
  | ([]) -> (

    ()
  )
  | ((x :: xs)) -> (

    printf  ("%d,\n") (x);
    f (xs)
  )
 end  in
f ([1; 2; 3]);
printf  ("1+20=%d\n") ((1 + 20))
;;
let whens = 
let rec (fib:((int))->(int)) = begin fun t1'  -> match t1' with
  | (n) when (n = 0) -> (

    0
  )
  | (n) when (n = 1) -> (

    1
  )
  | (n) -> (

    (fib ((n - 2)) + fib ((n - 1)))
  )
 end  in
printf  ("fib 11 %d\n") (fib (11))
;;
module A = struct
let a = 1234;;
let inc = (fun (k) -> (k + 1))
end;;
let _ = 
printf  ("A.a = %d A.inc(10) = %d\n")  ((A . a)) ((A . inc (10)))
;;
class ab = object
val a = 123
method c = a
end;;
let _ = 
printf  ("ab.a = %d\n") (((new ab) # c))
;;
class abc (b:int)(c:int) = object
method c = b
end;;
let _ = 
printf  ("ab.a = %d\n") (((new abc  (10) (20)) # c));
printf  ("ab.a = %d\n") (((2 * 3) + 1))
;;
class fib (x:int) = object
method apply = (match x with | (0) -> (
  0

)| (1) -> (
  1

)| (n) -> (
  (((new fib ((x - 2))) # apply) + ((new fib ((x - 1))) # apply))

))
end;;
let _ = 
printf  ("A.a = %d\n") (((new fib (10)) # apply));
printf  ("%d %d\n")  (((1 + 2) - 3)) ((- 1));
let a = [|1; 2; 3|] in
printf  ("%d%d%d\n")  (a .(0))  (a .(1)) (a .(2));
for i = 0 to 3 do 
printf  ("%d\n") (i)
 done;
for i = 10 downto 1 do 
printf  ("%d\n") (i)
 done;
let i = (ref 0) in
while ((! i) < 3) do 
incr (i);
printf  ("while %d\n") ((! i))
 done

