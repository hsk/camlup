
# 3 "?"
let rsize = 25.000000;;
type state = {pos:(float) array;step:(float) array;viewsize:(float) array};;

# 11 "?"
let s = {pos=[|0.000000; 0.000000|];step=[|3.000000; 3.000000|];viewsize=[|100.000000; 100.000000|]};;

# 14 "?"
let render_scene = (fun () -> 
# 19 "?"

  
# 15 "?"
(GlClear . clear ([`color]));
  
# 16 "?"
(GlDraw . color (1.000000 , 0.000000 , 0.000000));
  
# 17 "?"
(GlDraw . rect  ((s . pos) .(0) , (s . pos) .(1)) (((s . pos) .(0) +. rsize) , ((s . pos) .(1) -. rsize)));
  
# 18 "?"
(Glut . swapBuffers (()))
);;

# 21 "?"
let rec timer = (fun ~(value) -> 
# 45 "?"

  
# 23 "?"
let x = (s . pos) .(0) in
  
# 24 "?"
let y = (s . pos) .(1) in
  
# 25 "?"
(if ((x < (-. (s . viewsize) .(0))) || ((s . viewsize) .(0) < (x +. rsize))) then (((s . step) .(0) <- (-. (s . step) .(0))))  );
  
# 26 "?"
(if (((y -. rsize) < (-. (s . viewsize) .(1))) || ((s . viewsize) .(1) < y)) then (((s . step) .(1) <- (-. (s . step) .(1))))  );
  
# 27 "?"
((s . pos) .(0) <- (x +. (s . step) .(0)));
  
# 28 "?"
((s . pos) .(1) <- (y +. (s . step) .(1)));
  
# 32 "?"
(if (((s . viewsize) .(0) +. (s . step) .(0)) < ((s . pos) .(0) +. rsize)) then (
# 33 "?"
((s . pos) .(0) <- (((s . viewsize) .(0) -. rsize) -. 1.000000))  )else(
# 34 "?"
(if ((x +. (s . step) .(0)) < (-. (s . viewsize) .(0))) then (
# 35 "?"
((s . pos) .(0) <- ((-. (s . viewsize) .(0)) -. 1.000000)))    )));
  
# 37 "?"
(if (((s . viewsize) .(1) +. (s . step) .(1)) < (s . pos) .(1)) then (
# 38 "?"
((s . pos) .(1) <- ((s . viewsize) .(1) -. 1.000000))  )else(
# 39 "?"
(if ((y -. rsize) < ((-. (s . viewsize) .(1)) -. (s . step) .(1))) then (
# 40 "?"
((s . pos) .(1) <- (((-. (s . viewsize) .(1)) +. rsize) -. 1.000000)))    )));
  
# 43 "?"
(Glut . postRedisplay (()));
  
# 44 "?"
(Glut . timerFunc  ~ms:(33)  ~cb:(timer) ~value:(1))
);;

# 48 "?"
let setup_rc = (fun () -> 
# 50 "?"

  
# 49 "?"
(GlClear . color  ~alpha:(1.000000) (0.000000 , 0.000000 , 1.000000))
);;

# 52 "?"
let change_size = (fun ~(w) ~(h) -> 
# 77 "?"

  
# 53 "?"
let h = max  (h) (1) in
  
# 54 "?"
(GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(h));
  
# 56 "?"
(GlMat . mode (`projection));
  
# 57 "?"
(GlMat . load_identity (()));
  
# 59 "?"
let ortho = (GlMat . ortho ~z:(1.000000 , -1.000000)) in
  
# 60 "?"
let aspect_ratio = (float (w) /. float (h)) in
  
# 61 "?"
(if (aspect_ratio < 1.000000) then (
# 67 "?"

    
# 62 "?"
((s . viewsize) .(0) <- 100.000000);
    
# 63 "?"
((s . viewsize) .(1) <- (100.000000 /. 
# 64 "?"
aspect_ratio));
    let x = -100.000000 , 100.000000 in
    
# 65 "?"
let y = (-. (s . viewsize) .(0)) , (s . viewsize) .(1) in
    
# 66 "?"
ortho  ~x:(x) ~y:(y)
  )else(
# 73 "?"

    
# 68 "?"
((s . viewsize) .(0) <- (100.000000 *. 
# 69 "?"
aspect_ratio));
    ((s . viewsize) .(1) <- 100.000000);
    
# 70 "?"
let x = (-. (s . viewsize) .(0)) , (s . viewsize) .(1) in
    
# 71 "?"
let y = -100.000000 , 100.000000 in
    
# 72 "?"
ortho  ~x:(x) ~y:(y)
));
  
# 75 "?"
(GlMat . mode (`modelview));
  
# 76 "?"
(GlMat . load_identity (()))
);;

# 89 "?"
let _ = 

# 80 "?"
let _ = (Glut . init ((Sys . argv))) in

# 81 "?"
(Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) (()));

# 82 "?"
(Glut . initWindowSize  ~w:(400) ~h:(300));

# 83 "?"
let _ = (Glut . createWindow ("Bounce")) in

# 84 "?"
(Glut . displayFunc (render_scene));

# 85 "?"
(Glut . reshapeFunc (change_size));

# 86 "?"
(Glut . timerFunc  ~ms:(33)  ~cb:(timer) ~value:(1));

# 87 "?"
setup_rc (());

# 88 "?"
(Glut . mainLoop (()))

