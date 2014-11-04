
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

# 83 "?"
let cnt = (ref 0);;

# 85 "?"
let add = (fun x y -> 
# 89 "?"

  
# 86 "?"
(if ((! cnt) < 16) then (
# 88 "?"

    
# 87 "?"
(bullets := ({x=x;y=y;enable=(ref true)} :: (! bullets)))
)  )
);;

# 91 "?"
let move = (fun () -> 
# 101 "?"

  
# 92 "?"
(cnt := 0);
  
# 93 "?"
(bullets := 
# 97 "?"
(List . filter (
# 100 "?"
begin fun t1'  -> match t1' with
    | (
# 98 "?"
{y;enable={contents=b}}) -> (

# 99 "?"

      (b && (y > 0.000000))
    )
   end )) (
# 93 "?"
(List . map (
# 97 "?"
begin fun t1'  -> match t1' with
    | (
# 94 "?"
{x;y;enable}) -> (

# 95 "?"

      incr (cnt);
      
# 96 "?"
{x=x;y=(y -. 30.000000);enable=enable}
    )
   end )) (
# 93 "?"
(! bullets))))
);;

# 103 "?"
let draw = (fun () -> 
# 116 "?"

  
# 104 "?"
(GlDraw . color (
# 105 "?"
0.500000 , 
# 106 "?"
(0.800000 +. (Random . float (0.200000))) , 
# 107 "?"
(0.800000 +. (Random . float (0.200000)))));
  
# 109 "?"
(List . iter (
# 115 "?"
begin fun t1'  -> match t1' with
    | (
# 110 "?"
{x;y}) -> (

# 111 "?"

      (GlDraw . rect  (
# 112 "?"
(x -. 1.500000) , (y -. 6.500000)) (
# 113 "?"
(x +. 3.000000) , (y +. 4.000000)))
    )
   end )) (
# 109 "?"
(! bullets))
);;

# 118 "?"
let checkColligion = (fun x y r -> 
# 120 "?"

  
# 119 "?"
(Utils . checkColligion  (x)  (y) (r) ((! bullets)))
)
end;;
module Ship = struct

# 124 "?"
let rsize = 25.000000;;

# 125 "?"
let x = (ref (width /. 2.000000));;

# 126 "?"
let y = (ref (height -. (rsize *. 2.000000)));;

# 127 "?"
let speed = 5.000000;;

# 129 "?"
let move = (fun () -> 
# 158 "?"

  
# 131 "?"
let m = 5 in
  
# 132 "?"
let m = (if (Key . left (())) then ((m - 1))else(m)) in
  
# 133 "?"
let m = (if (Key . right (())) then ((m + 1))else(m)) in
  
# 134 "?"
let m = (if (Key . up (())) then ((m - 3))else(m)) in
  
# 135 "?"
let m = (if (Key . down (())) then ((m + 3))else(m)) in
  
# 136 "?"
let speed = (match m with | (
# 137 "?"
1)| (3)| (7)| (9)-> (
  (speed /. 1.400000)

)| (
# 138 "?"
_)-> (
  speed

)) in
  
# 140 "?"
let nx , ny = (match m with | (
# 141 "?"
1)-> (
  ((! x) -. speed) , ((! y) -. speed)

)| (
# 142 "?"
2)-> (
  (! x) , ((! y) -. speed)

)| (
# 143 "?"
3)-> (
  ((! x) +. speed) , ((! y) -. speed)

)| (
# 144 "?"
4)-> (
  ((! x) -. speed) , (! y)

)| (
# 145 "?"
5)-> (
  (! x) , (! y)

)| (
# 146 "?"
6)-> (
  ((! x) +. speed) , (! y)

)| (
# 147 "?"
7)-> (
  ((! x) -. speed) , ((! y) +. speed)

)| (
# 148 "?"
8)-> (
  (! x) , ((! y) +. speed)

)| (
# 149 "?"
9)-> (
  ((! x) +. speed) , ((! y) +. speed)

)| (
# 150 "?"
_)-> (
  (! x) , (! y)

)) in
  
# 153 "?"
(x := min  (max  (nx) ((rsize /. 2.000000))) ((width -. (rsize /. 2.000000))));
  
# 154 "?"
(y := min  (max  (ny) ((rsize /. 2.000000))) ((height -. (rsize /. 2.000000))));
  
# 156 "?"
(Bullets . move (()));
  
# 157 "?"
(if (Key . z (())) then ((Bullets . add  ((! x)) (((! y) -. (rsize /. 2.000000)))))  )
);;

