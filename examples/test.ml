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
printf  ("a=%d\n") (a);
;;
let rec functions = (fun (a) (b) -> 
  printf  ("test %d\n") ((a + b));
  let rec fib = (fun (n) -> (if (n == 0) then (0    )else((if (n == 1) then (1      )else((fib ((n - 2)) + fib ((n - 1)))))))  ) in
  printf  ("fib %d %d\n")  ((a + b)) (fib ((a + b)));
);;
functions  (10) (11);;
let rec pattern_match = (fun () -> 
  let rec fib = (fun (n) -> 
    (match n with | (0) -> (0    
)| (1) -> (1    
)| (n) -> ((fib ((n - 2)) + fib ((n - 1)))    
));
  ) in
  printf  ("fib 21 %d\n") (fib (21));
);;
pattern_match ();;
let rec parcial_function = (fun () -> 
  let rec fib = begin fun t1'  -> match t1' with
    | (0) -> (

      let a = 1 in
      a;
    )
    | (1) -> (
1    )
    | (n) -> (
(fib ((n - 2)) + fib ((n - 1)))    )
   end  in
  printf  ("fib 10 = %d\n") (fib (10));
  let llor = begin fun t1'  -> match t1' with
  | ((0 , 0)) -> (

    let a = 1 in
    let b = 2 in
    (a + b);
  )
  | ((a , b)) -> (
(a + b)  )
 end  in
  printf  ("llor %d\n") (llor ((1 , 2)));
);;
parcial_function ()
