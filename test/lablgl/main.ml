let angle t = t *. 10000.
let render () =
  GlClear.clear [ `color ];
  GlMat.load_identity ();
  GlMat.rotate ~angle: (angle (Sys.time ())) ~z:1. ();
  GlDraw.begins `triangles;
  List.iter GlDraw.vertex2 [-1., -1.; 0., 1.; 1., -1.];
  GlDraw.ends ();
  Glut.swapBuffers ()

let _ =

  let _ = Glut.init Sys.argv in
  Glut.initDisplayMode ~double_buffer:true ();
  let _ = Glut.createWindow ~title:"OpenGL Demo" in
  GlMat.mode `modelview;
  Glut.displayFunc ~cb:render;
  Glut.idleFunc ~cb:(Some Glut.postRedisplay);
  Glut.mainLoop ()

