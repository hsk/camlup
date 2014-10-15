all:
	ocamlyacc parser.mly
	echo "ocamlyacc ok"
	rm parser.mli
	echo "rm ok"
	ocamllex lexer.mll
	echo "ocaml lex ok"
#	ocamlc ast.ml parser.ml lexer.ml gen_ml.ml main.ml


#	ocamlopt -ccopt "-L c:\MinGW\lib" -ccopt "-L c:\MinGW\lib\gcc\mingw32\4.8.1" ast.ml parser.ml lexer.ml gen_ml.ml main.ml
	ocamlopt ast.ml parser.ml lexer.ml gen_ml.ml main.ml -o newmlc

clean:
	rm *.o *.cm*
