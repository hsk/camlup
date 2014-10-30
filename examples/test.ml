open Printf;;
open List;;

# 4 "?"
let (variable:int) = 2;;

# 6 "?"
let a = 
# 5 "?"
1;;

# 7 "?"
let b = 
# 6 "?"
2;;

# 8 "?"
let _ = 
# 7 "?"
3;;

# 9 "?"
let (block:unit) = 
# 12 "?"


# 11 "?"
printf ("test 1\n")
;;

# 18 "?"
let block = 
# 17 "?"


# 15 "?"
printf ("test 2\n");

# 16 "?"
printf ("test 2\n")
;;

# 19 "?"
let functions = (fun () -> 
# 22 "?"

  
# 21 "?"
printf ("test\n")
);;

# 22 "?"
functions (());;

# 116 "?"
let curry_function = 
# 115 "?"


# 26 "?"
let (f0:(unit)->(int)) = begin fun t1'  -> match t1' with
  | (()) -> (

    0
  )
 end  in

# 27 "?"
printf ("%d\n") (f0 (()));

# 28 "?"
let (f0:(unit)->(int)) = (fun () -> 
  0
) in

# 29 "?"
printf ("%d\n") (f0 (()));

# 30 "?"
let (f0:(unit)->(int)) = (fun () -> 0) in

# 31 "?"
printf ("%d\n") (f0 (()));

# 32 "?"
let f0 = (fun () -> 0) in

# 34 "?"
printf ("%d\n") (f0 (()));

# 35 "?"
printf  ("%d\n") (f0 (()));

# 36 "?"
printf  ("%d\n") (f0 (()));

# 38 "?"
let (f1:((int))->(int)) = begin fun t1'  -> match t1' with
  | (a) -> (

    a
  )
 end  in

# 39 "?"
printf  ("%d\n") (f1 (1));

# 40 "?"
let (f1:(int)->(int)) = (fun (a:int) -> 
  a
) in

# 41 "?"
printf  ("%d\n") (f1 (1));

# 42 "?"
let (f1:(int)->(int)) = (fun (a:int) -> 
# 43 "?"
a) in
printf  ("%d\n") (f1 (1));

# 44 "?"
let f1 = (fun (a:int) -> 
# 45 "?"
a) in

# 46 "?"
printf ("%d\n") (f1 (1));

# 47 "?"
printf  ("%d\n") (f1 (1));

# 48 "?"
printf  ("%d\n") (f1 (1));

# 50 "?"
let (f2:(int)->((int)->(int))) = begin fun t1' t2'  -> match t1',t2' with
  | (a),(b) -> (

    (a + b)
  )
 end  in

# 51 "?"
printf  ("%d\n") (f2  (1) (2));

# 52 "?"
let (f2:(int)->(((int))->(int))) = (fun (a:int) -> begin fun t1'  -> match t1' with
    | (b) -> (

      (a + b)
    )
   end ) in

# 53 "?"
printf  ("%d\n") (f2  (1) (2));

# 54 "?"
let (f2:(int)->((int)->(int))) = (fun (a:int) -> (fun (b:int) -> 
    (a + b)
  )) in

# 55 "?"
printf  ("%d\n") (f2  (1) (2));

# 56 "?"
let (f2:(int)->((int)->(int))) = (fun (a:int) (b:int) -> 
# 57 "?"
(
# 56 "?"
a + 
# 57 "?"
b)) in
printf  ("%d\n") (f2  (1) (2));

# 58 "?"
let f2 = (fun (a:int) (b:int) -> 
# 59 "?"
(
# 58 "?"
a + 
# 59 "?"
b)) in

# 60 "?"
printf ("%d\n") (f2 (1) (2));

# 61 "?"
printf  ("%d\n") (f2  (1) (2));

# 62 "?"
printf  ("%d\n") (f2  (1) (2));

# 64 "?"
let (f3:(int)->((int)->((int)->(int)))) = begin fun t1' t2' t3'  -> match t1',t2',t3' with
  | (a),(b),(c) -> (

    ((a + b) + c)
  )
 end  in

