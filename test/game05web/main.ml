module Html = 
# 5 "?"
Dom_html;; 
# 7 "?"
let width = 400.0;; 
# 8 "?"
let height = 600.0;; 
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
# 19 "?"
let ctx = canvas ## getContext ((Html . _2d_));; 
# 21 "?"
let grect = (fun ( x , y) ( x2 , y2)  -> 
# 30 "?"
   
# 23 "?"
ctx ## beginPath ();
  
# 24 "?"
ctx ## moveTo (x , y);
  
# 25 "?"
ctx ## lineTo (x2 , y);
  
# 26 "?"
ctx ## lineTo (x2 , y2);
  
# 27 "?"
ctx ## lineTo (x , y2);
  
# 28 "?"
ctx ## closePath ();
  
# 29 "?"
ctx ## fill ()
);; 
# 32 "?"
let gcolor = (fun (r , g , b)  -> 
# 37 "?"
   
# 33 "?"
let r = int_of_float ((max  (0.) (min  (1.) (r)) *. 255.)) in
  
# 34 "?"
let g = int_of_float ((max  (0.) (min  (1.) (g)) *. 255.)) in
  
# 35 "?"
let b = int_of_float ((max  (0.) (min  (1.) (b)) *. 255.)) in
  
# 36 "?"
(ctx ## fillStyle <- (Js . string ((Printf . sprintf  ("#%02x%02x%02x")  (r)  (g) (b)))))
);; 
# 39 "?"
let rect = (fun (x , y , width , height)  -> 
# 47 "?"
   
# 40 "?"
ctx ## beginPath ();
  
# 41 "?"
ctx ## moveTo (x , y);
  
# 42 "?"
ctx ## lineTo ((x +. width) , y);
  
# 43 "?"
ctx ## lineTo ((x +. width) , (y +. height));
  
# 44 "?"
ctx ## lineTo (x , (y +. height));
  
# 45 "?"
ctx ## closePath ();
  
# 46 "?"
ctx ## fill ()
);; module Key = struct 
# 51 "?"
let _up = (ref false);; 
# 52 "?"
let _down = (ref false);; 
# 53 "?"
let _left = (ref false);; 
# 54 "?"
let _right = (ref false);; 
# 55 "?"
let _z = (ref false);; 
# 57 "?"
let up = (fun ()  -> (! _up));; 
# 58 "?"
let down = (fun ()  -> (! _down));; 
# 59 "?"
let left = (fun ()  -> (! _left));; 
# 60 "?"
let right = (fun ()  -> (! _right));; 
# 61 "?"
let z = (fun ()  -> (! _z));; 
# 63 "?"
let setKey = (fun keyCode v  -> 
# 72 "?"
   
# 65 "?"
(match keyCode with | (
# 66 "?"
37)-> (     (_left := v)
  )| (
# 67 "?"
38)-> (     (_up := v)
  )| (
# 68 "?"
39)-> (     (_right := v)
  )| (
# 69 "?"
40)-> (     (_down := v)
  )| (
# 70 "?"
90)-> (     (_z := v)
  ))
);; 
# 74 "?"
let keydown = (fun ev  -> 
# 79 "?"
   
# 75 "?"
let keyCode = ev ## keyCode in
  
# 77 "?"
setKey  (keyCode) (true);
  
# 78 "?"
(Js . _true)
);; 
# 81 "?"
let keyup = (fun ev  -> 
# 85 "?"
   
# 82 "?"
let keyCode = ev ## keyCode in
  
# 83 "?"
setKey  (keyCode) (false);
  
# 84 "?"
(Js . _true)
);; 
# 86 "?"
let init = (fun ()  -> 
# 90 "?"
   
# 88 "?"
((Html . window) ## onkeyup <- (Html . handler (keyup)));
  
# 89 "?"
((Html . window) ## onkeydown <- (Html . handler (keydown)))
) end;; module Shots = struct type shot = {x:float;y:float;enable:(bool) ref};; 
# 96 "?"
let (shots:((shot) list) ref) = (ref []);; 
# 98 "?"
let cnt = (ref 0);; 
# 100 "?"
let add = (fun x y  -> 
# 104 "?"
   
# 101 "?"
(if ((! cnt) < 16) then (
# 103 "?"
     
# 102 "?"
(shots := ({x=x;y=y;enable=(ref true)} :: (! shots)))
)  )
);; 
# 106 "?"
let move = (fun ()  -> 
# 116 "?"
   
# 107 "?"
(cnt := 0);
  
# 108 "?"
(shots := 
# 112 "?"
(List . filter (
# 115 "?"
begin fun t1'  -> match t1' with     | (
# 113 "?"
{y;enable={contents=b}}) -> (
# 114 "?"
       (b && (y > 0.))
    )   end )) (
# 108 "?"
(List . map (
# 112 "?"
begin fun t1'  -> match t1' with     | (
# 109 "?"
{x;y;enable}) -> (
# 110 "?"
       incr (cnt);
      
# 111 "?"
{x=x;y=(y -. 30.0);enable=enable}
    )   end )) (
# 108 "?"
(! shots))))
);; 
# 118 "?"
let draw = (fun ()  -> 
# 131 "?"
   
# 119 "?"
gcolor (
# 120 "?"
0.5 , 
# 121 "?"
(0.8 +. (Random . float (0.2))) , 
# 122 "?"
(0.8 +. (Random . float (0.2))));
  
# 124 "?"
(List . iter (
# 130 "?"
begin fun t1'  -> match t1' with     | (
# 125 "?"
{x;y}) -> (
# 126 "?"
       grect  (
# 127 "?"
(x -. 1.5) , (y -. 6.5)) (
# 128 "?"
(x +. 3.0) , (y +. 4.0))
    )   end )) (
# 124 "?"
(! shots))
);; 
# 133 "?"
let checkColligion1 = (fun bx by r ls  -> 
# 138 "?"
   
# 134 "?"
(not (List . exists (
# 137 "?"
begin fun t1'  -> match t1' with   | (
# 134 "?"
{x;y}) -> (
# 135 "?"
     ((((x -. r) < bx) && (bx < (x +. r))) && 
# 136 "?"
(((y -. r) < by) && (by < (y +. r))))
  ) end ) (
# 137 "?"
ls)))
);; 
# 140 "?"
let checkColligion = (fun x y r  -> 
# 142 "?"
   
# 141 "?"
checkColligion1  (x)  (y) (r) ((! shots))
) end;; module Ship = struct 
# 146 "?"
let rsize = 25.0;; 
# 147 "?"
let x = (ref (width /. 2.0));; 
# 148 "?"
let y = (ref (height -. (rsize *. 2.0)));; 
# 149 "?"
let speed = 5.0;; 
# 151 "?"
let move = (fun ()  -> 
# 180 "?"
   
# 153 "?"
let m = 5 in
  
# 154 "?"
let m = (if (Key . left ()) then ((m - 1))else(m)) in
  
# 155 "?"
let m = (if (Key . right ()) then ((m + 1))else(m)) in
  
# 156 "?"
let m = (if (Key . up ()) then ((m - 3))else(m)) in
  
# 157 "?"
let m = (if (Key . down ()) then ((m + 3))else(m)) in
  
# 158 "?"
let speed = (match m with | (
# 159 "?"
1)| (3)| (7)| (9)-> (   (speed /. 1.4)
)| (
# 160 "?"
_)-> (   speed
)) in
  
# 162 "?"
let nx , ny = (match m with | (
# 163 "?"
1)-> (   ((! x) -. speed) , ((! y) -. speed)
)| (
# 164 "?"
2)-> (   (! x) , ((! y) -. speed)
)| (
# 165 "?"
3)-> (   ((! x) +. speed) , ((! y) -. speed)
)| (
# 166 "?"
4)-> (   ((! x) -. speed) , (! y)
)| (
# 167 "?"
5)-> (   (! x) , (! y)
)| (
# 168 "?"
6)-> (   ((! x) +. speed) , (! y)
)| (
# 169 "?"
7)-> (   ((! x) -. speed) , ((! y) +. speed)
)| (
# 170 "?"
8)-> (   (! x) , ((! y) +. speed)
)| (
# 171 "?"
9)-> (   ((! x) +. speed) , ((! y) +. speed)
)| (
# 172 "?"
_)-> (   (! x) , (! y)
)) in
  
# 175 "?"
(x := min  (max  (nx) ((rsize /. 2.))) ((width -. (rsize /. 2.))));
  
# 176 "?"
(y := min  (max  (ny) ((rsize /. 2.))) ((height -. (rsize /. 2.))));
  
# 178 "?"
(Shots . move ());
  
# 179 "?"
(if (Key . z ()) then ((Shots . add  ((! x)) (((! y) -. (rsize /. 2.)))))  )
);; 
# 182 "?"
let draw = (fun ()  -> 
# 199 "?"
   
# 183 "?"
gcolor (1.0 , 0.0 , 0.0);
  
# 184 "?"
let r = (rsize /. 6.) in
  
# 185 "?"
let r2 = (rsize /. 4.) in
  
# 186 "?"
grect  (
# 187 "?"
((! x) -. r) , (((! y) -. r) -. r2)) (
# 188 "?"
((! x) +. r) , (((! y) +. r) -. r));
  
# 190 "?"
grect  (
# 191 "?"
(((! x) -. r) -. r2) , (((! y) -. r) +. r2)) (
# 192 "?"
(((! x) +. r) -. r2) , (((! y) +. r) +. r2));
  
# 194 "?"
grect  (
# 195 "?"
(((! x) -. r) +. r2) , (((! y) -. r) +. r2)) (
# 196 "?"
(((! x) +. r) +. r2) , (((! y) +. r) +. r2));
  
# 198 "?"
(Shots . draw ())
);; 
# 201 "?"
let checkColligion = (fun r _x _y  -> 
# 204 "?"
   
# 202 "?"
((((_x -. r) < (! x)) && ((! x) < (_x +. r))) && 
# 203 "?"
(((_y -. r) < (! y)) && ((! y) < (_y +. r))))
) end;; module BG = struct 
# 209 "?"
let (stars:(((float * float * float)) list) ref) = (ref []);; 
# 211 "?"
let init = (fun ()  -> 
# 227 "?"
   
# 213 "?"
let rec createList = (fun i ls f  -> 
# 218 "?"
     
# 214 "?"
(match i with | (
# 215 "?"
(- 1))-> (       ls
    )| (
# 216 "?"
i)-> (       createList  ((i - 1))  ((f (i) :: ls)) (f)
    ))
  ) in
  
# 220 "?"
(stars := createList  (20) ([]) (
# 226 "?"
begin fun t1'  -> match t1' with     | (
# 221 "?"
i) -> (
# 222 "?"
       let x = (Random . float (width)) in
      
# 223 "?"
let y = (Random . float (height)) in
      
# 224 "?"
let speed = ((Random . float (3.)) +. 2.0) in
      
# 225 "?"
( x , y , speed)
    )   end ))
);; 
# 229 "?"
let move = (fun ()  -> 
# 242 "?"
   
# 230 "?"
(stars := (List . map (
# 241 "?"
begin fun t1'  -> match t1' with     | (
# 231 "?"
( x , y , speed)) -> (
# 232 "?"
       let x = (x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. speed)) in
      
# 233 "?"
let x = (if (x < 0.) then ((x +. width))else(x)) in
      
# 234 "?"
let x = (if (x > width) then ((x -. width))else(x)) in
      
# 235 "?"
let speed2 = (speed +. ((height -. (! (Ship . y))) *. 0.03)) in
      
# 236 "?"
let y = (y +. speed2) in
      
# 237 "?"
(if (y > height) then (
# 238 "?"
( (Random . float (width)) , 0. , ((Random . float (3.)) +. 2.))      )else(
# 240 "?"
( x , y , speed)))
    )   end )) (
# 230 "?"
(! stars)))
);; 
# 244 "?"
let draw = (fun ()  -> 
# 260 "?"
   
# 245 "?"
(List . iter (
# 259 "?"
begin fun t1'  -> match t1' with     | (
# 246 "?"
( x , y , s)) -> (
# 247 "?"
       gcolor (
# 248 "?"
((Random . float (0.5)) +. 0.5) , 
# 249 "?"
((Random . float (0.5)) +. 0.5) , 
# 250 "?"
((Random . float (0.5)) +. 0.5));
      
# 253 "?"
let s = (s +. ((height -. (! (Ship . y))) *. 0.06)) in
      
# 255 "?"
grect  (
# 256 "?"
x , y) (
# 257 "?"
(x +. 1.5) , ((y +. 1.0) +. s))
    )   end )) (
# 245 "?"
(! stars))
) end;; module Particles = struct type particle = {x:float;y:float;dir:float;speed:float;size:float;color:(float * float * float)};; 
# 267 "?"
let (particles:((particle) list) ref) = (ref []);; 
# 269 "?"
let cnt = (ref 0);; 
# 271 "?"
let add = (fun ?(color=(( 100.0 , 0.6 , 0.2))) ?(speed=(0.0)) x y n  -> 
# 283 "?"
   
# 272 "?"
for i = 0 to n do 
# 273 "?"
(if ((! cnt) < 28000) then (
# 282 "?"
     
# 274 "?"
(particles := 
# 281 "?"
({x=
# 274 "?"
x;y=
# 275 "?"
y;dir=
# 276 "?"
(Random . float ((pi *. 2.)));speed=
# 277 "?"
(if (speed > 0.0) then (speed)else((((Random . float (2.0)) *. (Random . float (0.5))) *. (Random . float (2.0)))));size=
# 278 "?"
((Random . float (15.1)) +. 2.);color=
# 279 "?"
color} :: 
# 281 "?"
(! particles)))
)  ) done
);; 
# 284 "?"
let add2 = (fun x y  -> 
# 286 "?"
   
# 285 "?"
add  ~color:(( 0.2 , 0.6 , 100.0))  ~speed:(10.0)  (x)  (y) (100)
);; 
# 287 "?"
let add1 = (fun x y  -> 
# 289 "?"
   
# 288 "?"
add  (x)  (y) (20)
);; 
# 290 "?"
let move = (fun ()  -> 
# 305 "?"
   
# 291 "?"
(cnt := 0);
  
# 292 "?"
(particles := 
# 301 "?"
(List . filter (
# 304 "?"
begin fun t1'  -> match t1' with     | (
# 302 "?"
{x;y;size}) -> (
# 303 "?"
       (((((size > 0.) && (y > 0.)) && (y < height)) && (x > 0.)) && (x < height))
    )   end )) (
# 292 "?"
(List . map (
# 301 "?"
begin fun t1'  -> match t1' with     | (
# 293 "?"
{x;y;dir;speed;size;color}) -> (
# 294 "?"
       incr (cnt);
      
# 300 "?"
{x=
# 296 "?"
((x +. (speed *. cos (dir))) -. (speed *. sin (dir)));y=
# 297 "?"
((y +. (speed *. sin (dir))) +. (speed *. cos (dir)));dir=
# 298 "?"
dir;speed=speed;size=(size -. 0.5);color=
# 299 "?"
color}
    )   end )) (
# 292 "?"
(! particles))))
);; 
# 307 "?"
let draw = (fun ()  -> 
# 321 "?"
   
# 308 "?"
(List . iter (
# 320 "?"
begin fun t1'  -> match t1' with     | (
# 309 "?"
{x;y;size;color=( r , g , b)}) -> (
# 310 "?"
       gcolor (
# 311 "?"
(((r +. (Random . float (0.2))) *. (size *. 0.75)) /. 5.) , 
# 312 "?"
(((g +. (Random . float (0.2))) *. (size *. 0.75)) /. 5.) , 
# 313 "?"
(((b +. (Random . float (0.2))) *. (size *. 0.75)) /. 5.));
      
# 316 "?"
grect  (
# 317 "?"
(x -. size) , (y -. size)) (
# 318 "?"
(x +. size) , (y +. size))
    )   end )) (
# 308 "?"
(! particles))
) end;; module Bullets = struct type bullet = {x:float;y:float;rad:float;speed:float;enable:(bool) ref};; 
# 327 "?"
let (bullets:((bullet) list) ref) = (ref []);; 
# 329 "?"
let cnt = (ref 0);; 
# 331 "?"
let add = (fun x y rad speed  -> 
# 335 "?"
   
# 332 "?"
(if ((! cnt) < 20) then (
# 334 "?"
     
# 333 "?"
(bullets := ({x=x;y=y;enable=(ref true);rad=rad;speed=speed} :: (! bullets)))
)  )
);; 
# 337 "?"
let move = (fun ()  -> 
# 357 "?"
   
# 338 "?"
(cnt := 0);
  
# 339 "?"
(bullets := 
# 353 "?"
(List . filter (
# 356 "?"
begin fun t1'  -> match t1' with     | (
# 354 "?"
{x;y;enable={contents=b}}) -> (
# 355 "?"
       ((((b && (y > 0.)) && (y < height)) && (x > 0.)) && (x < height))
    )   end )) (
# 339 "?"
(List . map (
# 353 "?"
begin fun t1'  -> match t1' with     | (
# 340 "?"
{x;y;rad;speed;enable}) -> (
# 341 "?"
       incr (cnt);
      
# 343 "?"
let c = (Ship . checkColligion  (1.2)  (x) (y)) in
      
# 344 "?"
(if c then (         (Particles . add2  (x) (y))
)      );
      
# 346 "?"
let e = 
# 351 "?"
{x=
# 346 "?"
(x +. (cos (rad) *. speed));y=
# 347 "?"
(y +. (sin (rad) *. speed));enable=
# 348 "?"
(ref ((! enable) && (not c)));speed=
# 349 "?"
speed;rad=
# 350 "?"
rad} in
      
# 352 "?"
e
    )   end )) (
# 339 "?"
(! bullets))))
);; 
# 359 "?"
let draw = (fun ()  -> 
# 373 "?"
   
# 360 "?"
gcolor (
# 361 "?"
((Random . float (0.1)) +. 0.8) , 
# 362 "?"
((Random . float (0.1)) +. 0.2) , 
# 363 "?"
((Random . float (0.1)) +. 0.8));
  
# 365 "?"
(List . iter (
# 372 "?"
begin fun t1'  -> match t1' with     | (
# 366 "?"
{x;y}) -> (
# 367 "?"
       let r = 5.0 in
      
# 368 "?"
grect  (
# 369 "?"
(x -. r) , (y -. r)) (
# 370 "?"
(x +. r) , (y +. r))
    )   end )) (
# 365 "?"
(! bullets))
) end;; module Enemies = struct class enemy (x:float)(y:float)(enable:bool) = object(this) 
# 378 "?"
method x = x 
# 379 "?"
method y = y 
# 380 "?"
val mutable enable = enable 
# 381 "?"
method enable = enable 
# 382 "?"
method set_enable = (fun e  -> (enable <- e)) 
# 383 "?"
method move = 
# 393 "?"
 
# 384 "?"
let s = (2.0 +. ((height -. (! (Ship . y))) *. 0.06)) in

# 385 "?"
let x = (x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. s)) in

# 387 "?"
(if ((Random . float (1.0)) < 0.01) then (
# 390 "?"
   
# 388 "?"
let rad2 = atan2  (((! (Ship . y)) -. y)) (((! (Ship . x)) -. x)) in
  
# 389 "?"
(Bullets . add  (x)  (y)  (rad2) (3.0))
));

# 392 "?"
(new enemy  (x)  ((y +. s)) ((enable && (y < height))))
 
# 394 "?"
method draw = 
# 405 "?"
 
# 395 "?"
gcolor (
# 396 "?"
((Random . float (0.1)) +. 0.8) , 
# 397 "?"
((Random . float (0.1)) +. 0.8) , 
# 398 "?"
((Random . float (0.1)) +. 0.2));

# 400 "?"
let r = 24.0 in

# 401 "?"
grect  (
# 402 "?"
(x -. r) , (y -. r)) (
# 403 "?"
(x +. r) , (y +. r))
 end;; class enemy2 (x:float)(y:float)(enable:bool) = object(this) 
# 409 "?"
method x = x 
# 410 "?"
method y = y 
# 411 "?"
method z = 1 
# 412 "?"
val mutable enable = enable 
# 413 "?"
method enable = enable 
# 414 "?"
method set_enable = (fun e  -> (enable <- e)) 
# 415 "?"
method move = 
# 425 "?"
 
# 417 "?"
let s = (5.0 +. ((height -. (! (Ship . y))) *. 0.06)) in

# 418 "?"
let x = (x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. s)) in

