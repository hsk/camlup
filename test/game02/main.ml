
# 7 "?"
let width = 400.000000;;

# 8 "?"
let height = 400.000000;;
module Key = struct

# 12 "?"
let up = (ref false);;

# 13 "?"
let down = (ref false);;

# 14 "?"
let left = (ref false);;

# 15 "?"
let right = (ref false);;

# 16 "?"
let z = (ref false);;

# 18 "?"
let onSpKeyDown = (fun ~(key) ~(x) ~(y) -> 
# 26 "?"

  
# 19 "?"
(match key with | (
# 20 "?"
(Glut . KEY_UP))-> (
    (up := true)
  
)| (
# 21 "?"
(Glut . KEY_DOWN))-> (
    (down := true)
  
)| (
# 22 "?"
(Glut . KEY_LEFT))-> (
    (left := true)
  
)| (
# 23 "?"
(Glut . KEY_RIGHT))-> (
    (right := true)
  
)| (
# 24 "?"
_)-> (
    ()
  
))
);;

# 28 "?"
let onSpKeyUp = (fun ~(key) ~(x) ~(y) -> 
# 36 "?"

  
# 29 "?"
(match key with | (
# 30 "?"
(Glut . KEY_UP))-> (
    (up := false)
  
)| (
# 31 "?"
(Glut . KEY_DOWN))-> (
    (down := false)
  
)| (
# 32 "?"
(Glut . KEY_LEFT))-> (
    (left := false)
  
)| (
# 33 "?"
(Glut . KEY_RIGHT))-> (
    (right := false)
  
)| (
# 34 "?"
_)-> (
    ()
  
))
);;

# 38 "?"
let onKeyDown = (fun ~(key) ~(x) ~(y) -> 
# 43 "?"

  
# 39 "?"
(match char_of_int (key) with | (
# 40 "?"
'z')-> (
    (z := true)
  
)| (
# 41 "?"
_)-> (
    ()
  
))
);;

# 45 "?"
let onKeyUp = (fun ~(key) ~(x) ~(y) -> 
# 50 "?"

  
# 46 "?"
(match char_of_int (key) with | (
# 47 "?"
'z')-> (
    (z := false)
  
)| (
# 48 "?"
_)-> (
    ()
  
))
);;

# 52 "?"
let init = (fun () -> 
# 57 "?"

  
# 53 "?"
(Glut . specialFunc (onSpKeyDown));
  
# 54 "?"
(Glut . specialUpFunc (onSpKeyUp));
  
# 55 "?"
(Glut . keyboardFunc (onKeyDown));
  
# 56 "?"
(Glut . keyboardUpFunc (onKeyUp))
)
end;;
module Ship = struct

# 61 "?"
let rsize = 25.000000;;

# 62 "?"
let x = (ref (width /. 2.000000));;

# 63 "?"
let y = (ref (height -. (rsize *. 2.000000)));;

# 64 "?"
let speed = 5.000000;;

# 66 "?"
let (bullets:(((float * float)) list) ref) = (ref []);;

# 68 "?"
let addBullet = (fun x y -> 
# 70 "?"

  
# 69 "?"
(bullets := (( x , y) :: (! bullets)))
);;

# 71 "?"
let moveBullets = (fun bs -> 
# 76 "?"

  
# 72 "?"
(bullets := 
# 73 "?"
(List . map (begin fun t1'  -> match t1' with
    | (( x , y)) -> (

      ( x , (y -. 10.000000))
    )
   end )) (
# 72 "?"
(! bullets)));
  
# 74 "?"
(bullets := 
# 75 "?"
(List . filter (begin fun t1'  -> match t1' with
    | (( _ , y)) -> (

      (y > 20.000000)
    )
   end )) (
# 74 "?"
(! bullets)))
);;

# 77 "?"
let drawBullets = (fun () -> 
# 84 "?"

  
# 78 "?"
(List . iter (
# 83 "?"
begin fun t1'  -> match t1' with
    | (
# 78 "?"
( x , y)) -> (

# 79 "?"

      (GlDraw . rect  (
# 80 "?"
(x -. 1.500000) , (y -. 1.500000)) (
# 81 "?"
(x +. 3.000000) , (y +. 3.000000)))
    )
   end )) (
# 78 "?"
(! bullets))
);;