# 65 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 66 "?"
let (f3:(int)->((int)->((int)->(int)))) = (fun (a:int) -> begin fun t1' t2'  -> match t1',t2' with
    | (b),(c) -> (

      ((a + b) + c)
    )
   end ) in

# 67 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 68 "?"
let (f3:(int)->((int)->((int)->(int)))) = (fun (a:int) -> (fun (b:int) -> begin fun t1'  -> match t1' with
      | (c) -> (

        ((a + b) + c)
      )
     end   )) in

# 69 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 70 "?"
let (f3:(int)->((int)->((int)->(int)))) = (fun (a:int) -> (fun (b:int) -> (fun (c:int) -> 
      ((a + b) + c)
    )  )) in

# 71 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 72 "?"
let (f3:(int)->((int)->((int)->(int)))) = (fun (a:int) (b:int) (c:int) -> 
# 73 "?"
(
# 72 "?"
(a + b) + 
# 73 "?"
c)) in
printf  ("%d\n") (f3  (1)  (2) (3));

# 74 "?"
let f3 = (fun (a:int) (b:int) (c:int) -> 
# 75 "?"
(
# 74 "?"
(a + b) + 
# 75 "?"
c)) in

# 76 "?"
printf ("%d\n") (f3 (1) (2) (3));

# 77 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 78 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 90 "?"

# 88 "?"

# 86 "?"

# 84 "?"

# 82 "?"

# 80 "?"
printf (
# 81 "?"
"%d %d %d %d\n") (
# 83 "?"
f0 (())) (
# 85 "?"
f1 (1)) (
# 87 "?"
f2 (1) (2)) (
# 89 "?"
f3 (1) (2) (3));

# 98 "?"

# 92 "?"
printf  (
# 93 "?"
"%d %d %d %d\n")  (
# 94 "?"
f0 (()))  (
# 95 "?"
f1 (1))  (
# 96 "?"
f2  (1) (2)) (
# 97 "?"
f3  (1)  (2) (3));

# 106 "?"

# 100 "?"
printf  (
# 101 "?"
"%d %d %d %d\n")  (
# 102 "?"
f0 (()))  (
# 103 "?"
f1 (1))  (
# 104 "?"
f2  (1) (2)) (
# 105 "?"
f3  (1)  (2) (3));

# 108 "?"
printf ("%d\n") (f3 ((- 1)) ((- 2)) ((- 3)));

# 109 "?"
printf  ("%d\n") (f3  ((- 1))  ((- 2)) ((- 3)));

# 110 "?"
printf  ("%d\n") (f3  ((- 1))  ((- 2)) ((- 3)));

# 112 "?"
printf ("%d+%d=%d\n") (a) (b) ((a + b));

# 113 "?"
printf  ("%d+%d=%d\n")  (a)  (b) ((a + b));

# 114 "?"
printf  ("%d+%d=%d\n")  (a)  (b) ((a + b))
;;

# 117 "?"
let if_else = (fun () -> 
# 125 "?"

  
# 120 "?"
(if 
# 119 "?"
(a < 10) then (printf ("b1\n"))  );
  
# 121 "?"
(if 
# 120 "?"
(a < 10) then (
    printf ("b2\n")
)  );
  
# 122 "?"
(if 
# 121 "?"
(a < 10) then (
    printf ("b2\n");
    printf ("b3\n")
)  );
  
# 124 "?"
(if 
# 122 "?"
(a > 10) then (printf ("a\n")  )else(printf ("b3\n")));
  
# 124 "?"
printf ((if (a < 1) then ("a\n"  )else("b1\n")))
);;

# 125 "?"
if_else (());;

