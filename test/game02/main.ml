
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
module BG = struct

# 66 "?"
let ship_x = (ref 0.000000);;

# 67 "?"
let ship_y = (ref 0.000000);;

# 69 "?"
let (stars:(((float * float * float)) list) ref) = (ref []);;

# 71 "?"
let init = (fun () -> 
# 87 "?"

  
# 73 "?"
let rec createList = (fun i ls f -> 
# 78 "?"

    
# 74 "?"
(match i with | (
# 75 "?"
(- 1))-> (
      ls
    
)| (
# 76 "?"
i)-> (
      createList  ((i - 1))  ((f (i) :: ls)) (f)
    
))
  ) in
  
# 80 "?"
(stars := createList  (30) ([]) (
# 86 "?"
begin fun t1'  -> match t1' with
    | (
# 81 "?"
i) -> (

# 82 "?"

      let x = (Random . float (width)) in
      
# 83 "?"
let y = (Random . float (height)) in
      
# 84 "?"
let speed = ((Random . float (3.000000)) +. 2.000000) in
      
# 85 "?"
( x , y , speed)
    )
   end ))
);;

# 89 "?"
let move = (fun bs -> 
# 102 "?"

  
# 90 "?"
(stars := (List . map (
# 101 "?"
begin fun t1'  -> match t1' with
    | (
# 91 "?"
( x , y , speed)) -> (

# 92 "?"

      let x = (x -. ((((! ship_x) -. (width /. 2.000000)) *. 0.005000) *. speed)) in
      
# 93 "?"
let x = (if (x < 0.000000) then ((x +. width))else(x)) in
      
# 94 "?"
let x = (if (x > width) then ((x -. width))else(x)) in
      
# 95 "?"
let speed2 = (speed +. ((height -. (! ship_y)) *. 0.030000)) in
      
# 96 "?"
let y = (y +. speed2) in
      
# 97 "?"
(if (y > height) then (
# 98 "?"
( (Random . float (width)) , 0.000000 , ((Random . float (3.000000)) +. 2.000000))      )else(
# 100 "?"
( x , y , speed)))
    )
   end )) (
# 90 "?"
(! stars)))
);;

# 104 "?"
let draw = (fun () -> 
# 119 "?"

  
# 105 "?"
(List . iter (
# 118 "?"
begin fun t1'  -> match t1' with
    | (
# 105 "?"
( x , y , s)) -> (

# 106 "?"

      (GlDraw . color (
# 107 "?"
((Random . float (0.500000)) +. 0.500000) , 
# 108 "?"
((Random . float (0.500000)) +. 0.500000) , 
# 109 "?"
((Random . float (0.500000)) +. 0.500000)));
      
# 112 "?"
let s = (s +. ((height -. (! ship_y)) *. 0.060000)) in
      
# 114 "?"
(GlDraw . rect  (
# 115 "?"
x , y) (
# 116 "?"
(x +. 1.500000) , ((y +. 1.000000) +. s)))
    )
   end )) (
# 105 "?"
(! stars))
)
end;;
module Bullets = struct

# 124 "?"
let (bullets:(((float * float * (bool) ref)) list) ref) = (ref []);;

# 126 "?"
let add = (fun x y -> 
# 128 "?"

  
# 127 "?"
(bullets := (( x , y , (ref true)) :: (! bullets)))
);;

# 130 "?"
let move = (fun bs -> 
# 141 "?"

  
# 131 "?"
(bullets := 
# 132 "?"
(List . map (
# 135 "?"
begin fun t1'  -> match t1' with
    | (
# 133 "?"
x , y , b) -> (

# 134 "?"

      ( x , (y -. 10.000000) , b)
    )
   end )) (
# 131 "?"
(! bullets)));
  
# 136 "?"
(bullets := 
# 137 "?"
(List . filter (
# 140 "?"
begin fun t1'  -> match t1' with
    | (
# 138 "?"
_ , y , {contents=b}) -> (

# 139 "?"

      (b && (y > 0.000000))
    )
   end )) (
# 136 "?"
(! bullets)))
);;

# 143 "?"
let draw = (fun () -> 
# 156 "?"

  
# 144 "?"
(GlDraw . color (
# 145 "?"
0.500000 , 
# 146 "?"
(0.800000 +. (Random . float (0.200000))) , 
# 147 "?"
(0.800000 +. (Random . float (0.200000)))));
  
# 149 "?"
(List . iter (
# 155 "?"
begin fun t1'  -> match t1' with
    | (
# 150 "?"
x , y , _) -> (

# 151 "?"

      (GlDraw . rect  (
# 152 "?"
(x -. 1.500000) , (y -. 6.500000)) (
# 153 "?"
(x +. 3.000000) , (y +. 4.000000)))
    )
   end )) (
# 149 "?"
(! bullets))
)
end;;
module Ship = struct

# 160 "?"
let rsize = 25.000000;;

# 161 "?"
let x = (ref (width /. 2.000000));;

# 162 "?"
let y = (ref (height -. (rsize *. 2.000000)));;

# 163 "?"
let speed = 5.000000;;

