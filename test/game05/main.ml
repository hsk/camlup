let width = 400.0
  
let height = 800.0
  
let pi = 4.0 *. (atan 1.0)
  
let normalize v =
  v +.
    ((2.0 *. pi) *.
       (if v > pi then (-1.) else if v < (-. pi) then 1. else 0.))
  
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
  
module Shots =
  struct
    type shot = { x : float; y : float; enable : bool ref }
    
    let (shots : (shot list) ref) = ref []
      
    let cnt = ref 0
      
    let add x y =
      if !cnt < 16
      then shots := { x = x; y = y; enable = ref true; } :: !shots
      else ()
      
    let move () =
      (cnt := 0;
       shots :=
         List.filter
           (fun t1' ->
              match t1' with
              | { y = y; enable = { contents = b } } -> b && (y > 0.))
           (List.map
              (fun t1' ->
                 match t1' with
                 | { x = x; y = y; enable = enable } ->
                     (incr cnt; { x = x; y = y -. 30.0; enable = enable; }))
              !shots))
      
    let draw () =
      (GlDraw.color
         (0.5, (0.8 +. (Random.float 0.2)), (0.8 +. (Random.float 0.2)));
       List.iter
         (fun t1' ->
            match t1' with
            | { x = x; y = y } ->
                GlDraw.rect ((x -. 1.5), (y -. 6.5)) ((x +. 3.0), (y +. 4.0)))
         !shots)
      
    let checkColligion1 bx by r ls =
      not
        (List.exists
           (fun t1' ->
              match t1' with
              | { x = x; y = y } ->
                  (((x -. r) < bx) && (bx < (x +. r))) &&
                    (((y -. r) < by) && (by < (y +. r))))
           ls)
      
    let checkColligion x y r = checkColligion1 x y r !shots
      
  end
  
module Ship =
  struct
    let rsize = 25.0
      
    let x = ref (width /. 2.0)
      
    let y = ref (height -. (rsize *. 2.0))
      
    let speed = 5.0
      
    let move () =
      let m = 5 in
      let m = if Key.left () then m - 1 else m in
      let m = if Key.right () then m + 1 else m in
      let m = if Key.up () then m - 3 else m in
      let m = if Key.down () then m + 3 else m in
      let speed =
        match m with | 1 | 3 | 7 | 9 -> speed /. 1.4 | _ -> speed in
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
        (x := min (max nx (rsize /. 2.)) (width -. (rsize /. 2.));
         y := min (max ny (rsize /. 2.)) (height -. (rsize /. 2.));
         Shots.move ();
         if Key.z () then Shots.add !x (!y -. (rsize /. 2.)) else ())
      
    let draw () =
      (GlDraw.color (1.0, 0.0, 0.0);
       let r = rsize /. 6. in
       let r2 = rsize /. 4.
       in
         (GlDraw.rect ((!x -. r), ((!y -. r) -. r2))
            ((!x +. r), ((!y +. r) -. r));
          GlDraw.rect (((!x -. r) -. r2), ((!y -. r) +. r2))
            (((!x +. r) -. r2), ((!y +. r) +. r2));
          GlDraw.rect (((!x -. r) +. r2), ((!y -. r) +. r2))
            (((!x +. r) +. r2), ((!y +. r) +. r2));
          Shots.draw ()))
      
    let checkColligion r _x _y =
      (((_x -. r) < !x) && (!x < (_x +. r))) &&
        (((_y -. r) < !y) && (!y < (_y +. r)))
      
  end
  
