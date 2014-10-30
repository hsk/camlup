open Printf;;
open List;;

# 111 "lexer.nml"
let (variable:int) = 
# 111 "lexer.nml"
2;;

# 111 "lexer.nml"
let a = 
# 111 "lexer.nml"
1;;

# 111 "lexer.nml"
let b = 
# 111 "lexer.nml"
2;;

# 111 "lexer.nml"
let _ = 
# 111 "lexer.nml"
3;;

# 111 "lexer.nml"
let (block:unit) = 
# 111 "lexer.nml"


# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"test 1\n")
;;

# 111 "lexer.nml"
let block = 
# 111 "lexer.nml"


# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"test 2\n");

# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"test 2\n")
;;

# 111 "lexer.nml"
let functions = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
() -> 
# 111 "lexer.nml"

  
# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"test\n")
);;

# 111 "lexer.nml"

# 111 "lexer.nml"
functions (
# 111 "lexer.nml"
());;

# 111 "lexer.nml"
let curry_function = 
# 111 "lexer.nml"


# 111 "lexer.nml"
let (f0:(unit)->(int)) = 
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
  | (
# 111 "lexer.nml"
()) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
0
  )
 end  in

# 111 "lexer.nml"
let (f0:(unit)->(int)) = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
() -> 
# 111 "lexer.nml"

  
# 111 "lexer.nml"
0
) in

# 111 "lexer.nml"
let (f0:(unit)->(int)) = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
() -> 
# 111 "lexer.nml"
0) in

# 111 "lexer.nml"
let f0 = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
() -> 
# 111 "lexer.nml"
0) in

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f0 (
# 111 "lexer.nml"
()));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f0 (
# 111 "lexer.nml"
()));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f0 (
# 111 "lexer.nml"
()));

# 111 "lexer.nml"
let (f1:((int))->(int)) = 
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
  | (
# 111 "lexer.nml"
a) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
a
  )
 end  in

# 111 "lexer.nml"
let (f1:(int)->(int)) = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(a:int) -> 
# 111 "lexer.nml"

  
# 111 "lexer.nml"
a
) in

# 111 "lexer.nml"
let (f1:(int)->(int)) = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(a:int) -> 
# 111 "lexer.nml"
a) in

# 111 "lexer.nml"
let f1 = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(a:int) -> 
# 111 "lexer.nml"
a) in

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f1 (
# 111 "lexer.nml"
1));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f1 (
# 111 "lexer.nml"
1));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f1 (
# 111 "lexer.nml"
1));

# 111 "lexer.nml"
let (f2:(int)->((int)->(int))) = 
# 111 "lexer.nml"
begin fun t1' t2'  -> match t1',t2' with
  | (
# 111 "lexer.nml"
a),(
# 111 "lexer.nml"
b) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b)
  )
 end  in

# 111 "lexer.nml"
let (f2:(int)->(((int))->(int))) = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(a:int) -> 
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
b) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b)
    )
   end ) in

# 111 "lexer.nml"
let (f2:(int)->((int)->(int))) = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(a:int) -> 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(b:int) -> 
# 111 "lexer.nml"

    
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b)
  )) in

# 111 "lexer.nml"
let (f2:(int)->((int)->(int))) = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(a:int) 
# 111 "lexer.nml"
(b:int) -> 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b)) in

# 111 "lexer.nml"
let f2 = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(a:int) 
# 111 "lexer.nml"
(b:int) -> 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b)) in

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
f2 (
# 111 "lexer.nml"
1) (
# 111 "lexer.nml"
2));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f2  (
# 111 "lexer.nml"
1) (
# 111 "lexer.nml"
2));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f2  (
# 111 "lexer.nml"
1) (
# 111 "lexer.nml"
2));

# 111 "lexer.nml"
let (f3:(int)->((int)->((int)->(int)))) = 
# 111 "lexer.nml"
begin fun t1' t2' t3'  -> match t1',t2',t3' with
  | (
# 111 "lexer.nml"
a),(
# 111 "lexer.nml"
b),(
# 111 "lexer.nml"
c) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b) + 
# 111 "lexer.nml"
c)
  )
 end  in

# 111 "lexer.nml"
let (f3:(int)->((int)->((int)->(int)))) = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(a:int) -> 
# 111 "lexer.nml"
begin fun t1' t2'  -> match t1',t2' with
    | (
# 111 "lexer.nml"
b),(
# 111 "lexer.nml"
c) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b) + 
# 111 "lexer.nml"
c)
    )
   end ) in

