module Html = 
# 5 "?"
Dom_html;; 
# 7 "?"
let width = 465.0;; 
# 8 "?"
let height = 465.0;; 
# 9 "?"
let pi = (4.0 *. atan (1.0));; 
# 11 "?"
let normalize = (fun v  -> 
# 16 "?"
   
# 12 "?"
(v +. ((2.0 *. pi) *. 
# 13 "?"
(if (v > pi) then (-1.  )else(
# 14 "?"
(if (v < (-. pi)) then (1.    )else(0.))))))
);; 
# 18 "?"
let canvas = (Html . createCanvas ((Html . window) ## document));; 
# 20 "?"
let ctx = (ref canvas ## getContext ((Html . _2d_)));; 
# 22 "?"
let grect = (fun ( x , y) ( x2 , y2)  -> 
# 31 "?"
   
# 24 "?"
(! ctx) ## beginPath ();
  
# 25 "?"
(! ctx) ## moveTo (x , y);
  
# 26 "?"
(! ctx) ## lineTo (x2 , y);
  
# 27 "?"
(! ctx) ## lineTo (x2 , y2);
  
# 28 "?"
(! ctx) ## lineTo (x , y2);
  
# 29 "?"
(! ctx) ## closePath ();
  
# 30 "?"
(! ctx) ## fill ()
);; 
# 33 "?"
let gcolor = (fun (r , g , b)  -> 
# 38 "?"
   
# 34 "?"
let r = int_of_float ((max  (0.) (min  (1.) (r)) *. 255.)) in
  
# 35 "?"
let g = int_of_float ((max  (0.) (min  (1.) (g)) *. 255.)) in
  
# 36 "?"
let b = int_of_float ((max  (0.) (min  (1.) (b)) *. 255.)) in
  
# 37 "?"
((! ctx) ## fillStyle <- (Js . string ((Printf . sprintf  ("#%02x%02x%02x")  (r)  (g) (b)))))
);; 
# 40 "?"
let rect = (fun (x , y , width , height)  -> 
# 48 "?"
   
# 41 "?"
(! ctx) ## beginPath ();
  
# 42 "?"
(! ctx) ## moveTo (x , y);
  
# 43 "?"
(! ctx) ## lineTo ((x +. width) , y);
  
# 44 "?"
(! ctx) ## lineTo ((x +. width) , (y +. height));
  
# 45 "?"
(! ctx) ## lineTo (x , (y +. height));
  
# 46 "?"
(! ctx) ## closePath ();
  
# 47 "?"
(! ctx) ## fill ()
);; module Key = struct 
# 52 "?"
let _up = (ref false);; 
# 53 "?"
let _down = (ref false);; 
# 54 "?"
let _left = (ref false);; 
# 55 "?"
let _right = (ref false);; 
# 56 "?"
let _z = (ref false);; 
# 58 "?"
let up = (fun ()  -> (! _up));; 
# 59 "?"
let down = (fun ()  -> (! _down));; 
# 60 "?"
let left = (fun ()  -> (! _left));; 
# 61 "?"
let right = (fun ()  -> (! _right));; 
# 62 "?"
let z = (fun ()  -> (! _z));; 
# 64 "?"
let setKey = (fun keyCode v  -> 
# 74 "?"
   
# 66 "?"
(match keyCode with | (
# 67 "?"
37)-> (     (_left := v)
  )| (
# 68 "?"
38)-> (     (_up := v)
  )| (
# 69 "?"
39)-> (     (_right := v)
  )| (
# 70 "?"
40)-> (     (_down := v)
  )| (
# 71 "?"
90)-> (     (_z := v)
  )| (
# 72 "?"
_)-> (     ()
  ))
);; 
# 76 "?"
let keydown = (fun ev  -> 
# 81 "?"
   
# 77 "?"
let keyCode = ev ## keyCode in
  
# 79 "?"
setKey  (keyCode) (true);
  
# 80 "?"
(Js . _false)
);; 
# 83 "?"
let keyup = (fun ev  -> 
# 87 "?"
   
# 84 "?"
let keyCode = ev ## keyCode in
  
# 85 "?"
setKey  (keyCode) (false);
  
# 86 "?"
(Js . _false)
);; 
# 88 "?"
let init = (fun ()  -> 
# 92 "?"
   
# 90 "?"
((Html . window) ## onkeyup <- (Html . handler (keyup)));
  
# 91 "?"
((Html . window) ## onkeydown <- (Html . handler (keydown)))
) end;; module Shots = struct type shot = {x:float;y:float;enable:(bool) ref};; 
# 98 "?"
let (shots:((shot) list) ref) = (ref []);; 
# 100 "?"
let cnt = (ref 0);; 
# 102 "?"
let add = (fun x y  -> 
# 106 "?"
   
# 103 "?"
(if ((! cnt) < 16) then (
# 105 "?"
     
# 104 "?"
(shots := ({x=x;y=y;enable=(ref true)} :: (! shots)))
)  )
);; 
# 108 "?"
let move = (fun ()  -> 
# 118 "?"
   
# 109 "?"
(cnt := 0);
  
# 110 "?"
(shots := 
# 114 "?"
(List . filter (
# 117 "?"
begin fun t1'  -> match t1' with     | (
# 115 "?"
{y;enable={contents=b}}) -> (
# 116 "?"
       (b && (y > 0.))
    )   end )) (
# 110 "?"
(List . map (
# 114 "?"
begin fun t1'  -> match t1' with     | (
# 111 "?"
{x;y;enable}) -> (
# 112 "?"
       incr (cnt);
      
# 113 "?"
{x=x;y=(y -. 30.0);enable=enable}
    )   end )) (
# 110 "?"
(! shots))))
);; 
# 120 "?"
let draw = (fun ()  -> 
# 133 "?"
   
# 121 "?"
gcolor (
# 122 "?"
0.5 , 
# 123 "?"
(0.8 +. (Random . float (0.2))) , 
# 124 "?"
(0.8 +. (Random . float (0.2))));
  
# 126 "?"
(List . iter (
# 132 "?"
begin fun t1'  -> match t1' with     | (
# 127 "?"
{x;y}) -> (
# 128 "?"
       grect  (
# 129 "?"
(x -. 1.5) , (y -. 6.5)) (
# 130 "?"
(x +. 3.0) , (y +. 4.0))
    )   end )) (
# 126 "?"
(! shots))
);; 
# 135 "?"
let checkColligion1 = (fun bx by r ls  -> 
# 140 "?"
   
# 136 "?"
(not (List . exists (
# 139 "?"
begin fun t1'  -> match t1' with   | (
# 136 "?"
{x;y}) -> (
# 137 "?"
     ((((x -. r) < bx) && (bx < (x +. r))) && 
# 138 "?"
(((y -. r) < by) && (by < (y +. r))))
  ) end ) (
# 139 "?"
ls)))
);; 
# 142 "?"
let checkColligion = (fun x y r  -> 
# 144 "?"
   
# 143 "?"
checkColligion1  (x)  (y) (r) ((! shots))
) end;; module Ship = struct 
# 148 "?"
let rsize = 25.0;; 
# 149 "?"
let x = (ref (width /. 2.0));; 
# 150 "?"
let y = (ref (height -. (rsize *. 2.0)));; 
# 151 "?"
let speed = 5.0;; 
# 153 "?"
let move = (fun ()  -> 
# 182 "?"
   
# 155 "?"
let m = 5 in
  
# 156 "?"
let m = (if (Key . left ()) then ((m - 1))else(m)) in
  
# 157 "?"
let m = (if (Key . right ()) then ((m + 1))else(m)) in
  
# 158 "?"
let m = (if (Key . up ()) then ((m - 3))else(m)) in
  
# 159 "?"
let m = (if (Key . down ()) then ((m + 3))else(m)) in
  
# 160 "?"
let speed = (match m with | (
# 161 "?"
1)| (3)| (7)| (9)-> (   (speed /. 1.4)
)| (
# 162 "?"
_)-> (   speed
)) in
  
# 164 "?"
let nx , ny = (match m with | (
# 165 "?"
1)-> (   ((! x) -. speed) , ((! y) -. speed)
)| (
# 166 "?"
2)-> (   (! x) , ((! y) -. speed)
)| (
# 167 "?"
3)-> (   ((! x) +. speed) , ((! y) -. speed)
)| (
# 168 "?"
4)-> (   ((! x) -. speed) , (! y)
)| (
# 169 "?"
5)-> (   (! x) , (! y)
)| (
# 170 "?"
6)-> (   ((! x) +. speed) , (! y)
)| (
# 171 "?"
7)-> (   ((! x) -. speed) , ((! y) +. speed)
)| (
# 172 "?"
8)-> (   (! x) , ((! y) +. speed)
)| (
# 173 "?"
9)-> (   ((! x) +. speed) , ((! y) +. speed)
)| (
# 174 "?"
_)-> (   (! x) , (! y)
)) in
  
# 177 "?"
(x := min  (max  (nx) ((rsize /. 2.))) ((width -. (rsize /. 2.))));
  
# 178 "?"
(y := min  (max  (ny) ((rsize /. 2.))) ((height -. (rsize /. 2.))));
  
# 180 "?"
(Shots . move ());
  
# 181 "?"
(if (Key . z ()) then ((Shots . add  ((! x)) (((! y) -. (rsize /. 2.)))))  )
);; 
# 184 "?"
let draw = (fun ()  -> 
# 201 "?"
   
# 185 "?"
gcolor (1.0 , 0.0 , 0.0);
  
# 186 "?"
let r = (rsize /. 6.) in
  
# 187 "?"
let r2 = (rsize /. 4.) in
  
# 188 "?"
grect  (
# 189 "?"
((! x) -. r) , (((! y) -. r) -. r2)) (
# 190 "?"
((! x) +. r) , (((! y) +. r) -. r));
  
# 192 "?"
grect  (
# 193 "?"
(((! x) -. r) -. r2) , (((! y) -. r) +. r2)) (
# 194 "?"
(((! x) +. r) -. r2) , (((! y) +. r) +. r2));
  
# 196 "?"
grect  (
# 197 "?"
(((! x) -. r) +. r2) , (((! y) -. r) +. r2)) (
# 198 "?"
(((! x) +. r) +. r2) , (((! y) +. r) +. r2));
  
# 200 "?"
(Shots . draw ())
);; 
# 203 "?"
let checkColligion = (fun r _x _y  -> 
# 206 "?"
   
# 204 "?"
((((_x -. r) < (! x)) && ((! x) < (_x +. r))) && 
# 205 "?"
(((_y -. r) < (! y)) && ((! y) < (_y +. r))))
) end;; module BG = struct 
# 211 "?"
let (stars:(((float * float * float)) list) ref) = (ref []);; 
# 213 "?"
let init = (fun ()  -> 
# 229 "?"
   
# 215 "?"
let rec createList = (fun i ls f  -> 
# 220 "?"
     
# 216 "?"
(match i with | (
# 217 "?"
(- 1))-> (       ls
    )| (
# 218 "?"
i)-> (       createList  ((i - 1))  ((f (i) :: ls)) (f)
    ))
  ) in
  
# 222 "?"
(stars := createList  (200) ([]) (
# 228 "?"
begin fun t1'  -> match t1' with     | (
# 223 "?"
i) -> (
# 224 "?"
       let x = (Random . float (width)) in
      
# 225 "?"
let y = (Random . float (height)) in
      
# 226 "?"
let speed = ((Random . float (3.)) +. 2.0) in
      
# 227 "?"
( x , y , speed)
    )   end ))
);; 
# 231 "?"
let move = (fun ()  -> 
# 244 "?"
   
# 232 "?"
(stars := (List . map (
# 243 "?"
begin fun t1'  -> match t1' with     | (
# 233 "?"
( x , y , speed)) -> (
# 234 "?"
       let x = (x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. speed)) in
      
# 235 "?"
let x = (if (x < 0.) then ((x +. width))else(x)) in
      
# 236 "?"
let x = (if (x > width) then ((x -. width))else(x)) in
      
# 237 "?"
let speed2 = (speed +. ((height -. (! (Ship . y))) *. 0.03)) in
      
# 238 "?"
let y = (y +. speed2) in
      
# 239 "?"
(if (y > height) then (
# 240 "?"
( (Random . float (width)) , 0. , ((Random . float (3.)) +. 2.))      )else(
# 242 "?"
( x , y , speed)))
    )   end )) (
# 232 "?"
(! stars)))
);; 
# 246 "?"
let draw = (fun ()  -> 
# 262 "?"
   
# 247 "?"
(List . iter (
# 261 "?"
begin fun t1'  -> match t1' with     | (
# 248 "?"
( x , y , s)) -> (
# 249 "?"
       gcolor (
# 250 "?"
((Random . float (0.5)) +. 0.5) , 
# 251 "?"
((Random . float (0.5)) +. 0.5) , 
# 252 "?"
((Random . float (0.5)) +. 0.5));
      
# 255 "?"
let s = (s +. ((height -. (! (Ship . y))) *. 0.06)) in
      
# 257 "?"
grect  (
# 258 "?"
x , y) (
# 259 "?"
(x +. 1.5) , ((y +. 1.0) +. s))
    )   end )) (
# 247 "?"
(! stars))
) end;; module Particles = struct type particle = {x:float;y:float;dir:float;speed:float;size:float;color:(float * float * float)};; 
# 269 "?"
let (particles:((particle) list) ref) = (ref []);; 
# 271 "?"
let cnt = (ref 0);; 
# 273 "?"
let add = (fun ?(color=(( 100.0 , 0.6 , 0.2))) ?(speed=(0.0)) x y n  -> 
# 285 "?"
   
# 274 "?"
for i = 0 to n do 
# 275 "?"
(if ((! cnt) < 28000) then (
# 284 "?"
     
# 276 "?"
(particles := 
# 283 "?"
({x=
# 276 "?"
x;y=
# 277 "?"
y;dir=
# 278 "?"
(Random . float ((pi *. 2.)));speed=
# 279 "?"
(if (speed > 0.0) then (speed)else((Random . float (2.0))));size=
# 280 "?"
((Random . float (15.1)) +. 2.);color=
# 281 "?"
color} :: 
# 283 "?"
(! particles)))
)  ) done
);; 
# 286 "?"
let add2 = (fun x y  -> 
# 288 "?"
   
# 287 "?"
add  ~color:(( 0.2 , 0.6 , 100.0))  ~speed:(10.0)  (x)  (y) (300)
);; 
# 289 "?"
let add1 = (fun x y  -> 
# 291 "?"
   
# 290 "?"
add  (x)  (y) (50)
);; 
# 292 "?"
let move = (fun ()  -> 
# 307 "?"
   
# 293 "?"
(cnt := 0);
  
# 294 "?"
(particles := 
# 303 "?"
(List . filter (
# 306 "?"
begin fun t1'  -> match t1' with     | (
# 304 "?"
{x;y;size}) -> (
# 305 "?"
       (((((size > 0.) && (y > 0.)) && (y < height)) && (x > 0.)) && (x < height))
    )   end )) (
# 294 "?"
(List . map (
# 303 "?"
begin fun t1'  -> match t1' with     | (
# 295 "?"
{x;y;dir;speed;size;color}) -> (
# 296 "?"
       incr (cnt);
      
# 302 "?"
{x=
# 298 "?"
((x +. (speed *. cos (dir))) -. (speed *. sin (dir)));y=
# 299 "?"
((y +. (speed *. sin (dir))) +. (speed *. cos (dir)));dir=
# 300 "?"
dir;speed=speed;size=(size -. 0.5);color=
# 301 "?"
color}
    )   end )) (
# 294 "?"
(! particles))))
);; 
# 309 "?"
let draw = (fun ()  -> 
# 323 "?"
   
# 310 "?"
(List . iter (
# 322 "?"
begin fun t1'  -> match t1' with     | (
# 311 "?"
{x;y;size;color=( r , g , b)}) -> (
# 312 "?"
       gcolor (
# 313 "?"
(((r +. (Random . float (0.2))) *. (size *. 0.75)) /. 5.) , 
# 314 "?"
(((g +. (Random . float (0.2))) *. (size *. 0.75)) /. 5.) , 
# 315 "?"
(((b +. (Random . float (0.2))) *. (size *. 0.75)) /. 5.));
      
# 318 "?"
grect  (
# 319 "?"
(x -. size) , (y -. size)) (
# 320 "?"
(x +. size) , (y +. size))
    )   end )) (
# 310 "?"
(! particles))
) end;; module Bullets = struct type bullet = {x:float;y:float;rad:float;speed:float;enable:(bool) ref};; 
# 329 "?"
let (bullets:((bullet) list) ref) = (ref []);; 
# 331 "?"
let cnt = (ref 0);; 
# 333 "?"
let add = (fun x y rad speed  -> 
# 337 "?"
   
# 334 "?"
(if ((! cnt) < 20) then (
# 336 "?"
     
# 335 "?"
(bullets := ({x=x;y=y;enable=(ref true);rad=rad;speed=speed} :: (! bullets)))
)  )
);; 
# 339 "?"
let move = (fun ()  -> 
# 359 "?"
   
# 340 "?"
(cnt := 0);
  
# 341 "?"
(bullets := 
# 355 "?"
(List . filter (
# 358 "?"
begin fun t1'  -> match t1' with     | (
# 356 "?"
{x;y;enable={contents=b}}) -> (
# 357 "?"
       ((((b && (y > 0.)) && (y < height)) && (x > 0.)) && (x < height))
    )   end )) (
# 341 "?"
(List . map (
# 355 "?"
begin fun t1'  -> match t1' with     | (
# 342 "?"
{x;y;rad;speed;enable}) -> (
# 343 "?"
       incr (cnt);
      
# 345 "?"
let c = (Ship . checkColligion  (1.2)  (x) (y)) in
      
# 346 "?"
(if c then (         (Particles . add2  (x) (y))
)      );
      
# 348 "?"
let e = 
# 353 "?"
{x=
# 348 "?"
(x +. (cos (rad) *. speed));y=
# 349 "?"
(y +. (sin (rad) *. speed));enable=
# 350 "?"
(ref ((! enable) && (not c)));speed=
# 351 "?"
speed;rad=
# 352 "?"
rad} in
      
# 354 "?"
e
    )   end )) (
# 341 "?"
(! bullets))))
);; 
# 361 "?"
let draw = (fun ()  -> 
# 375 "?"
   
# 362 "?"
gcolor (
# 363 "?"
((Random . float (0.1)) +. 0.8) , 
# 364 "?"
((Random . float (0.1)) +. 0.2) , 
# 365 "?"
((Random . float (0.1)) +. 0.8));
  
# 367 "?"
(List . iter (
# 374 "?"
begin fun t1'  -> match t1' with     | (
# 368 "?"
{x;y}) -> (
# 369 "?"
       let r = 5.0 in
      
# 370 "?"
grect  (
# 371 "?"
(x -. r) , (y -. r)) (
# 372 "?"
(x +. r) , (y +. r))
    )   end )) (
# 367 "?"
(! bullets))
) end;; module Enemies = struct class enemy (x:float)(y:float)(enable:bool) = object(this) 
# 380 "?"
method x = x 
# 381 "?"
method y = y 
# 382 "?"
val mutable enable = enable 
# 383 "?"
method enable = enable 
# 384 "?"
method set_enable = (fun e  -> (enable <- e)) 
# 385 "?"
method move = 
# 395 "?"
 
# 386 "?"
let s = (2.0 +. ((height -. (! (Ship . y))) *. 0.06)) in

# 387 "?"
let x = (x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. s)) in

# 389 "?"
(if ((Random . float (1.0)) < 0.01) then (
# 392 "?"
   
# 390 "?"
let rad2 = atan2  (((! (Ship . y)) -. y)) (((! (Ship . x)) -. x)) in
  
# 391 "?"
(Bullets . add  (x)  (y)  (rad2) (3.0))
));

# 394 "?"
(new enemy  (x)  ((y +. s)) ((enable && (y < height))))
 
# 396 "?"
method draw = 
# 407 "?"
 
# 397 "?"
gcolor (
# 398 "?"
((Random . float (0.1)) +. 0.8) , 
# 399 "?"
((Random . float (0.1)) +. 0.8) , 
# 400 "?"
((Random . float (0.1)) +. 0.2));

# 402 "?"
let r = 24.0 in

# 403 "?"
grect  (
# 404 "?"
(x -. r) , (y -. r)) (
# 405 "?"
(x +. r) , (y +. r))
 end;; class enemy2 (x:float)(y:float)(enable:bool) = object(this) 
# 411 "?"
method x = x 
# 412 "?"
method y = y 
# 413 "?"
method z = 1 
# 414 "?"
val mutable enable = enable 
# 415 "?"
method enable = enable 
# 416 "?"
method set_enable = (fun e  -> (enable <- e)) 
# 417 "?"
method move = 
# 427 "?"
 
# 419 "?"
let s = (5.0 +. ((height -. (! (Ship . y))) *. 0.06)) in

# 420 "?"
let x = (x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. s)) in

# 421 "?"
let y = (y +. s) in

# 423 "?"
let c = (Ship . checkColligion  (5.0)  (x) (y)) in

# 424 "?"
(if c then (   (Particles . add2  (x) (y))
));

# 426 "?"
(new enemy2  (x)  (y) (((enable && (y < height)) && (not c))))
 
# 428 "?"
method draw = 
# 439 "?"
 
# 429 "?"
gcolor (
# 430 "?"
((Random . float (0.1)) +. 0.5) , 
# 431 "?"
((Random . float (0.1)) +. 0.5) , 
# 432 "?"
((Random . float (0.1)) +. 0.9));

# 434 "?"
let r = 8.0 in

# 435 "?"
grect  (
# 436 "?"
(x -. r) , (y -. r)) (
# 437 "?"
(x +. r) , (y +. r))
 end;; class enemy3 (x:float)(y:float)(enable:bool) = object(this) 
# 443 "?"
method x = x 
# 444 "?"
method y = y 
# 445 "?"
val mutable enable = enable 
# 446 "?"
method enable = enable 
# 447 "?"
method set_enable = (fun e  -> (enable <- e)) 
# 448 "?"
val mutable cnt = (Random . float ((pi *. 2.0))) 
# 449 "?"
method set_cnt = (fun z1  -> (cnt <- z1)) 
# 450 "?"
method move = 
# 460 "?"
 
# 452 "?"
let s = (5.0 +. ((height -. (! (Ship . y))) *. 0.06)) in

# 453 "?"
let x = ((x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. s)) +. (sin (cnt) *. 10.0)) in

# 454 "?"
let y = (y +. s) in

# 455 "?"
let c = (Ship . checkColligion  (5.0)  (x) (y)) in

# 456 "?"
(if c then (   (Particles . add2  (x) (y))
));

# 457 "?"
let e = (new enemy3  (x)  (y) (((enable && (y < height)) && (not c)))) in

# 458 "?"
(e # set_cnt ((cnt +. 0.1)));

# 459 "?"
e
 
# 461 "?"
method draw = 
# 472 "?"
 
# 462 "?"
gcolor (
# 463 "?"
((Random . float (0.1)) +. 0.9) , 
# 464 "?"
((Random . float (0.1)) +. 0.5) , 
# 465 "?"
((Random . float (0.1)) +. 0.5));

# 467 "?"
let r = 8.0 in

# 468 "?"
grect  (
# 469 "?"
(x -. r) , (y -. r)) (
# 470 "?"
(x +. r) , (y +. r))
 end;; class enemy4 (x:float)(y:float)(enable:bool) = object(this) 
# 476 "?"
method x = x 
# 477 "?"
method y = y 
# 478 "?"
val mutable enable = enable 
# 479 "?"
method enable = enable 
# 480 "?"
method set_enable = (fun e  -> (enable <- e)) 
# 481 "?"
val mutable rad = 0.0 
# 482 "?"
method rad = rad 
# 483 "?"
method set_rad = (fun z1  -> (rad <- z1)) 
# 484 "?"
method move = 
# 501 "?"
 
# 485 "?"
let speed = 6.0 in

# 486 "?"
let r = 0.15 in

# 487 "?"
let rad2 = atan2  (((! (Ship . y)) -. y)) (((! (Ship . x)) -. x)) in

# 488 "?"
let rad = (if (normalize ((rad -. rad2)) < 0.) then ((rad +. r))else((rad -. r))) in

# 489 "?"
let rad = normalize (rad) in

# 490 "?"
let x = (x +. (cos (rad) *. speed)) in

# 491 "?"
let y = (y +. (sin (rad) *. speed)) in

# 495 "?"
let c = (Ship . checkColligion  (5.0)  (x) (y)) in

# 496 "?"
(if c then (   (Particles . add2  (x) (y))
));

# 498 "?"
let e = (new enemy4  (x)  (y) (((enable && (y < height)) && (not c)))) in

# 499 "?"
(e # set_rad (rad));

# 500 "?"
e
 
# 504 "?"
method draw = 
# 515 "?"
 
# 505 "?"
gcolor (
# 506 "?"
((Random . float (0.1)) +. 0.5) , 
# 507 "?"
((Random . float (0.1)) +. 0.5) , 
# 508 "?"
((Random . float (0.1)) +. 0.5));

# 510 "?"
let r = 8.0 in

# 511 "?"
grect  (
# 512 "?"
(x -. r) , (y -. r)) (
# 513 "?"
(x +. r) , (y +. r))
 end;; 
# 518 "?"
let (enemies:((enemy) list) ref) = (ref []);; 
# 520 "?"
let count = (ref 0);; 
# 521 "?"
let add = (fun enm x y  -> 
# 525 "?"
   
# 522 "?"
(if ((! count) < 20) then (
# 524 "?"
     
# 523 "?"
(enemies := (enm  (x)  (y) (true) :: (! enemies)))
)  )
);; 
# 527 "?"
let move = (fun ()  -> 
# 556 "?"
   
# 528 "?"
(if ((Random . float (1.0)) < 0.15) then (
# 540 "?"
     
# 530 "?"
let es = 
# 535 "?"
[
# 531 "?"
(new enemy); 
# 532 "?"
begin fun t1' t2' t3'  -> match t1',t2',t3' with   | (x),(y),(b) -> (     ((new enemy2  (x)  (y) (b)) :> enemy)
  ) end ; 
# 533 "?"
begin fun t1' t2' t3'  -> match t1',t2',t3' with   | (x),(y),(b) -> (     ((new enemy3  (x)  (y) (b)) :> enemy)
  ) end ; 
# 534 "?"
begin fun t1' t2' t3'  -> match t1',t2',t3' with   | (x),(y),(b) -> (     ((new enemy4  (x)  (y) (b)) :> enemy)
  ) end ] in
    
# 537 "?"
let enm = (List . nth  (es) ((Random . int ((List . length (es)))))) in
    
# 538 "?"
add  (enm)  (((Random . float ((width *. 2.0))) -. (width /. 2.))) (-10.0)
)  );
  
# 542 "?"
(count := 0);
  
# 543 "?"
(enemies := 
# 547 "?"
(List . filter (
# 555 "?"
begin fun t1'  -> match t1' with     | (
# 548 "?"
e) -> (
# 549 "?"
       (if (Shots . checkColligion  ((e # x))  ((e # y)) (16.0)) then (
# 550 "?"
(e # enable)      )else(
# 554 "?"
         
# 552 "?"
(Particles . add1  ((e # x)) ((e # y)));
        
# 553 "?"
false
))
    )   end )) (
# 543 "?"
(List . map (
# 547 "?"
begin fun t1'  -> match t1' with     | (
# 544 "?"
e) -> (
# 545 "?"
       incr (count);
      
# 546 "?"
(e # move)
    )   end )) (
# 543 "?"
(! enemies))))
);; 
# 558 "?"
let draw = (fun ()  -> 
# 561 "?"
   
# 560 "?"
(List . iter (begin fun t1'  -> match t1' with     | (e) -> (       (e # draw)
    )   end )) ((! enemies))
) end;; module Game = struct 
# 566 "?"
let draw = (fun ()  -> 
# 574 "?"
   
# 567 "?"
gcolor (0. , 0. , 0.);
  
# 568 "?"
grect  (0. , 0.) (width , height);
  
# 569 "?"
(BG . draw ());
  
# 570 "?"
(Enemies . draw ());
  
# 571 "?"
(Particles . draw ());
  
# 572 "?"
(Ship . draw ());
  
# 573 "?"
(Bullets . draw ())
);; 
# 576 "?"
let loop = (fun ()  -> 
# 583 "?"
   
# 578 "?"
(BG . move ());
  
# 579 "?"
(Particles . move ());
  
# 580 "?"
(Ship . move ());
  
# 581 "?"
(Bullets . move ());
  
# 582 "?"
(Enemies . move ())
);; 
# 584 "?"
let init = (fun ()  -> 
# 588 "?"
   
# 585 "?"
(Random . init (int_of_float (((Sys . time ()) *. 10000.0))));
  
# 586 "?"
(Key . init ());
  
# 587 "?"
(BG . init ())
) end;; module GameLib = struct 
# 593 "?"
let rec loop = (fun ()  -> 
# 597 "?"
   
# 594 "?"
(Game . loop ());
  
# 595 "?"
(Game . draw ());
  
# 596 "?"
ignore ((Html . window) ## setTimeout ((Js . wrap_callback (begin fun t1'  -> match t1' with     | (()) -> (       loop ()
    )   end )) , 15.))
);; 
# 599 "?"
let create_canvas = (fun w h  -> 
# 604 "?"
   
# 600 "?"
let c = canvas in
  
# 601 "?"
(c ## width <- int_of_float (w));
  
# 602 "?"
(c ## height <- int_of_float (h));
  
# 603 "?"
c
);; 
# 606 "?"
let start = (fun _  -> 
# 617 "?"
   
# 607 "?"
let c = create_canvas  (width) (height) in
  
# 613 "?"
(Dom . appendChild  ((Html . window) ## document ## body) (c));
  
# 614 "?"
(Game . init ());
  
# 615 "?"
loop ();
  
# 616 "?"
(Js . _false)
);; 
# 618 "?"
let _ = 
# 620 "?"
 
# 619 "?"
((Html . window) ## onload <- (Html . handler (start)))
 end
