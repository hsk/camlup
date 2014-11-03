
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
)
end;;
module Ship = struct

# 41 "?"
let rsize = 25.000000;;

# 42 "?"
let x = (ref ((width -. rsize) /. 2.000000));;

# 43 "?"
let y = (ref (height -. (rsize *. 2.000000)));;

# 44 "?"
let speed = 5.000000;;

# 46 "?"
let move = (fun () -> 
# 56 "?"

  
# 48 "?"
(x := (if (! Key . left) then (((! x) -. speed)  )else((! x))));
  
# 49 "?"
(x := (if (! Key . right) then (((! x) +. speed)  )else((! x))));
  
# 50 "?"
(y := (if (! Key . up) then (((! y) -. speed)  )else((! y))));
  
# 51 "?"
(y := (if (! Key . down) then (((! y) +. speed)  )else((! y))));
  
# 53 "?"
(x := min  (max  ((! x)) (0.000000)) ((width -. rsize)));
  
# 54 "?"
(y := min  (max  ((! y)) (0.000000)) ((height -. rsize)))
);;

# 58 "?"
let draw = (fun () -> 
# 63 "?"

  
# 59 "?"
GlDraw . rect  (
# 60 "?"
(! x) , (! y)) (
# 61 "?"
((! x) +. rsize) , ((! y) +. rsize))
)
end;;
module Game = struct

# 68 "?"
let draw = (fun () -> 
# 73 "?"

  
# 69 "?"
GlClear . clear ([`color]);
  
# 70 "?"
GlDraw . color (1.000000 , 0.000000 , 0.000000);
  
# 71 "?"
Ship . draw (());
  
# 72 "?"
Glut . swapBuffers (())
);;

# 75 "?"
let rec timer = (fun ~(value) -> 
# 79 "?"

  
# 76 "?"
Glut . postRedisplay (());
  
# 77 "?"
Ship . move (());
  
# 78 "?"
Glut . timerFunc  ~ms:(15)  ~cb:(timer) ~value:(1)
);;

# 81 "?"
let change_size = (fun ~(w) ~(h) -> 
# 95 "?"

  
# 82 "?"
let h = max  (h) (1) in
  
# 83 "?"
GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(h);
  
# 85 "?"
GlMat . mode (`projection);
  
# 86 "?"
GlMat . load_identity (());
  
# 88 "?"
let ortho = GlMat . ortho ~z:(( 1.000000 , -1.000000)) in
  
# 89 "?"
let x = ( 0.000000 , width) in
  
# 90 "?"
let y = ( height , -0.000000) in
  
# 91 "?"
ortho  ~x:(x) ~y:(y);
  
# 93 "?"
GlMat . mode (`modelview);
  
# 94 "?"
GlMat . load_identity (())
);;

# 97 "?"
let main = 
# 109 "?"


# 98 "?"
let _ = Glut . init (Sys . argv) in

# 99 "?"
Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) (());

# 100 "?"
Glut . initWindowSize  ~w:(int_of_float (width)) ~h:(int_of_float (height));

# 101 "?"
let _ = Glut . createWindow ("Game01") in

# 102 "?"
Glut . displayFunc (draw);

# 103 "?"
Glut . reshapeFunc (change_size);

# 104 "?"
Glut . specialFunc (Key . onKeyDown);

# 105 "?"
Glut . specialUpFunc (Key . onKeyUp);

# 106 "?"
Glut . timerFunc  ~ms:(33)  ~cb:(timer) ~value:(1);

# 107 "?"
GlClear . color  ~alpha:(1.000000) (( 0.100000 , 0.100000 , 0.100000));

# 108 "?"
Glut . mainLoop (())

end
