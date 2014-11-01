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

clean:
	rm *.cm* simple glrect *.o
