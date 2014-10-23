{
open Dexp_parser
}

let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']

rule token = parse
  | space+ { token lexbuf }
  | "/*" { comment lexbuf }
  | "//" [^ '\n' '\r']* ['\n' '\r'] { token lexbuf }
  | '(' { LPAREN(Lexing.lexeme lexbuf) }
  | ')' { RPAREN(Lexing.lexeme lexbuf) }
  | '{' { LPAREN(Lexing.lexeme lexbuf) }
  | '}' { RPAREN(Lexing.lexeme lexbuf) }
  | '[' { LPAREN(Lexing.lexeme lexbuf) }
  | ']' { RPAREN(Lexing.lexeme lexbuf) }
  | digit+ { INT(int_of_string (Lexing.lexeme lexbuf)) }

  | '"' [^ '"']* '"'  { STRING(Lexing.lexeme lexbuf) }
  | ['+' '-' '*' '/' '%' '<' '>' '=' '&' '|' '^' '~' ':' '?' '@']+
      { OP(Lexing.lexeme lexbuf) }
  | [';' ','] { OP(Lexing.lexeme lexbuf) }
  | ['.']+ { OP(Lexing.lexeme lexbuf) }
  | ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '_' '0'-'9']*
      { ID(Lexing.lexeme lexbuf) }
  | eof { EOF }
  | _ { failwith
        (Printf.sprintf "unknown token %s near characters %d-%d"
          (Lexing.lexeme lexbuf)
          (Lexing.lexeme_start lexbuf)
          (Lexing.lexeme_end lexbuf)) }

and comment = parse
  | "*/" { token lexbuf }
  | eof { failwith
        (Printf.sprintf "unknown token %s near characters %d-%d"
          (Lexing.lexeme lexbuf)
          (Lexing.lexeme_start lexbuf)
          (Lexing.lexeme_end lexbuf)) }
  | _ { comment lexbuf }
