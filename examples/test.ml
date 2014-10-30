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
# 312 "?"

  
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

# 312 "?"
record (());;
type e = EUnit|EInt of (int)|EAdd of (e * e);;

# 316 "?"
let variant = (fun () -> 
# 325 "?"

  
# 318 "?"
let rec (eval:(e)->(int)) = 
# 322 "?"
begin fun t1'  -> match t1' with
    | (
# 319 "?"
EUnit) -> (

      0
    )
    | (
# 320 "?"
EInt (i)) -> (

# 321 "?"

      i
    )
    | (EAdd (a , b)) -> (

# 322 "?"

      (
# 321 "?"
eval (a) + eval (b))
    )
   end  in
  
# 324 "?"
printf  ("1+2=%d\n") (eval (EAdd (EInt (1) , EInt (2))))
);;

# 325 "?"
variant (());;

# 327 "?"
let reference = (fun () -> 
# 341 "?"

  
# 330 "?"
let a = (ref 
# 329 "?"
1) in
  
# 330 "?"
(a := 2);
  
# 331 "?"
printf  ("%d\n") ((! a));
  
# 333 "?"
incr (a);
  printf  ("%d\n") ((! a));
  
# 335 "?"
let b = 
# 336 "?"
(ref 
# 335 "?"
1) in
  
# 337 "?"
incr (b);
  
# 338 "?"
printf  ("++ %d\n") ((! b));
  
# 340 "?"
decr (b);
  printf  ("-- %d\n") ((! b))
);;

# 341 "?"
reference (());;

# 343 "?"
let closure = (fun () -> 
# 375 "?"

  
# 345 "?"
let block = (fun sp -> (fun f -> 
# 349 "?"

    
# 346 "?"
printf ("{\n");
    
# 347 "?"
f ((sp ^ "  "));
    
# 348 "?"
printf  ("%s}\n") (sp)
  )) in
  
# 351 "?"
let p = printf in
  
# 352 "?"
p  ("def %s() ") ("a");
  
# 358 "?"

# 352 "?"
block ("") (
# 358 "?"
begin fun t1'  -> match t1' with
    | (
# 352 "?"
sp) -> (

# 353 "?"

      p  ("%sdef %s() ")  (sp) ("b");
      
# 356 "?"

# 353 "?"
block (sp) (
# 356 "?"
begin fun t1'  -> match t1' with
        | (
# 353 "?"
sp) -> (

# 354 "?"

          p  ("%sprogram2()\n") (sp);
          
# 355 "?"
p  ("%sprogram2()\n") (sp)
        )
       end );
      
# 357 "?"
p  ("%sprogram()\n") (sp)
    )
   end );
  
# 361 "?"
let block = (fun sp -> (fun f -> 
# 365 "?"

    
# 362 "?"
printf ("{\n");
    
# 363 "?"
f ((sp ^ "  "));
    
# 364 "?"
printf  ("%s}\n") (sp)
  )) in
  
# 367 "?"
let p = printf in
  
# 368 "?"
p  ("def %s() ") ("a");
  
# 374 "?"

# 368 "?"
block ("") (
# 374 "?"
begin fun t1'  -> match t1' with
    | (
# 368 "?"
sp) -> (

# 369 "?"

      p  ("%sdef %s() ")  (sp) ("b");
      
# 372 "?"

# 369 "?"
block (sp) (
# 372 "?"
begin fun t1'  -> match t1' with
        | (
# 369 "?"
sp) -> (

# 370 "?"

          p  ("%sprogram2()\n") (sp);
          
# 371 "?"
p  ("%sprogram2()\n") (sp)
        )
       end );
      
# 373 "?"
p  ("%sprogram()\n") (sp)
    )
   end )
);;

# 375 "?"
closure (());;

# 410 "?"
let list_type = 
# 409 "?"


# 380 "?"
let ls = 
# 379 "?"
[1; 2; 3] in

# 383 "?"

# 381 "?"
iter (
# 383 "?"
begin fun t1'  -> match t1' with
  | (
# 382 "?"
l) -> (

    printf  ("%d,") (l)
  )
 end ) (
# 381 "?"
ls);

# 383 "?"
printf ("\n");

# 385 "?"
let (ls:(int) list) = [1; 2; 3] in

# 389 "?"

# 387 "?"
iter (
# 389 "?"
begin fun t1'  -> match t1' with
  | (
# 388 "?"
l) -> (

    printf  ("%d,") (l)
  )
 end ) (
# 387 "?"
ls);

# 389 "?"
printf ("\n");

# 391 "?"
let (ls:((int * int)) list) = [1 , 2; 3 , 4] in

# 396 "?"

# 393 "?"
iter (
# 396 "?"
begin fun t1'  -> match t1' with
  | (
# 394 "?"
l , r) -> (

# 395 "?"

    printf  ("(%d,%d);")  (l) (r)
  )
 end ) (
# 393 "?"
ls);

# 396 "?"
printf ("\n");

# 404 "?"
let rec f = 
# 403 "?"
begin fun t1'  -> match t1' with
  | (
# 399 "?"
[]) -> (

    ()
  )
  | (
# 400 "?"
(x :: xs)) -> (

# 401 "?"

    printf  ("%d,\n") (x);
    
# 402 "?"
f (xs)
  )
 end  in

