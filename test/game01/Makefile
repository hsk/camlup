all:
	nmlc main.nml
	ocamlopt -I `ocamlfind query lablgl` lablgl.cmxa lablglut.cmxa main.ml -o game01
	./game01
clean:
	rm *.cm* game01 *.o
