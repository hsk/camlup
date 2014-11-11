module Html = 
# 1 "?"
Dom_html;; 
# 3 "?"
let w = 400.;; 
# 4 "?"
let h = 400.;; module Key = struct 
# 8 "?"
let z = (ref false);; 
# 9 "?"
let up = (ref false);; 
# 10 "?"
let down = (ref false);; 
# 11 "?"
let left = (ref false);; 
# 12 "?"
let right = (ref false);; 
# 14 "?"
let setKey = (fun keyCode v -> 
# 26 "?"
   
# 15 "?"
(match char_of_int (keyCode) with | (
# 16 "?"
'z')-> (     (z := v)
  )| (
# 17 "?"
_)-> (     ()
  ));
  
# 19 "?"
(match keyCode with | (
# 20 "?"
37)-> (     (left := v)
  )| (
# 21 "?"
38)-> (     (up := v)
  )| (
# 22 "?"
39)-> (     (right := v)
  )| (
# 23 "?"
40)-> (     (down := v)
  )| (
# 24 "?"
_)-> (     ()
  ))
);; 
# 28 "?"
let keydown = (fun ev -> 
# 32 "?"
   
# 29 "?"
let keyCode = ev ## keyCode in
  
# 30 "?"
setKey  (keyCode) (true);
  
# 31 "?"
(Js . _true)
);; 
# 34 "?"
let keyup = (fun ev -> 
# 38 "?"
   
# 35 "?"
let keyCode = ev ## keyCode in
  
# 36 "?"
setKey  (keyCode) (false);
  
# 37 "?"
(Js . _true)
);; 
# 39 "?"
let init = (fun () -> 
# 43 "?"
   
# 41 "?"
((Html . window) ## onkeyup <- (Html . handler (keyup)));
  
# 42 "?"
((Html . window) ## onkeydown <- (Html . handler (keydown)))
) end;; 
# 46 "?"
let rect = (fun c x y width height -> 
# 54 "?"
   
# 47 "?"
c ## beginPath ();
  
# 48 "?"
c ## moveTo (x , y);
  
# 49 "?"
c ## lineTo ((x +. width) , y);
  
# 50 "?"
c ## lineTo ((x +. width) , (y +. height));
  
# 51 "?"
c ## lineTo (x , (y +. height));
  
# 52 "?"
c ## closePath ();
  
# 53 "?"
c ## fill ()
);; module Game = struct 
# 57 "?"
let x = (ref 200.);; 
# 58 "?"
let y = (ref 200.);; 
# 60 "?"
let move = (fun () -> 
# 65 "?"
   
# 61 "?"
(x := (if (! (Key . left)) then (((! x) -. 1.)  )else((! x))));
  
# 62 "?"
(x := (if (! (Key . right)) then (((! x) +. 1.)  )else((! x))));
  
# 63 "?"
(y := (if (! (Key . up)) then (((! y) -. 1.)  )else((! y))));
  
# 64 "?"
(y := (if (! (Key . down)) then (((! y) +. 1.)  )else((! y))))
);; 
# 67 "?"
let draw = (fun c -> 
# 72 "?"
   
# 68 "?"
(c ## fillStyle <- (Js . string ("#ccffd9")));
  
# 69 "?"
rect  (c)  (0.)  (0.)  (w) (h);
  
# 70 "?"
(c ## fillStyle <- (Js . string ("#ff0000")));
  
# 71 "?"
rect  (c)  ((! x))  ((! y))  (50.) (50.)
);; 
# 74 "?"
let rec loop = (fun c -> 
# 78 "?"
   
# 75 "?"
move ();
  
# 76 "?"
draw (c);
  
# 77 "?"
ignore ((Html . window) ## setTimeout ((Js . wrap_callback (begin fun t1'  -> match t1' with     | (()) -> (       loop (c)
    )   end )) , 0.15))
);; 
# 80 "?"
let create_canvas = (fun w h -> 
# 86 "?"
   
# 81 "?"
let d = (Html . window) ## document in
  
# 82 "?"
let c = (Html . createCanvas (d)) in
  
# 83 "?"
(c ## width <- int_of_float (w));
  
# 84 "?"
(c ## height <- int_of_float (h));
  
# 85 "?"
c
);; 
# 88 "?"
let start = (fun _ -> 
# 95 "?"
   
# 89 "?"
let c = create_canvas  (w) (h) in
  
# 90 "?"
(Dom . appendChild  ((Html . window) ## document ## body) (c));
  
# 91 "?"
(Key . init ());
  
# 92 "?"
let c = c ## getContext ((Html . _2d_)) in
  
# 93 "?"
loop (c);
  
# 94 "?"
(Js . _false)
);; 
# 97 "?"
let _ = 
# 99 "?"
 
# 98 "?"
((Html . window) ## onload <- (Html . handler (start)))
 end