# 160 "?"
let draw = (fun () -> 
# 177 "?"

  
# 161 "?"
(GlDraw . color (1.000000 , 0.000000 , 0.000000));
  
# 162 "?"
let r = (rsize /. 6.000000) in
  
# 163 "?"
let r2 = (rsize /. 4.000000) in
  
# 164 "?"
(GlDraw . rect  (
# 165 "?"
((! x) -. r) , (((! y) -. r) -. r2)) (
# 166 "?"
((! x) +. r) , (((! y) +. r) -. r)));
  
# 168 "?"
(GlDraw . rect  (
# 169 "?"
(((! x) -. r) -. r2) , (((! y) -. r) +. r2)) (
# 170 "?"
(((! x) +. r) -. r2) , (((! y) +. r) +. r2)));
  
# 172 "?"
(GlDraw . rect  (
# 173 "?"
(((! x) -. r) +. r2) , (((! y) -. r) +. r2)) (
# 174 "?"
(((! x) +. r) +. r2) , (((! y) +. r) +. r2)));
  
# 176 "?"
(Bullets . draw (()))
)
end;;
module BG = struct

# 182 "?"
let (stars:(((float * float * float)) list) ref) = (ref []);;

# 184 "?"
let init = (fun () -> 
# 200 "?"

  
# 186 "?"
let rec createList = (fun i ls f -> 
# 191 "?"

    
# 187 "?"
(match i with | (
# 188 "?"
(- 1))-> (
      ls
    
)| (
# 189 "?"
i)-> (
      createList  ((i - 1))  ((f (i) :: ls)) (f)
    
))
  ) in
  
# 193 "?"
(stars := createList  (30) ([]) (
# 199 "?"
begin fun t1'  -> match t1' with
    | (
# 194 "?"
i) -> (

# 195 "?"

      let x = (Random . float (width)) in
      
# 196 "?"
let y = (Random . float (height)) in
      
# 197 "?"
let speed = ((Random . float (3.000000)) +. 2.000000) in
      
# 198 "?"
( x , y , speed)
    )
   end ))
);;

# 202 "?"
let move = (fun () -> 
# 215 "?"

  
# 203 "?"
(stars := (List . map (
# 214 "?"
begin fun t1'  -> match t1' with
    | (
# 204 "?"
( x , y , speed)) -> (

# 205 "?"

      let x = (x -. ((((! (Ship . x)) -. (width /. 2.000000)) *. 0.005000) *. speed)) in
      
# 206 "?"
let x = (if (x < 0.000000) then ((x +. width))else(x)) in
      
# 207 "?"
let x = (if (x > width) then ((x -. width))else(x)) in
      
# 208 "?"
let speed2 = (speed +. ((height -. (! (Ship . y))) *. 0.030000)) in
      
# 209 "?"
let y = (y +. speed2) in
      
# 210 "?"
(if (y > height) then (
# 211 "?"
( (Random . float (width)) , 0.000000 , ((Random . float (3.000000)) +. 2.000000))      )else(
# 213 "?"
( x , y , speed)))
    )
   end )) (
# 203 "?"
(! stars)))
);;

# 217 "?"
let draw = (fun () -> 
# 233 "?"

  
# 218 "?"
(List . iter (
# 232 "?"
begin fun t1'  -> match t1' with
    | (
# 219 "?"
( x , y , s)) -> (

# 220 "?"

      (GlDraw . color (
# 221 "?"
((Random . float (0.500000)) +. 0.500000) , 
# 222 "?"
((Random . float (0.500000)) +. 0.500000) , 
# 223 "?"
((Random . float (0.500000)) +. 0.500000)));
      
# 226 "?"
let s = (s +. ((height -. (! (Ship . y))) *. 0.060000)) in
      
# 228 "?"
(GlDraw . rect  (
# 229 "?"
x , y) (
# 230 "?"
(x +. 1.500000) , ((y +. 1.000000) +. s)))
    )
   end )) (
# 218 "?"
(! stars))
)
end;;
module Enemies = struct
class enemy (x:float)(y:float)(enable:(bool) ref) = object(this)

# 238 "?"
method x = x

# 239 "?"
method y = y

# 240 "?"
method enable = enable

# 241 "?"
method move = 
# 245 "?"


# 242 "?"
let s = (2.000000 +. ((height -. (! (Ship . y))) *. 0.060000)) in

# 243 "?"
let x = (x -. ((((! (Ship . x)) -. (width /. 2.000000)) *. 0.005000) *. s)) in

# 244 "?"
(new enemy  (x)  ((y +. s)) (enable))


# 246 "?"
method draw = 
# 257 "?"


# 247 "?"
(GlDraw . color (
# 248 "?"
((Random . float (0.100000)) +. 0.800000) , 
# 249 "?"
((Random . float (0.100000)) +. 0.800000) , 
# 250 "?"
((Random . float (0.100000)) +. 0.200000)));

# 252 "?"
let r = 12.000000 in

# 253 "?"
(GlDraw . rect  (
# 254 "?"
(x -. r) , (y -. r)) (
# 255 "?"
(x +. r) , (y +. r)))

end;;
class enemy2 (x:float)(y:float)(enable:(bool) ref) = object(this)

# 261 "?"
method x = x

# 262 "?"
method y = y

# 263 "?"
method enable = enable

# 264 "?"
method move = 
# 269 "?"


# 266 "?"
let s = (5.000000 +. ((height -. (! (Ship . y))) *. 0.060000)) in

