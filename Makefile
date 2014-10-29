all:
	cd src; ocamlyacc parser.mly
	rm src/parser.mli
	cd src; ocamllex lexer.mll

	cd src; ocamlyacc r_parser.mly
	rm src/r_parser.mli
	cd src; ocamllex r_lexer.mll

	cd src; ocamlyacc dexp_parser.mly
	rm src/dexp_parser.mli
	cd src; ocamllex dexp_lexer.mll

	cd src; ocamlc str.cma unix.cma ast.ml \
		parser.ml lexer.ml \
		r_parser.ml r_lexer.ml \
		dexp.ml dexp_parser.ml dexp_lexer.ml \
		cexp.ml cexp_parse.ml \
		cexp_to_ml.ml \
		gen_ml.ml utils.ml main.ml -o ../nmlc
	cp nmlc /usr/local/bin/.
hello:
	./nmlc -run examples/hello.nml

fib:
	./nmlc -run examples/fib.nml

test:
	./nmlc -run examples/test.nml

r_hello:
	./nmlc -run examples/hello.rml

r_fib:
	./nmlc -run examples/fib.rml

r_test:
	./nmlc -run examples/test.rml

clean:
	rm -rf nmlc.opt examples/*.class src/.omakedb src/*.cm* src/*parser.ml src/*lexer.ml src/*.o