module BG =
  struct
    let (stars : ((float * float * float) list) ref) = ref []
      
    let init () =
      let rec createList i ls f =
        match i with | (-1) -> ls | i -> createList (i - 1) ((f i) :: ls) f
      in
        stars :=
          createList 100 []
            (fun t1' ->
               match t1' with
               | i ->
                   let x = Random.float width in
                   let y = Random.float height in
                   let speed = (Random.float 3.) +. 2.0 in (x, y, speed))
      
    let move () =
      stars :=
        List.map
          (fun t1' ->
             match t1' with
             | (x, y, speed) ->
                 let x =
                   x -. (((!Ship.x -. (width /. 2.)) *. 0.005) *. speed) in
                 let x = if x < 0. then x +. width else x in
                 let x = if x > width then x -. width else x in
                 let speed2 = speed +. ((height -. !Ship.y) *. 0.03) in
                 let y = y +. speed2
                 in
                   if y > height
                   then ((Random.float width), 0., ((Random.float 3.) +. 2.))
                   else (x, y, speed))
          !stars
      
    let draw () =
      List.iter
        (fun t1' ->
           match t1' with
           | (x, y, s) ->
               (GlDraw.color
                  (((Random.float 0.5) +. 0.5), ((Random.float 0.5) +. 0.5),
                   ((Random.float 0.5) +. 0.5));
                let s = s +. ((height -. !Ship.y) *. 0.06)
                in GlDraw.rect (x, y) ((x +. 1.5), ((y +. 1.0) +. s))))
        !stars
      
  end
  
module Particles =
  struct
    type particle =
      { x : float; y : float; dir : float; speed : float; size : float;
        color : (float * float * float)
      }
    
    let (particles : (particle list) ref) = ref []
      
    let cnt = ref 0
      
    let add ?(color = (100.0, 0.6, 0.2)) ?(speed = 0.0) x y n =
      for i = 0 to n do
        if !cnt < 28000
        then
          particles :=
            {
              x = x;
              y = y;
              dir = Random.float (pi *. 2.);
              speed =
                if speed > 0.0
                then speed
                else
                  ((Random.float 2.0) *. (Random.float 0.5)) *.
                    (Random.float 2.0);
              size = (Random.float 15.1) +. 2.;
              color = color;
            } :: !particles
        else ()
      done
      
    let add2 x y = add ~color: (0.2, 0.6, 100.0) ~speed: 10.0 x y 3000
      
    let move () =
      (cnt := 0;
       particles :=
         List.filter
           (fun t1' ->
              match t1' with
              | { x = x; y = y; size = size } ->
                  ((((size > 0.) && (y > 0.)) && (y < height)) && (x > 0.))
                    && (x < height))
           (List.map
              (fun t1' ->
                 match t1' with
                 | {
                     x = x;
                     y = y;
                     dir = dir;
                     speed = speed;
                     size = size;
                     color = color } ->
                     (incr cnt;
                      {
                        x =
                          (x +. (speed *. (cos dir))) -. (speed *. (sin dir));
                        y =
                          (y +. (speed *. (sin dir))) +. (speed *. (cos dir));
                        dir = dir;
                        speed = speed;
                        size = size -. 0.5;
                        color = color;
                      }))
              !particles))
      
    let draw () =
      List.iter
        (fun t1' ->
           match t1' with
           | { x = x; y = y; size = size; color = (r, g, b) } ->
               (GlDraw.color
                  ((((r +. (Random.float 0.2)) *. (size *. 0.75)) /. 5.),
                   (((g +. (Random.float 0.2)) *. (size *. 0.75)) /. 5.),
                   (((b +. (Random.float 0.2)) *. (size *. 0.75)) /. 5.));
                GlDraw.rect ((x -. size), (y -. size))
                  ((x +. size), (y +. size))))
        !particles
      
  end
  
module Bullets =
  struct
    type bullet =
      { x : float; y : float; rad : float; speed : float; enable : bool ref
      }
    
    let (bullets : (bullet list) ref) = ref []
      
    let cnt = ref 0
      
    let add x y rad speed =
      if !cnt < 16000
      then
        bullets :=
          { x = x; y = y; enable = ref true; rad = rad; speed = speed; } ::
            !bullets
      else ()
      
    let move () =
      (cnt := 0;
       bullets :=
         List.filter
           (fun t1' ->
              match t1' with
              | { x = x; y = y; enable = { contents = b } } ->
                  (((b && (y > 0.)) && (y < height)) && (x > 0.)) &&
                    (x < height))
           (List.map
              (fun t1' ->
                 match t1' with
                 | { x = x; y = y; rad = rad; speed = speed; enable = enable
                     } ->
                     (incr cnt;
                      let c = Ship.checkColligion 1.2 x y
                      in
                        (if c then Particles.add2 x y else ();
                         let e =
                           {
                             x = x +. ((cos rad) *. speed);
                             y = y +. ((sin rad) *. speed);
                             enable = ref (!enable && (not c));
                             speed = speed;
                             rad = rad;
                           }
                         in e)))
              !bullets))
      
    let draw () =
      (GlDraw.color
         (((Random.float 0.1) +. 0.8), ((Random.float 0.1) +. 0.2),
          ((Random.float 0.1) +. 0.8));
       List.iter
         (fun t1' ->
            match t1' with
            | { x = x; y = y } ->
                let r = 5.0
                in GlDraw.rect ((x -. r), (y -. r)) ((x +. r), (y +. r)))
         !bullets)
      
  end
  