# 111 "lexer.nml"
let (f3:(int)->((int)->((int)->(int)))) = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(a:int) -> 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(b:int) -> 
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
      | (
# 111 "lexer.nml"
c) -> (

# 111 "lexer.nml"

        
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b) + 
# 111 "lexer.nml"
c)
      )
     end   )) in

# 111 "lexer.nml"
let (f3:(int)->((int)->((int)->(int)))) = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(a:int) -> 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(b:int) -> 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(c:int) -> 
# 111 "lexer.nml"

      
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b) + 
# 111 "lexer.nml"
c)
    )  )) in

# 111 "lexer.nml"
let (f3:(int)->((int)->((int)->(int)))) = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(a:int) 
# 111 "lexer.nml"
(b:int) 
# 111 "lexer.nml"
(c:int) -> 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b) + 
# 111 "lexer.nml"
c)) in

# 111 "lexer.nml"
let f3 = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
(a:int) 
# 111 "lexer.nml"
(b:int) 
# 111 "lexer.nml"
(c:int) -> 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b) + 
# 111 "lexer.nml"
c)) in

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
f3 (
# 111 "lexer.nml"
1) (
# 111 "lexer.nml"
2) (
# 111 "lexer.nml"
3));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f3  (
# 111 "lexer.nml"
1)  (
# 111 "lexer.nml"
2) (
# 111 "lexer.nml"
3));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f3  (
# 111 "lexer.nml"
1)  (
# 111 "lexer.nml"
2) (
# 111 "lexer.nml"
3));

# 111 "lexer.nml"
printf;

# 111 "lexer.nml"
"%d %d %d %d\n";

# 111 "lexer.nml"

# 111 "lexer.nml"
f0 (
# 111 "lexer.nml"
());

# 111 "lexer.nml"

# 111 "lexer.nml"
f1 (
# 111 "lexer.nml"
1);

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
f2 (
# 111 "lexer.nml"
1) (
# 111 "lexer.nml"
2);

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
f3 (
# 111 "lexer.nml"
1) (
# 111 "lexer.nml"
2) (
# 111 "lexer.nml"
3);

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d %d %d %d\n")  (
# 111 "lexer.nml"

# 111 "lexer.nml"
f0 (
# 111 "lexer.nml"
()))  (
# 111 "lexer.nml"

# 111 "lexer.nml"
f1 (
# 111 "lexer.nml"
1))  (
# 111 "lexer.nml"

# 111 "lexer.nml"
f2  (
# 111 "lexer.nml"
1) (
# 111 "lexer.nml"
2)) (
# 111 "lexer.nml"

# 111 "lexer.nml"
f3  (
# 111 "lexer.nml"
1)  (
# 111 "lexer.nml"
2) (
# 111 "lexer.nml"
3));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d %d %d %d\n")  (
# 111 "lexer.nml"

# 111 "lexer.nml"
f0 (
# 111 "lexer.nml"
()))  (
# 111 "lexer.nml"

# 111 "lexer.nml"
f1 (
# 111 "lexer.nml"
1))  (
# 111 "lexer.nml"

# 111 "lexer.nml"
f2  (
# 111 "lexer.nml"
1) (
# 111 "lexer.nml"
2)) (
# 111 "lexer.nml"

# 111 "lexer.nml"
f3  (
# 111 "lexer.nml"
1)  (
# 111 "lexer.nml"
2) (
# 111 "lexer.nml"
3));

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
f3 (
# 111 "lexer.nml"
(- 
# 111 "lexer.nml"
1)) (
# 111 "lexer.nml"
(- 
# 111 "lexer.nml"
2)) (
# 111 "lexer.nml"
(- 
# 111 "lexer.nml"
3)));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f3  (
# 111 "lexer.nml"
(- 
# 111 "lexer.nml"
1))  (
# 111 "lexer.nml"
(- 
# 111 "lexer.nml"
2)) (
# 111 "lexer.nml"
(- 
# 111 "lexer.nml"
3)));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f3  (
# 111 "lexer.nml"
(- 
# 111 "lexer.nml"
1))  (
# 111 "lexer.nml"
(- 
# 111 "lexer.nml"
2)) (
# 111 "lexer.nml"
(- 
# 111 "lexer.nml"
3)));

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"%d+%d=%d\n") (
# 111 "lexer.nml"
a) (
# 111 "lexer.nml"
b) (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d+%d=%d\n")  (
# 111 "lexer.nml"
a)  (
# 111 "lexer.nml"
b) (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d+%d=%d\n")  (
# 111 "lexer.nml"
a)  (
# 111 "lexer.nml"
b) (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b))
;;

