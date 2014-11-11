
# 5 "?"
let width = 400.0;; 
# 6 "?"
let height = 800.0;; module Key = struct 
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
(Glut . KEY_UP))-> (     (_up := true)
  )| (
# 25 "?"
(Glut . KEY_DOWN))-> (     (_down := true)
  )| (
# 26 "?"
(Glut . KEY_LEFT))-> (     (_left := true)
  )| (
# 27 "?"
(Glut . KEY_RIGHT))-> (     (_right := true)
  )| (
# 28 "?"
_)-> (     ()
  ))
);; 
# 32 "?"
let onSpKeyUp = (fun ~(key) ~(x) ~(y) -> 
# 40 "?"
   
# 33 "?"
(match key with | (
# 34 "?"
(Glut . KEY_UP))-> (     (_up := false)
  )| (
# 35 "?"
(Glut . KEY_DOWN))-> (     (_down := false)
  )| (
# 36 "?"
(Glut . KEY_LEFT))-> (     (_left := false)
  )| (
# 37 "?"
(Glut . KEY_RIGHT))-> (     (_right := false)
  )| (
# 38 "?"
_)-> (     ()
  ))
);; 
# 42 "?"
let onKeyDown = (fun ~(key) ~(x) ~(y) -> 
# 47 "?"
   
# 43 "?"
(match char_of_int (key) with | (
# 44 "?"
'z')-> (     (_z := true)
  )| (
# 45 "?"
_)-> (     ()
  ))
);; 
# 49 "?"
let onKeyUp = (fun ~(key) ~(x) ~(y) -> 
# 54 "?"
   
# 50 "?"
(match char_of_int (key) with | (
# 51 "?"
'z')-> (     (_z := false)
  )| (
# 52 "?"
_)-> (     ()
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
) end;; type bullet = {x:float;y:float;enable:(bool) ref};; module Utils = struct 
# 68 "?"
let checkColligion = (fun bx by r ls -> 
# 73 "?"
   
# 69 "?"
(not (List . exists (
# 72 "?"
begin fun t1'  -> match t1' with   | (
# 69 "?"
{x;y}) -> (
# 70 "?"
     ((((x -. r) < bx) && (bx < (x +. r))) && 
# 71 "?"
(((y -. r) < by) && (by < (y +. r))))
  ) end ) (
# 72 "?"
ls)))
) end;; module Bullets = struct 
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
begin fun t1'  -> match t1' with     | (
# 98 "?"
{y;enable={contents=b}}) -> (
# 99 "?"
       (b && (y > 0.))
    )   end )) (
# 93 "?"
(List . map (
# 97 "?"
begin fun t1'  -> match t1' with     | (
# 94 "?"
{x;y;enable}) -> (
# 95 "?"
       incr (cnt);
      
# 96 "?"
{x=x;y=(y -. 30.0);enable=enable}
    )   end )) (
# 93 "?"
(! bullets))))
);; 
# 103 "?"
let draw = (fun () -> 
# 116 "?"
   
# 104 "?"
(GlDraw . color (
# 105 "?"
0.5 , 
# 106 "?"
(0.8 +. (Random . float (0.2))) , 
# 107 "?"
(0.8 +. (Random . float (0.2)))));
  
# 109 "?"
(List . iter (
# 115 "?"
begin fun t1'  -> match t1' with     | (
# 110 "?"
{x;y}) -> (
# 111 "?"
       (GlDraw . rect  (
# 112 "?"
(x -. 1.5) , (y -. 6.5)) (
# 113 "?"
(x +. 3.0) , (y +. 4.0)))
    )   end )) (
# 109 "?"
(! bullets))
);; 
# 118 "?"
let checkColligion = (fun x y r -> 
# 120 "?"
   
# 119 "?"
(Utils . checkColligion  (x)  (y) (r) ((! bullets)))
) end;; module Ship = struct 
# 124 "?"
let rsize = 25.0;; 
# 125 "?"
let x = (ref (width /. 2.0));; 
# 126 "?"
let y = (ref (height -. (rsize *. 2.0)));; 
# 127 "?"
let speed = 5.0;; 
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
1)| (3)| (7)| (9)-> (   (speed /. 1.4)
)| (
# 138 "?"
_)-> (   speed
)) in
  
# 140 "?"
let nx , ny = (match m with | (
# 141 "?"
1)-> (   ((! x) -. speed) , ((! y) -. speed)
)| (
# 142 "?"
2)-> (   (! x) , ((! y) -. speed)
)| (
# 143 "?"
3)-> (   ((! x) +. speed) , ((! y) -. speed)
)| (
# 144 "?"
4)-> (   ((! x) -. speed) , (! y)
)| (
# 145 "?"
5)-> (   (! x) , (! y)
)| (
# 146 "?"
6)-> (   ((! x) +. speed) , (! y)
)| (
# 147 "?"
7)-> (   ((! x) -. speed) , ((! y) +. speed)
)| (
# 148 "?"
8)-> (   (! x) , ((! y) +. speed)
)| (
# 149 "?"
9)-> (   ((! x) +. speed) , ((! y) +. speed)
)| (
# 150 "?"
_)-> (   (! x) , (! y)
)) in
  
