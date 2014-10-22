let parse inp =
  let lexbuf = Lexing.from_string inp in
  Parser.prog Lexer.token lexbuf

let _ =
  Parser.print Format.std_formatter (parse "1+2 (1? 1 2 3 4? 5 6 7)");
  Format.fprintf Format.std_formatter "@.";
