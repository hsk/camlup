
# 5 "?"
let width = 400.000000;;

# 6 "?"
let height = 800.000000;;
module Key = struct

# 10 "?"
let _up = (ref false);;

# 11 "?"
let _down = (ref false);;

# 12 "?"
let _left = (ref false);;

# 13 "?"
let _right = (ref false);;

# 14 "?"
let _z = (ref false);;

# 16 "?"
let up = (fun () -> (! _up));;

# 17 "?"
let down = (fun () -> (! _down));;

# 18 "?"
let left = (fun () -> (! _left));;

# 19 "?"
let right = (fun () -> (! _right));;

# 20 "?"
let z = (fun () -> (! _z));;

# 22 "?"
let onSpKeyDown = (fun ~(key) ~(x) ~(y) -> 
# 30 "?"

  
# 23 "?"
(match key with | (
# 24 "?"
(Glut . KEY_UP))-> (
    (_up := true)
  
)| (
# 25 "?"
(Glut . KEY_DOWN))-> (
    (_down := true)
  
)| (
# 26 "?"
(Glut . KEY_LEFT))-> (
    (_left := true)
  
)| (
# 27 "?"
(Glut . KEY_RIGHT))-> (
    (_right := true)
  
)| (
# 28 "?"
_)-> (
    ()
  
))
);;

# 32 "?"
let onSpKeyUp = (fun ~(key) ~(x) ~(y) -> 
# 40 "?"

  
# 33 "?"
(match key with | (
# 34 "?"
(Glut . KEY_UP))-> (
    (_up := false)
  
)| (
# 35 "?"
(Glut . KEY_DOWN))-> (
    (_down := false)
  
)| (
# 36 "?"
(Glut . KEY_LEFT))-> (
    (_left := false)
  
)| (
# 37 "?"
(Glut . KEY_RIGHT))-> (
    (_right := false)
  
)| (
# 38 "?"
_)-> (
    ()
  
))
);;

# 42 "?"
let onKeyDown = (fun ~(key) ~(x) ~(y) -> 
# 47 "?"

  
# 43 "?"
(match char_of_int (key) with | (
# 44 "?"
'z')-> (
    (_z := true)
  
)| (
# 45 "?"
_)-> (
    ()
  
))
);;

# 49 "?"
let onKeyUp = (fun ~(key) ~(x) ~(y) -> 
# 54 "?"

  
# 50 "?"
(match char_of_int (key) with | (
# 51 "?"
'z')-> (
    (_z := false)
  
)| (
# 52 "?"
_)-> (
    ()
  
))
);;

# 56 "?"
let init = (fun () -> 
# 61 "?"

  
# 57 "?"
(Glut . specialFunc (onSpKeyDown));
  
# 58 "?"
(Glut . specialUpFunc (onSpKeyUp));
  
# 59 "?"
(Glut . keyboardFunc (onKeyDown));
  
# 60 "?"
(Glut . keyboardUpFunc (onKeyUp))
)
end;;
module Bullets = struct

# 66 "?"
let (bullets:(((float * float * (bool) ref)) list) ref) = (ref []);;

# 68 "?"
let add = (fun x y -> 
# 70 "?"

  
# 69 "?"
(bullets := (( x , y , (ref true)) :: (! bullets)))
);;

# 72 "?"
let move = (fun bs -> 
# 83 "?"

  
# 73 "?"
(bullets := 
# 74 "?"
(List . map (
# 77 "?"
begin fun t1'  -> match t1' with
    | (
# 75 "?"
x , y , b) -> (

# 76 "?"

      ( x , (y -. 10.000000) , b)
    )
   end )) (
# 73 "?"
(! bullets)));
  
# 78 "?"
(bullets := 
# 79 "?"
(List . filter (
# 82 "?"
begin fun t1'  -> match t1' with
    | (
# 80 "?"
_ , y , {contents=b}) -> (

# 81 "?"

      (b && (y > 0.000000))
    )
   end )) (
# 78 "?"
(! bullets)))
);;

# 85 "?"
let draw = (fun () -> 
# 98 "?"

  
# 86 "?"
(GlDraw . color (
# 87 "?"
0.500000 , 
# 88 "?"
(0.800000 +. (Random . float (0.200000))) , 
# 89 "?"
(0.800000 +. (Random . float (0.200000)))));
  
# 91 "?"
(List . iter (
# 97 "?"
begin fun t1'  -> match t1' with
    | (
# 92 "?"
x , y , _) -> (

# 93 "?"

      (GlDraw . rect  (
# 94 "?"
(x -. 1.500000) , (y -. 6.500000)) (
# 95 "?"
(x +. 3.000000) , (y +. 4.000000)))
    )
   end )) (
# 91 "?"
(! bullets))
)
end;;
module Ship = struct