# 111 "lexer.nml"
let if_else = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
() -> 
# 111 "lexer.nml"

  
# 111 "lexer.nml"
(if 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a < 
# 111 "lexer.nml"
10) then (
# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"b1\n"))  );
  
# 111 "lexer.nml"
(if 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a < 
# 111 "lexer.nml"
10) then (
# 111 "lexer.nml"

    
# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"b2\n")
)  );
  
# 111 "lexer.nml"
(if 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a < 
# 111 "lexer.nml"
10) then (
# 111 "lexer.nml"

    
# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"b2\n");
    
# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"b3\n")
)  );
  
# 111 "lexer.nml"
(if 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a > 
# 111 "lexer.nml"
10) then (
# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"a\n")  )else(
# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"b3\n")));
  
# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
(if 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a < 
# 111 "lexer.nml"
1) then (
# 111 "lexer.nml"
"a\n"  )else(
# 111 "lexer.nml"
"b1\n")))
);;

# 111 "lexer.nml"

# 111 "lexer.nml"
if_else (
# 111 "lexer.nml"
());;

# 111 "lexer.nml"
let recursive_function = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
() -> 
# 111 "lexer.nml"

  
# 111 "lexer.nml"
let rec (fib:((int))->(int)) = 
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
n) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"
(if 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
n = 
# 111 "lexer.nml"
0) then (
# 111 "lexer.nml"
0      )else(
# 111 "lexer.nml"
(if 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
n = 
# 111 "lexer.nml"
1) then (
# 111 "lexer.nml"
1        )else(
# 111 "lexer.nml"
(
# 111 "lexer.nml"

# 111 "lexer.nml"
fib (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
n - 
# 111 "lexer.nml"
2)) + 
# 111 "lexer.nml"

# 111 "lexer.nml"
fib (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
n - 
# 111 "lexer.nml"
1)))))))
    )
   end  in
  
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"fib 10 %d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
fib (
# 111 "lexer.nml"
10))
);;

# 111 "lexer.nml"

# 111 "lexer.nml"
recursive_function (
# 111 "lexer.nml"
());;

# 111 "lexer.nml"
let tuple = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
() -> 
# 111 "lexer.nml"

  
# 111 "lexer.nml"
let (addt:((int * int))->(int)) = 
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
  | (
# 111 "lexer.nml"

# 111 "lexer.nml"
a , 
# 111 "lexer.nml"
b) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b)
  )
 end  in
  
# 111 "lexer.nml"
let (f2:((int * int))->(((int * int))->(int))) = 
# 111 "lexer.nml"
begin fun t1' t2'  -> match t1',t2' with
  | (
# 111 "lexer.nml"

# 111 "lexer.nml"
a , 
# 111 "lexer.nml"
b),(
# 111 "lexer.nml"

# 111 "lexer.nml"
c , 
# 111 "lexer.nml"
d) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a * 
# 111 "lexer.nml"
b) + 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
c * 
# 111 "lexer.nml"
d))
  )
 end  in
  
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
f2 (
# 111 "lexer.nml"

# 111 "lexer.nml"
1 , 
# 111 "lexer.nml"
2) (
# 111 "lexer.nml"

# 111 "lexer.nml"
3 , 
# 111 "lexer.nml"
4));
  
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f2  (
# 111 "lexer.nml"

# 111 "lexer.nml"
1 , 
# 111 "lexer.nml"
2) (
# 111 "lexer.nml"

# 111 "lexer.nml"
3 , 
# 111 "lexer.nml"
4))
);;

# 111 "lexer.nml"

# 111 "lexer.nml"
tuple (
# 111 "lexer.nml"
());;

# 111 "lexer.nml"
let pattern_match = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
() -> 
# 111 "lexer.nml"

  
# 111 "lexer.nml"
let rec (fib:((int))->(int)) = 
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
n) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"
(match 
# 111 "lexer.nml"
n with | (
# 111 "lexer.nml"
0) -> (
# 111 "lexer.nml"

        
# 111 "lexer.nml"
0
      
)| (
# 111 "lexer.nml"
1) -> (
# 111 "lexer.nml"

        
# 111 "lexer.nml"
1
      
)| (
# 111 "lexer.nml"
n) -> (
# 111 "lexer.nml"

        
# 111 "lexer.nml"
(
# 111 "lexer.nml"

# 111 "lexer.nml"
fib (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
n - 
# 111 "lexer.nml"
2)) + 
# 111 "lexer.nml"

# 111 "lexer.nml"
fib (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
n - 
# 111 "lexer.nml"
1)))
      
))
    )
   end  in ()
);;

# 111 "lexer.nml"

# 111 "lexer.nml"
pattern_match (
# 111 "lexer.nml"
());;

