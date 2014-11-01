
# 7 "?"
let pi = acos (-1.000000);;

# 9 "?"
let around_xaxis = 1.000000 , 0.000000 , 0.000000;;

# 10 "?"
let around_yaxis = 0.000000 , 1.000000 , 0.000000;;

# 12 "?"
let rot = [|0.000000; 0.000000|];;

# 14 "?"
let rotate = (fun i delta -> 
# 16 "?"

  
# 15 "?"
(rot .(i) <- (rot .(i) +. 
# 16 "?"
delta))
);;

# 18 "?"
let setup = (fun () -> 
# 21 "?"

  
# 19 "?"
(GlClear . color  ~alpha:(1.000000) (0.000000 , 0.000000 , 0.000000));
  
# 20 "?"
(GlDraw . color (0.000000 , 1.000000 , 0.000000))
);;

# 23 "?"
let special_keys = (fun ~(key) ~(x) ~(y) -> 
# 31 "?"

  
# 24 "?"
(match key with | (
# 25 "?"
(Glut . KEY_UP)) -> (
    rotate  (0) (-5.000000)
  
)| (
# 26 "?"
(Glut . KEY_DOWN)) -> (
    rotate  (0) (5.000000)
  
)| (
# 27 "?"
(Glut . KEY_LEFT)) -> (
    rotate  (1) (-5.000000)
  
)| (
# 28 "?"
(Glut . KEY_RIGHT)) -> (
    rotate  (1) (5.000000)
  
));
  
# 30 "?"
(Glut . postRedisplay (()))
);;

# 33 "?"
let change_size = (fun ~(w) ~(h) -> 
# 52 "?"

  
# 34 "?"
let h = max  (h) (1) in
  
# 35 "?"
(GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(h));
  
# 36 "?"
(GlMat . mode (`projection));
  
# 37 "?"
(GlMat . load_identity (()));
  
# 39 "?"
let h = float (h) in
  
# 40 "?"
let w = float (w) in
  
# 41 "?"
let r = 100.000000 in
  
# 42 "?"
let z = (-. r) , r in
  
# 43 "?"
x , 
# 44 "?"
let y = (if (w < h) then (
# 45 "?"
(-. r) , r , (-. ((r *. h) /. w)) , (-. ((r *. h) /. w)))else(
# 47 "?"
(-. ((r *. w) /. h)) , ((r *. w) /. h) , (-. r) , r));
  
# 49 "?"
(GlMat . ortho  ~x:(x)  ~y:(y) ~z:(z));
  
# 50 "?"
(GlMat . mode (`modelview));
  
# 51 "?"
(GlMat . load_identity (()))
);;

# 54 "?"
let main = (fun 
# 56 "?"
?(setup=(setup)) 
# 57 "?"
?(special_keys=(special_keys)) 
# 58 "?"
?(change_size=(change_size)) 
# 59 "?"
~(title) 
# 60 "?"
render_scene -> 
# 74 "?"

  
# 62 "?"
(Glut . init ((Sys . argv)));
  
# 63 "?"
(Glut . initDisplayMode  ~double_buffer:(true)  ~alpha:(false) ~depth:(true));
  
# 64 "?"
(Glut . initWindowSize  ~w:(800) ~h:(600));
  
# 65 "?"
(Glut . createWindow (title));
  
# 67 "?"
(Glut . reshapeFunc (change_size));
  
# 68 "?"
(Glut . specialFunc (special_keys));
  
# 69 "?"
(Glut . displayFunc (render_scene));
  
# 71 "?"
setup (());
  
# 73 "?"
(Glut . mainLoop (()))
)
