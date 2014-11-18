
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
let up = (fun ()  -> (! _up));; 
# 17 "?"
let down = (fun ()  -> (! _down));; 
# 18 "?"
let left = (fun ()  -> (! _left));; 
# 19 "?"
let right = (fun ()  -> (! _right));; 
# 20 "?"
let z = (fun ()  -> (! _z));; 
# 22 "?"
let onSpKeyDown = (fun ~(key) ~(x) ~(y)  -> 
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
let onSpKeyUp = (fun ~(key) ~(x) ~(y)  -> 
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
let onKeyDown = (fun ~(key) ~(x) ~(y)  -> 
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
let onKeyUp = (fun ~(key) ~(x) ~(y)  -> 
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
let init = (fun ()  -> 
# 61 "?"
   
# 57 "?"
(Glut . specialFunc (onSpKeyDown));
  
# 58 "?"
(Glut . specialUpFunc (onSpKeyUp));
  
# 59 "?"
(Glut . keyboardFunc (onKeyDown));
  
# 60 "?"
(Glut . keyboardUpFunc (onKeyUp))
) end;; module Bullets = struct 
# 66 "?"
let (bullets:(((float * float * (bool) ref)) list) ref) = (ref []);; 
# 68 "?"
let add = (fun x y  -> 
# 71 "?"
   
# 70 "?"
(bullets := (( x , y , (ref true)) :: (! bullets)))
);; 
# 73 "?"
let move = (fun bs  -> 
# 81 "?"
   
# 74 "?"
(bullets := 
# 77 "?"
(List . filter (
# 80 "?"
begin fun t1'  -> match t1' with     | (
# 78 "?"
_ , y , {contents=b}) -> (
# 79 "?"
       (b && (y > 0.))
    )   end )) (
# 74 "?"
(List . map (
# 77 "?"
begin fun t1'  -> match t1' with     | (
# 75 "?"
x , y , b) -> (
# 76 "?"
       ( x , (y -. 10.0) , b)
    )   end )) (
# 74 "?"
(! bullets))))
);; 
# 83 "?"
let draw = (fun ()  -> 
# 96 "?"
   
# 84 "?"
(GlDraw . color (
# 85 "?"
0.5 , 
# 86 "?"
(0.8 +. (Random . float (0.2))) , 
# 87 "?"
(0.8 +. (Random . float (0.2)))));
  
# 89 "?"
(List . iter (
# 95 "?"
begin fun t1'  -> match t1' with     | (
# 90 "?"
x , y , _) -> (
# 91 "?"
       (GlDraw . rect  (
# 92 "?"
(x -. 1.5) , (y -. 6.5)) (
# 93 "?"
(x +. 3.0) , (y +. 4.0)))
    )   end )) (
# 89 "?"
(! bullets))
) end;; module Ship = struct 
# 100 "?"
let rsize = 25.0;; 
# 101 "?"
let x = (ref (width /. 2.0));; 
# 102 "?"
let y = (ref (height -. (rsize *. 2.0)));; 
# 103 "?"
let speed = 5.0;; 
# 105 "?"
let move = (fun ()  -> 
# 134 "?"
   
# 107 "?"
let m = 5 in
  
# 108 "?"
let m = (if (Key . left ()) then ((m - 1))else(m)) in
  
# 109 "?"
let m = (if (Key . right ()) then ((m + 1))else(m)) in
  
# 110 "?"
let m = (if (Key . up ()) then ((m - 3))else(m)) in
  
# 111 "?"
let m = (if (Key . down ()) then ((m + 3))else(m)) in
  
# 112 "?"
let speed = (match m with | (
# 113 "?"
1)| (3)| (7)| (9)-> (   (speed /. 1.4)
)| (
# 114 "?"
_)-> (   speed
)) in
  
# 116 "?"
let nx , ny = (match m with | (
# 117 "?"
1)-> (   ((! x) -. speed) , ((! y) -. speed)
)| (
# 118 "?"
2)-> (   (! x) , ((! y) -. speed)
)| (
# 119 "?"
3)-> (   ((! x) +. speed) , ((! y) -. speed)
)| (
# 120 "?"
4)-> (   ((! x) -. speed) , (! y)
)| (
# 121 "?"
5)-> (   (! x) , (! y)
)| (
# 122 "?"
6)-> (   ((! x) +. speed) , (! y)
)| (
# 123 "?"
7)-> (   ((! x) -. speed) , ((! y) +. speed)
)| (
# 124 "?"
8)-> (   (! x) , ((! y) +. speed)
)| (
# 125 "?"
9)-> (   ((! x) +. speed) , ((! y) +. speed)
)| (
# 126 "?"
_)-> (   (! x) , (! y)
)) in
  
# 129 "?"
(x := min  (max  (nx) ((rsize /. 2.))) ((width -. (rsize /. 2.))));
  
# 130 "?"
(y := min  (max  (ny) ((rsize /. 2.))) ((height -. (rsize /. 2.))));
  
# 132 "?"
(Bullets . move ());
  
# 133 "?"
(if (Key . z ()) then ((Bullets . add  ((! x)) (((! y) -. (rsize /. 2.)))))  )
);; 
# 136 "?"
let draw = (fun ()  -> 
# 153 "?"
   
# 137 "?"
(GlDraw . color (1.0 , 0.0 , 0.0));
  
# 138 "?"
let r = (rsize /. 6.) in
  
# 139 "?"
let r2 = (rsize /. 4.) in
  
# 140 "?"
(GlDraw . rect  (
# 141 "?"
((! x) -. r) , (((! y) -. r) -. r2)) (
# 142 "?"
((! x) +. r) , (((! y) +. r) -. r)));
  
# 144 "?"
(GlDraw . rect  (
# 145 "?"
(((! x) -. r) -. r2) , (((! y) -. r) +. r2)) (
# 146 "?"
(((! x) +. r) -. r2) , (((! y) +. r) +. r2)));
  
# 148 "?"
(GlDraw . rect  (
# 149 "?"
(((! x) -. r) +. r2) , (((! y) -. r) +. r2)) (
# 150 "?"
(((! x) +. r) +. r2) , (((! y) +. r) +. r2)));
  
# 152 "?"
(Bullets . draw ())
) end;; module BG = struct 
# 159 "?"
let (stars:(((float * float * float)) list) ref) = (ref []);; 
# 161 "?"
let init = (fun ()  -> 
# 177 "?"
   
# 163 "?"
let rec createList = (fun i ls f  -> 
# 168 "?"
     
# 164 "?"
(match i with | (
# 165 "?"
(- 1))-> (       ls
    )| (
# 166 "?"
i)-> (       createList  ((i - 1))  ((f (i) :: ls)) (f)
    ))
  ) in
  
# 170 "?"
(stars := createList  (30) ([]) (
# 176 "?"
begin fun t1'  -> match t1' with     | (
# 171 "?"
i) -> (
# 172 "?"
       let x = (Random . float (width)) in
      
# 173 "?"
let y = (Random . float (height)) in
      
# 174 "?"
let speed = ((Random . float (3.)) +. 2.0) in
      
# 175 "?"
( x , y , speed)
    )   end ))
);; 
# 179 "?"
let move = (fun bs  -> 
# 192 "?"
   
# 180 "?"
(stars := (List . map (
# 191 "?"
begin fun t1'  -> match t1' with     | (
# 181 "?"
( x , y , speed)) -> (
# 182 "?"
       let x = (x -. ((((! (Ship . x)) -. (width /. 2.)) *. 0.005) *. speed)) in
      
# 183 "?"
let x = (if (x < 0.) then ((x +. width))else(x)) in
      
# 184 "?"
let x = (if (x > width) then ((x -. width))else(x)) in
      
# 185 "?"
let speed2 = (speed +. ((height -. (! (Ship . y))) *. 0.03)) in
      
# 186 "?"
let y = (y +. speed2) in
      
# 187 "?"
(if (y > height) then (
# 188 "?"
( (Random . float (width)) , 0. , ((Random . float (3.)) +. 2.))      )else(
# 190 "?"
( x , y , speed)))
    )   end )) (
# 180 "?"
(! stars)))
);; 
# 194 "?"
let draw = (fun ()  -> 
# 210 "?"
   
# 195 "?"
(List . iter (
# 209 "?"
begin fun t1'  -> match t1' with     | (
# 196 "?"
( x , y , s)) -> (
# 197 "?"
       (GlDraw . color (
# 198 "?"
((Random . float (0.5)) +. 0.5) , 
# 199 "?"
((Random . float (0.5)) +. 0.5) , 
# 200 "?"
((Random . float (0.5)) +. 0.5)));
      
# 203 "?"
let s = (s +. ((height -. (! (Ship . y))) *. 0.06)) in
      
# 205 "?"
(GlDraw . rect  (
# 206 "?"
x , y) (
# 207 "?"
(x +. 1.5) , ((y +. 1.0) +. s)))
    )   end )) (
# 195 "?"
(! stars))
) end;; module Game = struct 
# 215 "?"
let draw = (fun ()  -> 
# 220 "?"
   
# 216 "?"
(GlClear . clear ([`color]));
  
# 217 "?"
(BG . draw ());
  
# 218 "?"
(Ship . draw ());
  
# 219 "?"
(Glut . swapBuffers ())
);; 
# 222 "?"
let rec mainLoop = (fun ~(value)  -> 
# 227 "?"
   
# 223 "?"
(Glut . postRedisplay ());
  
# 224 "?"
(BG . move ());
  
# 225 "?"
(Ship . move ());
  
# 226 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1))
);; 
# 229 "?"
let resize = (fun ~(w) ~(h)  -> 
# 240 "?"
   
# 230 "?"
(GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(max  (h) (1)));
  
# 232 "?"
(GlMat . mode (`projection));
  
# 233 "?"
(GlMat . load_identity ());
  
# 235 "?"
let ortho = (GlMat . ortho ~z:(( 1.0 , -1.0))) in
  
# 236 "?"
ortho  ~x:(( 0.0 , width)) ~y:(( height , -0.0));
  
# 238 "?"
(GlMat . mode (`modelview));
  
# 239 "?"
(GlMat . load_identity ())
);; 
# 242 "?"
let main = 
# 255 "?"
 
# 243 "?"
(Random . init (int_of_float (((Sys . time ()) *. 10000.0))));

# 244 "?"
ignore ((Glut . init ((Sys . argv))));

# 245 "?"
(Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) ());

# 246 "?"
(Glut . initWindowSize  ~w:(int_of_float (width)) ~h:(int_of_float (height)));

# 247 "?"
ignore ((Glut . createWindow ("Game02")));

# 248 "?"
(Glut . displayFunc (draw));

# 249 "?"
(Glut . reshapeFunc (resize));

# 250 "?"
(Key . init ());

# 251 "?"
(BG . init ());

# 252 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1));

# 253 "?"
(GlClear . color  ~alpha:(1.0) (0.1 , 0.1 , 0.1));

# 254 "?"
(Glut . mainLoop ())
 end
