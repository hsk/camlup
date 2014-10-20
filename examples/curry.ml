open Printf;;
let curry_function = 
let rec f1 = (fun (a) -> 
  a;
) in
printf  ("%d\n") (f1 (1));
let rec f0 = (fun (()) -> 
  0;
) in
printf ("%d\n") (f0 (()));
let f0 = (fun (()) -> 
  0;
) in
printf  ("%d\n") (f0 (()));
let f1 = (fun t1'  -> match t1' with
  | (a) -> (

    let b = (a * 2) in
    (a lor b);
  )
) in
printf ("%d\n") (f1 (1));
printf  ("%d\n") (f1 (1));
printf  ("%d\n") (f1 (1));
let rec (f1:(int)->(int)) = (fun (b) -> 
  b;
) in
printf  ("%d\n") (f1 (1));
let f2 = (fun t1' t2'  -> match t1',t2' with
  | (a),(b) -> (

    (a + b);
  )
) in
printf  ("%d\n") (f2  (1) (21111));
printf  ("%d\n") (f2  (1) (2));
printf  ("%d\n") (f2  (1) (2));
let f3 = (fun t1' t2' t3'  -> match t1',t2',t3' with
  | (a),(b),(c) -> (

    ((a + b) + c);
  )
) in
printf  ("%d\n") (f3  (1)  (2) (3));
printf ("%d\n") (f3 (1) (2) (3));
printf  ("%d\n") (f3  (1)  (2) (3));
printf  ("%d\n") (f3  (1)  (2) (3));
printf ("%d %d %d %d\n") (f0 (())) (f1 (1)) (f2 (1) (2)) (f3 (1) (2) (3));
printf  ("%d %d %d %d\n")  (f0 (()))  (f1 (1))  (f2  (1) (2)) (f3  (1)  (2) (3));
printf  ("%d %d %d %d\n")  (f0 (()))  (f1 (1))  (f2  (1) (2)) (f3  (1)  (2) (3));
printf ("%d\n") (f3 ((- 1)) ((- 2)) ((- 3)));
printf  ("%d\n") (f3  ((- 1))  ((- 2)) ((- 3)));
printf  ("%d\n") (f3  ((- 1))  ((- 2)) ((- 3)));
let a = 1 in
let b = 2 in
printf ("%d+%d=%d\n") (a) (b) ((a + b));
printf  ("%d+%d=%d\n")  (a)  (b) ((a + b));
printf  ("%d+%d=%d\n")  (a)  (b) ((a + b));

