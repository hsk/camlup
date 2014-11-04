
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
module Utils = struct

# 66 "?"
let checkColligion = (fun x y r ls -> 
# 71 "?"

  
# 67 "?"
(not (List . exists (
# 70 "?"
begin fun t1'  -> match t1' with
  | (
# 67 "?"
( bx , by , bb)) -> (

# 68 "?"

    ((((x -. r) < bx) && (bx < (x +. r))) && 
# 69 "?"
(((y -. r) < by) && (by < (y +. r))))
  )
 end ) (
# 70 "?"
ls)))
)
end;;
module Bullets = struct

# 77 "?"
let (bullets:(((float * float * (bool) ref)) list) ref) = (ref []);;

# 79 "?"
let add = (fun x y -> 
# 82 "?"

  
# 81 "?"
(bullets := (( x , y , (ref true)) :: (! bullets)))
);;

# 84 "?"
let move = (fun () -> 
# 92 "?"

  
# 85 "?"
(bullets := 
# 88 "?"
(List . filter (
# 91 "?"
begin fun t1'  -> match t1' with
    | (
# 89 "?"
_ , y , {contents=b}) -> (

# 90 "?"

      (b && (y > 0.000000))
    )
   end )) (
# 85 "?"
(List . map (
# 88 "?"
begin fun t1'  -> match t1' with
    | (
# 86 "?"
x , y , b) -> (

# 87 "?"

      ( x , (y -. 10.000000) , b)
    )
   end )) (
# 85 "?"
(! bullets))))
);;

# 94 "?"
let draw = (fun () -> 
# 107 "?"

  
# 95 "?"
(GlDraw . color (
# 96 "?"
0.500000 , 
# 97 "?"
(0.800000 +. (Random . float (0.200000))) , 
# 98 "?"
(0.800000 +. (Random . float (0.200000)))));
  
# 100 "?"
(List . iter (
# 106 "?"
begin fun t1'  -> match t1' with
    | (
# 101 "?"
x , y , _) -> (

# 102 "?"

      (GlDraw . rect  (
# 103 "?"
(x -. 1.500000) , (y -. 6.500000)) (
# 104 "?"
(x +. 3.000000) , (y +. 4.000000)))
    )
   end )) (
# 100 "?"
(! bullets))
);;

# 109 "?"
let checkColligion = (fun x y r -> 
# 111 "?"

  
# 110 "?"
(Utils . checkColligion  (x)  (y) (r) ((! bullets)))
)
end;;
module Ship = struct

# 115 "?"
let rsize = 25.000000;;

# 116 "?"
let x = (ref (width /. 2.000000));;

# 117 "?"
let y = (ref (height -. (rsize *. 2.000000)));;

# 118 "?"
let speed = 5.000000;;

# 120 "?"
let move = (fun () -> 
# 149 "?"

  
# 122 "?"
let m = 5 in
  
# 123 "?"
let m = (if (Key . left (())) then ((m - 1))else(m)) in
  
# 124 "?"
let m = (if (Key . right (())) then ((m + 1))else(m)) in
  
# 125 "?"
let m = (if (Key . up (())) then ((m - 3))else(m)) in
  
# 126 "?"
let m = (if (Key . down (())) then ((m + 3))else(m)) in
  
# 127 "?"
let speed = (match m with | (
# 128 "?"
1)| (3)| (7)| (9)-> (
  (speed /. 1.400000)

)| (
# 129 "?"
_)-> (
  speed

)) in
  
# 131 "?"
let nx , ny = (match m with | (
# 132 "?"
1)-> (
  ((! x) -. speed) , ((! y) -. speed)

)| (
# 133 "?"
2)-> (
  (! x) , ((! y) -. speed)

)| (
# 134 "?"
3)-> (
  ((! x) +. speed) , ((! y) -. speed)

)| (
# 135 "?"
4)-> (
  ((! x) -. speed) , (! y)

)| (
# 136 "?"
5)-> (
  (! x) , (! y)

)| (
# 137 "?"
6)-> (
  ((! x) +. speed) , (! y)

)| (
# 138 "?"
7)-> (
  ((! x) -. speed) , ((! y) +. speed)

)| (
# 139 "?"
8)-> (
  (! x) , ((! y) +. speed)

)| (
# 140 "?"
9)-> (
  ((! x) +. speed) , ((! y) +. speed)

)| (
# 141 "?"
_)-> (
  (! x) , (! y)

)) in
  
# 144 "?"
(x := min  (max  (nx) ((rsize /. 2.000000))) ((width -. (rsize /. 2.000000))));
  
# 145 "?"
(y := min  (max  (ny) ((rsize /. 2.000000))) ((height -. (rsize /. 2.000000))));
  
# 147 "?"
(Bullets . move (()));
  
# 148 "?"
(if (Key . z (())) then ((Bullets . add  ((! x)) (((! y) -. (rsize /. 2.000000)))))  )
);;

