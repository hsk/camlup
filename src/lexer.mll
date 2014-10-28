{
open Parser
}

let space = [' ' '\t']
let digit = ['0'-'9']

rule token = parse
  | space* ['\n' '\r' ';'] [' ' '\t' '\n' '\r' ';']* { SEMICOLON }
  | space+ { token lexbuf }
  | "open" { open_ lexbuf }
  | "/*" { comment lexbuf }
  | "//" [^ '\n' '\r']* ['\n' '\r'] { token lexbuf }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | '{' { LBRACE }
  | '}' { RBRACE }
  | '[' { LBRACK }
  | ']' { RBRACK }
  | "return" { RETURN }
  | "new" { NEW }
  | "this" { THIS }
  | "class" { CLASS }
  | "trait" { TRAIT }
  | "<:" { IMPLEMENT }
  | ":>" { RIMPLEMENT }
  | "=>" { ARROW }
  | "|>" { FARROW }
  | "->" { MEMBER }
  | "|>" { FARROW }
  | "if" { IF }
  | "else" { ELSE }
  | '@' { CASE }
  | "::" { ADDLIST }
  | "case" { CASE }
  | "match" { MATCH }
  | "when" { WHEN }
  | "type" { TYPE }
  | "module" { Printf.printf " module\n"; MODULE }
  | digit+ { INT(int_of_string (Lexing.lexeme lexbuf)) }

  | '^' { HAT }
  | "||" { LOR }
  | "&&" { LAMP }
  | '|' { OR }
  | '~' { XOR }
  | '&' { AMP }

  | "===" { EEQ }
  | "!==" { ENE }
  | "==" { EQ }
  | "!=" { NE }

  | '<' { LT }
  | '>' { GT }
  | "<=" { LE }
  | ">=" { GE }

  | '+' { ADD }
  | '-' { SUB }

  | '*' { MUL }
  | '/' { DIV }
  | '%' { MOD }

  | '.' { DOT }
  | ',' { COMMA }
  | ';' { SEMICOLON }
  | ':' { COLON }
  | ":=" { COLONASSIGN }
  | "#=" { REFASSIGN }
  | "def" { DEF }
  | '=' { ASSIGN }
  | '"' [^ '"']* '"' { STRING(Lexing.lexeme lexbuf) }
  | ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '_' '0'-'9']*
      { Printf.printf "%s\n" (Lexing.lexeme lexbuf); ID(Lexing.lexeme lexbuf) }
  | eof { EOF }
  | _ { failwith
        (Printf.sprintf "unknown token %s near characters %d-%d"
          (Lexing.lexeme lexbuf)
          (Lexing.lexeme_start lexbuf)
          (Lexing.lexeme_end lexbuf)) }

and open_ = parse
  | space+ { open_ lexbuf }
  | ['a'-'z' 'A'-'Z' '_' '.']* { OPEN(Lexing.lexeme lexbuf) }
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
