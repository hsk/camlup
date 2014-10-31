{
open Parser
}

let space = [' ' '\t']
let digit = ['0'-'9']

rule token = parse
  | '\r' '\n' { incr lineno; SEMI(!lineno) }
  | ['\n' '\r'] { incr lineno; SEMI(!lineno) }
  | ';' { SEMI(!lineno) }
  | space+ { token lexbuf }
  | "open" { open_ lexbuf }
  | "/*" {
      let no = !lineno in
      comment lexbuf;
      if no <> !lineno then SEMI(!lineno)
      else token lexbuf
    }
  | "//" [^ '\n' '\r']* ['\n' '\r'] { incr lineno; SEMI(!lineno) }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | '{' { LBRACE }
  | '}' { RBRACE }
  | '[' { LBRACK }
  | ']' { RBRACK }
  | "for" { FOR }
  | "while" { WHILE }
  | "to" { TO }
  | "until" { UNTIL }
  | "downto" { DOWNTO }
  | "return" { RETURN }
  | "new" { NEW }
  | "this" { THIS }
  | "class" { CLASS }
  | "trait" { TRAIT }
  | "<-" { ARROWASSIGN }
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
  | "as" { AS }
  | "when" { WHEN }
  | "type" { TYPE }
  | "module" { MODULE }
  | digit+ { INT(int_of_string (Lexing.lexeme lexbuf)) }
  | digit+ ('.' digit*)? (['e' 'E'] ['+' '-']? digit+)?
    { FLOAT(float_of_string (Lexing.lexeme lexbuf)) }  

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

  | "--" { DEC }
  | "++" { INC }
  | '!' { NOT }
  | "-." { FSUB }
  | "+." { FADD }
  | "*." { FMUL }
  | "/." { FDIV }
  | "**" { FPOW }

  | '.' { DOT }
  | ',' { COMMA }
  | ':' { COLON }
  | ":=" { COLONASSIGN }
  | '#' { REF }
  | "#=" { REFASSIGN }
  | "def" { DEF }
  | '=' { ASSIGN }
  | '"' [^ '"']* '"' { STR(Lexing.lexeme lexbuf) }
  | ['`' 'a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '_' '0'-'9']*
      { VAR(Lexing.lexeme lexbuf) }
  | eof { EOF }
  | _
    {
      failwith (
        Printf.sprintf "unknown token %s line %d"
          (Lexing.lexeme lexbuf)
          !lineno
      )
    }

and open_ = parse
  | space+ { open_ lexbuf }
  | ['a'-'z' 'A'-'Z' '_' '.']* { OPEN(Lexing.lexeme lexbuf) }
  | _
    {
      failwith (
        Printf.sprintf "unknown token %s near line %d"
        (Lexing.lexeme lexbuf)
        !lineno
      )
    }

and comment = parse
  | "*/" { () }
  | '\r' '\n' { incr lineno; comment lexbuf }
  | ['\n' '\r'] { incr lineno; comment lexbuf }

  | "/*" { comment lexbuf; comment lexbuf }
  | eof { Format.eprintf "warning: unterminated comment@." }
  | _ { comment lexbuf }
