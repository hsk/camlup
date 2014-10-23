{
open Parser
}

let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']

rule token = parse
  | space+ { token lexbuf }
  | "/*" { comment lexbuf }
  | "//" [^ '\n' '\r']* ['\n' '\r'] { token lexbuf }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | digit+ { INT(int_of_string (Lexing.lexeme lexbuf)) }
  | '"' [^ '"']* '"'  { STR(Lexing.lexeme lexbuf) }
  | ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '_' '0'-'9']* { VAR(Lexing.lexeme lexbuf) }
  | '+' { ADD }
  | '-' { SUB }
  | '*' { MUL }
  | '|' { OR }
  | '?' { CASE }
  | ';' { SEMI }
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
