
# 15 "?"
let _ = 

# 6 "?"
let _ = (Glut . init ((Sys . argv))) in

# 7 "?"
(Glut . initDisplayMode  ~double_buffer:(false) ~alpha:(true) (()));

# 8 "?"
let _ = (Glut . createWindow ~title:("Simple")) in

# 9 "?"
(Glut . displayFunc (
# 12 "?"
begin fun t1'  -> match t1' with
  | (
# 9 "?"
()) -> (

# 10 "?"

    (GlClear . clear ([`color]));
    
# 11 "?"
(Gl . flush (()))
  )
 end ));

# 13 "?"
(GlClear . color  ~alpha:(1.000000) (0.000000 , 0.000000 , 1.000000));

# 14 "?"
(Glut . mainLoop (()))

