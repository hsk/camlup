
# 5 "?"
let width = 400.000000;;

# 6 "?"
let height = 800.000000;;
module Key = struct

# 10 "?"
let up = (ref false);;

# 11 "?"
let down = (ref false);;

# 12 "?"
let left = (ref false);;

# 13 "?"
let right = (ref false);;

# 14 "?"
let z = (ref false);;

# 16 "?"
let onSpKeyDown = (fun ~(key) ~(x) ~(y) -> 
# 24 "?"

  
# 17 "?"
(match key with | (
# 18 "?"
(Glut . KEY_UP))-> (
    (up := true)
  
)| (
# 19 "?"
(Glut . KEY_DOWN))-> (
    (down := true)
  
)| (
# 20 "?"
(Glut . KEY_LEFT))-> (
    (left := true)
  
)| (
# 21 "?"
(Glut . KEY_RIGHT))-> (
    (right := true)
  
)| (
# 22 "?"
_)-> (
    ()
  
))
);;

# 26 "?"
let onSpKeyUp = (fun ~(key) ~(x) ~(y) -> 
# 34 "?"

  
# 27 "?"
(match key with | (
# 28 "?"
(Glut . KEY_UP))-> (
    (up := false)
  
)| (
# 29 "?"
(Glut . KEY_DOWN))-> (
    (down := false)
  
)| (
# 30 "?"
(Glut . KEY_LEFT))-> (
    (left := false)
  
)| (
# 31 "?"
(Glut . KEY_RIGHT))-> (
    (right := false)
  
)| (
# 32 "?"
_)-> (
    ()
  
))
);;

# 36 "?"
let onKeyDown = (fun ~(key) ~(x) ~(y) -> 
# 41 "?"

  
# 37 "?"
(match char_of_int (key) with | (
# 38 "?"
'z')-> (
    (z := true)
  
)| (
# 39 "?"
_)-> (
    ()
  
))
);;

# 43 "?"
let onKeyUp = (fun ~(key) ~(x) ~(y) -> 
# 48 "?"

  
# 44 "?"
(match char_of_int (key) with | (
# 45 "?"
'z')-> (
    (z := false)
  
)| (
# 46 "?"
_)-> (
    ()
  
))
);;

# 50 "?"
let init = (fun () -> 
# 55 "?"

  
# 51 "?"
(Glut . specialFunc (onSpKeyDown));
  
# 52 "?"
(Glut . specialUpFunc (onSpKeyUp));
  
# 53 "?"
(Glut . keyboardFunc (onKeyDown));
  
# 54 "?"
(Glut . keyboardUpFunc (onKeyUp))
)
end;;
module BG = struct

# 59 "?"
let ship_x = (ref 0.000000);;

# 60 "?"
let ship_y = (ref 0.000000);;

# 61 "?"
let (stars:(((float * float * float)) list) ref) = (ref []);;

# 63 "?"
let init = (fun () -> 
# 73 "?"

  
# 71 "?"
let rec loop = begin fun t1'  -> match t1' with
    | (
# 66 "?"
( 0 , ls)) -> (

      ls
    )
    | (
# 67 "?"
( n , ls)) -> (

      loop ((n - 1) , 
# 68 "?"
(( (Random . float (width)) , 
# 69 "?"
(Random . float (height)) , 
# 70 "?"
((Random . float (3.000000)) +. 2.000000)) :: ls))
    )
   end  in
  
# 72 "?"
(stars := loop (30 , []))
);;

# 75 "?"
let move = (fun bs -> 
# 87 "?"

  
# 76 "?"
(stars := (List . map (
# 86 "?"
begin fun t1'  -> match t1' with
    | (
# 76 "?"
( x , y , speed)) -> (

# 78 "?"

      let x = (x -. ((((! ship_x) -. (width /. 2.000000)) *. 0.005000) *. speed)) in
      
# 79 "?"
let x = (if (x < 0.000000) then ((x +. width))else(x)) in
      
# 80 "?"
let x = (if (x > width) then ((x -. width))else(x)) in
      
# 81 "?"
let speed2 = (speed +. ((height -. (! ship_y)) *. 0.030000)) in
      
# 82 "?"
let y = (y +. speed2) in
      
# 83 "?"
(if (y > height) then (
# 84 "?"
( (Random . float (width)) , 0.000000 , ((Random . float (3.000000)) +. 2.000000))      )else(
# 85 "?"
( x , y , speed)))
    )
   end )) (
# 76 "?"
(! stars)))
);;