# 267 "?"
let x = (x -. ((((! (Ship . x)) -. (width /. 2.000000)) *. 0.005000) *. s)) in

# 268 "?"
(new enemy2  (x)  ((y +. s)) (enable))


# 270 "?"
method draw = 
# 281 "?"


# 271 "?"
(GlDraw . color (
# 272 "?"
((Random . float (0.100000)) +. 0.500000) , 
# 273 "?"
((Random . float (0.100000)) +. 0.500000) , 
# 274 "?"
((Random . float (0.100000)) +. 0.900000)));

# 276 "?"
let r = 8.000000 in

# 277 "?"
(GlDraw . rect  (
# 278 "?"
(x -. r) , (y -. r)) (
# 279 "?"
(x +. r) , (y +. r)))

end;;

# 284 "?"
let (enemies:((enemy2) list) ref) = (ref []);;

# 286 "?"
let count = (ref 0);;

# 287 "?"
let add = (fun enm x y -> 
# 291 "?"

  
# 288 "?"
(if ((! count) < 20) then (
# 290 "?"

    
# 289 "?"
(enemies := (enm  (x)  (y) ((ref true)) :: (! enemies)))
)  )
);;

# 293 "?"
let move = (fun () -> 
# 314 "?"

  
# 294 "?"
(if ((Random . float (1.000000)) < 0.050000) then (
# 301 "?"

    
# 296 "?"
let es = [(new enemy2); (new enemy)] in
    
# 298 "?"
let enm = (List . nth  (es) ((Random . int ((List . length (es)))))) in
    
# 299 "?"
add  (enm)  (((Random . float ((width *. 2.000000))) -. (width /. 2.000000))) (-10.000000)
)  );
  
# 303 "?"
(count := 0);
  
# 304 "?"
(enemies := 
# 308 "?"
(List . filter (
# 313 "?"
begin fun t1'  -> match t1' with
    | (
# 309 "?"
e) -> (

# 310 "?"

      (((! (e # enable)) && 
# 311 "?"
((e # y) < height)) && 
# 312 "?"
(Bullets . checkColligion  ((e # x))  ((e # y)) (16.000000)))
    )
   end )) (
# 304 "?"
(List . map (
# 308 "?"
begin fun t1'  -> match t1' with
    | (
# 305 "?"
e) -> (

# 306 "?"

      incr (count);
      
# 307 "?"
(e # move)
    )
   end )) (
# 304 "?"
(! enemies))))
);;

# 316 "?"
let draw = (fun () -> 
# 318 "?"

  
# 317 "?"
(List . iter (begin fun t1'  -> match t1' with
    | (e) -> (

      (e # draw)
    )
   end )) ((! enemies))
)
end;;
module Game = struct

# 323 "?"
let draw = (fun () -> 
# 329 "?"

  
# 324 "?"
(GlClear . clear ([`color]));
  
# 325 "?"
(BG . draw (()));
  
# 326 "?"
(Ship . draw (()));
  
# 327 "?"
(Enemies . draw (()));
  
# 328 "?"
(Glut . swapBuffers (()))
);;

# 331 "?"
let rec mainLoop = (fun ~(value) -> 
# 337 "?"

  
# 332 "?"
(Glut . postRedisplay (()));
  
# 333 "?"
(BG . move (()));
  
# 334 "?"
(Ship . move (()));
  
# 335 "?"
(Enemies . move (()));
  
# 336 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1))
);;

# 339 "?"
let resize = (fun ~(w) ~(h) -> 
# 350 "?"

  
# 340 "?"
(GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(max  (h) (1)));
  
# 342 "?"
(GlMat . mode (`projection));
  
# 343 "?"
(GlMat . load_identity (()));
  
# 345 "?"
let ortho = (GlMat . ortho ~z:(( 1.000000 , -1.000000))) in
  
# 346 "?"
ortho  ~x:(( 0.000000 , width)) ~y:(( height , -0.000000));
  
# 348 "?"
(GlMat . mode (`modelview));
  
# 349 "?"
(GlMat . load_identity (()))
);;

# 352 "?"
let main = 
# 365 "?"


# 353 "?"
(Random . init (int_of_float (((Sys . time (())) *. 10000.000000))));

# 354 "?"
ignore ((Glut . init ((Sys . argv))));

# 355 "?"
(Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) (()));

# 356 "?"
(Glut . initWindowSize  ~w:(int_of_float (width)) ~h:(int_of_float (height)));

# 357 "?"
ignore ((Glut . createWindow ("Game03")));

# 358 "?"
(Glut . displayFunc (draw));

# 359 "?"
(Glut . reshapeFunc (resize));

# 360 "?"
(Key . init (()));

# 361 "?"
(BG . init (()));

# 362 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1));

# 363 "?"
(GlClear . color  ~alpha:(1.000000) (0.100000 , 0.100000 , 0.100000));

# 364 "?"
(Glut . mainLoop (()))

end
