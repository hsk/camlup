all:
	nmlc game.nml

	ocamlfind ocamlc -package js_of_ocaml -package js_of_ocaml.syntax -syntax camlp4o -linkpkg game.ml -o game
	js_of_ocaml game
	open index.html

clean:
	rm -rf *.cm* game *.o
