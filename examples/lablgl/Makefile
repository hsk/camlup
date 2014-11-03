simple:
	nmlc simple.nml
	ocamlopt -I `ocamlfind query lablgl` lablgl.cmxa lablglut.cmxa simple.ml -o simple
	./simple
glrect: glrect.nml
	nmlc glrect.nml
	ocamlopt -I `ocamlfind query lablgl` lablgl.cmxa lablglut.cmxa glrect.ml -o glrect
bounds: bounds.nml
	nmlc bounds.nml
	ocamlopt -I `ocamlfind query lablgl` lablgl.cmxa lablglut.cmxa bounds.ml -o bounds

m.ml: m.nml
	nmlc m.nml

points: points.nml m.ml
	nmlc points.nml
	ocamlopt -I `ocamlfind query lablgl` lablgl.cmxa lablglut.cmxa m.ml points.ml -o points

lines: lines.nml m.ml
	nmlc lines.nml
	ocamlopt -I `ocamlfind query lablgl` lablgl.cmxa lablglut.cmxa m.ml lines.ml -o lines

lstipple: lstipple.nml m.ml
	nmlc lstipple.nml
	ocamlopt -I `ocamlfind query lablgl` lablgl.cmxa lablglut.cmxa m.ml lstipple.ml -o lstipple

triangle: triangle.nml m.ml
	nmlc triangle.nml
	ocamlopt -I `ocamlfind query lablgl` lablgl.cmxa lablglut.cmxa m.ml triangle.ml -o triangle

clean:
	rm -rf *.cm* simple glrect points lines lstipple triangle *.o
