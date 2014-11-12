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
let error = (fun f  -> (Printf . ksprintf (begin fun t1'  -> match t1' with     | (s) -> (       (Firebug . console) ## error ((Js . string (s)));
      failwith (s)
    )   end ) (f)));; 
# 19 "?"
let debug = (fun f  -> (Printf . ksprintf (begin fun t1'  -> match t1' with     | (s) -> (       (Firebug . console) ## log ((Js . string (s)))
    )   end ) (f)));; 
# 20 "?"
let alert = (fun f  -> (Printf . ksprintf (begin fun t1'  -> match t1' with     | (s) -> (       (Dom_html . window) ## alert ((Js . string (s)));
      failwith (s)
    )   end ) (f)));; 
# 22 "?"
let canvas = 
# 27 "?"
 
# 23 "?"
let canvas = (Html . createCanvas ((Html . window) ## document)) in

# 24 "?"
(canvas ## width <- int_of_float (width));

# 25 "?"
(canvas ## height <- int_of_float (height));

# 26 "?"
canvas
;; 
# 29 "?"
let gl = ((Js . Opt) . get ((WebGL . getContext (canvas))) (begin fun t1'  -> match t1' with   | (()) -> (     alert ("can't init webgl context")
  ) end ));; 
# 31 "?"
let load_shader = (fun shader text  -> 
# 37 "?"
   
# 33 "?"
gl ## shaderSource (shader , text);
  
# 34 "?"
gl ## compileShader (shader);
  
# 35 "?"
let _ = gl ## getShaderParameter (shader , gl ## _COMPILE_STATUS_) in
  
# 36 "?"
()
);; 
# 39 "?"
let createProgram = (fun vs fs  -> 
# 53 "?"
   
# 40 "?"
let vertexShader = gl ## createShader (gl ## _VERTEX_SHADER_) in
  
# 41 "?"
let fragmentShader = gl ## createShader (gl ## _FRAGMENT_SHADER_) in
  
# 43 "?"
load_shader  (vertexShader) ((Js . string (vs)));
  
# 44 "?"
load_shader  (fragmentShader) ((Js . string (fs)));
  
# 46 "?"
let prog = gl ## createProgram () in
  
# 47 "?"
gl ## attachShader (prog , vertexShader);
  
# 48 "?"
gl ## attachShader (prog , fragmentShader);
  
# 49 "?"
gl ## linkProgram (prog);
  
# 50 "?"
let _ = gl ## getProgramParameter (prog , gl ## _LINK_STATUS_) in
  
# 51 "?"
gl ## useProgram (prog);
  
# 52 "?"
prog
);; 
# 54 "?"
let colorLocation = 
# 83 "?"
 
# 56 "?"
let vs = 
# 66 "?"
"attribute vec2 a_position;
    uniform vec2 u_resolution;
    void main() {
       // convert the rectangle from pixels to 0.0 to 1.0
       vec2 zeroToOne = a_position / u_resolution;
       // convert from 0->1 to 0->2
       vec2 zeroToTwo = zeroToOne * 2.0;
       // convert from 0->2 to -1->+1 (clipspace)
       vec2 clipSpace = zeroToTwo - 1.0;
       gl_Position = vec4(clipSpace * vec2(1, -1), 0, 1);
    }" in

# 68 "?"
let fs = 
# 69 "?"
"precision mediump float;uniform vec4 u_color;void main() {gl_FragColor = u_color;}" in

# 71 "?"
let prog = createProgram  (vs) (fs) in

# 73 "?"
let resolutionLocation = gl ## getUniformLocation (prog , (Js . string ("u_resolution"))) in

# 75 "?"
gl ## uniform2f (resolutionLocation , width , height);

# 76 "?"
gl ## bindBuffer (gl ## _ARRAY_BUFFER_ , gl ## createBuffer ());

# 78 "?"
let positionLocation = gl ## getAttribLocation (prog , (Js . string ("a_position"))) in

# 79 "?"
gl ## enableVertexAttribArray (positionLocation);

# 80 "?"
gl ## vertexAttribPointer (positionLocation , 2 , gl ## _FLOAT , (Js . _false) , 0 , 0);

# 82 "?"
gl ## getUniformLocation (prog , (Js . string ("u_color")))
;; 
# 85 "?"
let float32array = (fun a  -> 
# 89 "?"
   
# 86 "?"
let array = jsnew Typed_array.float32Array ((Array . length (a))) in
  
# 87 "?"
(Array . iteri (begin fun t1' t2'  -> match t1',t2' with     | (i),(v) -> (       (Typed_array . set  (array)  (i) (v))
    )   end ) (a));
  
# 88 "?"
array
);; 
# 91 "?"
let grect = (fun ( x1 , y1) ( x2 , y2)  -> 
# 103 "?"
   
# 93 "?"
let recfa = float32array (
# 100 "?"
[|
# 94 "?"
x1; y1; 
# 95 "?"
x2; y1; 
# 96 "?"
x1; y2; 
# 97 "?"
x1; y2; 
# 98 "?"
x2; y1; 
# 99 "?"
x2; y2|]) in
  
# 101 "?"
gl ## bufferData (gl ## _ARRAY_BUFFER_ , recfa , gl ## _STATIC_DRAW_);
  
# 102 "?"
gl ## drawArrays (gl ## _TRIANGLES , 0 , 6)
);; 
# 105 "?"
let gcolor = (fun (r , g , b)  -> 
# 108 "?"
   
# 106 "?"
gl ## uniform4f (colorLocation , r , g , b , 1.);
  
# 107 "?"
()
);; module Key = struct 
# 112 "?"
let _up = (ref false);; 
# 113 "?"
let _down = (ref false);; 
# 114 "?"
let _left = (ref false);; 
# 115 "?"
let _right = (ref false);; 
# 116 "?"
let _z = (ref false);; 
# 118 "?"
let up = (fun ()  -> (! _up));; 
# 119 "?"
let down = (fun ()  -> (! _down));; 
# 120 "?"
let left = (fun ()  -> (! _left));; 
# 121 "?"
let right = (fun ()  -> (! _right));; 
# 122 "?"
let z = (fun ()  -> (! _z));; 
# 124 "?"
let setKey = (fun keyCode v  -> 
# 134 "?"
   
# 126 "?"
(match keyCode with | (
# 127 "?"
37)-> (     (_left := v)
  )| (
# 128 "?"
38)-> (     (_up := v)
  )| (
# 129 "?"
39)-> (     (_right := v)
  )| (
# 130 "?"
40)-> (     (_down := v)
  )| (
# 131 "?"
90)-> (     (_z := v)
  )| (
# 132 "?"
_)-> (     ()
  ))
);; 
# 136 "?"
let keydown = (fun ev  -> 
# 141 "?"
   
# 137 "?"
let keyCode = ev ## keyCode in
  
# 139 "?"
setKey  (keyCode) (true);
  
# 140 "?"
(Js . _false)
);; 
# 143 "?"
let keyup = (fun ev  -> 
# 147 "?"
   
# 144 "?"
let keyCode = ev ## keyCode in
  
# 145 "?"
setKey  (keyCode) (false);
  
# 146 "?"
(Js . _false)
);; 
# 148 "?"
let init = (fun ()  -> 
# 152 "?"
   
# 150 "?"
((Html . window) ## onkeyup <- (Html . handler (keyup)));
  
# 151 "?"
((Html . window) ## onkeydown <- (Html . handler (keydown)))
) end;; module Shots = struct type shot = {x:float;y:float;enable:(bool) ref};; 
# 158 "?"
let (shots:((shot) list) ref) = (ref []);; 
# 160 "?"
let cnt = (ref 0);; 
# 162 "?"
let add = (fun x y  -> 
# 166 "?"
   
# 163 "?"
(if ((! cnt) < 16) then (
# 165 "?"
     
# 164 "?"
(shots := ({x=x;y=y;enable=(ref true)} :: (! shots)))
)  )
);; 
# 168 "?"
let move = (fun ()  -> 
# 178 "?"
   
# 169 "?"
(cnt := 0);
  
# 170 "?"
(shots := 
# 174 "?"
(List . filter (
# 177 "?"
begin fun t1'  -> match t1' with     | (
# 175 "?"
{y;enable={contents=b}}) -> (
# 176 "?"
       (b && (y > 0.))
    )   end )) (
# 170 "?"
(List . map (
# 174 "?"
begin fun t1'  -> match t1' with     | (
# 171 "?"
{x;y;enable}) -> (
# 172 "?"
       incr (cnt);
      
# 173 "?"
{x=x;y=(y -. 30.0);enable=enable}
    )   end )) (
# 170 "?"
(! shots))))
);; 
# 180 "?"
let draw = (fun ()  -> 
# 193 "?"
   
# 181 "?"
gcolor (
# 182 "?"
0.5 , 
# 183 "?"
(0.8 +. (Random . float (0.2))) , 
# 184 "?"
(0.8 +. (Random . float (0.2))));
  
# 186 "?"
(List . iter (
# 192 "?"
begin fun t1'  -> match t1' with     | (
# 187 "?"
{x;y}) -> (
# 188 "?"
       grect  (
# 189 "?"
(x -. 1.5) , (y -. 6.5)) (
# 190 "?"
(x +. 3.0) , (y +. 4.0))
    )   end )) (
# 186 "?"
(! shots))
);; 
# 195 "?"
let checkColligion1 = (fun bx by r ls  -> 
# 200 "?"
   
# 196 "?"
(not (List . exists (
# 199 "?"
begin fun t1'  -> match t1' with   | (
# 196 "?"
{x;y}) -> (
# 197 "?"
     ((((x -. r) < bx) && (bx < (x +. r))) && 
# 198 "?"
(((y -. r) < by) && (by < (y +. r))))
  ) end ) (
# 199 "?"
ls)))
);; 
# 202 "?"
let checkColligion = (fun x y r  -> 
# 204 "?"
   
# 203 "?"
checkColligion1  (x)  (y) (r) ((! shots))
) end;; module Ship = struct 
# 208 "?"
let rsize = 25.0;; 
# 209 "?"
let x = (ref (width /. 2.0));; 
# 210 "?"
let y = (ref (height -. (rsize *. 2.0)));; 
# 211 "?"
let speed = 5.0;; 
# 213 "?"
let move = (fun ()  -> 
# 242 "?"
   
# 215 "?"
let m = 5 in
  
# 216 "?"
let m = (if (Key . left ()) then ((m - 1))else(m)) in
  
# 217 "?"
let m = (if (Key . right ()) then ((m + 1))else(m)) in
  
# 218 "?"
let m = (if (Key . up ()) then ((m - 3))else(m)) in
  
# 219 "?"
let m = (if (Key . down ()) then ((m + 3))else(m)) in
  
# 220 "?"
let speed = (match m with | (
# 221 "?"
1)| (3)| (7)| (9)-> (   (speed /. 1.4)
)| (
# 222 "?"
_)-> (   speed
)) in
  
# 224 "?"
let nx , ny = (match m with | (
# 225 "?"
1)-> (   ((! x) -. speed) , ((! y) -. speed)
)| (
# 226 "?"
2)-> (   (! x) , ((! y) -. speed)
)| (
# 227 "?"
3)-> (   ((! x) +. speed) , ((! y) -. speed)
)| (
# 228 "?"
4)-> (   ((! x) -. speed) , (! y)
)| (
# 229 "?"
5)-> (   (! x) , (! y)
)| (
# 230 "?"
6)-> (   ((! x) +. speed) , (! y)
)| (
# 231 "?"
7)-> (   ((! x) -. speed) , ((! y) +. speed)
)| (
# 232 "?"
8)-> (   (! x) , ((! y) +. speed)
)| (
# 233 "?"
9)-> (   ((! x) +. speed) , ((! y) +. speed)
)| (
# 234 "?"
_)-> (   (! x) , (! y)
)) in
  
# 237 "?"
(x := min  (max  (nx) ((rsize /. 2.))) ((width -. (rsize /. 2.))));
  
# 238 "?"
(y := min  (max  (ny) ((rsize /. 2.))) ((height -. (rsize /. 2.))));
  
# 240 "?"
(Shots . move ());
  
# 241 "?"
(if (Key . z ()) then ((Shots . add  ((! x)) (((! y) -. (rsize /. 2.)))))  )
);; 
# 244 "?"
let draw = (fun ()  -> 
# 261 "?"
   
# 245 "?"
gcolor (1.0 , 0.0 , 0.0);
  
# 246 "?"
let r = (rsize /. 6.) in
  
# 247 "?"
let r2 = (rsize /. 4.) in
  
# 248 "?"
grect  (
# 249 "?"
((! x) -. r) , (((! y) -. r) -. r2)) (
# 250 "?"
((! x) +. r) , (((! y) +. r) -. r));
  
# 252 "?"
grect  (
# 253 "?"
(((! x) -. r) -. r2) , (((! y) -. r) +. r2)) (
# 254 "?"
(((! x) +. r) -. r2) , (((! y) +. r) +. r2));
  
# 256 "?"
grect  (
# 257 "?"
(((! x) -. r) +. r2) , (((! y) -. r) +. r2)) (
# 258 "?"
(((! x) +. r) +. r2) , (((! y) +. r) +. r2));
  
# 260 "?"
(Shots . draw ())
);; 
# 263 "?"
let checkColligion = (fun r _x _y  -> 
# 266 "?"
   
# 264 "?"
((((_x -. r) < (! x)) && ((! x) < (_x +. r))) && 
# 265 "?"
(((_y -. r) < (! y)) && ((! y) < (_y +. r))))
) end;; module BG = struct 
# 271 "?"
let (stars:(((float * float * float)) list) ref) = (ref []);; 
# 273 "?"
let init = (fun ()  -> 
# 289 "?"
   
# 275 "?"
let rec createList = (fun i ls f  -> 
# 280 "?"
     
# 276 "?"
(match i with | (
# 277 "?"
(- 1))-> (       ls
    )| (
# 278 "?"
i)-> (       createList  ((i - 1))  ((f (i) :: ls)) (f)
    ))
  ) in
  
# 282 "?"
(stars := createList  (200) ([]) (
# 288 "?"
begin fun t1'  -> match t1' with     | (
# 283 "?"
i) -> (
# 284 "?"
       let x = (Random . float (width)) in
      
# 285 "?"
let y = (Random . float (height)) in
      
# 286 "?"
let speed = ((Random . float (3.)) +. 2.0) in
      
# 287 "?"
( x , y , speed)
    )   end ))
);; 
# 291 "?"
let move = (fun ()  -> 
# 304 "?"
   
# 292 "?"
(stars := (List . map (
# 303 "?"
begin fun t1'  -> match t1' with     | (
# 293 "?"
( x , y , speed)) -> (
# 294 "?"
       let x = (x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. speed)) in
      
# 295 "?"
let x = (if (x < 0.) then ((x +. width))else(x)) in
      
# 296 "?"
let x = (if (x > width) then ((x -. width))else(x)) in
      
# 297 "?"
let speed2 = (speed +. ((height -. (! (Ship . y))) *. 0.03)) in
      
# 298 "?"
let y = (y +. speed2) in
      
# 299 "?"
(if (y > height) then (
# 300 "?"
( (Random . float (width)) , 0. , ((Random . float (3.)) +. 2.))      )else(
# 302 "?"
( x , y , speed)))
    )   end )) (
# 292 "?"
(! stars)))
);; 
# 306 "?"
let draw = (fun ()  -> 
# 322 "?"
   
# 307 "?"
(List . iter (
# 321 "?"
begin fun t1'  -> match t1' with     | (
# 308 "?"
( x , y , s)) -> (
# 309 "?"
       gcolor (
# 310 "?"
((Random . float (0.5)) +. 0.5) , 
# 311 "?"
((Random . float (0.5)) +. 0.5) , 
# 312 "?"
((Random . float (0.5)) +. 0.5));
      
# 315 "?"
let s = (s +. ((height -. (! (Ship . y))) *. 0.06)) in
      
# 317 "?"
grect  (
# 318 "?"
x , y) (
# 319 "?"
(x +. 1.5) , ((y +. 1.0) +. s))
    )   end )) (
# 307 "?"
(! stars))
) end;; module Particles = struct type particle = {x:float;y:float;dir:float;speed:float;size:float;color:(float * float * float)};; 
# 329 "?"
let (particles:((particle) list) ref) = (ref []);; 
# 331 "?"
let cnt = (ref 0);; 
# 333 "?"
let add = (fun ?(color=(( 100.0 , 0.6 , 0.2))) ?(speed=(0.0)) x y n  -> 
# 345 "?"
   
# 334 "?"
for i = 0 to n do 
# 335 "?"
(if ((! cnt) < 28000) then (
# 344 "?"
     
# 336 "?"
(particles := 
# 343 "?"
({x=
# 336 "?"
x;y=
# 337 "?"
y;dir=
# 338 "?"
(Random . float ((pi *. 2.)));speed=
# 339 "?"
(if (speed > 0.0) then (speed)else((Random . float (2.0))));size=
# 340 "?"
((Random . float (15.1)) +. 2.);color=
# 341 "?"
color} :: 
# 343 "?"
(! particles)))
)  ) done
);; 
# 346 "?"
let add2 = (fun x y  -> 
# 348 "?"
   
# 347 "?"
add  ~color:(( 0.2 , 0.6 , 100.0))  ~speed:(10.0)  (x)  (y) (300)
);; 
# 349 "?"
let add1 = (fun x y  -> 
# 351 "?"
   
# 350 "?"
add  (x)  (y) (50)
);; 
# 352 "?"
let move = (fun ()  -> 
# 367 "?"
   
# 353 "?"
(cnt := 0);
  
# 354 "?"
(particles := 
# 363 "?"
(List . filter (
# 366 "?"
begin fun t1'  -> match t1' with     | (
# 364 "?"
{x;y;size}) -> (
# 365 "?"
       (((((size > 0.) && (y > 0.)) && (y < height)) && (x > 0.)) && (x < height))
    )   end )) (
# 354 "?"
(List . map (
# 363 "?"
begin fun t1'  -> match t1' with     | (
# 355 "?"
{x;y;dir;speed;size;color}) -> (
# 356 "?"
       incr (cnt);
      
# 362 "?"
{x=
# 358 "?"
((x +. (speed *. cos (dir))) -. (speed *. sin (dir)));y=
# 359 "?"
((y +. (speed *. sin (dir))) +. (speed *. cos (dir)));dir=
# 360 "?"
dir;speed=speed;size=(size -. 0.5);color=
# 361 "?"
color}
    )   end )) (
# 354 "?"
(! particles))))
);; 
# 369 "?"
let draw = (fun ()  -> 
# 383 "?"
   
# 370 "?"
(List . iter (
# 382 "?"
begin fun t1'  -> match t1' with     | (
# 371 "?"
{x;y;size;color=( r , g , b)}) -> (
# 372 "?"
       gcolor (
# 373 "?"
(((r +. (Random . float (0.2))) *. (size *. 0.75)) /. 5.) , 
# 374 "?"
(((g +. (Random . float (0.2))) *. (size *. 0.75)) /. 5.) , 
# 375 "?"
(((b +. (Random . float (0.2))) *. (size *. 0.75)) /. 5.));
      
# 378 "?"
grect  (
# 379 "?"
(x -. size) , (y -. size)) (
# 380 "?"
(x +. size) , (y +. size))
    )   end )) (
# 370 "?"
(! particles))
) end;; module Bullets = struct type bullet = {x:float;y:float;rad:float;speed:float;enable:(bool) ref};; 
# 389 "?"
let (bullets:((bullet) list) ref) = (ref []);; 
# 391 "?"
let cnt = (ref 0);; 
# 393 "?"
let add = (fun x y rad speed  -> 
# 397 "?"
   
# 394 "?"
(if ((! cnt) < 20) then (
# 396 "?"
     
# 395 "?"
(bullets := ({x=x;y=y;enable=(ref true);rad=rad;speed=speed} :: (! bullets)))
)  )
);; 
# 399 "?"
let move = (fun ()  -> 
# 419 "?"
   
# 400 "?"
(cnt := 0);
  
# 401 "?"
(bullets := 
# 415 "?"
(List . filter (
# 418 "?"
begin fun t1'  -> match t1' with     | (
# 416 "?"
{x;y;enable={contents=b}}) -> (
# 417 "?"
       ((((b && (y > 0.)) && (y < height)) && (x > 0.)) && (x < height))
    )   end )) (
# 401 "?"
(List . map (
# 415 "?"
begin fun t1'  -> match t1' with     | (
# 402 "?"
{x;y;rad;speed;enable}) -> (
# 403 "?"
       incr (cnt);
      
# 405 "?"
let c = (Ship . checkColligion  (1.2)  (x) (y)) in
      
# 406 "?"
(if c then (         (Particles . add2  (x) (y))
)      );
      
# 408 "?"
let e = 
# 413 "?"
{x=
# 408 "?"
(x +. (cos (rad) *. speed));y=
# 409 "?"
(y +. (sin (rad) *. speed));enable=
# 410 "?"
(ref ((! enable) && (not c)));speed=
# 411 "?"
speed;rad=
# 412 "?"
rad} in
      
# 414 "?"
e
    )   end )) (
# 401 "?"
(! bullets))))
);; 
# 421 "?"
let draw = (fun ()  -> 
# 435 "?"
   
# 422 "?"
gcolor (
# 423 "?"
((Random . float (0.1)) +. 0.8) , 
# 424 "?"
((Random . float (0.1)) +. 0.2) , 
# 425 "?"
((Random . float (0.1)) +. 0.8));
  
# 427 "?"
(List . iter (
# 434 "?"
begin fun t1'  -> match t1' with     | (
# 428 "?"
{x;y}) -> (
# 429 "?"
       let r = 5.0 in
      
# 430 "?"
grect  (
# 431 "?"
(x -. r) , (y -. r)) (
# 432 "?"
(x +. r) , (y +. r))
    )   end )) (
# 427 "?"
(! bullets))
) end;; module Enemies = struct class enemy (x:float)(y:float)(enable:bool) = object(this) 
# 440 "?"
method x = x 
# 441 "?"
method y = y 
# 442 "?"
val mutable enable = enable 
# 443 "?"
method enable = enable 
# 444 "?"
method set_enable = (fun e  -> (enable <- e)) 
# 445 "?"
method move = 
# 455 "?"
 
# 446 "?"
let s = (2.0 +. ((height -. (! (Ship . y))) *. 0.06)) in

# 447 "?"
let x = (x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. s)) in

# 449 "?"
(if ((Random . float (1.0)) < 0.01) then (
# 452 "?"
   
# 450 "?"
let rad2 = atan2  (((! (Ship . y)) -. y)) (((! (Ship . x)) -. x)) in
  
# 451 "?"
(Bullets . add  (x)  (y)  (rad2) (3.0))
));

# 454 "?"
(new enemy  (x)  ((y +. s)) ((enable && (y < height))))
 
# 456 "?"
method draw = 
# 467 "?"
 
# 457 "?"
gcolor (
# 458 "?"
((Random . float (0.1)) +. 0.8) , 
# 459 "?"
((Random . float (0.1)) +. 0.8) , 
# 460 "?"
((Random . float (0.1)) +. 0.2));

# 462 "?"
let r = 24.0 in

# 463 "?"
grect  (
# 464 "?"
(x -. r) , (y -. r)) (
# 465 "?"
(x +. r) , (y +. r))
 end;; class enemy2 (x:float)(y:float)(enable:bool) = object(this) 
# 471 "?"
method x = x 
# 472 "?"
method y = y 
# 473 "?"
method z = 1 
# 474 "?"
val mutable enable = enable 
# 475 "?"
method enable = enable 
# 476 "?"
method set_enable = (fun e  -> (enable <- e)) 
# 477 "?"
method move = 
# 487 "?"
 
# 479 "?"
let s = (5.0 +. ((height -. (! (Ship . y))) *. 0.06)) in

# 480 "?"
let x = (x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. s)) in

# 481 "?"
let y = (y +. s) in

# 483 "?"
let c = (Ship . checkColligion  (5.0)  (x) (y)) in

# 484 "?"
(if c then (   (Particles . add2  (x) (y))
));

# 486 "?"
(new enemy2  (x)  (y) (((enable && (y < height)) && (not c))))
 
# 488 "?"
method draw = 
# 499 "?"
 
# 489 "?"
gcolor (
# 490 "?"
((Random . float (0.1)) +. 0.5) , 
# 491 "?"
((Random . float (0.1)) +. 0.5) , 
# 492 "?"
((Random . float (0.1)) +. 0.9));

# 494 "?"
let r = 8.0 in

# 495 "?"
grect  (
# 496 "?"
(x -. r) , (y -. r)) (
# 497 "?"
(x +. r) , (y +. r))
 end;; class enemy3 (x:float)(y:float)(enable:bool) = object(this) 
# 503 "?"
method x = x 
# 504 "?"
method y = y 
# 505 "?"
val mutable enable = enable 
# 506 "?"
method enable = enable 
# 507 "?"
method set_enable = (fun e  -> (enable <- e)) 
# 508 "?"
val mutable cnt = (Random . float ((pi *. 2.0))) 
# 509 "?"
method set_cnt = (fun z1  -> (cnt <- z1)) 
# 510 "?"
method move = 
# 520 "?"
 
# 512 "?"
let s = (5.0 +. ((height -. (! (Ship . y))) *. 0.06)) in

# 513 "?"
let x = ((x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. s)) +. (sin (cnt) *. 10.0)) in

# 514 "?"
let y = (y +. s) in

# 515 "?"
let c = (Ship . checkColligion  (5.0)  (x) (y)) in

# 516 "?"
(if c then (   (Particles . add2  (x) (y))
));

# 517 "?"
let e = (new enemy3  (x)  (y) (((enable && (y < height)) && (not c)))) in

# 518 "?"
(e # set_cnt ((cnt +. 0.1)));

# 519 "?"
e
 
# 521 "?"
method draw = 
# 532 "?"
 
# 522 "?"
gcolor (
# 523 "?"
((Random . float (0.1)) +. 0.9) , 
# 524 "?"
((Random . float (0.1)) +. 0.5) , 
# 525 "?"
((Random . float (0.1)) +. 0.5));

# 527 "?"
let r = 8.0 in

# 528 "?"
grect  (
# 529 "?"
(x -. r) , (y -. r)) (
# 530 "?"
(x +. r) , (y +. r))
 end;; class enemy4 (x:float)(y:float)(enable:bool) = object(this) 
# 536 "?"
method x = x 
# 537 "?"
method y = y 
# 538 "?"
val mutable enable = enable 
# 539 "?"
method enable = enable 
# 540 "?"
method set_enable = (fun e  -> (enable <- e)) 
# 541 "?"
val mutable rad = 0.0 
# 542 "?"
method rad = rad 
# 543 "?"
method set_rad = (fun z1  -> (rad <- z1)) 
# 544 "?"
method move = 
# 561 "?"
 
# 545 "?"
let speed = 6.0 in

# 546 "?"
let r = 0.15 in

# 547 "?"
let rad2 = atan2  (((! (Ship . y)) -. y)) (((! (Ship . x)) -. x)) in

# 548 "?"
let rad = (if (normalize ((rad -. rad2)) < 0.) then ((rad +. r))else((rad -. r))) in

# 549 "?"
let rad = normalize (rad) in

# 550 "?"
let x = (x +. (cos (rad) *. speed)) in

# 551 "?"
let y = (y +. (sin (rad) *. speed)) in

# 555 "?"
let c = (Ship . checkColligion  (5.0)  (x) (y)) in

# 556 "?"
(if c then (   (Particles . add2  (x) (y))
));

# 558 "?"
let e = (new enemy4  (x)  (y) (((enable && (y < height)) && (not c)))) in

# 559 "?"
(e # set_rad (rad));

# 560 "?"
e
 
# 564 "?"
method draw = 
# 575 "?"
 
# 565 "?"
gcolor (
# 566 "?"
((Random . float (0.1)) +. 0.5) , 
# 567 "?"
((Random . float (0.1)) +. 0.5) , 
# 568 "?"
((Random . float (0.1)) +. 0.5));

# 570 "?"
let r = 8.0 in

# 571 "?"
grect  (
# 572 "?"
(x -. r) , (y -. r)) (
# 573 "?"
(x +. r) , (y +. r))
 end;; 
# 578 "?"
let (enemies:((enemy) list) ref) = (ref []);; 
# 580 "?"
let count = (ref 0);; 
# 581 "?"
let add = (fun enm x y  -> 
# 585 "?"
   
# 582 "?"
(if ((! count) < 20) then (
# 584 "?"
     
# 583 "?"
(enemies := (enm  (x)  (y) (true) :: (! enemies)))
)  )
);; 
# 587 "?"
let move = (fun ()  -> 
# 616 "?"
   
# 588 "?"
(if ((Random . float (1.0)) < 0.15) then (
# 600 "?"
     
# 590 "?"
let es = 
# 595 "?"
[
# 591 "?"
(new enemy); 
# 592 "?"
begin fun t1' t2' t3'  -> match t1',t2',t3' with   | (x),(y),(b) -> (     ((new enemy2  (x)  (y) (b)) :> enemy)
  ) end ; 
# 593 "?"
begin fun t1' t2' t3'  -> match t1',t2',t3' with   | (x),(y),(b) -> (     ((new enemy3  (x)  (y) (b)) :> enemy)
  ) end ; 
# 594 "?"
begin fun t1' t2' t3'  -> match t1',t2',t3' with   | (x),(y),(b) -> (     ((new enemy4  (x)  (y) (b)) :> enemy)
  ) end ] in
    
# 597 "?"
let enm = (List . nth  (es) ((Random . int ((List . length (es)))))) in
    
# 598 "?"
add  (enm)  (((Random . float ((width *. 2.0))) -. (width /. 2.))) (-10.0)
)  );
  
# 602 "?"
(count := 0);
  
# 603 "?"
(enemies := 
# 607 "?"
(List . filter (
# 615 "?"
begin fun t1'  -> match t1' with     | (
# 608 "?"
e) -> (
# 609 "?"
       (if (Shots . checkColligion  ((e # x))  ((e # y)) (16.0)) then (
# 610 "?"
(e # enable)      )else(
# 614 "?"
         
# 612 "?"
(Particles . add1  ((e # x)) ((e # y)));
        
# 613 "?"
false
))
    )   end )) (
# 603 "?"
(List . map (
# 607 "?"
begin fun t1'  -> match t1' with     | (
# 604 "?"
e) -> (
# 605 "?"
       incr (count);
      
# 606 "?"
(e # move)
    )   end )) (
# 603 "?"
(! enemies))))
);; 
# 618 "?"
let draw = (fun ()  -> 
# 621 "?"
   
# 620 "?"
(List . iter (begin fun t1'  -> match t1' with     | (e) -> (       (e # draw)
    )   end )) ((! enemies))
) end;; module Game = struct 
# 626 "?"
let draw = (fun ()  -> 
# 634 "?"
   
# 627 "?"
gcolor (0. , 0. , 0.);
  
# 628 "?"
grect  (0. , 0.) (width , height);
  
# 629 "?"
(BG . draw ());
  
# 630 "?"
(Enemies . draw ());
  
# 631 "?"
(Particles . draw ());
  
# 632 "?"
(Ship . draw ());
  
# 633 "?"
(Bullets . draw ())
);; 
# 636 "?"
let loop = (fun ()  -> 
# 643 "?"
   
# 638 "?"
(BG . move ());
  
# 639 "?"
(Particles . move ());
  
# 640 "?"
(Ship . move ());
  
# 641 "?"
(Bullets . move ());
  
# 642 "?"
(Enemies . move ())
);; 
# 644 "?"
let init = (fun ()  -> 
# 648 "?"
   
# 645 "?"
(Random . init (int_of_float (((Sys . time ()) *. 10000.0))));
  
# 646 "?"
(Key . init ());
  
# 647 "?"
(BG . init ())
) end;; module GameLib = struct 
# 655 "?"
let rec loop = (fun ()  -> 
# 659 "?"
   
# 656 "?"
(Game . loop ());
  
# 657 "?"
(Game . draw ());
  
# 658 "?"
ignore ((Html . window) ## setTimeout ((Js . wrap_callback (begin fun t1'  -> match t1' with     | (()) -> (       loop ()
    )   end )) , 15.))
);; 
# 662 "?"
let start = (fun _  -> 
# 667 "?"
   
# 663 "?"
(Dom . appendChild  ((Html . window) ## document ## body) (canvas));
  
# 664 "?"
(Game . init ());
  
# 665 "?"
loop ();
  
# 666 "?"
(Js . _false)
);; 
# 668 "?"
let _ = 
# 670 "?"
 
# 669 "?"
((Html . window) ## onload <- (Html . handler (start)))
 end