# 151 "?"
let draw = (fun () -> 
# 168 "?"

  
# 152 "?"
(GlDraw . color (1.000000 , 0.000000 , 0.000000));
  
# 153 "?"
let r = (rsize /. 6.000000) in
  
# 154 "?"
let r2 = (rsize /. 4.000000) in
  
# 155 "?"
(GlDraw . rect  (
# 156 "?"
((! x) -. r) , (((! y) -. r) -. r2)) (
# 157 "?"
((! x) +. r) , (((! y) +. r) -. r)));
  
# 159 "?"
(GlDraw . rect  (
# 160 "?"
(((! x) -. r) -. r2) , (((! y) -. r) +. r2)) (
# 161 "?"
(((! x) +. r) -. r2) , (((! y) +. r) +. r2)));
  
# 163 "?"
(GlDraw . rect  (
# 164 "?"
(((! x) -. r) +. r2) , (((! y) -. r) +. r2)) (
# 165 "?"
(((! x) +. r) +. r2) , (((! y) +. r) +. r2)));
  
# 167 "?"
(Bullets . draw (()))
)
end;;
module BG = struct

# 174 "?"
let (stars:(((float * float * float)) list) ref) = (ref []);;

# 176 "?"
let init = (fun () -> 
# 192 "?"

  
# 178 "?"
let rec createList = (fun i ls f -> 
# 183 "?"

    
# 179 "?"
(match i with | (
# 180 "?"
(- 1))-> (
      ls
    
)| (
# 181 "?"
i)-> (
      createList  ((i - 1))  ((f (i) :: ls)) (f)
    
))
  ) in
  
# 185 "?"
(stars := createList  (30) ([]) (
# 191 "?"
begin fun t1'  -> match t1' with
    | (
# 186 "?"
i) -> (

# 187 "?"

      let x = (Random . float (width)) in
      
# 188 "?"
let y = (Random . float (height)) in
      
# 189 "?"
let speed = ((Random . float (3.000000)) +. 2.000000) in
      
# 190 "?"
( x , y , speed)
    )
   end ))
);;

# 194 "?"
let move = (fun () -> 
# 207 "?"

  
# 195 "?"
(stars := (List . map (
# 206 "?"
begin fun t1'  -> match t1' with
    | (
# 196 "?"
( x , y , speed)) -> (

# 197 "?"

      let x = (x -. ((((! (Ship . x)) -. (width /. 2.000000)) *. 0.005000) *. speed)) in
      
# 198 "?"
let x = (if (x < 0.000000) then ((x +. width))else(x)) in
      
# 199 "?"
let x = (if (x > width) then ((x -. width))else(x)) in
      
# 200 "?"
let speed2 = (speed +. ((height -. (! (Ship . y))) *. 0.030000)) in
      
# 201 "?"
let y = (y +. speed2) in
      
# 202 "?"
(if (y > height) then (
# 203 "?"
( (Random . float (width)) , 0.000000 , ((Random . float (3.000000)) +. 2.000000))      )else(
# 205 "?"
( x , y , speed)))
    )
   end )) (
# 195 "?"
(! stars)))
);;

# 209 "?"
let draw = (fun () -> 
# 225 "?"

  
# 210 "?"
(List . iter (
# 224 "?"
begin fun t1'  -> match t1' with
    | (
# 211 "?"
( x , y , s)) -> (

# 212 "?"

      (GlDraw . color (
# 213 "?"
((Random . float (0.500000)) +. 0.500000) , 
# 214 "?"
((Random . float (0.500000)) +. 0.500000) , 
# 215 "?"
((Random . float (0.500000)) +. 0.500000)));
      
# 218 "?"
let s = (s +. ((height -. (! (Ship . y))) *. 0.060000)) in
      
# 220 "?"
(GlDraw . rect  (
# 221 "?"
x , y) (
# 222 "?"
(x +. 1.500000) , ((y +. 1.000000) +. s)))
    )
   end )) (
# 210 "?"
(! stars))
)
end;;
module Enemies = struct

# 230 "?"
let (enemies:(((float * float * (bool) ref)) list) ref) = (ref []);;

# 232 "?"
let count = (ref 0);;