# 419 "?"
let y = (y +. s) in

# 421 "?"
let c = (Ship . checkColligion  (5.0)  (x) (y)) in

# 422 "?"
(if c then (   (Particles . add2  (x) (y))
));

# 424 "?"
(new enemy2  (x)  (y) (((enable && (y < height)) && (not c))))
 
# 426 "?"
method draw = 
# 437 "?"
 
# 427 "?"
gcolor (
# 428 "?"
((Random . float (0.1)) +. 0.5) , 
# 429 "?"
((Random . float (0.1)) +. 0.5) , 
# 430 "?"
((Random . float (0.1)) +. 0.9));

# 432 "?"
let r = 8.0 in

# 433 "?"
grect  (
# 434 "?"
(x -. r) , (y -. r)) (
# 435 "?"
(x +. r) , (y +. r))
 end;; class enemy3 (x:float)(y:float)(enable:bool) = object(this) 
# 441 "?"
method x = x 
# 442 "?"
method y = y 
# 443 "?"
val mutable enable = enable 
# 444 "?"
method enable = enable 
# 445 "?"
method set_enable = (fun e  -> (enable <- e)) 
# 446 "?"
val mutable cnt = (Random . float ((pi *. 2.0))) 
# 447 "?"
method set_cnt = (fun z1  -> (cnt <- z1)) 
# 448 "?"
method move = 
# 458 "?"
 
