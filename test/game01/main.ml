
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
# 61 "?"

  
# 53 "?"
(x := (if (! Key . left) then (((! x) -. speed)  )else((! x))));
  
# 54 "?"
(x := (if (! Key . right) then (((! x) +. speed)  )else((! x))));
  
# 55 "?"
(y := (if (! Key . up) then (((! y) -. speed)  )else((! y))));
  
# 56 "?"
(y := (if (! Key . down) then (((! y) +. speed)  )else((! y))));
  
# 58 "?"
(x := min  (max  ((! x)) (0.000000)) ((width -. rsize)));
  
# 59 "?"
(y := min  (max  ((! y)) (0.000000)) ((height -. rsize)))
);;

# 63 "?"
let draw = (fun () -> 
# 68 "?"

  
# 64 "?"
GlDraw . rect  (
# 65 "?"
(! x) , (! y)) (
# 66 "?"
((! x) +. rsize) , ((! y) +. rsize))
)
end;;
module Game = struct

# 73 "?"
let draw = (fun () -> 
# 78 "?"

  
# 74 "?"
GlClear . clear ([`color]);
  
# 75 "?"
GlDraw . color (1.000000 , 0.000000 , 0.000000);
  
# 76 "?"
Ship . draw (());
  
# 77 "?"
Glut . swapBuffers (())
);;

# 80 "?"
let rec timer = (fun ~(value) -> 
# 84 "?"

  
# 81 "?"
Glut . postRedisplay (());
  
# 82 "?"
Ship . move (());
  
# 83 "?"
Glut . timerFunc  ~ms:(15)  ~cb:(timer) ~value:(1)
);;

# 86 "?"
let change_size = (fun ~(w) ~(h) -> 
# 100 "?"

  
# 87 "?"
let h = max  (h) (1) in
  
# 88 "?"
GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(h);
  
# 90 "?"
GlMat . mode (`projection);
  
# 91 "?"
GlMat . load_identity (());
  
# 93 "?"
let ortho = GlMat . ortho ~z:(( 1.000000 , -1.000000)) in
  
# 94 "?"
let x = ( 0.000000 , width) in
  
# 95 "?"
let y = ( height , -0.000000) in
  
# 96 "?"
ortho  ~x:(x) ~y:(y);
  
# 98 "?"
GlMat . mode (`modelview);
  
# 99 "?"
GlMat . load_identity (())
);;

# 102 "?"
let main = 
# 113 "?"


# 103 "?"
let _ = Glut . init (Sys . argv) in

# 104 "?"
Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) (());

# 105 "?"
Glut . initWindowSize  ~w:(int_of_float (width)) ~h:(int_of_float (height));

# 106 "?"
let _ = Glut . createWindow ("Game01") in

# 107 "?"
Glut . displayFunc (draw);

# 108 "?"
Glut . reshapeFunc (change_size);

# 109 "?"
Key . init (());

# 110 "?"
Glut . timerFunc  ~ms:(33)  ~cb:(timer) ~value:(1);

# 111 "?"
GlClear . color  ~alpha:(1.000000) (( 0.100000 , 0.100000 , 0.100000));

# 112 "?"
Glut . mainLoop (())

end