# 153 "?"
(x := min  (max  (nx) ((rsize /. 2.))) ((width -. (rsize /. 2.))));
  
# 154 "?"
(y := min  (max  (ny) ((rsize /. 2.))) ((height -. (rsize /. 2.))));
  
# 156 "?"
(Bullets . move (()));
  
# 157 "?"
(if (Key . z (())) then ((Bullets . add  ((! x)) (((! y) -. (rsize /. 2.)))))  )
);; 
# 160 "?"
let draw = (fun () -> 
# 177 "?"
   
# 161 "?"
(GlDraw . color (1.0 , 0.0 , 0.0));
  
# 162 "?"
let r = (rsize /. 6.) in
  
# 163 "?"
let r2 = (rsize /. 4.) in
  
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
) end;; module BG = struct 
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
(- 1))-> (       ls
    )| (
# 189 "?"
i)-> (       createList  ((i - 1))  ((f (i) :: ls)) (f)
    ))
  ) in
  
# 193 "?"
(stars := createList  (30) ([]) (
# 199 "?"
begin fun t1'  -> match t1' with     | (
# 194 "?"
i) -> (
# 195 "?"
       let x = (Random . float (width)) in
      
# 196 "?"
let y = (Random . float (height)) in
      
# 197 "?"
let speed = ((Random . float (3.)) +. 2.0) in
      
# 198 "?"
( x , y , speed)
    )   end ))
);; 
# 202 "?"
let move = (fun () -> 
# 215 "?"
   
# 203 "?"
(stars := (List . map (
# 214 "?"
begin fun t1'  -> match t1' with     | (
# 204 "?"
( x , y , speed)) -> (
# 205 "?"
       let x = (x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. speed)) in
      
# 206 "?"
let x = (if (x < 0.) then ((x +. width))else(x)) in
      
# 207 "?"
let x = (if (x > width) then ((x -. width))else(x)) in
      
# 208 "?"
let speed2 = (speed +. ((height -. (! (Ship . y))) *. 0.03)) in
      
# 209 "?"
let y = (y +. speed2) in
      
# 210 "?"
(if (y > height) then (
# 211 "?"
( (Random . float (width)) , 0. , ((Random . float (3.)) +. 2.))      )else(
# 213 "?"
( x , y , speed)))
    )   end )) (
# 203 "?"
(! stars)))
);; 
# 217 "?"
let draw = (fun () -> 
# 233 "?"
   
# 218 "?"
(List . iter (
# 232 "?"
begin fun t1'  -> match t1' with     | (
# 219 "?"
( x , y , s)) -> (
# 220 "?"
       (GlDraw . color (
# 221 "?"
((Random . float (0.5)) +. 0.5) , 
# 222 "?"
((Random . float (0.5)) +. 0.5) , 
# 223 "?"
((Random . float (0.5)) +. 0.5)));
      
# 226 "?"
let s = (s +. ((height -. (! (Ship . y))) *. 0.06)) in
      
# 228 "?"
(GlDraw . rect  (
# 229 "?"
x , y) (
# 230 "?"
(x +. 1.5) , ((y +. 1.0) +. s)))
    )   end )) (
# 218 "?"
(! stars))
) end;; module Enemies = struct class enemy (x:float)(y:float)(enable:bool) = object(this) 
# 238 "?"
method x = x 
# 239 "?"
method y = y 
# 240 "?"
val mutable enable = enable 
# 241 "?"
method enable = enable 
# 242 "?"
method set_enable = (fun e -> (enable <- e)) 
# 243 "?"
method move = 
# 247 "?"
 
# 244 "?"
let s = (2.0 +. ((height -. (! (Ship . y))) *. 0.06)) in

# 245 "?"
let x = (x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. s)) in

# 246 "?"
(new enemy  (x)  ((y +. s)) ((enable && (y < height))))
 
# 248 "?"
method draw = 
# 259 "?"
 
# 249 "?"
(GlDraw . color (
# 250 "?"
((Random . float (0.1)) +. 0.8) , 
# 251 "?"
((Random . float (0.1)) +. 0.8) , 
# 252 "?"
((Random . float (0.1)) +. 0.2)));

# 254 "?"
let r = 12.0 in

# 255 "?"
(GlDraw . rect  (
# 256 "?"
(x -. r) , (y -. r)) (
# 257 "?"
(x +. r) , (y +. r)))
 end;; class enemy2 (x:float)(y:float)(enable:bool) = object(this) 
# 263 "?"
method x = x 
# 264 "?"
method y = y 
# 265 "?"
method z = 1 
# 266 "?"
val mutable enable = enable 
# 267 "?"
method enable = enable 
# 268 "?"
method set_enable = (fun e -> (enable <- e)) 
# 269 "?"
method move = 
# 274 "?"
 
