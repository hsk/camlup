let parse inp =
  let lexbuf = Lexing.from_string inp in
  Parser.prog Lexer.token lexbuf

let _ =
  Parser.print Format.std_formatter (parse "
  	printf(\"fib 10=%d\\n\"; (0 ? 0 1 ? 1 n ? recall(n-2)+recall(n-1))(10))
  ");
  Format.fprintf Format.std_formatter "@.";