# 127 "?"
let recursive_function = (fun () -> 
# 146 "?"

  
# 130 "?"
let rec (fib:((int))->(int)) = 
# 135 "?"
begin fun t1'  -> match t1' with
    | (
# 130 "?"
n) -> (

# 135 "?"

      (if 
# 131 "?"
(n = 0) then (0      )else(
# 135 "?"
(if 
# 132 "?"
(n = 1) then (1        )else(
# 134 "?"
(
# 133 "?"
fib ((n - 2)) + fib ((n - 1)))))))
    )
   end  in
  
# 145 "?"
printf  ("fib 10 %d\n") (fib (10))
);;

# 146 "?"
recursive_function (());;

# 148 "?"
let tuple = (fun () -> 
# 224 "?"

  
# 150 "?"
let (addt:((int * int))->(int)) = 
# 152 "?"
begin fun t1'  -> match t1' with
  | (
# 150 "?"
a , b) -> (

# 152 "?"

    (
# 151 "?"
a + 
# 152 "?"
b)
  )
 end  in
  
# 153 "?"
printf  ("%d\n") (addt (1 , 2));
  
# 214 "?"
let (f2:((int * int))->(((int * int))->(int))) = 
# 216 "?"
begin fun t1' t2'  -> match t1',t2' with
  | (
# 215 "?"
a , b),(c , d) -> (

# 216 "?"

    (
# 215 "?"
(a * b) + 
# 216 "?"
(
# 215 "?"
c * 
# 216 "?"
d))
  )
 end  in
  
# 222 "?"
printf ("%d\n") (f2 (1 , 2) (3 , 4));
  
# 223 "?"
printf  ("%d\n") (f2  (1 , 2) (3 , 4))
);;

# 224 "?"
tuple (());;

# 226 "?"
let pattern_match = (fun () -> 
# 247 "?"

  
# 228 "?"
let rec (fib:((int))->(int)) = 
# 234 "?"
begin fun t1'  -> match t1' with
    | (
# 228 "?"
n) -> (

# 229 "?"

      (match n with | (
# 230 "?"
0) -> (
        0
      
)| (
# 231 "?"
1) -> (
        1
      
)| (
# 232 "?"
n) -> (
# 233 "?"

        (
# 232 "?"
fib ((n - 2)) + fib ((n - 1)))
      
))
    )
   end  in
  
# 236 "?"
printf  ("fib 10 %d\n") (fib (10))
);;

# 247 "?"
pattern_match (());;

# 249 "?"
let parcial_function = (fun () -> 
# 267 "?"

  
# 251 "?"
let rec (fib:((int))->(int)) = 
# 255 "?"
begin fun t1'  -> match t1' with
    | (
# 252 "?"
0) -> (

      0
    )
    | (
# 253 "?"
1) -> (

      1
    )
    | (
# 254 "?"
n) -> (

# 255 "?"

      (
# 254 "?"
fib ((n - 2)) + fib ((n - 1)))
    )
   end  in
  
# 257 "?"
printf  ("fib 10 = %d\n") (fib (10));
  
# 261 "?"
let (llor:((int * int))->(int)) = 
# 264 "?"
begin fun t1'  -> match t1' with
  | (
# 262 "?"
0 , 0) -> (

    let a = 1 in
    let b = 2 in
    
# 263 "?"
(
# 262 "?"
a lor 
# 263 "?"
b)
  )
  | (a , b) -> (

# 264 "?"

    (
# 263 "?"
a lor 
# 264 "?"
b)
  )
 end  in
  
# 266 "?"
printf  ("llor %d\n") (llor (1 , 2))
);;

# 267 "?"
parcial_function (());;

# 269 "?"
let list = (fun () -> 
# 296 "?"

  
# 271 "?"
iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf ("%d\n") (x)
    )
   end ) ([1; 2; 3; 4]);
  
# 272 "?"
iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) ([1; 2; 3; 4]);
  
# 273 "?"
iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) ([1; 2; 3; 4]);
  
# 274 "?"
iter  (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) ([1; 2; 3; 4]);
  
# 276 "?"
iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) ([1; 2; 3; 4]);
  