# 102 "?"
let rsize = 25.000000;;

# 103 "?"
let x = (ref (width /. 2.000000));;

# 104 "?"
let y = (ref (height -. (rsize *. 2.000000)));;

# 105 "?"
let speed = 5.000000;;

# 107 "?"
let move = (fun () -> 
# 137 "?"

  
# 109 "?"
let m = 5 in
  
# 110 "?"
let m = (if (Key . left (())) then ((m - 1))else(m)) in
  
# 111 "?"
let m = (if (Key . right (())) then ((m + 1))else(m)) in
  
# 112 "?"
let m = (if (Key . up (())) then ((m - 3))else(m)) in
  
# 113 "?"
let m = (if (Key . down (())) then ((m + 3))else(m)) in
  
# 114 "?"
let speed = (match m with | (
# 115 "?"
1)| (3)| (7)| (9)-> (
  (speed /. 1.400000)

)| (
# 116 "?"
_)-> (
  speed

)) in
  
# 118 "?"
let nx , ny = (match m with | (
# 119 "?"
1)-> (
  ((! x) -. speed) , ((! y) -. speed)

)| (
# 120 "?"
2)-> (
  (! x) , ((! y) -. speed)

)| (
# 121 "?"
3)-> (
  ((! x) +. speed) , ((! y) -. speed)

)| (
# 122 "?"
4)-> (
  ((! x) -. speed) , (! y)

)| (
# 123 "?"
5)-> (
  (! x) , (! y)

)| (
# 124 "?"
6)-> (
  ((! x) +. speed) , (! y)

)| (
# 125 "?"
7)-> (
  ((! x) -. speed) , ((! y) +. speed)

)| (
# 126 "?"
8)-> (
  (! x) , ((! y) +. speed)

)| (
# 127 "?"
9)-> (
  ((! x) +. speed) , ((! y) +. speed)

)| (
# 128 "?"
_)-> (
  (! x) , (! y)

)) in
  
# 131 "?"
(x := min  (max  (nx) ((rsize /. 2.000000))) ((width -. (rsize /. 2.000000))));
  
# 132 "?"
(y := min  (max  (ny) ((rsize /. 2.000000))) ((height -. (rsize /. 2.000000))));
  
# 134 "?"
(Bullets . move (()));
  
# 135 "?"
(if (Key . z (())) then ((Bullets . add  ((! x)) (((! y) -. (rsize /. 2.000000)))))  )
);;

# 139 "?"
let draw = (fun () -> 
# 156 "?"

  
# 140 "?"
(GlDraw . color (1.000000 , 0.000000 , 0.000000));
  
# 141 "?"
let r = (rsize /. 6.000000) in
  
# 142 "?"
let r2 = (rsize /. 4.000000) in
  
# 143 "?"
(GlDraw . rect  (
# 144 "?"
((! x) -. r) , (((! y) -. r) -. r2)) (
# 145 "?"
((! x) +. r) , (((! y) +. r) -. r)));
  
# 147 "?"
(GlDraw . rect  (
# 148 "?"
(((! x) -. r) -. r2) , (((! y) -. r) +. r2)) (
# 149 "?"
(((! x) +. r) -. r2) , (((! y) +. r) +. r2)));
  
# 151 "?"
(GlDraw . rect  (
# 152 "?"
(((! x) -. r) +. r2) , (((! y) -. r) +. r2)) (
# 153 "?"
(((! x) +. r) +. r2) , (((! y) +. r) +. r2)));
  
# 155 "?"
(Bullets . draw (()))
)
end;;
module BG = struct

# 162 "?"
let (stars:(((float * float * float)) list) ref) = (ref []);;

# 164 "?"
let init = (fun () -> 
# 180 "?"

  
# 166 "?"
let rec createList = (fun i ls f -> 
# 171 "?"

    
# 167 "?"
(match i with | (
# 168 "?"
(- 1))-> (
      ls
    
)| (
# 169 "?"
i)-> (
      createList  ((i - 1))  ((f (i) :: ls)) (f)
    
))
  ) in
  
# 173 "?"
(stars := createList  (30) ([]) (
# 179 "?"
begin fun t1'  -> match t1' with
    | (
# 174 "?"
i) -> (

# 175 "?"

      let x = (Random . float (width)) in
      
# 176 "?"
let y = (Random . float (height)) in
      
# 177 "?"
let speed = ((Random . float (3.000000)) +. 2.000000) in
      
# 178 "?"
( x , y , speed)
    )
   end ))
);;