# 111 "lexer.nml"
let parcial_function = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
() -> 
# 111 "lexer.nml"

  
# 111 "lexer.nml"
let rec (fib:((int))->(int)) = 
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
0) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"
0
    )
    | (
# 111 "lexer.nml"
1) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"
1
    )
    | (
# 111 "lexer.nml"
n) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"
(
# 111 "lexer.nml"

# 111 "lexer.nml"
fib (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
n - 
# 111 "lexer.nml"
2)) + 
# 111 "lexer.nml"

# 111 "lexer.nml"
fib (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
n - 
# 111 "lexer.nml"
1)))
    )
   end  in
  
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"fib 10 = %d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
fib (
# 111 "lexer.nml"
10));
  
# 111 "lexer.nml"
let (llor:((int * int))->(int)) = 
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
  | (
# 111 "lexer.nml"

# 111 "lexer.nml"
0 , 
# 111 "lexer.nml"
0) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
let a = 
# 111 "lexer.nml"
1 in
    
# 111 "lexer.nml"
let b = 
# 111 "lexer.nml"
2 in
    
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a lor 
# 111 "lexer.nml"
b)
  )
  | (
# 111 "lexer.nml"

# 111 "lexer.nml"
a , 
# 111 "lexer.nml"
b) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a lor 
# 111 "lexer.nml"
b)
  )
 end  in
  
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"llor %d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
llor (
# 111 "lexer.nml"

# 111 "lexer.nml"
1 , 
# 111 "lexer.nml"
2))
);;

# 111 "lexer.nml"

# 111 "lexer.nml"
parcial_function (
# 111 "lexer.nml"
());;

# 111 "lexer.nml"
let list = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
() -> 
# 111 "lexer.nml"

  
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
iter (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
x) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
x)
    )
   end ) (
# 111 "lexer.nml"
[
# 111 "lexer.nml"
1; 
# 111 "lexer.nml"
2; 
# 111 "lexer.nml"
3; 
# 111 "lexer.nml"
4]);
  
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
iter (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
x) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
x)
    )
   end ) (
# 111 "lexer.nml"
[
# 111 "lexer.nml"
1; 
# 111 "lexer.nml"
2; 
# 111 "lexer.nml"
3; 
# 111 "lexer.nml"
4]);
  
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
iter (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
x) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
x)
    )
   end ) (
# 111 "lexer.nml"
[
# 111 "lexer.nml"
1; 
# 111 "lexer.nml"
2; 
# 111 "lexer.nml"
3; 
# 111 "lexer.nml"
4]);
  
# 111 "lexer.nml"

# 111 "lexer.nml"
iter  (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
x) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
x)
    )
   end ) (
# 111 "lexer.nml"
[
# 111 "lexer.nml"
1; 
# 111 "lexer.nml"
2; 
# 111 "lexer.nml"
3; 
# 111 "lexer.nml"
4]);
  
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
iter (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
x) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
x)
    )
   end ) (
# 111 "lexer.nml"
[
# 111 "lexer.nml"
1; 
# 111 "lexer.nml"
2; 
# 111 "lexer.nml"
3; 
# 111 "lexer.nml"
4]);
  
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
iter (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
x) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
x)
    )
   end ) (
# 111 "lexer.nml"
[
# 111 "lexer.nml"
1; 
# 111 "lexer.nml"
2; 
# 111 "lexer.nml"
3; 
# 111 "lexer.nml"
4]);
  
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
iter (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
x) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
x)
    )
   end ) (
# 111 "lexer.nml"
[
# 111 "lexer.nml"
1; 
# 111 "lexer.nml"
2; 
# 111 "lexer.nml"
3; 
# 111 "lexer.nml"
4]);
  
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
iter (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
x) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
x)
    )
   end ) (
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
map (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
x) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"
(
# 111 "lexer.nml"
x * 
# 111 "lexer.nml"
10)
    )
   end ) (
# 111 "lexer.nml"
[
# 111 "lexer.nml"
1; 
# 111 "lexer.nml"
2; 
# 111 "lexer.nml"
3; 
# 111 "lexer.nml"
4]))
);;

# 111 "lexer.nml"

# 111 "lexer.nml"
list (
# 111 "lexer.nml"
());;
type a = {x:int;y:int};;

# 111 "lexer.nml"
let record = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
() -> 
# 111 "lexer.nml"

  
# 111 "lexer.nml"
let (a:a) = 
# 111 "lexer.nml"
{x=
# 111 "lexer.nml"
1;y=
# 111 "lexer.nml"
2} in
  
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a . 
# 111 "lexer.nml"
x));
  
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
{x=
# 111 "lexer.nml"
(
# 111 "lexer.nml"
1 + 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
2 * 
# 111 "lexer.nml"
3));y=
# 111 "lexer.nml"