# 89 "?"
let draw = (fun () -> 
# 103 "?"

  
# 90 "?"
(List . iter (
# 102 "?"
begin fun t1'  -> match t1' with
    | (
# 90 "?"
( x , y , s)) -> (

# 91 "?"

      (GlDraw . color (
# 92 "?"
((Random . float (0.500000)) +. 0.500000) , 
# 93 "?"
((Random . float (0.500000)) +. 0.500000) , 
# 94 "?"
((Random . float (0.500000)) +. 0.500000)));
      
# 96 "?"
let s = (s +. ((height -. (! ship_y)) *. 0.060000)) in
      
# 98 "?"
(GlDraw . rect  (
# 99 "?"
x , y) (
# 100 "?"
(x +. 1.500000) , ((y +. 1.000000) +. s)))
    )
   end )) (
# 90 "?"
(! stars))
)
end;;
module Bullets = struct

# 108 "?"
let (bullets:(((float * float * (bool) ref)) list) ref) = (ref []);;

# 110 "?"
let add = (fun x y -> 
# 112 "?"

  
# 111 "?"
(bullets := (( x , y , (ref true)) :: (! bullets)))
);;

# 114 "?"
let move = (fun bs -> 
# 119 "?"

  
# 115 "?"
(bullets := 
# 116 "?"
(List . map (begin fun t1'  -> match t1' with
    | (( x , y , b)) -> (

      ( x , (y -. 10.000000) , b)
    )
   end )) (
# 115 "?"
(! bullets)));
  
# 117 "?"
(bullets := 
# 118 "?"
(List . filter (begin fun t1'  -> match t1' with
    | (( _ , y , {contents=b})) -> (

      (b && (y > 0.000000))
    )
   end )) (
# 117 "?"
(! bullets)))
);;

# 121 "?"
let draw = (fun () -> 
# 128 "?"

  
# 122 "?"
(List . iter (
# 127 "?"
begin fun t1'  -> match t1' with
    | (
# 122 "?"
( x , y , _)) -> (

# 123 "?"

      (GlDraw . rect  (
# 124 "?"
(x -. 1.500000) , (y -. 6.500000)) (
# 125 "?"
(x +. 3.000000) , (y +. 4.000000)))
    )
   end )) (
# 122 "?"
(! bullets))
)
end;;
module Ship = struct

# 132 "?"
let rsize = 25.000000;;

# 133 "?"
let x = (ref (width /. 2.000000));;

# 134 "?"
let y = (ref (height -. (rsize *. 2.000000)));;

# 135 "?"
let speed = 5.000000;;

# 137 "?"
let move = (fun () -> 
# 172 "?"

  
# 139 "?"
let m = 5 in
  
# 140 "?"
let m = (if (! (Key . left)) then ((m - 1))else(m)) in
  
# 141 "?"
let m = (if (! (Key . right)) then ((m + 1))else(m)) in
  
# 142 "?"
let m = (if (! (Key . up)) then ((m - 3))else(m)) in
  
# 143 "?"
let m = (if (! (Key . down)) then ((m + 3))else(m)) in
  
# 144 "?"
let speed = (match m with | (
# 145 "?"
1)| (
# 146 "?"
3)| (
# 147 "?"
7)| (
# 148 "?"
9)-> (
  (speed /. 1.400000)

)| (
# 149 "?"
_)-> (
  speed

)) in
  
# 151 "?"
let nx , ny = (match m with | (
# 152 "?"
1)-> (
  ((! x) -. speed) , ((! y) -. speed)

)| (
# 153 "?"
2)-> (
  (! x) , ((! y) -. speed)

)| (
# 154 "?"
3)-> (
  ((! x) +. speed) , ((! y) -. speed)

)| (
# 155 "?"
4)-> (
  ((! x) -. speed) , (! y)

)| (
# 156 "?"
5)-> (
  (! x) , (! y)

)| (
# 157 "?"
6)-> (
  ((! x) +. speed) , (! y)

)| (
# 158 "?"
7)-> (
  ((! x) -. speed) , ((! y) +. speed)

)| (
# 159 "?"
8)-> (
  (! x) , ((! y) +. speed)

)| (
# 160 "?"
9)-> (
  ((! x) +. speed) , ((! y) +. speed)

)| (
# 161 "?"
_)-> (
  (! x) , (! y)

)) in
  
# 164 "?"
(x := min  (max  (nx) ((rsize /. 2.000000))) ((width -. (rsize /. 2.000000))));
  
# 165 "?"
(y := min  (max  (ny) ((rsize /. 2.000000))) ((height -. (rsize /. 2.000000))));
  
# 167 "?"
(Bullets . move (()));
  
# 168 "?"
(if (! (Key . z)) then ((Bullets . add  ((! x)) (((! y) -. (rsize /. 2.000000)))))  );
  
# 169 "?"
((BG . ship_x) := (! x));
  
# 170 "?"
((BG . ship_y) := (! y))
);;

