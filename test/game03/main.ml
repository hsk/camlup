
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
type bullet = {x:float;y:float;enable:(bool) ref};;
module Utils = struct

# 68 "?"
let checkColligion = (fun bx by r ls -> 
# 73 "?"

  
# 69 "?"
(not (List . exists (
# 72 "?"
begin fun t1'  -> match t1' with
  | (
# 69 "?"
{x;y}) -> (

# 70 "?"

    ((((x -. r) < bx) && (bx < (x +. r))) && 
# 71 "?"
(((y -. r) < by) && (by < (y +. r))))
  )
 end ) (
# 72 "?"
ls)))
)
end;;
module Bullets = struct

# 80 "?"
let (bullets:((bullet) list) ref) = (ref []);;

# 82 "?"
let add = (fun x y -> 
# 85 "?"

  
# 84 "?"
(bullets := ({x=x;y=y;enable=(ref true)} :: (! bullets)))
);;

# 87 "?"
let move = (fun () -> 
# 95 "?"

  
# 88 "?"
(bullets := 
# 91 "?"
(List . filter (
# 94 "?"
begin fun t1'  -> match t1' with
    | (
# 92 "?"
{y;enable={contents=b}}) -> (

# 93 "?"

      (b && (y > 0.000000))
    )
   end )) (
# 88 "?"
(List . map (
# 91 "?"
begin fun t1'  -> match t1' with
    | (
# 89 "?"
{x;y;enable}) -> (

# 90 "?"

      {x=x;y=(y -. 10.000000);enable=enable}
    )
   end )) (
# 88 "?"
(! bullets))))
);;

# 97 "?"
let draw = (fun () -> 
# 110 "?"

  
# 98 "?"
(GlDraw . color (
# 99 "?"
0.500000 , 
# 100 "?"
(0.800000 +. (Random . float (0.200000))) , 
# 101 "?"
(0.800000 +. (Random . float (0.200000)))));
  
# 103 "?"
(List . iter (
# 109 "?"
begin fun t1'  -> match t1' with
    | (
# 104 "?"
{x;y}) -> (

# 105 "?"

      (GlDraw . rect  (
# 106 "?"
(x -. 1.500000) , (y -. 6.500000)) (
# 107 "?"
(x +. 3.000000) , (y +. 4.000000)))
    )
   end )) (
# 103 "?"
(! bullets))
);;

# 112 "?"
let checkColligion = (fun x y r -> 
# 114 "?"

  
# 113 "?"
(Utils . checkColligion  (x)  (y) (r) ((! bullets)))
)
end;;
module Ship = struct

# 118 "?"
let rsize = 25.000000;;

# 119 "?"
let x = (ref (width /. 2.000000));;

# 120 "?"
let y = (ref (height -. (rsize *. 2.000000)));;

# 121 "?"
let speed = 5.000000;;

# 123 "?"
let move = (fun () -> 
# 152 "?"

  
# 125 "?"
let m = 5 in
  
# 126 "?"
let m = (if (Key . left (())) then ((m - 1))else(m)) in
  
# 127 "?"
let m = (if (Key . right (())) then ((m + 1))else(m)) in
  
# 128 "?"
let m = (if (Key . up (())) then ((m - 3))else(m)) in
  
# 129 "?"
let m = (if (Key . down (())) then ((m + 3))else(m)) in
  
# 130 "?"
let speed = (match m with | (
# 131 "?"
1)| (3)| (7)| (9)-> (
  (speed /. 1.400000)

)| (
# 132 "?"
_)-> (
  speed

)) in
  
# 134 "?"
let nx , ny = (match m with | (
# 135 "?"
1)-> (
  ((! x) -. speed) , ((! y) -. speed)

)| (
# 136 "?"
2)-> (
  (! x) , ((! y) -. speed)

)| (
# 137 "?"
3)-> (
  ((! x) +. speed) , ((! y) -. speed)

)| (
# 138 "?"
4)-> (
  ((! x) -. speed) , (! y)

)| (
# 139 "?"
5)-> (
  (! x) , (! y)

)| (
# 140 "?"
6)-> (
  ((! x) +. speed) , (! y)

)| (
# 141 "?"
7)-> (
  ((! x) -. speed) , ((! y) +. speed)

)| (
# 142 "?"
8)-> (
  (! x) , ((! y) +. speed)

)| (
# 143 "?"
9)-> (
  ((! x) +. speed) , ((! y) +. speed)

)| (
# 144 "?"
_)-> (
  (! x) , (! y)

)) in
  
# 147 "?"
(x := min  (max  (nx) ((rsize /. 2.000000))) ((width -. (rsize /. 2.000000))));
  
# 148 "?"
(y := min  (max  (ny) ((rsize /. 2.000000))) ((height -. (rsize /. 2.000000))));
  
# 150 "?"
(Bullets . move (()));
  
# 151 "?"
(if (Key . z (())) then ((Bullets . add  ((! x)) (((! y) -. (rsize /. 2.000000)))))  )
);;

