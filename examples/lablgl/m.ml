
# 7 "?"
let pi = acos (-1.000000);;

# 9 "?"
let around_xaxis = ( 1.000000 , 0.000000 , 0.000000);;

# 10 "?"
let around_yaxis = ( 0.000000 , 1.000000 , 0.000000);;

# 12 "?"
let rot = [|0.000000; 0.000000|];;

# 14 "?"
let rotate = (fun i delta -> 
# 16 "?"

  
# 15 "?"
(rot .(i) <- (rot .(i) +. delta))
);;

# 18 "?"
let setup = (fun () -> 
# 21 "?"

  
# 19 "?"
(GlClear . color  ~alpha:(1.000000) (( 0.000000 , 0.000000 , 0.000000)));
  
# 20 "?"
(GlDraw . color (0.000000 , 1.000000 , 0.000000))
);;

# 23 "?"
let special_keys = (fun ~(key) ~(x) ~(y) -> 
# 32 "?"

  
# 24 "?"
(match key with | (
# 25 "?"
(Glut . KEY_UP))-> (
    rotate  (0) (-5.000000)
  
)| (
# 26 "?"
(Glut . KEY_DOWN))-> (
    rotate  (0) (5.000000)
  
)| (
# 27 "?"
(Glut . KEY_LEFT))-> (
    rotate  (1) (-5.000000)
  
)| (
# 28 "?"
(Glut . KEY_RIGHT))-> (
    rotate  (1) (5.000000)
  
)| (
# 29 "?"
_)-> (
    ()
  
));
  
# 31 "?"
(Glut . postRedisplay (()))
);;

# 34 "?"
let change_size = (fun ~(w) ~(h) -> 
# 53 "?"

  
# 35 "?"
let h = max  (h) (1) in
  
# 36 "?"
(GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(h));
  
# 37 "?"
(GlMat . mode (`projection));
  
# 38 "?"
(GlMat . load_identity (()));
  
# 40 "?"
let h = float (h) in
  
# 41 "?"
let w = float (w) in
  
# 42 "?"
let r = 100.000000 in
  
# 43 "?"
let z = ( (-. r) , r) in
  
# 44 "?"
let x , y = 
# 45 "?"
(if (w < h) then (
# 46 "?"
( (-. r) , r) , ( (-. ((r *. h) /. w)) , (-. ((r *. h) /. w))))else(
# 48 "?"
( (-. ((r *. w) /. h)) , ((r *. w) /. h)) , ( (-. r) , r))) in
  
# 50 "?"
(GlMat . ortho  ~x:(x)  ~y:(y) ~z:(z));
  
# 51 "?"
(GlMat . mode (`modelview));
  
# 52 "?"
(GlMat . load_identity (()))
);;

# 55 "?"
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
# 75 "?"

  
# 63 "?"
let _ = (Glut . init ((Sys . argv))) in
  
# 64 "?"
let _ = (Glut . initDisplayMode  ~double_buffer:(true)  ~alpha:(false) ~depth:(true)) in
  
# 65 "?"
(Glut . initWindowSize  ~w:(800) ~h:(600));
  
# 66 "?"
let _ = (Glut . createWindow (title)) in
  
# 68 "?"
(Glut . reshapeFunc (change_size));
  
# 69 "?"
(Glut . specialFunc (special_keys));
  
# 70 "?"
(Glut . displayFunc (render_scene));
  
# 72 "?"
setup (());
  
# 74 "?"
(Glut . mainLoop (()))
)