# 233 "?"
let add = (fun x y -> 
# 237 "?"

  
# 234 "?"
(if ((! count) < 20) then (
# 236 "?"

    
# 235 "?"
(enemies := (( x , y , (ref true)) :: (! enemies)))
)  )
);;

# 241 "?"
let init = (fun () -> 
# 244 "?"

  
# 242 "?"
(Printf . printf  ("%d\n") (1))
);;

# 246 "?"
let move = (fun () -> 
# 261 "?"

  
# 247 "?"
(if ((Random . float (1.000000)) < 0.050000) then (
# 248 "?"
add  (((Random . float ((width *. 2.000000))) -. (width /. 2.000000))) (-10.000000))  );
  
# 250 "?"
(count := 0);
  
# 251 "?"
(enemies := 
# 257 "?"
(List . filter (
# 260 "?"
begin fun t1'  -> match t1' with
    | (
# 258 "?"
x , y , {contents=b}) -> (

# 259 "?"

      ((b && (y < height)) && (Bullets . checkColligion  (x)  (y) (16.000000)))
    )
   end )) (
# 251 "?"
(List . map (
# 257 "?"
begin fun t1'  -> match t1' with
    | (
# 252 "?"
x , y , b) -> (

# 253 "?"

      incr (count);
      
# 254 "?"
let s = (5.000000 +. ((height -. (! (Ship . y))) *. 0.060000)) in
      
# 255 "?"
let x = (x -. ((((! (Ship . x)) -. (width /. 2.000000)) *. 0.005000) *. s)) in
      
# 256 "?"
( x , (y +. s) , b)
    )
   end )) (
# 251 "?"
(! enemies))))
);;

# 263 "?"
let draw = (fun () -> 
# 277 "?"

  
# 264 "?"
(List . iter (
# 276 "?"
begin fun t1'  -> match t1' with
    | (
# 265 "?"
( x , y , s)) -> (

# 266 "?"

      (GlDraw . color (
# 267 "?"
((Random . float (0.100000)) +. 0.800000) , 
# 268 "?"
((Random . float (0.100000)) +. 0.800000) , 
# 269 "?"
((Random . float (0.100000)) +. 0.200000)));
      
# 271 "?"
let r = 12.000000 in
      
# 272 "?"
(GlDraw . rect  (
# 273 "?"
(x -. r) , (y -. r)) (
# 274 "?"
(x +. r) , (y +. r)))
    )
   end )) (
# 264 "?"
(! enemies))
)
end;;
module Game = struct

# 282 "?"
let draw = (fun () -> 
# 288 "?"

  
# 283 "?"
(GlClear . clear ([`color]));
  
# 284 "?"
(BG . draw (()));
  
# 285 "?"
(Ship . draw (()));
  
# 286 "?"
(Enemies . draw (()));
  
# 287 "?"
(Glut . swapBuffers (()))
);;

# 290 "?"
let rec mainLoop = (fun ~(value) -> 
# 296 "?"

  
# 291 "?"
(Glut . postRedisplay (()));
  
# 292 "?"
(BG . move (()));
  
# 293 "?"
(Ship . move (()));
  
# 294 "?"
(Enemies . move (()));
  
# 295 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1))
);;

# 298 "?"
let resize = (fun ~(w) ~(h) -> 
# 309 "?"

  
# 299 "?"
(GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(max  (h) (1)));
  
# 301 "?"
(GlMat . mode (`projection));
  
# 302 "?"
(GlMat . load_identity (()));
  
# 304 "?"
let ortho = (GlMat . ortho ~z:(( 1.000000 , -1.000000))) in
  
# 305 "?"
ortho  ~x:(( 0.000000 , width)) ~y:(( height , -0.000000));
  
# 307 "?"
(GlMat . mode (`modelview));
  
# 308 "?"
(GlMat . load_identity (()))
);;

# 311 "?"
let main = 
# 324 "?"


# 312 "?"
(Random . init (int_of_float (((Sys . time (())) *. 10000.000000))));

# 313 "?"
ignore ((Glut . init ((Sys . argv))));

# 314 "?"
(Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) (()));

# 315 "?"
(Glut . initWindowSize  ~w:(int_of_float (width)) ~h:(int_of_float (height)));

# 316 "?"
ignore ((Glut . createWindow ("Game02")));

# 317 "?"
(Glut . displayFunc (draw));

# 318 "?"
(Glut . reshapeFunc (resize));

# 319 "?"
(Key . init (()));

# 320 "?"
(BG . init (()));

# 321 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1));

# 322 "?"
(GlClear . color  ~alpha:(1.000000) (0.100000 , 0.100000 , 0.100000));

# 323 "?"
(Glut . mainLoop (()))

end