# 86 "?"
let move = (fun () -> 
# 119 "?"

  
# 88 "?"
let m = 5 in
  
# 89 "?"
let m = (if (! (Key . left)) then ((m - 1))else(m)) in
  
# 90 "?"
let m = (if (! (Key . right)) then ((m + 1))else(m)) in
  
# 91 "?"
let m = (if (! (Key . up)) then ((m - 3))else(m)) in
  
# 92 "?"
let m = (if (! (Key . down)) then ((m + 3))else(m)) in
  
# 93 "?"
let speed = (match m with | (
# 94 "?"
1)| (
# 95 "?"
3)| (
# 96 "?"
7)| (
# 97 "?"
9)-> (
  (speed /. 1.400000)

)| (
# 98 "?"
_)-> (
  speed

)) in
  
# 100 "?"
let nx , ny = (match m with | (
# 101 "?"
1)-> (
  ((! x) -. speed) , ((! y) -. speed)

)| (
# 102 "?"
2)-> (
  (! x) , ((! y) -. speed)

)| (
# 103 "?"
3)-> (
  ((! x) +. speed) , ((! y) -. speed)

)| (
# 104 "?"
4)-> (
  ((! x) -. speed) , (! y)

)| (
# 105 "?"
5)-> (
  (! x) , (! y)

)| (
# 106 "?"
6)-> (
  ((! x) +. speed) , (! y)

)| (
# 107 "?"
7)-> (
  ((! x) -. speed) , ((! y) +. speed)

)| (
# 108 "?"
8)-> (
  (! x) , ((! y) +. speed)

)| (
# 109 "?"
9)-> (
  ((! x) +. speed) , ((! y) +. speed)

)| (
# 110 "?"
_)-> (
  (! x) , (! y)

)) in
  
# 113 "?"
(x := min  (max  (nx) ((rsize /. 2.000000))) ((width -. (rsize /. 2.000000))));
  
# 114 "?"
(y := min  (max  (ny) ((rsize /. 2.000000))) ((height -. (rsize /. 2.000000))));
  
# 116 "?"
moveBullets (());
  
# 117 "?"
(if (! (Key . z)) then (addBullet  ((! x)) (((! y) -. (rsize /. 2.000000))))  )
);;

# 122 "?"
let draw = (fun () -> 
# 130 "?"

  
# 123 "?"
(GlDraw . color (1.000000 , 0.000000 , 0.000000));
  
# 124 "?"
(GlDraw . rect  (
# 125 "?"
((! x) -. (rsize /. 2.000000)) , ((! y) -. (rsize /. 2.000000))) (
# 126 "?"
((! x) +. (rsize /. 2.000000)) , ((! y) +. (rsize /. 2.000000))));
  
# 128 "?"
(GlDraw . color (0.500000 , 1.000000 , 1.000000));
  
# 129 "?"
drawBullets (())
)
end;;
module Game = struct

# 135 "?"
let draw = (fun () -> 
# 139 "?"

  
# 136 "?"
(GlClear . clear ([`color]));
  
# 137 "?"
(Ship . draw (()));
  
# 138 "?"
(Glut . swapBuffers (()))
);;

# 141 "?"
let rec timer = (fun ~(value) -> 
# 145 "?"

  
# 142 "?"
(Glut . postRedisplay (()));
  
# 143 "?"
(Ship . move (()));
  
# 144 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(timer) ~value:(1))
);;

# 147 "?"
let resize = (fun ~(w) ~(h) -> 
# 161 "?"

  
# 148 "?"
let h = max  (h) (1) in
  
# 149 "?"
(GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(h));
  
# 151 "?"
(GlMat . mode (`projection));
  
# 152 "?"
(GlMat . load_identity (()));
  
# 154 "?"
let ortho = (GlMat . ortho ~z:(( 1.000000 , -1.000000))) in
  
# 155 "?"
let x = ( 0.000000 , width) in
  
# 156 "?"
let y = ( height , -0.000000) in
  
# 157 "?"
ortho  ~x:(x) ~y:(y);
  
# 159 "?"
(GlMat . mode (`modelview));
  
# 160 "?"
(GlMat . load_identity (()))
);;

# 163 "?"
let main = 
# 174 "?"


# 164 "?"
let _ = (Glut . init ((Sys . argv))) in

# 165 "?"
(Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) (()));

# 166 "?"
(Glut . initWindowSize  ~w:(int_of_float (width)) ~h:(int_of_float (height)));

# 167 "?"
let _ = (Glut . createWindow ("Game01")) in

# 168 "?"
(Glut . displayFunc (draw));

# 169 "?"
(Glut . reshapeFunc (resize));

# 170 "?"
(Key . init (()));

# 171 "?"
(Glut . timerFunc  ~ms:(33)  ~cb:(timer) ~value:(1));

# 172 "?"
(GlClear . color  ~alpha:(1.000000) (( 0.100000 , 0.100000 , 0.100000)));

# 173 "?"
(Glut . mainLoop (()))

end
