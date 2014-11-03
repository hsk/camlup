
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
let z = (ref false);;

# 19 "?"
let onSpKeyDown = (fun ~(key) ~(x) ~(y) -> 
# 27 "?"

  
# 20 "?"
(match key with | (
# 21 "?"
Glut . KEY_UP)-> (
    (up := true)
  
)| (
# 22 "?"
Glut . KEY_DOWN)-> (
    (down := true)
  
)| (
# 23 "?"
Glut . KEY_LEFT)-> (
    (left := true)
  
)| (
# 24 "?"
Glut . KEY_RIGHT)-> (
    (right := true)
  
)| (
# 25 "?"
_)-> (
    ()
  
))
);;

# 29 "?"
let onSpKeyUp = (fun ~(key) ~(x) ~(y) -> 
# 37 "?"

  
# 30 "?"
(match key with | (
# 31 "?"
Glut . KEY_UP)-> (
    (up := false)
  
)| (
# 32 "?"
Glut . KEY_DOWN)-> (
    (down := false)
  
)| (
# 33 "?"
Glut . KEY_LEFT)-> (
    (left := false)
  
)| (
# 34 "?"
Glut . KEY_RIGHT)-> (
    (right := false)
  
)| (
# 35 "?"
_)-> (
    ()
  
))
);;

# 39 "?"
let init = (fun () -> 
# 42 "?"

  
# 40 "?"
Glut . specialFunc (onSpKeyDown);
  
# 41 "?"
Glut . specialUpFunc (onSpKeyUp)
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
let bllets = ref ;;

# 53 "?"
let move = (fun () -> 
# 83 "?"

  
# 55 "?"
let m = 5 in
  
# 56 "?"
let m = (if (! Key . left) then ((m - 1))else(m)) in
  
# 57 "?"
let m = (if (! Key . right) then ((m + 1))else(m)) in
  
# 58 "?"
let m = (if (! Key . up) then ((m - 3))else(m)) in
  
# 59 "?"
let m = (if (! Key . down) then ((m + 3))else(m)) in
  
# 60 "?"
let speed = (match m with | (
# 61 "?"
1)| (
# 62 "?"
3)| (
# 63 "?"
7)| (
# 64 "?"
9)-> (
  (speed /. 1.400000)

)| (
# 65 "?"
_)-> (
  speed

)) in
  
# 67 "?"
let nx , ny = (match m with | (
# 68 "?"
1)-> (
  ((! x) -. speed) , ((! y) -. speed)

)| (
# 69 "?"
2)-> (
  (! x) , ((! y) -. speed)

)| (
# 70 "?"
3)-> (
  ((! x) +. speed) , ((! y) -. speed)

)| (
# 71 "?"
4)-> (
  ((! x) -. speed) , (! y)

)| (
# 72 "?"
5)-> (
  (! x) , (! y)

)| (
# 73 "?"
6)-> (
  ((! x) +. speed) , (! y)

)| (
# 74 "?"
7)-> (
  ((! x) -. speed) , ((! y) +. speed)

)| (
# 75 "?"
8)-> (
  (! x) , ((! y) +. speed)

)| (
# 76 "?"
9)-> (
  ((! x) +. speed) , ((! y) +. speed)

)| (
# 77 "?"
_)-> (
  (! x) , (! y)

)) in
  
# 80 "?"
(x := min  (max  (nx) (0.000000)) ((width -. rsize)));
  
# 81 "?"
(y := min  (max  (ny) (0.000000)) ((height -. rsize)))
);;

# 85 "?"
let draw = (fun () -> 
# 90 "?"

  
# 86 "?"
GlDraw . rect  (
# 87 "?"
(! x) , (! y)) (
# 88 "?"
((! x) +. rsize) , ((! y) +. rsize))
)
end;;
module Game = struct

# 95 "?"
let draw = (fun () -> 
# 100 "?"

  
# 96 "?"
GlClear . clear ([`color]);
  
# 97 "?"
GlDraw . color (1.000000 , 0.000000 , 0.000000);
  
# 98 "?"
Ship . draw (());
  
# 99 "?"
Glut . swapBuffers (())
);;

# 102 "?"
let rec timer = (fun ~(value) -> 
# 106 "?"

  
# 103 "?"
Glut . postRedisplay (());
  
# 104 "?"
Ship . move (());
  
# 105 "?"
Glut . timerFunc  ~ms:(15)  ~cb:(timer) ~value:(1)
);;

# 108 "?"
let resize = (fun ~(w) ~(h) -> 
# 122 "?"

  
# 109 "?"
let h = max  (h) (1) in
  
# 110 "?"
GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(h);
  
# 112 "?"
GlMat . mode (`projection);
  
# 113 "?"
GlMat . load_identity (());
  
# 115 "?"
let ortho = GlMat . ortho ~z:(( 1.000000 , -1.000000)) in
  
# 116 "?"
let x = ( 0.000000 , width) in
  
# 117 "?"
let y = ( height , -0.000000) in
  
# 118 "?"
ortho  ~x:(x) ~y:(y);
  
# 120 "?"
GlMat . mode (`modelview);
  
# 121 "?"
GlMat . load_identity (())
);;

# 124 "?"
let main = 
# 135 "?"


# 125 "?"
let _ = Glut . init (Sys . argv) in

# 126 "?"
Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) (());

# 127 "?"
Glut . initWindowSize  ~w:(int_of_float (width)) ~h:(int_of_float (height));

# 128 "?"
let _ = Glut . createWindow ("Game01") in

# 129 "?"
Glut . displayFunc (draw);

# 130 "?"
Glut . reshapeFunc (resize);

# 131 "?"
Key . init (());

# 132 "?"
Glut . timerFunc  ~ms:(33)  ~cb:(timer) ~value:(1);

# 133 "?"
GlClear . color  ~alpha:(1.000000) (( 0.100000 , 0.100000 , 0.100000));

# 134 "?"
Glut . mainLoop (())

end
