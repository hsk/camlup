all:
	nmlc main2.nml
#	ocamlopt -I `ocamlfind query lablgl` lablgl.cmxa lablglut.cmxa main.ml
	ocamlopt -I `ocamlfind query lablgl` lablgl.cmxa lablglut.cmxa main2.ml
	./a.out
clean:
	rm *.cm* a.out *.o
