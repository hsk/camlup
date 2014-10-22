all:
	ocamlyacc parser.mly
	rm parser.mli
	ocamllex lexer.mll
	ocamlc parser.ml lexer.ml main.ml
	./a.out
	rm -rf *.cm* parser.ml lexer.ml a.out
clean:
	rm -rf *.cm* parser.ml lexer.ml a.out