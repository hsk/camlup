open Printf;;
open List;;

# 4 "?"
let (variable:int) = 2;;
()let a = 
# 5 "?"
1;;
()let b = 
# 6 "?"
2882400009;;
()let c = 
# 7 "?"
2882400009;;
()let d = 
# 8 "?"
342391;;
()let e = 
# 9 "?"
342391;;
()let f = 
# 10 "?"
170;;
()let g = 
# 11 "?"
170;;
()let _ = 
# 12 "?"
3;;

# 15 "?"
let (block:unit) = 
# 18 "?"


# 17 "?"
printf ("test 1\n")
;;
()let block = 
# 23 "?"


# 21 "?"
printf ("test 2\n");

# 22 "?"
printf ("test 2\n")
;;

# 28 "?"
let 
# 25 "?"
functions (()) = 
# 28 "?"


# 27 "?"
printf ("test\n")
;;

# 28 "?"
functions (());;
()let curry_function = 
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
let f0 (()) = 0 in

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
let f1 ~a:() = a in

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
let f2  ~a:() ~b:() = (a + b) in

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
let f3  ~a:()  ~b:() ~c:() = ((a + b) + c) in

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

# 131 "?"
let 
# 123 "?"
if_else (()) = 
# 131 "?"


# 125 "?"
(if (a < 10) then (printf ("b1\n")));

# 126 "?"
(if (a < 10) then (
  printf ("b2\n")
));

# 127 "?"
(if (a < 10) then (
  printf ("b2\n");
  printf ("b3\n")
));

# 128 "?"
(if (a > 10) then (printf ("a\n"))else(printf ("b3\n")));

# 130 "?"
printf ((if (a < 1) then ("a\n")else("b1\n")))
;;

# 131 "?"
if_else (());;

# 152 "?"
let 
# 133 "?"
recursive_function (()) = 
# 152 "?"


# 136 "?"
let rec (fib:((int))->(int)) = 
# 141 "?"
begin fun t1'  -> match t1' with
  | (
# 136 "?"
n) -> (

# 137 "?"

    (if (n = 0) then (0    )else(
# 138 "?"
(if (n = 1) then (1      )else(
# 139 "?"
(fib ((n - 2)) + fib ((n - 1)))))))
  )
 end  in

# 151 "?"
printf  ("fib 10 %d\n") (fib (10))
;;

# 152 "?"
recursive_function (());;

# 230 "?"
let 
# 154 "?"
tuple (()) = 
# 230 "?"


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

# 220 "?"
let (f2:((int * int))->(((int * int))->(int))) = 
# 222 "?"
begin fun t1' t2'  -> match t1',t2' with
  | (
# 221 "?"
a , b),(c , d) -> (

    ((a * b) + (c * d))
  )
 end  in

# 228 "?"
printf ("%d\n") (f2 (1 , 2) (3 , 4));

# 229 "?"
printf  ("%d\n") (f2  (1 , 2) (3 , 4))
;;

# 230 "?"
tuple (());;

# 253 "?"
let 
# 232 "?"
pattern_match (()) = 
# 253 "?"


# 234 "?"
let rec (fib:((int))->(int)) = 
# 240 "?"
begin fun t1'  -> match t1' with
  | (
# 234 "?"
n) -> (

# 235 "?"

    (match n with | (
# 236 "?"
0) -> (
      0
    
)| (
# 237 "?"
1) -> (
      1
    
)| (
# 238 "?"
n) -> (
      (fib ((n - 2)) + fib ((n - 1)))
    
))
  )
 end  in

# 242 "?"
printf  ("fib 10 %d\n") (fib (10))
;;

# 253 "?"
pattern_match (());;

# 273 "?"
let 
# 255 "?"
parcial_function (()) = 
# 273 "?"


# 257 "?"
let rec (fib:((int))->(int)) = 
# 261 "?"
begin fun t1'  -> match t1' with
  | (
# 258 "?"
0) -> (

    0
  )
  | (
# 259 "?"
1) -> (

    1
  )
  | (
# 260 "?"
n) -> (

    (fib ((n - 2)) + fib ((n - 1)))
  )
 end  in

