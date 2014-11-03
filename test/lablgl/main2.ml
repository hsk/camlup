
# 1 "?"
let angle = (fun t -> 
# 3 "?"

  
# 2 "?"
(t *. 10000.000000)
);;

# 5 "?"
let render = (fun () -> 
# 13 "?"

  
# 6 "?"
GlClear . clear ([`color]);
  
# 7 "?"
GlMat . load_identity (());
  
# 8 "?"
GlMat . rotate  ~angle:(angle (Sys . time (()))) ~z:(1.000000) (());
  
# 9 "?"
GlDraw . begins (`triangles);
  
# 10 "?"
List . iter  (GlDraw . vertex2) ([-1.000000 , -1.000000; 0.000000 , 1.000000; 1.000000 , -1.000000]);
  
# 11 "?"
GlDraw . ends (());
  
# 12 "?"
Glut . swapBuffers (())
);;

# 15 "?"
let _ = 
# 23 "?"


# 16 "?"
let _ = Glut . init (Sys . argv) in

# 17 "?"
Glut . initDisplayMode ~double_buffer:(true) (());

# 18 "?"
let _ = Glut . createWindow ~title:("OpenGL Demo") in

# 19 "?"
GlMat . mode (`modelview);

# 20 "?"
Glut . displayFunc ~cb:(render);

# 21 "?"
Glut . idleFunc ~cb:(Some (Glut . postRedisplay));

# 22 "?"
Glut . mainLoop (())