# 111 "lexer.nml"
let a = 
# 111 "lexer.nml"
1 in

# 111 "lexer.nml"
a
} . 
# 111 "lexer.nml"
x));
  
# 111 "lexer.nml"
let aa = 
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
  | (
# 111 "lexer.nml"
{x}) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
x)
  )
 end  in ()
);;

# 111 "lexer.nml"

# 111 "lexer.nml"
record (
# 111 "lexer.nml"
());;
type e = EUnit|EInt of (int)|EAdd of (e * e);;

# 111 "lexer.nml"
let variant = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
() -> 
# 111 "lexer.nml"

  
# 111 "lexer.nml"
let rec (eval:(e)->(int)) = 
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
EUnit) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"
0
    )
    | (
# 111 "lexer.nml"

# 111 "lexer.nml"
EInt (
# 111 "lexer.nml"
i)) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"
i
    )
    | (
# 111 "lexer.nml"

# 111 "lexer.nml"
EAdd (
# 111 "lexer.nml"

# 111 "lexer.nml"
a , 
# 111 "lexer.nml"
b)) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"
(
# 111 "lexer.nml"

# 111 "lexer.nml"
eval (
# 111 "lexer.nml"
a) + 
# 111 "lexer.nml"

# 111 "lexer.nml"
eval (
# 111 "lexer.nml"
b))
    )
   end  in
  
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"1+2=%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
eval (
# 111 "lexer.nml"

# 111 "lexer.nml"
EAdd (
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
EInt (
# 111 "lexer.nml"
1) , 
# 111 "lexer.nml"

# 111 "lexer.nml"
EInt (
# 111 "lexer.nml"
2))))
);;

# 111 "lexer.nml"

# 111 "lexer.nml"
variant (
# 111 "lexer.nml"
());;

# 111 "lexer.nml"
let reference = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
() -> 
# 111 "lexer.nml"

  
# 111 "lexer.nml"
let a = 
# 111 "lexer.nml"
(ref 
# 111 "lexer.nml"
1) in
  
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a := 
# 111 "lexer.nml"
2);
  
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
(! 
# 111 "lexer.nml"
a));
  
# 111 "lexer.nml"

# 111 "lexer.nml"
incr (
# 111 "lexer.nml"
a);
  
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
(! 
# 111 "lexer.nml"
a));
  
# 111 "lexer.nml"
let b = 
# 111 "lexer.nml"
(ref 
# 111 "lexer.nml"
1) in
  
# 111 "lexer.nml"

# 111 "lexer.nml"
incr (
# 111 "lexer.nml"
b);
  
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"++ %d\n") (
# 111 "lexer.nml"
(! 
# 111 "lexer.nml"
b));
  
# 111 "lexer.nml"

# 111 "lexer.nml"
decr (
# 111 "lexer.nml"
b);
  
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"-- %d\n") (
# 111 "lexer.nml"
(! 
# 111 "lexer.nml"
b))
);;

# 111 "lexer.nml"

# 111 "lexer.nml"
reference (
# 111 "lexer.nml"
());;

# 111 "lexer.nml"
let closure = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
() -> 
# 111 "lexer.nml"

  
# 111 "lexer.nml"
let block = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
sp -> 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
f -> 
# 111 "lexer.nml"

    
# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"{\n");
    
# 111 "lexer.nml"

# 111 "lexer.nml"
f (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
sp ^ 
# 111 "lexer.nml"
"  "));
    
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%s}\n") (
# 111 "lexer.nml"
sp)
  )) in
  
# 111 "lexer.nml"
let p = 
# 111 "lexer.nml"
printf in
  
# 111 "lexer.nml"

# 111 "lexer.nml"
p  (
# 111 "lexer.nml"
"def %s() ") (
# 111 "lexer.nml"
"a");
  
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
block (
# 111 "lexer.nml"
"") (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
sp) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"

# 111 "lexer.nml"
p  (
# 111 "lexer.nml"
"%sdef %s() ")  (
# 111 "lexer.nml"
sp) (
# 111 "lexer.nml"
"b");
      
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
block (
# 111 "lexer.nml"
sp) (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
        | (
# 111 "lexer.nml"
sp) -> (

# 111 "lexer.nml"

          
# 111 "lexer.nml"

# 111 "lexer.nml"
p  (
# 111 "lexer.nml"
"%sprogram2()\n") (
# 111 "lexer.nml"
sp);
          
# 111 "lexer.nml"

# 111 "lexer.nml"
p  (
# 111 "lexer.nml"
"%sprogram2()\n") (
# 111 "lexer.nml"
sp)
        )
       end );
      