# 263 "?"
printf  ("fib 10 = %d\n") (fib (10));

# 267 "?"
let (llor:((int * int))->(int)) = 
# 270 "?"
begin fun t1'  -> match t1' with
  | (
# 268 "?"
0 , 0) -> (

    let a = 1 in
    let b = 2 in
    (a lor b)
  )
  | (
# 269 "?"
a , b) -> (

    (a lor b)
  )
 end  in

# 272 "?"
printf  ("llor %d\n") (llor (1 , 2))
;;

# 273 "?"
parcial_function (());;

# 302 "?"
let 
# 275 "?"
list (()) = 
# 302 "?"


# 277 "?"
iter (begin fun t1'  -> match t1' with
  | (x) -> (

    printf ("%d\n") (x)
  )
 end ) ([1; 2; 3; 4]);

# 278 "?"
iter (begin fun t1'  -> match t1' with
  | (x) -> (

    printf  ("%d\n") (x)
  )
 end ) ([1; 2; 3; 4]);

# 279 "?"
iter (begin fun t1'  -> match t1' with
  | (x) -> (

    printf  ("%d\n") (x)
  )
 end ) ([1; 2; 3; 4]);

# 280 "?"
iter  (begin fun t1'  -> match t1' with
  | (x) -> (

    printf  ("%d\n") (x)
  )
 end ) ([1; 2; 3; 4]);

# 282 "?"
iter (begin fun t1'  -> match t1' with
  | (x) -> (

    printf  ("%d\n") (x)
  )
 end ) ([1; 2; 3; 4]);

# 283 "?"
iter (begin fun t1'  -> match t1' with
  | (x) -> (

    printf  ("%d\n") (x)
  )
 end ) ([1; 2; 3; 4]);

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
[1; 2; 3; 4]);

# 289 "?"

# 291 "?"
iter (
# 293 "?"
begin fun t1'  -> match t1' with
  | (
# 292 "?"
x) -> (

    printf  ("%d\n") (x)
  )
 end ) (
# 289 "?"
map (
# 291 "?"
begin fun t1'  -> match t1' with
  | (
# 290 "?"
x) -> (

    (x * 10)
  )
 end ) (
# 289 "?"
[1; 2; 3; 4]))
;;

# 302 "?"
list (());;
type a = {x:int;y:int};;

# 317 "?"
let 
# 306 "?"
record (()) = 
# 317 "?"


# 308 "?"
let (a:a) = {x=1;y=2} in

# 310 "?"
printf  ("%d\n") ((a . x));

# 312 "?"
printf  ("%d\n") (({x=(1 + (2 * 3));y=
let a = 1 in
a
} . x));

# 314 "?"
let aa = begin fun t1'  -> match t1' with
  | ({x}) -> (

    printf  ("%d\n") (x)
  )
 end  in

# 316 "?"
aa ({x=1;y=2})
;;

# 317 "?"
record (());;
type e = EUnit|EInt of (int)|EAdd of (e * e);;

# 330 "?"
let 
# 321 "?"
variant (()) = 
# 330 "?"


# 323 "?"
let rec (eval:(e)->(int)) = 
# 327 "?"
begin fun t1'  -> match t1' with
  | (
# 324 "?"
EUnit) -> (

    0
  )
  | (
# 325 "?"
EInt (i)) -> (

    i
  )
  | (
# 326 "?"
EAdd (a , b)) -> (

    (eval (a) + eval (b))
  )
 end  in

# 329 "?"
printf  ("1+2=%d\n") (eval (EAdd (EInt (1) , EInt (2))))
;;

# 330 "?"
variant (());;

# 346 "?"
let 
# 332 "?"
reference (()) = 
# 346 "?"


# 334 "?"
let a = (ref 1) in

# 335 "?"
(a := 2);

# 336 "?"
printf  ("%d\n") ((! a));

# 337 "?"
incr (a);

# 338 "?"
printf  ("%d\n") ((! a));

# 340 "?"
let b = (ref 1) in