module Enemies =
  struct
    class enemy (x : float) (y : float) (enable : bool) =
      object (this)
        method x = x
        method y = y
        val mutable enable = enable
        method enable = enable
        method set_enable = fun e -> enable <- e
        method move =
          let s = 2.0 +. ((height -. !Ship.y) *. 0.06) in
          let x = x -. (((!Ship.x -. (width /. 2.)) *. 0.005) *. s)
          in
            (if (Random.float 1.0) < 0.01
             then
               (let rad2 = atan2 (!Ship.y -. y) (!Ship.x -. x)
                in Bullets.add x y rad2 3.0)
             else ();
             new enemy x (y +. s) (enable && (y < height)))
        method draw =
          (GlDraw.color
             (((Random.float 0.1) +. 0.8), ((Random.float 0.1) +. 0.8),
              ((Random.float 0.1) +. 0.2));
           let r = 24.0
           in GlDraw.rect ((x -. r), (y -. r)) ((x +. r), (y +. r)))
      end
      
    class enemy2 (x : float) (y : float) (enable : bool) =
      object (this)
        method x = x
        method y = y
        method z = 1
        val mutable enable = enable
        method enable = enable
        method set_enable = fun e -> enable <- e
        method move =
          let s = 5.0 +. ((height -. !Ship.y) *. 0.06) in
          let x = x -. (((!Ship.x -. (width /. 2.)) *. 0.005) *. s) in
          let y = y +. s in
          let c = Ship.checkColligion 5.0 x y
          in
            (if c then Particles.add2 x y else ();
             new enemy2 x y ((enable && (y < height)) && (not c)))
        method draw =
          (GlDraw.color
             (((Random.float 0.1) +. 0.5), ((Random.float 0.1) +. 0.5),
              ((Random.float 0.1) +. 0.9));
           let r = 8.0
           in GlDraw.rect ((x -. r), (y -. r)) ((x +. r), (y +. r)))
      end
      
    class enemy3 (x : float) (y : float) (enable : bool) =
      object (this)
        method x = x
        method y = y
        val mutable enable = enable
        method enable = enable
        method set_enable = fun e -> enable <- e
        val mutable cnt = Random.float (pi *. 2.0)
        method set_cnt = fun z1 -> cnt <- z1
        method move =
          let s = 5.0 +. ((height -. !Ship.y) *. 0.06) in
          let x =
            (x -. (((!Ship.x -. (width /. 2.)) *. 0.005) *. s)) +.
              ((sin cnt) *. 10.0) in
          let y = y +. s in
          let c = Ship.checkColligion 5.0 x y
          in
            (if c then Particles.add2 x y else ();
             let e = new enemy3 x y ((enable && (y < height)) && (not c))
             in (e#set_cnt (cnt +. 0.1); e))
        method draw =
          (GlDraw.color
             (((Random.float 0.1) +. 0.9), ((Random.float 0.1) +. 0.5),
              ((Random.float 0.1) +. 0.5));
           let r = 8.0
           in GlDraw.rect ((x -. r), (y -. r)) ((x +. r), (y +. r)))
      end
      
    class enemy4 (x : float) (y : float) (enable : bool) =
      object (this)
        method x = x
        method y = y
        val mutable enable = enable
        method enable = enable
        method set_enable = fun e -> enable <- e
        val mutable rad = 0.0
        method rad = rad
        method set_rad = fun z1 -> rad <- z1
        method move =
          let speed = 6.0 in
          let r = 0.15 in
          let rad2 = atan2 (!Ship.y -. y) (!Ship.x -. x) in
          let rad =
            if (normalize (rad -. rad2)) < 0. then rad +. r else rad -. r in
          let rad = normalize rad in
          let x = x +. ((cos rad) *. speed) in
          let y = y +. ((sin rad) *. speed) in
          let c = Ship.checkColligion 5.0 x y
          in
            (if c then Particles.add2 x y else ();
             let e = new enemy4 x y ((enable && (y < height)) && (not c))
             in (e#set_rad rad; e))
        method draw =
          (GlDraw.color
             (((Random.float 0.1) +. 0.5), ((Random.float 0.1) +. 0.5),
              ((Random.float 0.1) +. 0.5));
           let r = 8.0
           in GlDraw.rect ((x -. r), (y -. r)) ((x +. r), (y +. r)))
      end
      
    let (enemies : (enemy list) ref) = ref []
      
    let count = ref 0
      
    let add enm x y =
      if !count < 20 then enemies := (enm x y true) :: !enemies else ()
      
    let move () =
      (if (Random.float 1.0) < 0.35
       then
         (let es =
            [ new enemy;
              (fun t1' t2' t3' ->
                 match (t1', t2', t3') with
                 | (x, y, b) -> (new enemy2 x y b :> enemy));
              (fun t1' t2' t3' ->
                 match (t1', t2', t3') with
                 | (x, y, b) -> (new enemy3 x y b :> enemy));
              (fun t1' t2' t3' ->
                 match (t1', t2', t3') with
                 | (x, y, b) -> (new enemy4 x y b :> enemy)) ] in
          let enm = List.nth es (Random.int (List.length es))
          in add enm ((Random.float (width *. 2.0)) -. (width /. 2.)) (-10.0))
       else ();
       count := 0;
       enemies :=
         List.filter
           (fun t1' ->
              match t1' with
              | e ->
                  if Shots.checkColligion e#x e#y 16.0
                  then e#enable
                  else (Particles.add e#x e#y 1000; false))
           (List.map (fun t1' -> match t1' with | e -> (incr count; e#move))
              !enemies))
      
    let draw () =
      List.iter (fun t1' -> match t1' with | e -> e#draw) !enemies
      
  end
  
module Game =
  struct
    let draw () =
      (GlClear.clear [ `color ];
       BG.draw ();
       Enemies.draw ();
       Particles.draw ();
       Ship.draw ();
       Bullets.draw ();
       Glut.swapBuffers ())
      
    let rec mainLoop ~value =
      (Glut.postRedisplay ();
       BG.move ();
       Particles.move ();
       Ship.move ();
       Bullets.move ();
       Enemies.move ();
       Glut.timerFunc ~ms: 15 ~cb: mainLoop ~value: 1)
      
    let resize ~w ~h =
      (GlDraw.viewport ~x: 0 ~y: 0 ~w: w ~h: (max h 1);
       GlMat.mode `projection;
       GlMat.load_identity ();
       GlMat.ortho ~z: (1.0, (-1.0)) ~x: (0.0, width) ~y: (height, (-0.0));
       GlMat.mode `modelview;
       GlMat.load_identity ())
      
    let main =
      (Random.init (int_of_float ((Sys.time ()) *. 10000.0));
       ignore (Glut.init Sys.argv);
       Glut.initDisplayMode ~double_buffer: true ~alpha: true ();
       Glut.initWindowSize ~w: (int_of_float width) ~h: (int_of_float height);
       ignore (Glut.createWindow "Game05");
       Glut.displayFunc draw;
       Glut.reshapeFunc resize;
       Key.init ();
       BG.init ();
       Glut.timerFunc ~ms: 15 ~cb: mainLoop ~value: 1;
       GlClear.color ~alpha: 1.0 (0.1, 0.1, 0.1);
       Glut.mainLoop ())
      
  end
  