# 154 "?"
let draw = (fun () -> 
# 171 "?"

  
# 155 "?"
(GlDraw . color (1.000000 , 0.000000 , 0.000000));
  
# 156 "?"
let r = (rsize /. 6.000000) in
  
# 157 "?"
let r2 = (rsize /. 4.000000) in
  
# 158 "?"
(GlDraw . rect  (
# 159 "?"
((! x) -. r) , (((! y) -. r) -. r2)) (
# 160 "?"
((! x) +. r) , (((! y) +. r) -. r)));
  
# 162 "?"
(GlDraw . rect  (
# 163 "?"
(((! x) -. r) -. r2) , (((! y) -. r) +. r2)) (
# 164 "?"
(((! x) +. r) -. r2) , (((! y) +. r) +. r2)));
  
# 166 "?"
(GlDraw . rect  (
# 167 "?"
(((! x) -. r) +. r2) , (((! y) -. r) +. r2)) (
# 168 "?"
(((! x) +. r) +. r2) , (((! y) +. r) +. r2)));
  
# 170 "?"
(Bullets . draw (()))
)
end;;
module BG = struct

# 177 "?"
let (stars:(((float * float * float)) list) ref) = (ref []);;

# 179 "?"
let init = (fun () -> 
# 195 "?"

  
# 181 "?"
let rec createList = (fun i ls f -> 
# 186 "?"

    
# 182 "?"
(match i with | (
# 183 "?"
(- 1))-> (
      ls
    
)| (
# 184 "?"
i)-> (
      createList  ((i - 1))  ((f (i) :: ls)) (f)
    
))
  ) in
  
# 188 "?"
(stars := createList  (30) ([]) (
# 194 "?"
begin fun t1'  -> match t1' with
    | (
# 189 "?"
i) -> (

# 190 "?"

      let x = (Random . float (width)) in
      
# 191 "?"
let y = (Random . float (height)) in
      
# 192 "?"
let speed = ((Random . float (3.000000)) +. 2.000000) in
      
# 193 "?"
( x , y , speed)
    )
   end ))
);;

# 197 "?"
let move = (fun () -> 
# 210 "?"

  
# 198 "?"
(stars := (List . map (
# 209 "?"
begin fun t1'  -> match t1' with
    | (
# 199 "?"
( x , y , speed)) -> (

# 200 "?"

      let x = (x -. ((((! (Ship . x)) -. (width /. 2.000000)) *. 0.005000) *. speed)) in
      
# 201 "?"
let x = (if (x < 0.000000) then ((x +. width))else(x)) in
      
# 202 "?"
let x = (if (x > width) then ((x -. width))else(x)) in
      
# 203 "?"
let speed2 = (speed +. ((height -. (! (Ship . y))) *. 0.030000)) in
      
# 204 "?"
let y = (y +. speed2) in
      
# 205 "?"
(if (y > height) then (
# 206 "?"
( (Random . float (width)) , 0.000000 , ((Random . float (3.000000)) +. 2.000000))      )else(
# 208 "?"
( x , y , speed)))
    )
   end )) (
# 198 "?"
(! stars)))
);;

# 212 "?"
let draw = (fun () -> 
# 228 "?"

  
# 213 "?"
(List . iter (
# 227 "?"
begin fun t1'  -> match t1' with
    | (
# 214 "?"
( x , y , s)) -> (

# 215 "?"

      (GlDraw . color (
# 216 "?"
((Random . float (0.500000)) +. 0.500000) , 
# 217 "?"
((Random . float (0.500000)) +. 0.500000) , 
# 218 "?"
((Random . float (0.500000)) +. 0.500000)));
      
# 221 "?"
let s = (s +. ((height -. (! (Ship . y))) *. 0.060000)) in
      
# 223 "?"
(GlDraw . rect  (
# 224 "?"
x , y) (
# 225 "?"
(x +. 1.500000) , ((y +. 1.000000) +. s)))
    )
   end )) (
# 213 "?"
(! stars))
)
end;;
module Enemies = struct
type enemy = {x:float;y:float;enable:(bool) ref};;

# 235 "?"
let (enemies:((enemy) list) ref) = (ref []);;

# 237 "?"
let count = (ref 0);;