# 111 "lexer.nml"

# 111 "lexer.nml"
p  (
# 111 "lexer.nml"
"%sprogram()\n") (
# 111 "lexer.nml"
sp)
    )
   end );
  
# 111 "lexer.nml"
let block = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
sp -> 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
f -> 
# 111 "lexer.nml"

    
# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"{\n");
    
# 111 "lexer.nml"

# 111 "lexer.nml"
f (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
sp ^ 
# 111 "lexer.nml"
"  "));
    
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%s}\n") (
# 111 "lexer.nml"
sp)
  )) in
  
# 111 "lexer.nml"
let p = 
# 111 "lexer.nml"
printf in
  
# 111 "lexer.nml"

# 111 "lexer.nml"
p  (
# 111 "lexer.nml"
"def %s() ") (
# 111 "lexer.nml"
"a");
  
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
block (
# 111 "lexer.nml"
"") (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
    | (
# 111 "lexer.nml"
sp) -> (

# 111 "lexer.nml"

      
# 111 "lexer.nml"

# 111 "lexer.nml"
p  (
# 111 "lexer.nml"
"%sdef %s() ")  (
# 111 "lexer.nml"
sp) (
# 111 "lexer.nml"
"b");
      
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
block (
# 111 "lexer.nml"
sp) (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
        | (
# 111 "lexer.nml"
sp) -> (

# 111 "lexer.nml"

          
# 111 "lexer.nml"

# 111 "lexer.nml"
p  (
# 111 "lexer.nml"
"%sprogram2()\n") (
# 111 "lexer.nml"
sp);
          
# 111 "lexer.nml"

# 111 "lexer.nml"
p  (
# 111 "lexer.nml"
"%sprogram2()\n") (
# 111 "lexer.nml"
sp)
        )
       end );
      
# 111 "lexer.nml"

# 111 "lexer.nml"
p  (
# 111 "lexer.nml"
"%sprogram()\n") (
# 111 "lexer.nml"
sp)
    )
   end )
);;

# 111 "lexer.nml"

# 111 "lexer.nml"
closure (
# 111 "lexer.nml"
());;

# 111 "lexer.nml"
let list_type = 
# 111 "lexer.nml"


# 111 "lexer.nml"
let ls = 
# 111 "lexer.nml"
[
# 111 "lexer.nml"
1; 
# 111 "lexer.nml"
2; 
# 111 "lexer.nml"
3] in

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
iter (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
  | (
# 111 "lexer.nml"
l) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d,") (
# 111 "lexer.nml"
l)
  )
 end ) (
# 111 "lexer.nml"
ls);

# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"\n");

# 111 "lexer.nml"
let (ls:(int) list) = 
# 111 "lexer.nml"
[
# 111 "lexer.nml"
1; 
# 111 "lexer.nml"
2; 
# 111 "lexer.nml"
3] in

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
iter (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
  | (
# 111 "lexer.nml"
l) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d,") (
# 111 "lexer.nml"
l)
  )
 end ) (
# 111 "lexer.nml"
ls);

# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"\n");

# 111 "lexer.nml"
let (ls:((int * int)) list) = 
# 111 "lexer.nml"
[
# 111 "lexer.nml"

# 111 "lexer.nml"
1 , 
# 111 "lexer.nml"
2; 
# 111 "lexer.nml"

# 111 "lexer.nml"
3 , 
# 111 "lexer.nml"
4] in

# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
iter (
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
  | (
# 111 "lexer.nml"

# 111 "lexer.nml"
l , 
# 111 "lexer.nml"
r) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"(%d,%d);")  (
# 111 "lexer.nml"
l) (
# 111 "lexer.nml"
r)
  )
 end ) (
# 111 "lexer.nml"
ls);

# 111 "lexer.nml"

# 111 "lexer.nml"
printf (
# 111 "lexer.nml"
"\n");

# 111 "lexer.nml"
let rec f = 
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
  | (
# 111 "lexer.nml"
[]) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
()
  )
  | (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
x :: 
# 111 "lexer.nml"
xs)) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d,\n") (
# 111 "lexer.nml"
x);
    
# 111 "lexer.nml"

# 111 "lexer.nml"
f (
# 111 "lexer.nml"
xs)
  )
 end  in

# 111 "lexer.nml"

# 111 "lexer.nml"
f (
# 111 "lexer.nml"
[
# 111 "lexer.nml"
1; 
# 111 "lexer.nml"
2; 
# 111 "lexer.nml"
3]);

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"1+20=%d\n") (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
1 + 
# 111 "lexer.nml"
20))
;;

# 111 "lexer.nml"
let whens = 
# 111 "lexer.nml"


