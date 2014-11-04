open Printf;;
class enemy (x:float)(y:float) = object(this)

# 3 "?"
val mutable x = x

# 4 "?"
val mutable y = y

# 5 "?"
method private incx = (x <- (x +. 1.000000))

# 6 "?"
method private incy = (y <- (y +. 1.000000))

# 7 "?"
method move = 
# 10 "?"


# 8 "?"
(this # incx);

# 9 "?"
(this # incy)


# 11 "?"
method draw = 
# 13 "?"


# 12 "?"
printf  ("enemy %f %f\n")  (x) (y)

end;;
class enemy2 (x:float)(y:float) = object(this)

# 17 "?"
val mutable x = x

# 18 "?"
val mutable y = y

# 19 "?"
method move = (y <- (y +. 100.000000))

# 20 "?"
method draw = 
# 22 "?"


# 21 "?"
printf  ("enemy %f %f\n")  (x) (y)

end;;

# 25 "?"
let _ = 
# 32 "?"


# 26 "?"
let es = 
# 29 "?"
[
# 27 "?"
(new enemy  (10.000000) (20.000000)); 
# 28 "?"
((new enemy2  (10.000000) (20.000000)) :> enemy)] in

# 30 "?"
(List . iter (begin fun t1'  -> match t1' with
  | (e) -> (

    (e # move);
    (e # draw)
  )
 end ) (es))
;;
class a (x:int) = object(this)

# 35 "?"
method x = x
end;;
class b (x:int) = object(this)

# 39 "?"
method x = x
end;;

# 42 "?"
let _ = 
# 46 "?"


# 44 "?"
let b1 = ((new b (10)) :> a) in

# 45 "?"
printf  ("%d\n") ((b1 # x))

