
# 5 "?"
let width = 400.0;; 
# 6 "?"
let height = 400.0;; module Key = struct 
# 10 "?"
let up = (ref false);; 
# 11 "?"
let down = (ref false);; 
# 12 "?"
let left = (ref false);; 
# 13 "?"
let right = (ref false);; 
# 15 "?"
let z = (ref false);; 
# 17 "?"
let onSpKeyDown = (fun ~(key) ~(x) ~(y) -> 
# 25 "?"
   
# 18 "?"
(match key with | (
# 19 "?"
(Glut . KEY_UP))-> (     (up := true)
  )| (
# 20 "?"
(Glut . KEY_DOWN))-> (     (down := true)
  )| (
# 21 "?"
(Glut . KEY_LEFT))-> (     (left := true)
  )| (
# 22 "?"
(Glut . KEY_RIGHT))-> (     (right := true)
  )| (
# 23 "?"
_)-> (     ()
  ))
);; 
# 27 "?"
let onSpKeyUp = (fun ~(key) ~(x) ~(y) -> 
# 35 "?"
   
# 28 "?"
(match key with | (
# 29 "?"
(Glut . KEY_UP))-> (     (up := false)
  )| (
# 30 "?"
(Glut . KEY_DOWN))-> (     (down := false)
  )| (
# 31 "?"
(Glut . KEY_LEFT))-> (     (left := false)
  )| (
# 32 "?"
(Glut . KEY_RIGHT))-> (     (right := false)
  )| (
# 33 "?"
_)-> (     ()
  ))
);; 
# 37 "?"
let init = (fun () -> 
# 40 "?"
   
# 38 "?"
(Glut . specialFunc (onSpKeyDown));
  
# 39 "?"
(Glut . specialUpFunc (onSpKeyUp))
) end;; module Ship = struct 
# 44 "?"
let rsize = 25.;; 
# 45 "?"
let x = (ref ((width -. rsize) /. 2.));; 
# 46 "?"
let y = (ref (height -. (rsize *. 2.0)));; 
# 47 "?"
let speed = 5.;; 
# 49 "?"
let bllets = ref ;; 
# 51 "?"
let move = (fun () -> 
# 81 "?"
   
# 53 "?"
let m = 5 in
  
# 54 "?"
let m = (if (! (Key . left)) then ((m - 1))else(m)) in
  
# 55 "?"
let m = (if (! (Key . right)) then ((m + 1))else(m)) in
  
# 56 "?"
let m = (if (! (Key . up)) then ((m - 3))else(m)) in
  
# 57 "?"
let m = (if (! (Key . down)) then ((m + 3))else(m)) in
  
# 58 "?"
let speed = (match m with | (
# 59 "?"
1)| (
# 60 "?"
3)| (
# 61 "?"
7)| (
# 62 "?"
9)-> (   (speed /. 1.4)
)| (
# 63 "?"
_)-> (   speed
)) in
  
# 65 "?"
let nx , ny = (match m with | (
# 66 "?"
1)-> (   ((! x) -. speed) , ((! y) -. speed)
)| (
# 67 "?"
2)-> (   (! x) , ((! y) -. speed)
)| (
# 68 "?"
3)-> (   ((! x) +. speed) , ((! y) -. speed)
)| (
# 69 "?"
4)-> (   ((! x) -. speed) , (! y)
)| (
# 70 "?"
5)-> (   (! x) , (! y)
)| (
# 71 "?"
6)-> (   ((! x) +. speed) , (! y)
)| (
# 72 "?"
7)-> (   ((! x) -. speed) , ((! y) +. speed)
)| (
# 73 "?"
8)-> (   (! x) , ((! y) +. speed)
)| (
# 74 "?"
9)-> (   ((! x) +. speed) , ((! y) +. speed)
)| (
# 75 "?"
_)-> (   (! x) , (! y)
)) in
  
# 78 "?"
(x := min  (max  (nx) (0.)) ((width -. rsize)));
  
# 79 "?"
(y := min  (max  (ny) (0.)) ((height -. rsize)))
);; 
# 83 "?"
let draw = (fun () -> 
# 88 "?"
   
# 84 "?"
(GlDraw . rect  (
# 85 "?"
(! x) , (! y)) (
# 86 "?"
((! x) +. rsize) , ((! y) +. rsize)))
) end;; module Game = struct 
# 93 "?"
let draw = (fun () -> 
# 98 "?"
   
# 94 "?"
(GlClear . clear ([`color]));
  
# 95 "?"
(GlDraw . color (1.0 , 0.0 , 0.0));
  
# 96 "?"
(Ship . draw (()));
  
# 97 "?"
(Glut . swapBuffers (()))
);; 
# 100 "?"
let rec timer = (fun ~(value) -> 
# 104 "?"
   
# 101 "?"
(Glut . postRedisplay (()));
  
# 102 "?"
(Ship . move (()));
  
# 103 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(timer) ~value:(1))
);; 
# 106 "?"
let resize = (fun ~(w) ~(h) -> 
# 120 "?"
   
# 107 "?"
let h = max  (h) (1) in
  
# 108 "?"
(GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(h));
  
# 110 "?"
(GlMat . mode (`projection));
  
# 111 "?"
(GlMat . load_identity (()));
  
# 113 "?"
let ortho = (GlMat . ortho ~z:(( 1.0 , -1.0))) in
  
# 114 "?"
let x = ( 0.0 , width) in
  
# 115 "?"
let y = ( height , -0.0) in
  
# 116 "?"
ortho  ~x:(x) ~y:(y);
  
# 118 "?"
(GlMat . mode (`modelview));
  
# 119 "?"
(GlMat . load_identity (()))
);; 
# 122 "?"
let main = 
# 133 "?"
 
# 123 "?"
let _ = (Glut . init ((Sys . argv))) in

# 124 "?"
(Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) (()));

# 125 "?"
(Glut . initWindowSize  ~w:(int_of_float (width)) ~h:(int_of_float (height)));

# 126 "?"
let _ = (Glut . createWindow ("Game01")) in

# 127 "?"
(Glut . displayFunc (draw));

# 128 "?"
(Glut . reshapeFunc (resize));

# 129 "?"
(Key . init (()));

# 130 "?"
(Glut . timerFunc  ~ms:(33)  ~cb:(timer) ~value:(1));

# 131 "?"
(GlClear . color  ~alpha:(1.0) (( 0.1 , 0.1 , 0.1)));

# 132 "?"
(Glut . mainLoop (()))
 end
