all:
	nmlc main.nml
	ocamlopt -I `ocamlfind query lablgl` lablgl.cmxa lablglut.cmxa main.ml -o game
	camlp4 main.ml -parser o -printer o > main2.ml
	mv main2.ml main.ml
	./game
clean:
	rm -rf *.cm* game *.o
