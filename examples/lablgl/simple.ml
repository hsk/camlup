
# 16 "?"
let _ = 

# 7 "?"
let _ = (Glut . init ((Sys . argv))) in

# 8 "?"
(Glut . initDisplayMode  ~double_buffer:(false) ~alpha:(true) (()));

# 9 "?"
let _ = (Glut . createWindow ~title:("Simple")) in

# 10 "?"
(Glut . displayFunc (
# 13 "?"
begin fun t1'  -> match t1' with
  | (
# 10 "?"
()) -> (

# 11 "?"

    (GlClear . clear ([`color]));
    
# 12 "?"
(Gl . flush (()))
  )
 end ));

# 14 "?"
(GlClear . color  ~alpha:(1.000000) (0.000000 , 0.000000 , 1.000000));

# 15 "?"
(Glut . mainLoop (()))