# 405 "?"
f ([1; 2; 3]);

# 408 "?"

# 407 "?"
printf  ("1+20=%d\n") (
# 408 "?"
(
# 407 "?"
1 + 
# 408 "?"
20))
;;

# 420 "?"
let whens = 
# 419 "?"


# 413 "?"
let rec (fib:((int))->(int)) = 
# 417 "?"
begin fun t1'  -> match t1' with
  | (
# 414 "?"
n) when (n = 0) -> (

    0
  )
  | (
# 415 "?"
n) when (n = 1) -> (

    1
  )
  | (
# 416 "?"
n) -> (

# 417 "?"

    (
# 416 "?"
fib ((n - 2)) + fib ((n - 1)))
  )
 end  in

# 418 "?"
printf  ("fib 11 %d\n") (fib (11))
;;
module A = struct

# 423 "?"
let a = 
# 422 "?"
1234;;

# 423 "?"
let inc = (fun k -> 
# 424 "?"
(
# 423 "?"
k + 1))
end;;

# 430 "?"
let _ = 
# 429 "?"


# 428 "?"
printf  ("A.a = %d A.inc(10) = %d\n")  ((A . a)) ((A . inc (10)))
;;
class ab = object

# 434 "?"
val a = 
# 433 "?"
123

# 436 "?"
method c = a
end;;

# 446 "?"
let _ = 
# 445 "?"


# 444 "?"
printf  ("ab.a = %d\n") (((new ab) # c))
;;
class abc (b:int)(c:int) = object

# 450 "?"
method c = b
end;;

# 457 "?"
let _ = 
# 456 "?"


# 454 "?"
printf  ("ab.a = %d\n") (((new abc  (10) (20)) # c));

# 455 "?"
printf  ("ab.a = %d\n") (((2 * 3) + 1))
;;
class fib (x:int) = object

# 466 "?"
method apply = 
# 460 "?"
(match x with | (
# 461 "?"
0) -> (
  0

)| (
# 462 "?"
1) -> (
  1

)| (
# 463 "?"
n) -> (
# 465 "?"

  (
# 463 "?"
((new fib ((x - 2))) # apply) + 
# 465 "?"
(
# 464 "?"
(new fib ((x - 1))) # 
# 465 "?"
apply))

))
end;;

# 474 "?"
let _ = 
# 473 "?"


# 470 "?"
printf  ("A.a = %d\n") (((new fib (10)) # apply));

# 471 "?"
printf  ("%d %d\n")  (((1 + 2) - 3)) ((- 1))
;;

# 493 "?"
let array_and_loop = 
# 492 "?"


# 477 "?"
let a = 
# 476 "?"
[|1; 2; 3|] in

# 477 "?"
printf  ("%d%d%d\n")  (a .(0))  (a .(1)) (a .(2));

# 482 "?"
for i = 
# 479 "?"
0 to 3 do 
# 481 "?"


# 480 "?"
printf  ("%d\n") (i)
 done;

# 486 "?"
for i = 
# 483 "?"
10 downto 1 do 
# 485 "?"


# 484 "?"
printf  ("%d\n") (i)
 done;

# 488 "?"
let i = (ref 
# 487 "?"
0) in

# 492 "?"
while 
# 488 "?"
((! i) < 3) do 
# 491 "?"


# 490 "?"
incr (i);
printf  ("while %d\n") ((! i))
 done
;;

# 503 "?"
let variants = 
# 502 "?"


# 501 "?"
let rec eval = 
# 500 "?"
begin fun t1'  -> match t1' with
  | (
# 497 "?"
`int (n)) -> (

# 498 "?"

    n
  )
  | (`add (a , b)) -> (

# 499 "?"

    (
# 498 "?"
eval (a) + eval (b))
  )
  | (
# 499 "?"
`mul (a , b)) -> (

# 500 "?"

    (
# 499 "?"
eval (a) * eval (b))
  )
 end  in

# 501 "?"
printf  ("%d\n") (eval (`add (`mul (`int (10) , `int (20)) , `int (20))))
;;

# 511 "?"
let keyword_params = 
# 510 "?"


# 505 "?"
let f = (fun ?(a:int=(1)) ~(b:int) ~(c) d -> 
# 506 "?"
(
# 505 "?"
((a + b) + c) + 
# 506 "?"
d)) in
printf  ("%d\n") (f  ~a:(1)  ~b:(2)  ~c:(5) (3));

# 508 "?"
let f = (fun ?(a:int=(1)) ~(b:int) ~(c) d -> 
# 509 "?"
(
# 508 "?"
((a + b) + c) + 
# 509 "?"
d)) in
printf  ("%d\n") (f  ~a:(1)  ~b:(2)  ~c:(5) (3))
;;

# 517 "?"
let floats = 
# 516 "?"


# 514 "?"
let n = 
# 513 "?"
1.234000 in

# 515 "?"
let m = (
# 514 "?"
n +. 10.500000) in

# 515 "?"
printf  ("%f\n") (m)