# 277 "?"
iter (begin fun t1'  -> match t1' with
    | (x) -> (

      printf  ("%d\n") (x)
    )
   end ) ([1; 2; 3; 4]);
  
# 282 "?"

# 281 "?"

# 279 "?"
iter (
# 281 "?"
begin fun t1'  -> match t1' with
    | (
# 280 "?"
x) -> (

      printf  ("%d\n") (x)
    )
   end ) (
# 279 "?"
[1; 2; 3; 4]);
  
# 288 "?"

# 287 "?"

# 285 "?"
iter (
# 287 "?"
begin fun t1'  -> match t1' with
    | (
# 286 "?"
x) -> (

      printf  ("%d\n") (x)
    )
   end ) (
# 285 "?"

# 283 "?"
map (
# 285 "?"
begin fun t1'  -> match t1' with
    | (
# 284 "?"
x) -> (

# 285 "?"

      (
# 284 "?"
x * 10)
    )
   end ) (
# 283 "?"
[1; 2; 3; 4]))
);;

# 296 "?"
list (());;
type a = {x:int;y:int};;

# 300 "?"
let record = (fun () -> 
# 311 "?"

  
# 302 "?"
let (a:a) = {x=1;y=2} in
  
# 304 "?"
printf  ("%d\n") ((a . x));
  
# 306 "?"
printf  ("%d\n") (({x=(1 + (2 * 3));y=
let a = 1 in
a
} . x));
  
# 309 "?"
let aa = 
# 308 "?"
begin fun t1'  -> match t1' with
  | ({x}) -> (

    printf  ("%d\n") (x)
  )
 end  in
  
# 310 "?"
aa ({x=1;y=2})
);;

# 311 "?"
record (());;
type e = EUnit|EInt of (int)|EAdd of (e * e);;

# 315 "?"
let variant = (fun () -> 
# 324 "?"

  
# 317 "?"
let rec (eval:(e)->(int)) = 
# 321 "?"
begin fun t1'  -> match t1' with
    | (
# 318 "?"
EUnit) -> (

      0
    )
    | (
# 319 "?"
EInt (i)) -> (

# 320 "?"

      i
    )
    | (EAdd (a , b)) -> (

# 321 "?"

      (
# 320 "?"
eval (a) + eval (b))
    )
   end  in
  
# 323 "?"
printf  ("1+2=%d\n") (eval (EAdd (EInt (1) , EInt (2))))
);;

# 324 "?"
variant (());;

# 326 "?"
let reference = (fun () -> 
# 340 "?"

  
# 329 "?"
let a = (ref 
# 328 "?"
1) in
  
# 329 "?"
(a := 2);
  
# 330 "?"
printf  ("%d\n") ((! a));
  
# 332 "?"
incr (a);
  printf  ("%d\n") ((! a));
  
# 334 "?"
let b = 
# 335 "?"
(ref 
# 334 "?"
1) in
  
# 336 "?"
incr (b);
  
# 337 "?"
printf  ("++ %d\n") ((! b));
  
# 339 "?"
decr (b);
  printf  ("-- %d\n") ((! b))
);;

# 340 "?"
reference (());;

