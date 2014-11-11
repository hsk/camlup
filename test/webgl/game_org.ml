module Html = Dom_html

let w = 400.
let h = 400.

module Key = struct
  let z = ref false
  let up = ref false
  let down = ref false
  let left = ref false
  let right = ref false

  let setKey keyCode v =
    begin match char_of_int keyCode with
    | 'z' -> z := v
    | _ -> ()
    end;
    begin match keyCode with
    | 37 -> left := v
    | 38 -> up := v
    | 39 -> right := v
    | 40 -> down := v
    | _ -> ()
    end

  let keydown ev =
    let keyCode = ev##keyCode in
    setKey keyCode true;
    (*Html.window##alert ( Js.string ( "x:" ^ (string_of_int keyCode)));*)
    Js._true

  let keyup ev =
    let keyCode = ev##keyCode in
    setKey keyCode false;
    Js._true

  let init() =
    Html.window##onkeyup <- Html.handler keyup;
    Html.window##onkeydown <- Html.handler keydown
end

let rect c x y width height =
  c##beginPath ();
  c##moveTo (x , y);
  c##lineTo (x+.width, y);
  c##lineTo (x+.width, y+.height);
  c##lineTo (x,        y+.height);
  c##closePath();
  c##fill ()

module Game = struct
  let x = ref 200.
  let y = ref 200.

  let move () =
    x := if !Key.left  then !x -. 1. else !x;
    x := if !Key.right then !x +. 1. else !x;
    y := if !Key.up    then !y -. 1. else !y;
    y := if !Key.down  then !y +. 1. else !y

  let draw c =
    c##fillStyle <- Js.string "#ccffd9";
    rect c 0. 0. w h;
    c##fillStyle <- Js.string "#ff0000";
    rect c !x !y 50. 50.

  let rec loop c =
    move();
    draw c;
    ignore (Html.window##setTimeout(Js.wrap_callback (fun()-> loop c), 0.15))

  let create_canvas w h =
    let d = Html.window##document in
    let c = Html.createCanvas d in
    c##width <- int_of_float w;
    c##height <- int_of_float h;
    c

  let start _ =
    let c = create_canvas w h in
    (*c##onclick <- Html.handler 
      (fun ev ->
         let mx=ev##clientX and my=ev##clientY in
          Html.window##alert ( Js.string ( "x:" ^ (string_of_int mx) ^ "y:" ^ (string_of_int my) ));
         Js._true);*)
    Dom.appendChild Html.window##document##body c;
    Key.init ();
    let c = c##getContext (Html._2d_) in
    loop c;
    Js._false
   
  let _ =
      Html.window##onload <- Html.handler start
end