# 111 "lexer.nml"
let rec (fib:((int))->(int)) = 
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
  | (
# 111 "lexer.nml"
n) when 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
n = 
# 111 "lexer.nml"
0) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
0
  )
  | (
# 111 "lexer.nml"
n) when 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
n = 
# 111 "lexer.nml"
1) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
1
  )
  | (
# 111 "lexer.nml"
n) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
(
# 111 "lexer.nml"

# 111 "lexer.nml"
fib (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
n - 
# 111 "lexer.nml"
2)) + 
# 111 "lexer.nml"

# 111 "lexer.nml"
fib (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
n - 
# 111 "lexer.nml"
1)))
  )
 end  in

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"fib 11 %d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
fib (
# 111 "lexer.nml"
11))
;;
module A = struct

# 111 "lexer.nml"
let a = 
# 111 "lexer.nml"
1234;;

# 111 "lexer.nml"
let inc = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
k -> 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
k + 
# 111 "lexer.nml"
1))
end;;

# 111 "lexer.nml"
let _ = 
# 111 "lexer.nml"


# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"A.a = %d A.inc(10) = %d\n")  (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
A . 
# 111 "lexer.nml"
a)) (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
A . 
# 111 "lexer.nml"

# 111 "lexer.nml"
inc (
# 111 "lexer.nml"
10)))
;;
class ab = object
val a = 
# 111 "lexer.nml"
123
method c = 
# 111 "lexer.nml"
a
end;;

# 111 "lexer.nml"
let _ = 
# 111 "lexer.nml"


# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"ab.a = %d\n") (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(new 
# 111 "lexer.nml"
ab) # 
# 111 "lexer.nml"
c))
;;
class abc (b:int)(c:int) = object
method c = 
# 111 "lexer.nml"
b
end;;

# 111 "lexer.nml"
let _ = 
# 111 "lexer.nml"


# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"ab.a = %d\n") (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(new 
# 111 "lexer.nml"

# 111 "lexer.nml"
abc  (
# 111 "lexer.nml"
10) (
# 111 "lexer.nml"
20)) # 
# 111 "lexer.nml"
c));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"ab.a = %d\n") (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(
# 111 "lexer.nml"
2 * 
# 111 "lexer.nml"
3) + 
# 111 "lexer.nml"
1))
;;
class fib (x:int) = object
method apply = 
# 111 "lexer.nml"
(match 
# 111 "lexer.nml"
x with | (
# 111 "lexer.nml"
0) -> (
# 111 "lexer.nml"

  
# 111 "lexer.nml"
0

)| (
# 111 "lexer.nml"
1) -> (
# 111 "lexer.nml"

  
# 111 "lexer.nml"
1

)| (
# 111 "lexer.nml"
n) -> (
# 111 "lexer.nml"

  
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(new 
# 111 "lexer.nml"

# 111 "lexer.nml"
fib (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
x - 
# 111 "lexer.nml"
2))) # 
# 111 "lexer.nml"
apply) + 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(new 
# 111 "lexer.nml"

# 111 "lexer.nml"
fib (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
x - 
# 111 "lexer.nml"
1))) # 
# 111 "lexer.nml"
apply))

))
end;;

# 111 "lexer.nml"
let _ = 
# 111 "lexer.nml"


# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"A.a = %d\n") (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(new 
# 111 "lexer.nml"

# 111 "lexer.nml"
fib (
# 111 "lexer.nml"
10)) # 
# 111 "lexer.nml"
apply));

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d %d\n")  (
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(
# 111 "lexer.nml"
1 + 
# 111 "lexer.nml"
2) - 
# 111 "lexer.nml"
3)) (
# 111 "lexer.nml"
(- 
# 111 "lexer.nml"
1))
;;

# 111 "lexer.nml"
let array_and_loop = 
# 111 "lexer.nml"


# 111 "lexer.nml"
let a = 
# 111 "lexer.nml"
[|
# 111 "lexer.nml"
1; 
# 111 "lexer.nml"
2; 
# 111 "lexer.nml"
3|] in

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d%d%d\n")  (
# 111 "lexer.nml"

# 111 "lexer.nml"
a .(
# 111 "lexer.nml"
0))  (
# 111 "lexer.nml"

# 111 "lexer.nml"
a .(
# 111 "lexer.nml"
1)) (
# 111 "lexer.nml"

# 111 "lexer.nml"
a .(
# 111 "lexer.nml"
2));

# 111 "lexer.nml"
for i = 
# 111 "lexer.nml"
0 to 
# 111 "lexer.nml"
3 do 
# 111 "lexer.nml"


# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
i)
 done;