# 342 "?"
let closure = (fun () -> 
# 374 "?"

  
# 344 "?"
let block = (fun sp -> (fun f -> 
# 348 "?"

    
# 345 "?"
printf ("{\n");
    
# 346 "?"
f ((sp ^ "  "));
    
# 347 "?"
printf  ("%s}\n") (sp)
  )) in
  
# 350 "?"
let p = printf in
  
# 351 "?"
p  ("def %s() ") ("a");
  
# 357 "?"

# 351 "?"
block ("") (
# 357 "?"
begin fun t1'  -> match t1' with
    | (
# 351 "?"
sp) -> (

# 352 "?"

      p  ("%sdef %s() ")  (sp) ("b");
      
# 355 "?"

# 352 "?"
block (sp) (
# 355 "?"
begin fun t1'  -> match t1' with
        | (
# 352 "?"
sp) -> (

# 353 "?"

          p  ("%sprogram2()\n") (sp);
          
# 354 "?"
p  ("%sprogram2()\n") (sp)
        )
       end );
      
# 356 "?"
p  ("%sprogram()\n") (sp)
    )
   end );
  
# 360 "?"
let block = (fun sp -> (fun f -> 
# 364 "?"

    
# 361 "?"
printf ("{\n");
    
# 362 "?"
f ((sp ^ "  "));
    
# 363 "?"
printf  ("%s}\n") (sp)
  )) in
  
# 366 "?"
let p = printf in
  
# 367 "?"
p  ("def %s() ") ("a");
  
# 373 "?"

# 367 "?"
block ("") (
# 373 "?"
begin fun t1'  -> match t1' with
    | (
# 367 "?"
sp) -> (

# 368 "?"

      p  ("%sdef %s() ")  (sp) ("b");
      
# 371 "?"

# 368 "?"
block (sp) (
# 371 "?"
begin fun t1'  -> match t1' with
        | (
# 368 "?"
sp) -> (

# 369 "?"

          p  ("%sprogram2()\n") (sp);
          
# 370 "?"
p  ("%sprogram2()\n") (sp)
        )
       end );
      
# 372 "?"
p  ("%sprogram()\n") (sp)
    )
   end )
);;

# 374 "?"
closure (());;

# 409 "?"
let list_type = 
# 408 "?"


# 379 "?"
let ls = 
# 378 "?"
[1; 2; 3] in

# 382 "?"

# 380 "?"
iter (
# 382 "?"
begin fun t1'  -> match t1' with
  | (
# 381 "?"
l) -> (

    printf  ("%d,") (l)
  )
 end ) (
# 380 "?"
ls);

# 382 "?"
printf ("\n");

# 384 "?"
let (ls:(int) list) = [1; 2; 3] in

# 388 "?"

# 386 "?"
iter (
# 388 "?"
begin fun t1'  -> match t1' with
  | (
# 387 "?"
l) -> (

    printf  ("%d,") (l)
  )
 end ) (
# 386 "?"
ls);

# 388 "?"
printf ("\n");

# 390 "?"
let (ls:((int * int)) list) = [1 , 2; 3 , 4] in

# 395 "?"

# 392 "?"
iter (
# 395 "?"
begin fun t1'  -> match t1' with
  | (
# 393 "?"
l , r) -> (

# 394 "?"

    printf  ("(%d,%d);")  (l) (r)
  )
 end ) (
# 392 "?"
ls);

# 395 "?"
printf ("\n");

# 403 "?"
let rec f = 
# 402 "?"
begin fun t1'  -> match t1' with
  | (
# 398 "?"
[]) -> (

    ()
  )
  | (
# 399 "?"
(x :: xs)) -> (

# 400 "?"

    printf  ("%d,\n") (x);
    
# 401 "?"
f (xs)
  )
 end  in

# 404 "?"
f ([1; 2; 3]);

# 407 "?"

# 406 "?"
printf  ("1+20=%d\n") (
# 407 "?"
(
# 406 "?"
1 + 
# 407 "?"
20))
;;

# 419 "?"
let whens = 
# 418 "?"


# 412 "?"
let rec (fib:((int))->(int)) = 
# 416 "?"
begin fun t1'  -> match t1' with
  | (
# 413 "?"
n) when (n = 0) -> (

    0
  )
  | (
# 414 "?"
n) when (n = 1) -> (

    1
  )
  | (
# 415 "?"
n) -> (

# 416 "?"

    (
# 415 "?"
fib ((n - 2)) + fib ((n - 1)))
  )
 end  in

# 417 "?"
printf  ("fib 11 %d\n") (fib (11))
;;
module A = struct

# 422 "?"
let a = 
# 421 "?"
1234;;

# 422 "?"
let inc = (fun k -> 
# 423 "?"
(
# 422 "?"
k + 1))
end;;

# 429 "?"
let _ = 
# 428 "?"


