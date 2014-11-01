
# 11 "?"
let _ = 

# 2 "?"
let _ = (Glut . init ((Sys . argv))) in

# 3 "?"
(Glut . initDisplayMode  ~double_buffer:(false) ~alpha:(true) (()));

# 4 "?"
let _ = (Glut . createWindow ~title:("Simple")) in

# 5 "?"
(Glut . displayFunc (
# 8 "?"
begin fun t1'  -> match t1' with
  | (
# 5 "?"
()) -> (

# 6 "?"

    (GlClear . clear ([`color]));
    
# 7 "?"
(Gl . flush (()))
  )
 end ));

# 9 "?"
(GlClear . color  ~alpha:(1.000000) (0.000000 , 0.000000 , 1.000000));

# 10 "?"
(Glut . mainLoop (()))

