all:
	nmlc main.nml
	ocamlopt -I `ocamlfind query lablgl` lablgl.cmxa lablglut.cmxa main.ml -o game
	./game
clean:
	rm -rf *.cm* game *.o