# 450 "?"
let s = (5.0 +. ((height -. (! (Ship . y))) *. 0.06)) in

# 451 "?"
let x = ((x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. s)) +. (sin (cnt) *. 10.0)) in

# 452 "?"
let y = (y +. s) in

# 453 "?"
let c = (Ship . checkColligion  (5.0)  (x) (y)) in

# 454 "?"
(if c then (   (Particles . add2  (x) (y))
));

# 455 "?"
let e = (new enemy3  (x)  (y) (((enable && (y < height)) && (not c)))) in

# 456 "?"
(e # set_cnt ((cnt +. 0.1)));

# 457 "?"
e
 
# 459 "?"
method draw = 
# 470 "?"
 
# 460 "?"
gcolor (
# 461 "?"
((Random . float (0.1)) +. 0.9) , 
# 462 "?"
((Random . float (0.1)) +. 0.5) , 
# 463 "?"
((Random . float (0.1)) +. 0.5));

# 465 "?"
let r = 8.0 in

# 466 "?"
grect  (
# 467 "?"
(x -. r) , (y -. r)) (
# 468 "?"
(x +. r) , (y +. r))
 end;; class enemy4 (x:float)(y:float)(enable:bool) = object(this) 
# 474 "?"
method x = x 
# 475 "?"
method y = y 
# 476 "?"
val mutable enable = enable 
# 477 "?"
method enable = enable 
# 478 "?"
method set_enable = (fun e  -> (enable <- e)) 
# 479 "?"
val mutable rad = 0.0 
# 480 "?"
method rad = rad 
# 481 "?"
method set_rad = (fun z1  -> (rad <- z1)) 
# 482 "?"
method move = 
# 499 "?"
 
# 483 "?"
let speed = 6.0 in

# 484 "?"
let r = 0.15 in

# 485 "?"
let rad2 = atan2  (((! (Ship . y)) -. y)) (((! (Ship . x)) -. x)) in

# 486 "?"
let rad = (if (normalize ((rad -. rad2)) < 0.) then ((rad +. r))else((rad -. r))) in

# 487 "?"
let rad = normalize (rad) in

# 488 "?"
let x = (x +. (cos (rad) *. speed)) in

# 489 "?"
let y = (y +. (sin (rad) *. speed)) in

# 493 "?"
let c = (Ship . checkColligion  (5.0)  (x) (y)) in

# 494 "?"
(if c then (   (Particles . add2  (x) (y))
));

# 496 "?"
let e = (new enemy4  (x)  (y) (((enable && (y < height)) && (not c)))) in

# 497 "?"
(e # set_rad (rad));

# 498 "?"
e
 
# 502 "?"
method draw = 
# 513 "?"
 
# 503 "?"
gcolor (
# 504 "?"
((Random . float (0.1)) +. 0.5) , 
# 505 "?"
((Random . float (0.1)) +. 0.5) , 
# 506 "?"
((Random . float (0.1)) +. 0.5));

# 508 "?"
let r = 8.0 in

# 509 "?"
grect  (
# 510 "?"
(x -. r) , (y -. r)) (
# 511 "?"
(x +. r) , (y +. r))
 end;; 
# 516 "?"
let (enemies:((enemy) list) ref) = (ref []);; 
# 518 "?"
let count = (ref 0);; 
# 519 "?"
let add = (fun enm x y  -> 
# 523 "?"
   
# 520 "?"
(if ((! count) < 20) then (
# 522 "?"
     
# 521 "?"
(enemies := (enm  (x)  (y) (true) :: (! enemies)))
)  )
);; 
# 525 "?"
let move = (fun ()  -> 
# 554 "?"
   
# 526 "?"
(if ((Random . float (1.0)) < 0.15) then (
# 538 "?"
     
# 528 "?"
let es = 
# 533 "?"
[
# 529 "?"
(new enemy); 
# 530 "?"
begin fun t1' t2' t3'  -> match t1',t2',t3' with   | (x),(y),(b) -> (     ((new enemy2  (x)  (y) (b)) :> enemy)
  ) end ; 
# 531 "?"
begin fun t1' t2' t3'  -> match t1',t2',t3' with   | (x),(y),(b) -> (     ((new enemy3  (x)  (y) (b)) :> enemy)
  ) end ; 
# 532 "?"
begin fun t1' t2' t3'  -> match t1',t2',t3' with   | (x),(y),(b) -> (     ((new enemy4  (x)  (y) (b)) :> enemy)
  ) end ] in
    
# 535 "?"
let enm = (List . nth  (es) ((Random . int ((List . length (es)))))) in
    
# 536 "?"
add  (enm)  (((Random . float ((width *. 2.0))) -. (width /. 2.))) (-10.0)
)  );
  
# 540 "?"
(count := 0);
  
# 541 "?"
(enemies := 
# 545 "?"
(List . filter (
# 553 "?"
begin fun t1'  -> match t1' with     | (
# 546 "?"
e) -> (
# 547 "?"
       (if (Shots . checkColligion  ((e # x))  ((e # y)) (16.0)) then (
# 548 "?"
(e # enable)      )else(
# 552 "?"
         
# 550 "?"
(Particles . add1  ((e # x)) ((e # y)));
        
# 551 "?"
false
))
    )   end )) (
# 541 "?"
(List . map (
# 545 "?"
begin fun t1'  -> match t1' with     | (
# 542 "?"
e) -> (
# 543 "?"
       incr (count);
      
# 544 "?"
(e # move)
    )   end )) (
# 541 "?"
(! enemies))))
);; 
# 556 "?"
let draw = (fun ()  -> 
# 559 "?"
   
# 558 "?"
(List . iter (begin fun t1'  -> match t1' with     | (e) -> (       (e # draw)
    )   end )) ((! enemies))
) end;; module Game = struct 
# 564 "?"
let draw = (fun ()  -> 
# 572 "?"
   
# 565 "?"
(ctx ## fillStyle <- (Js . string ("#000000")));
  
# 566 "?"
grect  (0. , 0.) (width , height);
  
# 567 "?"
(BG . draw ());
  
# 568 "?"
(Enemies . draw ());
  
# 569 "?"
(Particles . draw ());
  
# 570 "?"
(Ship . draw ());
  
# 571 "?"
(Bullets . draw ())
);; 
# 574 "?"
let loop = (fun ()  -> 
# 581 "?"
   
# 576 "?"
(BG . move ());
  
# 577 "?"
(Particles . move ());
  
# 578 "?"
(Ship . move ());
  
# 579 "?"
(Bullets . move ());
  
# 580 "?"
(Enemies . move ())
);; 
# 582 "?"
let init = (fun ()  -> 
# 586 "?"
   
# 583 "?"
(Random . init (int_of_float (((Sys . time ()) *. 10000.0))));
  
# 584 "?"
(Key . init ());
  
# 585 "?"
(BG . init ())
) end;; module GameLib = struct 
# 591 "?"
let rec loop = (fun ()  -> 
# 595 "?"
   
# 592 "?"
(Game . loop ());
  
# 593 "?"
(Game . draw ());
  
# 594 "?"
ignore ((Html . window) ## setTimeout ((Js . wrap_callback (begin fun t1'  -> match t1' with     | (()) -> (       loop ()
    )   end )) , 15.))
);; 
# 597 "?"
let create_canvas = (fun w h  -> 
# 602 "?"
   
# 598 "?"
let c = canvas in
  
# 599 "?"
(c ## width <- int_of_float (w));
  
# 600 "?"
(c ## height <- int_of_float (h));
  
# 601 "?"
c
);; 
# 604 "?"
let start = (fun _  -> 
# 610 "?"
   
# 605 "?"
let c = create_canvas  (width) (height) in
  
# 606 "?"
(Dom . appendChild  ((Html . window) ## document ## body) (c));
  
# 607 "?"
(Game . init ());
  
# 608 "?"
loop ();
  
# 609 "?"
(Js . _false)
);; 
# 611 "?"
let _ = 
# 613 "?"
 
# 612 "?"
((Html . window) ## onload <- (Html . handler (start)))
 end