# 427 "?"
printf  ("A.a = %d A.inc(10) = %d\n")  ((A . a)) ((A . inc (10)))
;;
class ab = object

# 433 "?"
val a = 
# 432 "?"
123

# 435 "?"
method c = a
end;;

# 445 "?"
let _ = 
# 444 "?"


# 443 "?"
printf  ("ab.a = %d\n") (((new ab) # c))
;;
class abc (b:int)(c:int) = object

# 449 "?"
method c = b
end;;

# 456 "?"
let _ = 
# 455 "?"


# 453 "?"
printf  ("ab.a = %d\n") (((new abc  (10) (20)) # c));

# 454 "?"
printf  ("ab.a = %d\n") (((2 * 3) + 1))
;;
class fib (x:int) = object

# 465 "?"
method apply = 
# 459 "?"
(match x with | (
# 460 "?"
0) -> (
  0

)| (
# 461 "?"
1) -> (
  1

)| (
# 462 "?"
n) -> (
# 464 "?"

  (
# 462 "?"
((new fib ((x - 2))) # apply) + 
# 464 "?"
(
# 463 "?"
(new fib ((x - 1))) # 
# 464 "?"
apply))

))
end;;

# 472 "?"
let _ = 
# 471 "?"


# 469 "?"
printf  ("A.a = %d\n") (((new fib (10)) # apply));

# 470 "?"
printf  ("%d %d\n")  (((1 + 2) - 3)) ((- 1))
;;

# 492 "?"
let array_and_loop = 
# 491 "?"


# 475 "?"
let a = 
# 474 "?"
[|1; 2; 3|] in

# 475 "?"
printf  ("%d%d%d\n")  (a .(0))  (a .(1)) (a .(2));

# 478 "?"
(
# 477 "?"
a .(0) <- 100);

# 481 "?"
for i = 
# 478 "?"
0 to 2 do 
# 480 "?"


# 479 "?"
printf  ("for %d\n") (a .(i))
 done;

# 485 "?"
for i = 
# 482 "?"
10 downto 1 do 
# 484 "?"


# 483 "?"
printf  ("for %d\n") (i)
 done;

# 487 "?"
let i = (ref 
# 486 "?"
0) in

# 491 "?"
while 
# 487 "?"
((! i) < 3) do 
# 490 "?"


# 489 "?"
incr (i);
printf  ("while %d\n") ((! i))
 done
;;

# 502 "?"
let variants = 
# 501 "?"


# 500 "?"
let rec eval = 
# 499 "?"
begin fun t1'  -> match t1' with
  | (
# 496 "?"
`int (n)) -> (

# 497 "?"

    n
  )
  | (`add (a , b)) -> (

# 498 "?"

    (
# 497 "?"
eval (a) + eval (b))
  )
  | (
# 498 "?"
`mul (a , b)) -> (

# 499 "?"

    (
# 498 "?"
eval (a) * eval (b))
  )
 end  in

# 500 "?"
printf  ("%d\n") (eval (`add (`mul (`int (10) , `int (20)) , `int (20))))
;;

# 510 "?"
let keyword_params = 
# 509 "?"


# 504 "?"
let f = (fun ?(a:int=(1)) ~(b:int) ~(c) d -> 
# 505 "?"
(
# 504 "?"
((a + b) + c) + 
# 505 "?"
d)) in
printf  ("%d\n") (f  ~a:(1)  ~b:(2)  ~c:(5) (3));

# 507 "?"
let f = (fun ?(a:int=(1)) ~(b:int) ~(c) d -> 
# 508 "?"
(
# 507 "?"
((a + b) + c) + 
# 508 "?"
d)) in
printf  ("%d\n") (f  ~a:(1)  ~b:(2)  ~c:(5) (3))
;;

# 516 "?"
let floats = 
# 515 "?"


# 513 "?"
let n = 
# 512 "?"
1.234000 in

# 514 "?"
let m = (
# 513 "?"
n +. 10.500000) in

# 514 "?"
printf  ("%f\n") (m)

