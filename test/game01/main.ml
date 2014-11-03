
# 7 "?"
let width = 400.000000;;

# 8 "?"
let height = 400.000000;;
module Key = struct

# 12 "?"
let up = (ref false);;

# 13 "?"
let down = (ref false);;

# 14 "?"
let left = (ref false);;

# 15 "?"
let right = (ref false);;

# 17 "?"
let onKeyDown = (fun ~(key) ~(x) ~(y) -> 
# 26 "?"

  
# 18 "?"
(match key with | (
# 19 "?"
Glut . KEY_UP)-> (
    (up := true)
  
)| (
# 20 "?"
Glut . KEY_DOWN)-> (
    (down := true)
  
)| (
# 21 "?"
Glut . KEY_LEFT)-> (
    (left := true)
  
)| (
# 22 "?"
Glut . KEY_RIGHT)-> (
    (right := true)
  
)| (
# 23 "?"
_)-> (
    ()
  
));
  
# 25 "?"
Glut . postRedisplay (())
);;

# 28 "?"
let onKeyUp = (fun ~(key) ~(x) ~(y) -> 
# 37 "?"

  
# 29 "?"
(match key with | (
# 30 "?"
Glut . KEY_UP)-> (
    (up := false)
  
)| (
# 31 "?"
Glut . KEY_DOWN)-> (
    (down := false)
  
)| (
# 32 "?"
Glut . KEY_LEFT)-> (
    (left := false)
  
)| (
# 33 "?"
Glut . KEY_RIGHT)-> (
    (right := false)
  
)| (
# 34 "?"
_)-> (
    ()
  
));
  
# 36 "?"
Glut . postRedisplay (())
);;

# 39 "?"
let init = (fun () -> 
# 42 "?"

  
# 40 "?"
Glut . specialFunc (onKeyDown);
  
# 41 "?"
Glut . specialUpFunc (onKeyUp)
)
end;;
module Ship = struct

# 46 "?"
let rsize = 25.000000;;

# 47 "?"
let x = (ref ((width -. rsize) /. 2.000000));;

# 48 "?"
let y = (ref (height -. (rsize *. 2.000000)));;

# 49 "?"
let speed = 5.000000;;

# 51 "?"
let move = (fun () -> 
# 81 "?"

  
# 53 "?"
let m = 5 in
  
# 54 "?"
let m = (if (! Key . left) then ((m - 1))else(m)) in
  
# 55 "?"
let m = (if (! Key . right) then ((m + 1))else(m)) in
  
# 56 "?"
let m = (if (! Key . up) then ((m - 3))else(m)) in
  
# 57 "?"
let m = (if (! Key . down) then ((m + 3))else(m)) in
  
# 58 "?"
let speed = (match m with | (
# 59 "?"
1)| (
# 60 "?"
3)| (
# 61 "?"
7)| (
# 62 "?"
9)-> (
  (speed /. 1.400000)

)| (
# 63 "?"
_)-> (
  speed

)) in
  
# 65 "?"
let nx , ny = (match m with | (
# 66 "?"
1)-> (
  ((! x) -. speed) , ((! y) -. speed)

)| (
# 67 "?"
2)-> (
  (! x) , ((! y) -. speed)

)| (
# 68 "?"
3)-> (
  ((! x) +. speed) , ((! y) -. speed)

)| (
# 69 "?"
4)-> (
  ((! x) -. speed) , (! y)

)| (
# 70 "?"
5)-> (
  (! x) , (! y)

)| (
# 71 "?"
6)-> (
  ((! x) +. speed) , (! y)

)| (
# 72 "?"
7)-> (
  ((! x) -. speed) , ((! y) +. speed)

)| (
# 73 "?"
8)-> (
  (! x) , ((! y) +. speed)

)| (
# 74 "?"
9)-> (
  ((! x) +. speed) , ((! y) +. speed)

)| (
# 75 "?"
_)-> (
  (! x) , (! y)

)) in
  
# 78 "?"
(x := min  (max  (nx) (0.000000)) ((width -. rsize)));
  
# 79 "?"
(y := min  (max  (ny) (0.000000)) ((height -. rsize)))
);;

# 83 "?"
let draw = (fun () -> 
# 88 "?"

  
# 84 "?"
GlDraw . rect  (
# 85 "?"
(! x) , (! y)) (
# 86 "?"
((! x) +. rsize) , ((! y) +. rsize))
)
end;;
module Game = struct

# 93 "?"
let draw = (fun () -> 
# 98 "?"

  
# 94 "?"
GlClear . clear ([`color]);
  
# 95 "?"
GlDraw . color (1.000000 , 0.000000 , 0.000000);
  
# 96 "?"
Ship . draw (());
  
# 97 "?"
Glut . swapBuffers (())
);;

# 100 "?"
let rec timer = (fun ~(value) -> 
# 104 "?"

  
# 101 "?"
Glut . postRedisplay (());
  
# 102 "?"
Ship . move (());
  
# 103 "?"
Glut . timerFunc  ~ms:(15)  ~cb:(timer) ~value:(1)
);;

# 106 "?"
let resize = (fun ~(w) ~(h) -> 
# 120 "?"

  
# 107 "?"
let h = max  (h) (1) in
  
# 108 "?"
GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(h);
  
# 110 "?"
GlMat . mode (`projection);
  
# 111 "?"
GlMat . load_identity (());
  
# 113 "?"
let ortho = GlMat . ortho ~z:(( 1.000000 , -1.000000)) in
  
# 114 "?"
let x = ( 0.000000 , width) in
  
# 115 "?"
let y = ( height , -0.000000) in
  
# 116 "?"
ortho  ~x:(x) ~y:(y);
  
# 118 "?"
GlMat . mode (`modelview);
  
# 119 "?"
GlMat . load_identity (())
);;

# 122 "?"
let main = 
# 133 "?"


# 123 "?"
let _ = Glut . init (Sys . argv) in

# 124 "?"
Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) (());

# 125 "?"
Glut . initWindowSize  ~w:(int_of_float (width)) ~h:(int_of_float (height));

# 126 "?"
let _ = Glut . createWindow ("Game01") in

# 127 "?"
Glut . displayFunc (draw);

# 128 "?"
Glut . reshapeFunc (resize);

# 129 "?"
Key . init (());

# 130 "?"
Glut . timerFunc  ~ms:(33)  ~cb:(timer) ~value:(1);

# 131 "?"
GlClear . color  ~alpha:(1.000000) (( 0.100000 , 0.100000 , 0.100000));

# 132 "?"
Glut . mainLoop (())

end
