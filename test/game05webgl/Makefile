all:
	nmlc main.nml

	ocamlfind ocamlc -package js_of_ocaml -package js_of_ocaml.syntax -syntax camlp4o -linkpkg main.ml -o main
	js_of_ocaml main
	open index.html

clean:
	rm -rf *.cm* main *.o
