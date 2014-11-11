let width = 400.000000
  
let height = 800.000000
  
module Key =
  struct
    let _up = ref false
      
    let _down = ref false
      
    let _left = ref false
      
    let _right = ref false
      
    let _z = ref false
      
    let up () = !_up
      
    let down () = !_down
      
    let left () = !_left
      
    let right () = !_right
      
    let z () = !_z
      
    let onSpKeyDown ~key ~x ~y =
      match key with
      | Glut.KEY_UP -> _up := true
      | Glut.KEY_DOWN -> _down := true
      | Glut.KEY_LEFT -> _left := true
      | Glut.KEY_RIGHT -> _right := true
      | _ -> ()
      
    let onSpKeyUp ~key ~x ~y =
      match key with
      | Glut.KEY_UP -> _up := false
      | Glut.KEY_DOWN -> _down := false
      | Glut.KEY_LEFT -> _left := false
      | Glut.KEY_RIGHT -> _right := false
      | _ -> ()
      
    let onKeyDown ~key ~x ~y =
      match char_of_int key with | 'z' -> _z := true | _ -> ()
      
    let onKeyUp ~key ~x ~y =
      match char_of_int key with | 'z' -> _z := false | _ -> ()
      
    let init () =
      (Glut.specialFunc onSpKeyDown;
       Glut.specialUpFunc onSpKeyUp;
       Glut.keyboardFunc onKeyDown;
       Glut.keyboardUpFunc onKeyUp)
      
  end
  