# 341 "?"
incr (b);

# 343 "?"
printf  ("++ %d\n") ((! b));

# 344 "?"
decr (b);

# 345 "?"
printf  ("-- %d\n") ((! b))
;;

# 346 "?"
reference (());;

# 380 "?"
let 
# 348 "?"
closure (()) = 
# 380 "?"


# 354 "?"
let 
# 350 "?"
block (sp) (f) = 
# 354 "?"


# 351 "?"
printf ("{\n");

# 352 "?"
f ((sp ^ "  "));

# 353 "?"
printf  ("%s}\n") (sp)
 in

# 355 "?"
let p = printf in

# 357 "?"
p  ("def %s() ") ("a");
block ("") (
# 363 "?"
begin fun t1'  -> match t1' with
  | (
# 357 "?"
sp) -> (

# 358 "?"

    p  ("%sdef %s() ")  (sp) ("b");
    block (sp) (
# 361 "?"
begin fun t1'  -> match t1' with
      | (
# 358 "?"
sp) -> (

# 359 "?"

        p  ("%sprogram2()\n") (sp);
        
# 360 "?"
p  ("%sprogram2()\n") (sp)
      )
     end );
    
# 362 "?"
p  ("%sprogram()\n") (sp)
  )
 end );

# 370 "?"
let 
# 366 "?"
block (sp) (f) = 
# 370 "?"


# 367 "?"
printf ("{\n");

# 368 "?"
f ((sp ^ "  "));

# 369 "?"
printf  ("%s}\n") (sp)
 in

# 371 "?"
let p = printf in

# 373 "?"
p  ("def %s() ") ("a");
block ("") (
# 379 "?"
begin fun t1'  -> match t1' with
  | (
# 373 "?"
sp) -> (

# 374 "?"

    p  ("%sdef %s() ")  (sp) ("b");
    block (sp) (
# 377 "?"
begin fun t1'  -> match t1' with
      | (
# 374 "?"
sp) -> (

# 375 "?"

        p  ("%sprogram2()\n") (sp);
        
# 376 "?"
p  ("%sprogram2()\n") (sp)
      )
     end );
    
# 378 "?"
p  ("%sprogram()\n") (sp)
  )
 end )
;;

# 380 "?"
closure (());;
()let list_type = 
# 414 "?"


# 384 "?"
let ls = [1; 2; 3] in

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
let (ls:(int) list) = [1; 2; 3] in

# 392 "?"
iter (
# 394 "?"
begin fun t1'  -> match t1' with
  | (
# 393 "?"
l) -> (

    printf  ("%d,") (l)
  )
 end ) (
# 392 "?"
ls);

# 394 "?"
printf ("\n");

# 396 "?"
let (ls:((int * int)) list) = [1 , 2; 3 , 4] in

# 398 "?"
iter (
# 401 "?"
begin fun t1'  -> match t1' with
  | (
# 399 "?"
l , r) -> (

# 400 "?"

    printf  ("(%d,%d);")  (l) (r)
  )
 end ) (
# 398 "?"
ls);

# 401 "?"
printf ("\n");

# 408 "?"
let rec f = begin fun t1'  -> match t1' with
  | (
# 404 "?"
[]) -> (

    ()
  )
  | (
# 405 "?"
(x :: xs)) -> (

# 406 "?"

    printf  ("%d,\n") (x);
    
# 407 "?"
f (xs)
  )
 end  in

# 410 "?"
f ([1; 2; 3]);

# 412 "?"
printf  ("1+20=%d\n") ((1 + 
# 413 "?"
20))
;;
()let whens = 
# 424 "?"


# 418 "?"
let rec (fib:((int))->(int)) = 
# 422 "?"
begin fun t1'  -> match t1' with
  | (
# 419 "?"
n) when (n = 0) -> (

    0
  )
  | (
# 420 "?"
n) when (n = 1) -> (

    1
  )
  | (
# 421 "?"
n) -> (

    (fib ((n - 2)) + fib ((n - 1)))
  )
 end  in

# 423 "?"
printf  ("fib 11 %d\n") (fib (11))

