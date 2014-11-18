open Printf;; open List;; 
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
let functions = (fun ()  -> 
# 28 "?"
   
# 27 "?"
printf ("test\n")
);; 
# 28 "?"
functions ();; 
# 30 "?"
let curry_function = 
# 121 "?"
 
# 32 "?"
let (f0:(unit)->(int)) = begin fun t1'  -> match t1' with   | (()) -> (     0
  ) end  in

# 33 "?"
printf ("%d\n") (f0 ());

# 34 "?"
let (f0:(unit)->(int)) = (fun ()  ->    0
) in

# 35 "?"
printf ("%d\n") (f0 ());

# 36 "?"
let (f0:(unit)->(int)) = (fun ()  -> 0) in

# 37 "?"
printf ("%d\n") (f0 ());

# 38 "?"
let f0 = (fun ()  -> 0) in

# 40 "?"
printf ("%d\n") (f0 ());

# 41 "?"
printf  ("%d\n") (f0 ());

# 42 "?"
printf  ("%d\n") (f0 ());

# 44 "?"
let (f1:((int))->(int)) = begin fun t1'  -> match t1' with   | (a) -> (     a
  ) end  in

# 45 "?"
printf  ("%d\n") (f1 (1));

# 46 "?"
let (f1:(int)->(int)) = (fun (a:int)  ->    a
) in

# 47 "?"
printf  ("%d\n") (f1 (1));

# 48 "?"
let (f1:(int)->(int)) = (fun (a:int)  -> a) in

# 49 "?"
printf  ("%d\n") (f1 (1));

# 50 "?"
let f1 = (fun (a:int)  -> a) in

# 52 "?"
printf ("%d\n") (f1 (1));

# 53 "?"
printf  ("%d\n") (f1 (1));

# 54 "?"
printf  ("%d\n") (f1 (1));

# 56 "?"
let (f2:(int)->((int)->(int))) = begin fun t1' t2'  -> match t1',t2' with   | (a),(b) -> (     (a + b)
  ) end  in

# 57 "?"
printf  ("%d\n") (f2  (1) (2));

# 58 "?"
let (f2:(int)->(((int))->(int))) = (fun (a:int)  -> begin fun t1'  -> match t1' with     | (b) -> (       (a + b)
    )   end ) in

# 59 "?"
printf  ("%d\n") (f2  (1) (2));

# 60 "?"
let (f2:(int)->((int)->(int))) = (fun (a:int)  -> (fun (b:int)  ->      (a + b)
  )) in

# 61 "?"
printf  ("%d\n") (f2  (1) (2));

# 62 "?"
let (f2:(int)->((int)->(int))) = (fun (a:int) (b:int)  -> (a + b)) in

# 63 "?"
printf  ("%d\n") (f2  (1) (2));

# 64 "?"
let f2 = (fun (a:int) (b:int)  -> (a + b)) in

# 66 "?"
printf ("%d\n") (f2 (1) (2));

# 67 "?"
printf  ("%d\n") (f2  (1) (2));

# 68 "?"
printf  ("%d\n") (f2  (1) (2));

# 70 "?"
let (f3:(int)->((int)->((int)->(int)))) = begin fun t1' t2' t3'  -> match t1',t2',t3' with   | (a),(b),(c) -> (     ((a + b) + c)
  ) end  in

# 71 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 72 "?"
let (f3:(int)->((int)->((int)->(int)))) = (fun (a:int)  -> begin fun t1' t2'  -> match t1',t2' with     | (b),(c) -> (       ((a + b) + c)
    )   end ) in

# 73 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 74 "?"
let (f3:(int)->((int)->((int)->(int)))) = (fun (a:int)  -> (fun (b:int)  -> begin fun t1'  -> match t1' with       | (c) -> (         ((a + b) + c)
      )     end   )) in

# 75 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 76 "?"
let (f3:(int)->((int)->((int)->(int)))) = (fun (a:int)  -> (fun (b:int)  -> (fun (c:int)  ->        ((a + b) + c)
    )  )) in

# 77 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 78 "?"
let (f3:(int)->((int)->((int)->(int)))) = (fun (a:int) (b:int) (c:int)  -> ((a + b) + c)) in