module Bullets =
  struct
    let (bullets : ((float * float * (bool ref)) list) ref) = ref []
      
    let add x y = bullets := (x, y, (ref true)) :: !bullets
      
    let move bs =
      bullets :=
        List.filter
          (fun t1' ->
             match t1' with | (_, y, { contents = b }) -> b && (y > 0.000000))
          (List.map
             (fun t1' ->
                match t1' with | (x, y, b) -> (x, (y -. 10.000000), b))
             !bullets)
      
    let draw () =
      (GlDraw.color
         (0.500000, (0.800000 +. (Random.float 0.200000)),
          (0.800000 +. (Random.float 0.200000)));
       List.iter
         (fun t1' ->
            match t1' with
            | (x, y, _) ->
                GlDraw.rect ((x -. 1.500000), (y -. 6.500000))
                  ((x +. 3.000000), (y +. 4.000000)))
         !bullets)
      
  end
  
module Ship =
  struct
    let rsize = 25.000000
      
    let x = ref (width /. 2.000000)
      
    let y = ref (height -. (rsize *. 2.000000))
      
    let speed = 5.000000
      
    let move () =
      let m = 5 in
      let m = if Key.left () then m - 1 else m in
      let m = if Key.right () then m + 1 else m in
      let m = if Key.up () then m - 3 else m in
      let m = if Key.down () then m + 3 else m in
      let speed =
        match m with | 1 | 3 | 7 | 9 -> speed /. 1.400000 | _ -> speed in
      let (nx, ny) =
        match m with
        | 1 -> ((!x -. speed), (!y -. speed))
        | 2 -> ((!x), (!y -. speed))
        | 3 -> ((!x +. speed), (!y -. speed))
        | 4 -> ((!x -. speed), (!y))
        | 5 -> ((!x), (!y))
        | 6 -> ((!x +. speed), (!y))
        | 7 -> ((!x -. speed), (!y +. speed))
        | 8 -> ((!x), (!y +. speed))
        | 9 -> ((!x +. speed), (!y +. speed))
        | _ -> ((!x), (!y))
      in
        (x := min (max nx (rsize /. 2.000000)) (width -. (rsize /. 2.000000));
         y :=
           min (max ny (rsize /. 2.000000)) (height -. (rsize /. 2.000000));
         Bullets.move ();
         if Key.z () then Bullets.add !x (!y -. (rsize /. 2.000000)) else ())
      
    let draw () =
      (GlDraw.color (1.000000, 0.000000, 0.000000);
       let r = rsize /. 6.000000 in
       let r2 = rsize /. 4.000000
       in
         (GlDraw.rect (!x -. r, ((!y -. r) -. r2))
            ((!x +. r), ((!y +. r) -. r));
          GlDraw.rect (((!x -. r) -. r2), ((!y -. r) +. r2))
            (((!x +. r) -. r2), ((!y +. r) +. r2));
          GlDraw.rect (((!x -. r) +. r2), ((!y -. r) +. r2))
            (((!x +. r) +. r2), ((!y +. r) +. r2));
          Bullets.draw ()))
      
  end
  
module BG =
  struct
    let (stars : ((float * float * float) list) ref) = ref []
      
    let init () =
      let rec createList i ls f =
        match i with | (-1) -> ls | i -> createList (i - 1) ((f i) :: ls) f
      in
        stars :=
          createList 30 []
            (fun t1' ->
               match t1' with
               | i ->
                   let x = Random.float width in
                   let y = Random.float height in
                   let speed = (Random.float 3.000000) +. 2.000000
                   in (x, y, speed))
      
    let move bs =
      stars :=
        List.map
          (fun t1' ->
             match t1' with
             | (x, y, speed) ->
                 let x =
                   x -.
                     (((!Ship.x -. (width /. 2.000000)) *. 0.005000) *. speed) in
                 let x = if x < 0.000000 then x +. width else x in
                 let x = if x > width then x -. width else x in
                 let speed2 = speed +. ((height -. !Ship.y) *. 0.030000) in
                 let y = y +. speed2
                 in
                   if y > height
                   then
                     ((Random.float width), 0.000000,
                      ((Random.float 3.000000) +. 2.000000))
                   else (x, y, speed))
          !stars
      
    let draw () =
      List.iter
        (fun t1' ->
           match t1' with
           | (x, y, s) ->
               (GlDraw.color
                  (((Random.float 0.500000) +. 0.500000),
                   ((Random.float 0.500000) +. 0.500000),
                   ((Random.float 0.500000) +. 0.500000));
                let s = s +. ((height -. !Ship.y) *. 0.060000)
                in
                  GlDraw.rect (x, y)
                    ((x +. 1.500000), ((y +. 1.000000) +. s))))
        !stars
      
  end
  
module Game =
  struct
    let draw () =
      (GlClear.clear [ `color ];
       BG.draw ();
       Ship.draw ();
       Glut.swapBuffers ())
      
    (* test *)
    let rec mainLoop ~value =
      (Glut.postRedisplay ();
       BG.move ();
       Ship.move ();
       Glut.timerFunc ~ms: 15 ~cb: mainLoop ~value: 1)
      
    let resize ~w ~h =
      (GlDraw.viewport ~x: 0 ~y: 0 ~w: w ~h: (max h 1);
       GlMat.mode `projection;
       GlMat.load_identity ();
       let ortho = GlMat.ortho ~z: (1.000000, (-1.000000))
       in
         (ortho ~x: (0.000000, width) ~y: (height, (-0.000000));
          GlMat.mode `modelview;
          GlMat.load_identity ()))
      
    let main =
      (Random.init (int_of_float ((Sys.time ()) *. 10000.000000));
       ignore (Glut.init Sys.argv);
       Glut.initDisplayMode ~double_buffer: true ~alpha: true ();
       Glut.initWindowSize ~w: (int_of_float width) ~h: (int_of_float height);
       ignore (Glut.createWindow "Game02");
       Glut.displayFunc draw;
       Glut.reshapeFunc resize;
       Key.init ();
       BG.init ();
       Glut.timerFunc ~ms: 15 ~cb: mainLoop ~value: 1;
       GlClear.color ~alpha: 1.000000 (0.100000, 0.100000, 0.100000);
       Glut.mainLoop ())
      
  end
  