# 271 "?"
let s = (5.0 +. ((height -. (! (Ship . y))) *. 0.06)) in

# 272 "?"
let x = (x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. s)) in

# 273 "?"
(new enemy2  (x)  ((y +. s)) ((enable && (y < height))))
 
# 275 "?"
method draw = 
# 286 "?"
 
# 276 "?"
(GlDraw . color (
# 277 "?"
((Random . float (0.1)) +. 0.5) , 
# 278 "?"
((Random . float (0.1)) +. 0.5) , 
# 279 "?"
((Random . float (0.1)) +. 0.9)));

# 281 "?"
let r = 8.0 in

# 282 "?"
(GlDraw . rect  (
# 283 "?"
(x -. r) , (y -. r)) (
# 284 "?"
(x +. r) , (y +. r)))
 end;; 
# 289 "?"
let (enemies:((enemy) list) ref) = (ref []);; 
# 291 "?"
let count = (ref 0);; 
# 292 "?"
let add = (fun enm x y -> 
# 296 "?"
   
# 293 "?"
(if ((! count) < 20) then (
# 295 "?"
     
# 294 "?"
(enemies := (enm  (x)  (y) (true) :: (! enemies)))
)  )
);; 
# 298 "?"
let move = (fun () -> 
# 318 "?"
   
# 299 "?"
(if ((Random . float (1.0)) < 0.05) then (
# 306 "?"
     
# 301 "?"
let es = [begin fun t1' t2' t3'  -> match t1',t2',t3' with   | (x),(y),(b) -> (     ((new enemy2  (x)  (y) (b)) :> enemy)
  ) end ; (new enemy)] in
    
# 303 "?"
let enm = (List . nth  (es) ((Random . int ((List . length (es)))))) in
    
# 304 "?"
add  (enm)  (((Random . float ((width *. 2.0))) -. (width /. 2.))) (-10.0)
)  );
  
# 308 "?"
(count := 0);
  
# 309 "?"
(enemies := 
# 313 "?"
(List . filter (
# 317 "?"
begin fun t1'  -> match t1' with     | (
# 314 "?"
e) -> (
# 315 "?"
       ((e # enable) && 
# 316 "?"
(Bullets . checkColligion  ((e # x))  ((e # y)) (16.0)))
    )   end )) (
# 309 "?"
(List . map (
# 313 "?"
begin fun t1'  -> match t1' with     | (
# 310 "?"
e) -> (
# 311 "?"
       incr (count);
      
# 312 "?"
(e # move)
    )   end )) (
# 309 "?"
(! enemies))))
);; 
# 320 "?"
let draw = (fun () -> 
# 322 "?"
   
# 321 "?"
(List . iter (begin fun t1'  -> match t1' with     | (e) -> (       (e # draw)
    )   end )) ((! enemies))
) end;; module Game = struct 
# 327 "?"
let draw = (fun () -> 
# 333 "?"
   
# 328 "?"
(GlClear . clear ([`color]));
  
# 329 "?"
(BG . draw (()));
  
# 330 "?"
(Ship . draw (()));
  
# 331 "?"
(Enemies . draw (()));
  
# 332 "?"
(Glut . swapBuffers (()))
);; 
# 335 "?"
let rec mainLoop = (fun ~(value) -> 
# 341 "?"
   
# 336 "?"
(Glut . postRedisplay (()));
  
# 337 "?"
(BG . move (()));
  
# 338 "?"
(Ship . move (()));
  
# 339 "?"
(Enemies . move (()));
  
# 340 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1))
);; 
# 343 "?"
let resize = (fun ~(w) ~(h) -> 
# 354 "?"
   
# 344 "?"
(GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(max  (h) (1)));
  
# 346 "?"
(GlMat . mode (`projection));
  
# 347 "?"
(GlMat . load_identity (()));
  
# 349 "?"
let ortho = (GlMat . ortho ~z:(( 1.0 , -1.0))) in
  
# 350 "?"
ortho  ~x:(( 0.0 , width)) ~y:(( height , -0.0));
  
# 352 "?"
(GlMat . mode (`modelview));
  
# 353 "?"
(GlMat . load_identity (()))
);; 
# 356 "?"
let main = 
# 369 "?"
 
# 357 "?"
(Random . init (int_of_float (((Sys . time (())) *. 10000.0))));

# 358 "?"
ignore ((Glut . init ((Sys . argv))));

# 359 "?"
(Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) (()));

# 360 "?"
(Glut . initWindowSize  ~w:(int_of_float (width)) ~h:(int_of_float (height)));

# 361 "?"
ignore ((Glut . createWindow ("Game04")));

# 362 "?"
(Glut . displayFunc (draw));

# 363 "?"
(Glut . reshapeFunc (resize));

# 364 "?"
(Key . init (()));

# 365 "?"
(BG . init (()));

# 366 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1));

# 367 "?"
(GlClear . color  ~alpha:(1.0) (0.1 , 0.1 , 0.1));

# 368 "?"
(Glut . mainLoop (()))
 end