# 182 "?"
let move = (fun bs -> 
# 195 "?"

  
# 183 "?"
(stars := (List . map (
# 194 "?"
begin fun t1'  -> match t1' with
    | (
# 184 "?"
( x , y , speed)) -> (

# 185 "?"

      let x = (x -. ((((! (Ship . x)) -. (width /. 2.000000)) *. 0.005000) *. speed)) in
      
# 186 "?"
let x = (if (x < 0.000000) then ((x +. width))else(x)) in
      
# 187 "?"
let x = (if (x > width) then ((x -. width))else(x)) in
      
# 188 "?"
let speed2 = (speed +. ((height -. (! (Ship . y))) *. 0.030000)) in
      
# 189 "?"
let y = (y +. speed2) in
      
# 190 "?"
(if (y > height) then (
# 191 "?"
( (Random . float (width)) , 0.000000 , ((Random . float (3.000000)) +. 2.000000))      )else(
# 193 "?"
( x , y , speed)))
    )
   end )) (
# 183 "?"
(! stars)))
);;

# 197 "?"
let draw = (fun () -> 
# 212 "?"

  
# 198 "?"
(List . iter (
# 211 "?"
begin fun t1'  -> match t1' with
    | (
# 198 "?"
( x , y , s)) -> (

# 199 "?"

      (GlDraw . color (
# 200 "?"
((Random . float (0.500000)) +. 0.500000) , 
# 201 "?"
((Random . float (0.500000)) +. 0.500000) , 
# 202 "?"
((Random . float (0.500000)) +. 0.500000)));
      
# 205 "?"
let s = (s +. ((height -. (! (Ship . y))) *. 0.060000)) in
      
# 207 "?"
(GlDraw . rect  (
# 208 "?"
x , y) (
# 209 "?"
(x +. 1.500000) , ((y +. 1.000000) +. s)))
    )
   end )) (
# 198 "?"
(! stars))
)
end;;
module Game = struct

# 217 "?"
let draw = (fun () -> 
# 222 "?"

  
# 218 "?"
(GlClear . clear ([`color]));
  
# 219 "?"
(BG . draw (()));
  
# 220 "?"
(Ship . draw (()));
  
# 221 "?"
(Glut . swapBuffers (()))
);;

# 224 "?"
let rec mainLoop = (fun ~(value) -> 
# 229 "?"

  
# 225 "?"
(Glut . postRedisplay (()));
  
# 226 "?"
(BG . move (()));
  
# 227 "?"
(Ship . move (()));
  
# 228 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1))
);;

# 231 "?"
let resize = (fun ~(w) ~(h) -> 
# 242 "?"

  
# 232 "?"
(GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(max  (h) (1)));
  
# 234 "?"
(GlMat . mode (`projection));
  
# 235 "?"
(GlMat . load_identity (()));
  
# 237 "?"
let ortho = (GlMat . ortho ~z:(( 1.000000 , -1.000000))) in
  
# 238 "?"
ortho  ~x:(( 0.000000 , width)) ~y:(( height , -0.000000));
  
# 240 "?"
(GlMat . mode (`modelview));
  
# 241 "?"
(GlMat . load_identity (()))
);;

# 244 "?"
let main = 
# 257 "?"


# 245 "?"
(Random . init (int_of_float (((Sys . time (())) *. 10000.000000))));

# 246 "?"
ignore ((Glut . init ((Sys . argv))));

# 247 "?"
(Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) (()));

# 248 "?"
(Glut . initWindowSize  ~w:(int_of_float (width)) ~h:(int_of_float (height)));

# 249 "?"
ignore ((Glut . createWindow ("Game02")));

# 250 "?"
(Glut . displayFunc (draw));

# 251 "?"
(Glut . reshapeFunc (resize));

# 252 "?"
(Key . init (()));

# 253 "?"
(BG . init (()));

# 254 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1));

# 255 "?"
(GlClear . color  ~alpha:(1.000000) (0.100000 , 0.100000 , 0.100000));

# 256 "?"
(Glut . mainLoop (()))

end