# 238 "?"
let add = (fun x y -> 
# 242 "?"

  
# 239 "?"
(if ((! count) < 20) then (
# 241 "?"

    
# 240 "?"
(enemies := ({x;y;enable=(ref true)} :: (! enemies)))
)  )
);;

# 246 "?"
let init = (fun () -> 
# 249 "?"

  
# 247 "?"
(Printf . printf  ("%d\n") (1))
);;

# 251 "?"
let move = (fun () -> 
# 266 "?"

  
# 252 "?"
(if ((Random . float (1.000000)) < 0.050000) then (
# 253 "?"
add  (((Random . float ((width *. 2.000000))) -. (width /. 2.000000))) (-10.000000))  );
  
# 255 "?"
(count := 0);
  
# 256 "?"
(enemies := 
# 262 "?"
(List . filter (
# 265 "?"
begin fun t1'  -> match t1' with
    | (
# 263 "?"
{x;y;enable={contents=b}}) -> (

# 264 "?"

      ((b && (y < height)) && (Bullets . checkColligion  (x)  (y) (16.000000)))
    )
   end )) (
# 256 "?"
(List . map (
# 262 "?"
begin fun t1'  -> match t1' with
    | (
# 257 "?"
{x;y;enable}) -> (

# 258 "?"

      incr (count);
      
# 259 "?"
let s = (5.000000 +. ((height -. (! (Ship . y))) *. 0.060000)) in
      
# 260 "?"
let x = (x -. ((((! (Ship . x)) -. (width /. 2.000000)) *. 0.005000) *. s)) in
      
# 261 "?"
{x=x;y=(y +. s);enable=enable}
    )
   end )) (
# 256 "?"
(! enemies))))
);;

# 268 "?"
let draw = (fun () -> 
# 282 "?"

  
# 269 "?"
(List . iter (
# 281 "?"
begin fun t1'  -> match t1' with
    | (
# 270 "?"
{x;y}) -> (

# 271 "?"

      (GlDraw . color (
# 272 "?"
((Random . float (0.100000)) +. 0.800000) , 
# 273 "?"
((Random . float (0.100000)) +. 0.800000) , 
# 274 "?"
((Random . float (0.100000)) +. 0.200000)));
      
# 276 "?"
let r = 12.000000 in
      
# 277 "?"
(GlDraw . rect  (
# 278 "?"
(x -. r) , (y -. r)) (
# 279 "?"
(x +. r) , (y +. r)))
    )
   end )) (
# 269 "?"
(! enemies))
)
end;;
module Game = struct

# 287 "?"
let draw = (fun () -> 
# 293 "?"

  
# 288 "?"
(GlClear . clear ([`color]));
  
# 289 "?"
(BG . draw (()));
  
# 290 "?"
(Ship . draw (()));
  
# 291 "?"
(Enemies . draw (()));
  
# 292 "?"
(Glut . swapBuffers (()))
);;

# 295 "?"
let rec mainLoop = (fun ~(value) -> 
# 301 "?"

  
# 296 "?"
(Glut . postRedisplay (()));
  
# 297 "?"
(BG . move (()));
  
# 298 "?"
(Ship . move (()));
  
# 299 "?"
(Enemies . move (()));
  
# 300 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1))
);;

# 303 "?"
let resize = (fun ~(w) ~(h) -> 
# 314 "?"

  
# 304 "?"
(GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(max  (h) (1)));
  
# 306 "?"
(GlMat . mode (`projection));
  
# 307 "?"
(GlMat . load_identity (()));
  
# 309 "?"
let ortho = (GlMat . ortho ~z:(( 1.000000 , -1.000000))) in
  
# 310 "?"
ortho  ~x:(( 0.000000 , width)) ~y:(( height , -0.000000));
  
# 312 "?"
(GlMat . mode (`modelview));
  
# 313 "?"
(GlMat . load_identity (()))
);;

# 316 "?"
let main = 
# 329 "?"


# 317 "?"
(Random . init (int_of_float (((Sys . time (())) *. 10000.000000))));

# 318 "?"
ignore ((Glut . init ((Sys . argv))));

# 319 "?"
(Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) (()));

# 320 "?"
(Glut . initWindowSize  ~w:(int_of_float (width)) ~h:(int_of_float (height)));

# 321 "?"
ignore ((Glut . createWindow ("Game03")));

# 322 "?"
(Glut . displayFunc (draw));

# 323 "?"
(Glut . reshapeFunc (resize));

# 324 "?"
(Key . init (()));

# 325 "?"
(BG . init (()));

# 326 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1));

# 327 "?"
(GlClear . color  ~alpha:(1.000000) (0.100000 , 0.100000 , 0.100000));

# 328 "?"
(Glut . mainLoop (()))

end