# 165 "?"
let move = (fun () -> 
# 197 "?"

  
# 167 "?"
let m = 5 in
  
# 168 "?"
let m = (if (Key . left (())) then ((m - 1))else(m)) in
  
# 169 "?"
let m = (if (Key . right (())) then ((m + 1))else(m)) in
  
# 170 "?"
let m = (if (Key . up (())) then ((m - 3))else(m)) in
  
# 171 "?"
let m = (if (Key . down (())) then ((m + 3))else(m)) in
  
# 172 "?"
let speed = (match m with | (
# 173 "?"
1)| (3)| (7)| (9)-> (
  (speed /. 1.400000)

)| (
# 174 "?"
_)-> (
  speed

)) in
  
# 176 "?"
let nx , ny = (match m with | (
# 177 "?"
1)-> (
  ((! x) -. speed) , ((! y) -. speed)

)| (
# 178 "?"
2)-> (
  (! x) , ((! y) -. speed)

)| (
# 179 "?"
3)-> (
  ((! x) +. speed) , ((! y) -. speed)

)| (
# 180 "?"
4)-> (
  ((! x) -. speed) , (! y)

)| (
# 181 "?"
5)-> (
  (! x) , (! y)

)| (
# 182 "?"
6)-> (
  ((! x) +. speed) , (! y)

)| (
# 183 "?"
7)-> (
  ((! x) -. speed) , ((! y) +. speed)

)| (
# 184 "?"
8)-> (
  (! x) , ((! y) +. speed)

)| (
# 185 "?"
9)-> (
  ((! x) +. speed) , ((! y) +. speed)

)| (
# 186 "?"
_)-> (
  (! x) , (! y)

)) in
  
# 189 "?"
(x := min  (max  (nx) ((rsize /. 2.000000))) ((width -. (rsize /. 2.000000))));
  
# 190 "?"
(y := min  (max  (ny) ((rsize /. 2.000000))) ((height -. (rsize /. 2.000000))));
  
# 192 "?"
(Bullets . move (()));
  
# 193 "?"
(if (Key . z (())) then ((Bullets . add  ((! x)) (((! y) -. (rsize /. 2.000000)))))  );
  
# 194 "?"
((BG . ship_x) := (! x));
  
# 195 "?"
((BG . ship_y) := (! y))
);;

# 199 "?"
let draw = (fun () -> 
# 216 "?"

  
# 200 "?"
(GlDraw . color (1.000000 , 0.000000 , 0.000000));
  
# 201 "?"
let r = (rsize /. 6.000000) in
  
# 202 "?"
let r2 = (rsize /. 4.000000) in
  
# 203 "?"
(GlDraw . rect  (
# 204 "?"
((! x) -. r) , (((! y) -. r) -. r2)) (
# 205 "?"
((! x) +. r) , (((! y) +. r) -. r)));
  
# 207 "?"
(GlDraw . rect  (
# 208 "?"
(((! x) -. r) -. r2) , (((! y) -. r) +. r2)) (
# 209 "?"
(((! x) +. r) -. r2) , (((! y) +. r) +. r2)));
  
# 211 "?"
(GlDraw . rect  (
# 212 "?"
(((! x) -. r) +. r2) , (((! y) -. r) +. r2)) (
# 213 "?"
(((! x) +. r) +. r2) , (((! y) +. r) +. r2)));
  
# 215 "?"
(Bullets . draw (()))
)
end;;
module Game = struct

# 221 "?"
let draw = (fun () -> 
# 226 "?"

  
# 222 "?"
(GlClear . clear ([`color]));
  
# 223 "?"
(BG . draw (()));
  
# 224 "?"
(Ship . draw (()));
  
# 225 "?"
(Glut . swapBuffers (()))
);;

# 228 "?"
let rec mainLoop = (fun ~(value) -> 
# 233 "?"

  
# 229 "?"
(Glut . postRedisplay (()));
  
# 230 "?"
(BG . move (()));
  
# 231 "?"
(Ship . move (()));
  
# 232 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1))
);;

# 235 "?"
let resize = (fun ~(w) ~(h) -> 
# 246 "?"

  
# 236 "?"
(GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(max  (h) (1)));
  
# 238 "?"
(GlMat . mode (`projection));
  
# 239 "?"
(GlMat . load_identity (()));
  
# 241 "?"
let ortho = (GlMat . ortho ~z:(( 1.000000 , -1.000000))) in
  
# 242 "?"
ortho  ~x:(( 0.000000 , width)) ~y:(( height , -0.000000));
  
# 244 "?"
(GlMat . mode (`modelview));
  
# 245 "?"
(GlMat . load_identity (()))
);;

# 248 "?"
let main = 
# 261 "?"


# 249 "?"
(Random . init (int_of_float (((Sys . time (())) *. 10000.000000))));

# 250 "?"
ignore ((Glut . init ((Sys . argv))));

# 251 "?"
(Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) (()));

# 252 "?"
(Glut . initWindowSize  ~w:(int_of_float (width)) ~h:(int_of_float (height)));

# 253 "?"
ignore ((Glut . createWindow ("Game02")));

# 254 "?"
(Glut . displayFunc (draw));

# 255 "?"
(Glut . reshapeFunc (resize));

# 256 "?"
(Key . init (()));

# 257 "?"
(BG . init (()));

# 258 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1));

# 259 "?"
(GlClear . color  ~alpha:(1.000000) (0.100000 , 0.100000 , 0.100000));

# 260 "?"
(Glut . mainLoop (()))

end
