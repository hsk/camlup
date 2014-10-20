open Printf;;
let rec pattern_match = (fun (()) -> 
  let rec fib = (fun (n) -> 
    (match n with | (0) -> (
      0;
    
)| (1) -> (
      1;
    
)| (n) -> (
      (fib ((n - 2)) + fib ((n - 1)));
    
));
  ) in
  printf  ("%d\n") (fib (10));
);;
pattern_match (());;
let rec parcial_function = (fun (()) -> 
  let rec fib = (fun t1'  -> match t1' with
    | (0) -> (

      0;
    )
t1'  -> match t1' with
    | (1) -> (

      1;
    )
t1'  -> match t1' with
    | (n) -> (

      (fib ((n - 2)) + fib ((n - 1)));
    )
  ) in
  printf  ("fib 10 = %d\n") (fib (10));
  let rec fib = (fun t1'  -> match t1' with
    | (0) -> (

      0;
    )
t1'  -> match t1' with
    | (1) -> (

      1;
    )
t1'  -> match t1' with
    | (n) -> (

      (fib ((n - 2)) + fib ((n - 1)));
    )
  ) in
  printf  ("fib 10 = %d\n") (fib (10));
  let rec fib = (fun t1'  -> match t1' with
    | (0) -> (

      0;
    )
t1'  -> match t1' with
    | (1) -> (

      1;
    )
t1'  -> match t1' with
    | (n) -> (

      (fib ((n - 2)) + fib ((n - 1)));
    )
  ) in
  printf  ("fib 10 = %d\n") (fib (10));
);;
parcial_function (())