# 111 "lexer.nml"
for i = 
# 111 "lexer.nml"
10 downto 
# 111 "lexer.nml"
1 do 
# 111 "lexer.nml"


# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"
i)
 done;

# 111 "lexer.nml"
let i = 
# 111 "lexer.nml"
(ref 
# 111 "lexer.nml"
0) in

# 111 "lexer.nml"
while 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(! 
# 111 "lexer.nml"
i) < 
# 111 "lexer.nml"
3) do 
# 111 "lexer.nml"


# 111 "lexer.nml"

# 111 "lexer.nml"
incr (
# 111 "lexer.nml"
i);

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"while %d\n") (
# 111 "lexer.nml"
(! 
# 111 "lexer.nml"
i))
 done
;;

# 111 "lexer.nml"
let variants = 
# 111 "lexer.nml"


# 111 "lexer.nml"
let rec eval = 
# 111 "lexer.nml"
begin fun t1'  -> match t1' with
  | (
# 111 "lexer.nml"

# 111 "lexer.nml"
`int (
# 111 "lexer.nml"
n)) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
n
  )
  | (
# 111 "lexer.nml"

# 111 "lexer.nml"
`add (
# 111 "lexer.nml"

# 111 "lexer.nml"
a , 
# 111 "lexer.nml"
b)) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
(
# 111 "lexer.nml"

# 111 "lexer.nml"
eval (
# 111 "lexer.nml"
a) + 
# 111 "lexer.nml"

# 111 "lexer.nml"
eval (
# 111 "lexer.nml"
b))
  )
  | (
# 111 "lexer.nml"

# 111 "lexer.nml"
`mul (
# 111 "lexer.nml"

# 111 "lexer.nml"
a , 
# 111 "lexer.nml"
b)) -> (

# 111 "lexer.nml"

    
# 111 "lexer.nml"
(
# 111 "lexer.nml"

# 111 "lexer.nml"
eval (
# 111 "lexer.nml"
a) * 
# 111 "lexer.nml"

# 111 "lexer.nml"
eval (
# 111 "lexer.nml"
b))
  )
 end  in

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
eval (
# 111 "lexer.nml"

# 111 "lexer.nml"
`add (
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
`mul (
# 111 "lexer.nml"

# 111 "lexer.nml"

# 111 "lexer.nml"
`int (
# 111 "lexer.nml"
10) , 
# 111 "lexer.nml"

# 111 "lexer.nml"
`int (
# 111 "lexer.nml"
20)) , 
# 111 "lexer.nml"

# 111 "lexer.nml"
`int (
# 111 "lexer.nml"
20))))
;;

# 111 "lexer.nml"
let keyword_params = 
# 111 "lexer.nml"


# 111 "lexer.nml"
let f = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
?(a:int=(
# 111 "lexer.nml"
1)) 
# 111 "lexer.nml"
~(b:int) 
# 111 "lexer.nml"
~(c) 
# 111 "lexer.nml"
d -> 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b) + 
# 111 "lexer.nml"
c) + 
# 111 "lexer.nml"
d)) in

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f  ~a:(
# 111 "lexer.nml"
1)  ~b:(
# 111 "lexer.nml"
2)  ~c:(
# 111 "lexer.nml"
5) (
# 111 "lexer.nml"
3));

# 111 "lexer.nml"
let f = 
# 111 "lexer.nml"
(fun 
# 111 "lexer.nml"
?(a:int=(
# 111 "lexer.nml"
1)) 
# 111 "lexer.nml"
~(b:int) 
# 111 "lexer.nml"
~(c) 
# 111 "lexer.nml"
d -> 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(
# 111 "lexer.nml"
(
# 111 "lexer.nml"
a + 
# 111 "lexer.nml"
b) + 
# 111 "lexer.nml"
c) + 
# 111 "lexer.nml"
d)) in

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%d\n") (
# 111 "lexer.nml"

# 111 "lexer.nml"
f  ~a:(
# 111 "lexer.nml"
1)  ~b:(
# 111 "lexer.nml"
2)  ~c:(
# 111 "lexer.nml"
5) (
# 111 "lexer.nml"
3))
;;

# 111 "lexer.nml"
let floats = 
# 111 "lexer.nml"


# 111 "lexer.nml"
let n = 
# 111 "lexer.nml"
1.234000 in

# 111 "lexer.nml"
let m = 
# 111 "lexer.nml"
(
# 111 "lexer.nml"
n +. 
# 111 "lexer.nml"
10.500000) in

# 111 "lexer.nml"

# 111 "lexer.nml"
printf  (
# 111 "lexer.nml"
"%f\n") (
# 111 "lexer.nml"
m)

