all:
	cd src; ocamlyacc parser.mly
	rm src/parser.mli
	cd src; ocamllex lexer.mll

	cd src; ocamlyacc r_parser.mly
	rm src/r_parser.mli
	cd src; ocamllex r_lexer.mll

	cd src; ocamlc str.cma unix.cma ast.ml \
		parser.ml lexer.ml \
		r_parser.ml r_lexer.ml \
		gen_ml.ml utils.ml main.ml -o ../nmlc


hello:
	./nmlc examples/hello.nml
	ocaml examples/hello.ml

fib:
	./nmlc examples/fib.nml
	ocaml examples/fib.ml

test:
	./nmlc examples/test.nml
	ocaml examples/test.ml

r_hello:
	./nmlc examples/hello.rml
	ocaml examples/hello.ml

r_fib:
	./nmlc examples/fib.rml
	ocaml examples/fib.ml

r_test:
	./nmlc examples/test.rml
	ocaml examples/test.ml

clean:
	rm -rf nmlc nmlc.opt examples/*.ml examples/*.class src/.omakedb src/*.cm* src/*parser.ml src/*lexer.ml src/*.o
