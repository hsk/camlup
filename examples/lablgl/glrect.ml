
# 3 "?"
let display = (fun () -> 
# 8 "?"

  
# 4 "?"
(GlClear . clear ([`color]));
  
# 5 "?"
(GlDraw . color (1.000000 , 0.000000 , 0.000000));
  
# 6 "?"
(GlDraw . rect  (-25.000000 , 25.000000) (25.000000 , -25.000000));
  
# 7 "?"
(Gl . flush (()))
);;

# 10 "?"
let setup = (fun () -> 
# 12 "?"

  
# 11 "?"
(GlClear . color  ~alpha:(1.000000) (0.000000 , 0.000000 , 1.000000))
);;

# 14 "?"
let reshape = (fun ~(w) ~(h) -> 
# 30 "?"

  
# 15 "?"
(Printf . printf  ("w = %d, h = %d\n")  (w) (h));
  flush (stdout);
  
# 16 "?"
(GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(max  (h) (1)));
  
# 17 "?"
(GlMat . mode (`projection));
  
# 18 "?"
(GlMat . load_identity (()));
  
# 20 "?"
let aspect_ratio = (float (w) /. float (h)) in
  
# 21 "?"
(if (w <= h) then (
# 24 "?"

    
# 22 "?"
let w = (100.000000 *. 
# 23 "?"
aspect_ratio) in
    (GlMat . ortho  ~x:(w , (-. w))  ~y:(-100.000000 , 100.000000) ~z:(1.000000 , -1.000000))
  )else(
# 27 "?"

    
# 25 "?"
let h = (100.000000 /. 
# 26 "?"
aspect_ratio) in
    (GlMat . ortho  ~x:(-100.000000 , 100.000000)  ~y:((-. h) , h) ~z:(1.000000 , -1.000000))
));
  
# 28 "?"
(GlMat . mode (`modelview));
  
# 29 "?"
(GlMat . load_identity (()))
);;

# 40 "?"
let _ = 

# 33 "?"
let _ = (Glut . init ((Sys . argv))) in

# 34 "?"
let _ = (Glut . initDisplayMode  ~double_buffer:(false) ~alpha:(false)) in

# 35 "?"
let _ = (Glut . createWindow ~title:("GlRect")) in

# 36 "?"
(Glut . displayFunc (display));

# 37 "?"
(Glut . reshapeFunc (reshape));

# 38 "?"
setup (());

# 39 "?"
(Glut . mainLoop (()))