# 79 "?"
printf  ("%d\n") (f3  (1)  (2) (3));

# 80 "?"
let f3 = (fun (a:int) (b:int) (c:int)  -> ((a + b) + c)) in

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
f0 ()) (
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
f0 ())  (
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
f0 ())  (
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
let if_else = (fun ()  -> 
# 131 "?"
   
# 125 "?"
(if (a < 10) then (printf ("b1\n"))  );
  
# 126 "?"
(if (a < 10) then (     printf ("b2\n")
)  );
  
# 127 "?"
(if (a < 10) then (     printf ("b2\n");
    printf ("b3\n")
)  );
  
# 128 "?"
(if (a > 10) then (printf ("a\n")  )else(printf ("b3\n")));
  
# 130 "?"
printf ((if (a < 1) then ("a\n"  )else("b1\n")))
);; 
# 131 "?"
if_else ();; 
# 133 "?"
let recursive_function = (fun ()  -> 
# 152 "?"
   
# 136 "?"
let rec (fib:((int))->(int)) = 
# 141 "?"
begin fun t1'  -> match t1' with     | (
# 136 "?"
n) -> (
# 137 "?"
       (if (n = 0) then (0      )else(
# 138 "?"
(if (n = 1) then (1        )else(
# 139 "?"
(fib ((n - 2)) + fib ((n - 1)))))))
    )   end  in
  
# 151 "?"
printf  ("fib 10 %d\n") (fib (10))
);; 
# 152 "?"
recursive_function ();; 
# 154 "?"
let tuple = (fun ()  -> 
# 240 "?"
   
# 156 "?"
let (addt:((int * int))->(int)) = 
# 158 "?"
begin fun t1'  -> match t1' with   | (
# 156 "?"
a , b) -> (
# 157 "?"
     (a + b)
  ) end  in
  
# 159 "?"
printf  ("%d\n") (addt (1 , 2));
  
# 161 "?"
let x , y = 1 , 2 in
  
# 162 "?"
printf  ("%d %d\n")  (x) (y);
  
# 164 "?"
let x , y = (if true then (
# 165 "?"
( 1 , 2) , ( 3 , 4))else(
# 167 "?"
( 5 , 6) , ( 7 , 8))) in
  
# 169 "?"
printf  ("*** %d %d\n")  (addt (x)) (addt (y));
  
# 230 "?"
let (f2:((int * int))->(((int * int))->(int))) = 
# 232 "?"
begin fun t1' t2'  -> match t1',t2' with   | (
# 231 "?"
a , b),(c , d) -> (     ((a * b) + (c * d))
  ) end  in
  
# 238 "?"
printf ("%d\n") (f2 (1 , 2) (3 , 4));
  
# 239 "?"
printf  ("%d\n") (f2  (1 , 2) (3 , 4))
);; 
# 240 "?"
tuple ();; 
# 242 "?"
let pattern_match = (fun ()  -> 
# 263 "?"
   
# 244 "?"
let rec (fib:((int))->(int)) = 
# 250 "?"
begin fun t1'  -> match t1' with     | (
# 244 "?"
n) -> (
# 245 "?"
       (match n with | (
# 246 "?"
0)-> (         0
      )| (
# 247 "?"
1)-> (         1
      )| (
# 248 "?"
n)-> (         (fib ((n - 2)) + fib ((n - 1)))
      ))
    )   end  in
  
# 252 "?"
printf  ("fib 10 %d\n") (fib (10))
);; 
# 263 "?"
pattern_match ();; 
# 265 "?"
let parcial_function = (fun ()  -> 
# 283 "?"
   
# 267 "?"
let rec (fib:((int))->(int)) = 
# 271 "?"
begin fun t1'  -> match t1' with     | (
# 268 "?"
0) -> (       0
    )    | (
# 269 "?"
1) -> (       1
    )    | (
# 270 "?"
n) -> (       (fib ((n - 2)) + fib ((n - 1)))
    )   end  in
  
# 273 "?"
printf  ("fib 10 = %d\n") (fib (10));
  
# 277 "?"
let (llor:((int * int))->(int)) = 
# 280 "?"
begin fun t1'  -> match t1' with   | (
# 278 "?"
0 , 0) -> (     let a = 1 in
    let b = 2 in
    (a lor b)
  )  | (
# 279 "?"
a , b) -> (     (a lor b)
  ) end  in
  
# 282 "?"
printf  ("llor %d\n") (llor (1 , 2))
);; 
# 283 "?"
parcial_function ();; 
# 285 "?"
let list = (fun ()  -> 
# 312 "?"
   
# 287 "?"
iter (begin fun t1'  -> match t1' with     | (x) -> (       printf ("%d\n") (x)
    )   end ) ([1; 2; 3; 4]);
  
# 288 "?"
iter (begin fun t1'  -> match t1' with     | (x) -> (       printf  ("%d\n") (x)
    )   end ) ([1; 2; 3; 4]);
  
# 289 "?"
iter (begin fun t1'  -> match t1' with     | (x) -> (       printf  ("%d\n") (x)
    )   end ) ([1; 2; 3; 4]);
  
# 290 "?"
iter  (begin fun t1'  -> match t1' with     | (x) -> (       printf  ("%d\n") (x)
    )   end ) ([1; 2; 3; 4]);
  
# 292 "?"
iter (begin fun t1'  -> match t1' with     | (x) -> (       printf  ("%d\n") (x)
    )   end ) ([1; 2; 3; 4]);
  
# 293 "?"
iter (begin fun t1'  -> match t1' with     | (x) -> (       printf  ("%d\n") (x)
    )   end ) ([1; 2; 3; 4]);
  
# 295 "?"
iter (
# 297 "?"
begin fun t1'  -> match t1' with     | (
# 296 "?"
x) -> (       printf  ("%d\n") (x)
    )   end ) (
# 295 "?"
[1; 2; 3; 4]);
  
# 299 "?"

# 301 "?"
iter (
# 303 "?"
begin fun t1'  -> match t1' with     | (
# 302 "?"
x) -> (       printf  ("%d\n") (x)
    )   end ) (
# 299 "?"
map (
# 301 "?"
begin fun t1'  -> match t1' with     | (
# 300 "?"
x) -> (       (x * 10)
    )   end ) (
# 299 "?"
[1; 2; 3; 4]))
);; 
# 312 "?"
list ();; type a = {x:int;y:int};; 
# 316 "?"
let record = (fun ()  -> 
# 327 "?"
   
# 318 "?"
let (a:a) = {x=1;y=2} in
  
# 320 "?"
printf  ("%d\n") ((a . x));
  
# 322 "?"
printf  ("%d\n") (({x=(1 + (2 * 3));y= let a = 1 in
a
} . x));
  
# 324 "?"
let aa = begin fun t1'  -> match t1' with   | ({x}) -> (     printf  ("%d\n") (x)
  ) end  in
  
# 326 "?"
aa ({x=1;y=2})
);; 
# 327 "?"
record ();; type e = EUnit|EInt of (int)|EAdd of (e * e);; 
# 331 "?"
let variant = (fun ()  -> 
# 340 "?"
   
# 333 "?"
let rec (eval:(e)->(int)) = 
# 337 "?"
begin fun t1'  -> match t1' with     | (
# 334 "?"
EUnit) -> (       0
    )    | (
# 335 "?"
EInt (i)) -> (       i
    )    | (
# 336 "?"
EAdd (a , b)) -> (       (eval (a) + eval (b))
    )   end  in
  
# 339 "?"
printf  ("1+2=%d\n") (eval (EAdd (EInt (1) , EInt (2))))
);; 
# 340 "?"
variant ();; 
# 342 "?"
let reference = (fun ()  -> 
# 356 "?"
   
# 344 "?"
let a = (ref 1) in
  
# 345 "?"
(a := 2);
  
# 346 "?"
printf  ("%d\n") ((! a));
  
# 347 "?"
incr (a);
  
# 348 "?"
printf  ("%d\n") ((! a));
  
# 350 "?"
let b = (ref 1) in
  
# 351 "?"
incr (b);
  
# 353 "?"
printf  ("++ %d\n") ((! b));
  
# 354 "?"
decr (b);
  
# 355 "?"
printf  ("-- %d\n") ((! b))
);; 
# 356 "?"
reference ();; 
# 358 "?"
let closure = (fun ()  -> 
# 390 "?"
   
# 360 "?"
let block = (fun sp  -> (fun f  -> 
# 364 "?"
     
# 361 "?"
printf ("{\n");
    
# 362 "?"
f ((sp ^ "  "));
    
# 363 "?"
printf  ("%s}\n") (sp)
  )) in
  
# 365 "?"
let p = printf in
  
# 367 "?"
p  ("def %s() ") ("a");
  block ("") (
# 373 "?"
begin fun t1'  -> match t1' with     | (
# 367 "?"
sp) -> (
# 368 "?"
       p  ("%sdef %s() ")  (sp) ("b");
      block (sp) (
# 371 "?"
begin fun t1'  -> match t1' with         | (
# 368 "?"
sp) -> (
# 369 "?"
           p  ("%sprogram2()\n") (sp);
          
# 370 "?"
p  ("%sprogram2()\n") (sp)
        )       end );
      
# 372 "?"
p  ("%sprogram()\n") (sp)
    )   end );
  
# 376 "?"
let block = (fun sp  -> (fun f  -> 
# 380 "?"
     
# 377 "?"
printf ("{\n");
    
# 378 "?"
f ((sp ^ "  "));
    
# 379 "?"
printf  ("%s}\n") (sp)
  )) in
  
# 381 "?"
let p = printf in
  
# 383 "?"
p  ("def %s() ") ("a");
  block ("") (
# 389 "?"
begin fun t1'  -> match t1' with     | (
# 383 "?"
sp) -> (
# 384 "?"
       p  ("%sdef %s() ")  (sp) ("b");
      block (sp) (
# 387 "?"
begin fun t1'  -> match t1' with         | (
# 384 "?"
sp) -> (
# 385 "?"
           p  ("%sprogram2()\n") (sp);
          
# 386 "?"
p  ("%sprogram2()\n") (sp)
        )       end );
      
# 388 "?"
p  ("%sprogram()\n") (sp)
    )   end )
);; 
# 390 "?"
closure ();; 
# 392 "?"
let list_type = 
# 424 "?"
 
# 394 "?"
let ls = [1; 2; 3] in

# 396 "?"
iter (
# 398 "?"
begin fun t1'  -> match t1' with   | (
# 397 "?"
l) -> (     printf  ("%d,") (l)
  ) end ) (
# 396 "?"
ls);

# 398 "?"
printf ("\n");

# 400 "?"
let (ls:(int) list) = [1; 2; 3] in

# 402 "?"
iter (
# 404 "?"
begin fun t1'  -> match t1' with   | (
# 403 "?"
l) -> (     printf  ("%d,") (l)
  ) end ) (
# 402 "?"
ls);

# 404 "?"
printf ("\n");

# 406 "?"
let (ls:((int * int)) list) = [1 , 2; 3 , 4] in

# 408 "?"
iter (
# 411 "?"
begin fun t1'  -> match t1' with   | (
# 409 "?"
( l , r)) -> (
# 410 "?"
     printf  ("(%d,%d);")  (l) (r)
  ) end ) (
# 408 "?"
ls);

# 411 "?"
printf ("\n");

# 418 "?"
let rec f = begin fun t1'  -> match t1' with   | (
# 414 "?"
[]) -> (     ()
  )  | (
# 415 "?"
(x :: xs)) -> (
# 416 "?"
     printf  ("%d,\n") (x);
    
# 417 "?"
f (xs)
  ) end  in

# 420 "?"
f ([1; 2; 3]);

# 422 "?"
printf  ("1+20=%d\n") ((1 + 
# 423 "?"
20))
;; 
# 426 "?"
let whens = 
# 434 "?"
 
# 428 "?"
let rec (fib:((int))->(int)) = 
# 432 "?"
begin fun t1'  -> match t1' with   | (
# 429 "?"
n) when (n = 0) -> (     0
  )  | (
# 430 "?"
n) when (n = 1) -> (     1
  )  | (
# 431 "?"
n) -> (     (fib ((n - 2)) + fib ((n - 1)))
  ) end  in

# 433 "?"
printf  ("fib 11 %d\n") (fib (11))
;; module A = struct 
# 438 "?"
let a = 1234;; 
# 439 "?"
let inc = (fun k  -> (k + 1)) end;; 
# 442 "?"
let _ = 
# 445 "?"
 
# 444 "?"
printf  ("A.a = %d A.inc(10) = %d\n")  ((A . a)) ((A . inc (10)))
;; class ab = object(this) 
# 449 "?"
val a = 123 
# 451 "?"
method c = a end;; 
# 458 "?"
let _ = 
# 461 "?"
 
# 460 "?"
printf  ("ab.a = %d\n") (((new ab) # c))
;; class abc (b:int)(c:int) = object(this) 
# 465 "?"
method c = b end;; 
# 468 "?"
let _ = 
# 472 "?"
 
# 470 "?"
printf  ("ab.a = %d\n") (((new abc  (10) (20)) # c));

# 471 "?"
printf  ("ab.a = %d\n") (((2 * 3) + 1))
;; class fib (x:int) = object(this) 
# 476 "?"
method apply = (match x with | (
# 477 "?"
0)-> (   0
)| (
# 478 "?"
1)-> (   1
)| (
# 479 "?"
n)-> (   (((new fib ((x - 2))) # apply) + 
# 480 "?"
((new fib ((x - 1))) # apply))
)) end;; 
# 484 "?"
let _ = 
# 488 "?"
 
# 486 "?"
printf  ("A.a = %d\n") (((new fib (10)) # apply));

# 487 "?"
printf  ("%d %d\n")  (((1 + 2) - 3)) ((- 1))
;; 
# 490 "?"
let array_and_loop = 
# 508 "?"
 
# 491 "?"
let a = [|1; 2; 3|] in

# 492 "?"
printf  ("%d%d%d\n")  (a .(0))  (a .(1)) (a .(2));

# 494 "?"
(a .(0) <- 100);

# 495 "?"
for i = 0 to 2 do 
# 497 "?"
 
# 496 "?"
printf  ("for %d\n") (a .(i))
 done;

# 499 "?"
for i = 10 downto 1 do 
# 501 "?"
 
# 500 "?"
printf  ("for %d\n") (i)
 done;

# 503 "?"
let i = (ref 0) in

# 504 "?"
while ((! i) < 3) do 
# 507 "?"
 
# 505 "?"
incr (i);

# 506 "?"
printf  ("while %d\n") ((! i))
 done
;; 
# 510 "?"
let variants = 
# 518 "?"
 
# 516 "?"
let rec eval = begin fun t1'  -> match t1' with   | (
# 513 "?"
`int (n)) -> (     n
  )  | (
# 514 "?"
`add (a , b)) -> (     (eval (a) + eval (b))
  )  | (
# 515 "?"
`mul (a , b)) -> (     (eval (a) * eval (b))
  ) end  in

# 517 "?"
printf  ("%d\n") (eval (`add (`mul (`int (10) , `int (20)) , `int (20))))
;; 
# 520 "?"
let keyword_params = 
# 526 "?"
 
# 521 "?"
let f = (fun ?(a:int=(1)) ~(b:int) ~(c) d  -> (((a + b) + c) + d)) in

# 522 "?"
printf  ("%d\n") (f  ~a:(1)  ~b:(2)  ~c:(5) (3));

# 524 "?"
let f = (fun ?(a:int=(1)) ~(b:int) ~(c) d  -> (((a + b) + c) + d)) in

# 525 "?"
printf  ("%d\n") (f  ~a:(1)  ~b:(2)  ~c:(5) (3))
;; 
# 528 "?"
let floats = 
# 532 "?"
 
# 529 "?"
let n = 1.234 in

# 530 "?"
let m = (n +. 10.5) in

# 531 "?"
printf  ("%f\n") (m)
;; type a = A|B;; 
# 538 "?"
let rec f1 = (fun x  -> f2 (x))  and 
# 539 "?"
f2 = (fun x  -> x  );; 
# 542 "?"
let refmatch = 
# 549 "?"
 
# 543 "?"
let a = (ref 1) in

# 544 "?"
(match (! a) with | (
# 545 "?"
0)-> (   printf ("0\n")
)| (
# 546 "?"
_)-> (   printf ("other\n")
))

