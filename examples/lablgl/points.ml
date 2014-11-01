open M;;

# 11 "?"
let r = 50.000000;;

# 13 "?"
let render_scene = (fun () -> 
# 34 "?"

  
# 14 "?"
(GlClear . clear ([`color]));
  
# 32 "?"
let _ = 

# 16 "?"
(GlMat . push (()));

# 17 "?"
(GlMat . rotate3  ~angle:(rot .(0)) (around_xaxis));

# 18 "?"
(GlMat . rotate3  ~angle:(rot .(1)) (around_yaxis));

# 29 "?"
let _ = 

# 20 "?"
(GlDraw . begins (`points));

# 21 "?"
let max = 120 in

# 22 "?"
for i = 0 to max do 
# 28 "?"


# 23 "?"
let t = ((float (i) /. 20.000000) *. 
# 24 "?"
pi) in
let x = (r *. sin (t)) in

# 25 "?"
let y = (r *. cos (t)) in

# 26 "?"
let z = (-50.000000 +. ((100.000000 *. float (i)) /. float (max))) in

# 27 "?"
(GlDraw . vertex3 (x , y , z))
 done
 in

# 30 "?"
(GlDraw . ends (()));

# 31 "?"
(GlMat . pop (()))
 in
  
# 33 "?"
(Glut . swapBuffers (()))
);;

# 38 "?"
let _ = 

# 37 "?"
(M . main  ~title:("Points Example") (render_scene))