# 174 "?"
let draw = (fun () -> 
# 193 "?"

  
# 175 "?"
(GlDraw . color (1.000000 , 0.000000 , 0.000000));
  
# 176 "?"
let r = (rsize /. 6.000000) in
  
# 177 "?"
let r2 = (rsize /. 4.000000) in
  
# 178 "?"
(GlDraw . rect  (
# 179 "?"
((! x) -. r) , (((! y) -. r) -. r2)) (
# 180 "?"
((! x) +. r) , (((! y) +. r) -. r)));
  
# 182 "?"
(GlDraw . rect  (
# 183 "?"
(((! x) -. r) -. r2) , (((! y) -. r) +. r2)) (
# 184 "?"
(((! x) +. r) -. r2) , (((! y) +. r) +. r2)));
  
# 186 "?"
(GlDraw . rect  (
# 187 "?"
(((! x) -. r) +. r2) , (((! y) -. r) +. r2)) (
# 188 "?"
(((! x) +. r) +. r2) , (((! y) +. r) +. r2)));
  
# 191 "?"
(GlDraw . color (0.500000 , (0.800000 +. (Random . float (0.200000))) , (0.800000 +. (Random . float (0.200000)))));
  
# 192 "?"
(Bullets . draw (()))
)
end;;
module Game = struct

# 198 "?"
let draw = (fun () -> 
# 203 "?"

  
# 199 "?"
(GlClear . clear ([`color]));
  
# 200 "?"
(BG . draw (()));
  
# 201 "?"
(Ship . draw (()));
  
# 202 "?"
(Glut . swapBuffers (()))
);;

# 205 "?"
let rec mainLoop = (fun ~(value) -> 
# 210 "?"

  
# 206 "?"
(Glut . postRedisplay (()));
  
# 207 "?"
(BG . move (()));
  
# 208 "?"
(Ship . move (()));
  
# 209 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1))
);;

# 212 "?"
let resize = (fun ~(w) ~(h) -> 
# 226 "?"

  
# 213 "?"
let h = max  (h) (1) in
  
# 214 "?"
(GlDraw . viewport  ~x:(0)  ~y:(0)  ~w:(w) ~h:(h));
  
# 216 "?"
(GlMat . mode (`projection));
  
# 217 "?"
(GlMat . load_identity (()));
  
# 219 "?"
let ortho = (GlMat . ortho ~z:(( 1.000000 , -1.000000))) in
  
# 220 "?"
let x = ( 0.000000 , width) in
  
# 221 "?"
let y = ( height , -0.000000) in
  
# 222 "?"
ortho  ~x:(x) ~y:(y);
  
# 224 "?"
(GlMat . mode (`modelview));
  
# 225 "?"
(GlMat . load_identity (()))
);;

# 228 "?"
let main = 
# 241 "?"


# 229 "?"
(Random . init (int_of_float (((Sys . time (())) *. 10000.000000))));

# 230 "?"
let _ = (Glut . init ((Sys . argv))) in

# 231 "?"
(Glut . initDisplayMode  ~double_buffer:(true) ~alpha:(true) (()));

# 232 "?"
(Glut . initWindowSize  ~w:(int_of_float (width)) ~h:(int_of_float (height)));

# 233 "?"
let _ = (Glut . createWindow ("Game02")) in

# 234 "?"
(Glut . displayFunc (draw));

# 235 "?"
(Glut . reshapeFunc (resize));

# 236 "?"
(Key . init (()));

# 237 "?"
(BG . init (()));

# 238 "?"
(Glut . timerFunc  ~ms:(15)  ~cb:(mainLoop) ~value:(1));

# 239 "?"
(GlClear . color  ~alpha:(1.000000) (( 0.100000 , 0.100000 , 0.100000)));

# 240 "?"
(Glut . mainLoop (()))

end
