open Printf;;
let rec b = (fun (x) -> c (x))
and c = (fun (x) -> x  );;
let _ = 
printf  ("%d\n") (b (10));

