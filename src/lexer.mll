{
open Parser
let buf = ref ""
}

let space = [' ' '\t']
let digit = ['0'-'9']


rule token = parse
  | '\r' '\n' space* "else" { incr lineno; ELSE }
  | '\r' '\n' { incr lineno; SEMI(!lineno) }
  | ['\n' '\r'] space* "else" { incr lineno; ELSE }
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
  | "jsnew" { JSNEW }
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
  | ":::" { CATLIST }
  | "::" { ADDLIST }
  | "case" { CASE }
  | "match" { MATCH }
  | "as" { AS }
  | "when" { WHEN }
  | "type" { TYPE }
  | "module" { MODULE }
  | digit+ { INT(int_of_string (Lexing.lexeme lexbuf)) }
  | '0' ['x' 'X'] ['0'-'9' 'a'-'f' 'A' - 'F']+ { INT(int_of_string (Lexing.lexeme lexbuf)) }
  | '0' ['o' 'O'] ['0'-'7']+ { INT(int_of_string (Lexing.lexeme lexbuf)) }
  | '0' ['b' 'B'] ['0'-'1']+ { INT(int_of_string (Lexing.lexeme lexbuf)) }
  | digit+ ('.' digit*)? (['e' 'E'] ['+' '-']? digit+)?
    { FLOAT(Lexing.lexeme lexbuf) }  

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
  | "##" { REFREF }
  | "def" { DEF }
  | "and" { AND }
  | '=' { ASSIGN }
  | '"' { buf:="\""; STR(str lexbuf) }
  | '\'' ([^ '\''] | "\\" (['"'  '\'' 'n' 'r' 't' 'b' ] | ['0'-'9'] ['0'-'9'] ['0'-'9']) )* '\'' { CHR(Lexing.lexeme lexbuf) }

  | ['`' 'a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '_' '0'-'9']*
      { VAR(Lexing.lexeme lexbuf) }
  | eof { EOF }
  | _
    {
      failwith (
        parse_error2 (
          Printf.sprintf "unknown token %s line %d"
            (Lexing.lexeme lexbuf)
            !lineno
        )
      )
    }

and open_ = parse
  | space+ { open_ lexbuf }
  | ['a'-'z' 'A'-'Z' '_' '.' '0'-'9']* { OPEN(Lexing.lexeme lexbuf) }
  | _
    {
      failwith (
        parse_error2 (
          Printf.sprintf "unknown token %s near line %d"
          (Lexing.lexeme lexbuf)
          !lineno
        )
      )
    }

and comment = parse
  | "*/" { () }
  | '\r' '\n' { incr lineno; comment lexbuf }
  | ['\n' '\r'] { incr lineno; comment lexbuf }

  | "/*" { comment lexbuf; comment lexbuf }
  | eof { Format.eprintf "warning: unterminated comment@." }
  | _ { comment lexbuf }

and str = parse
  | '\r' '\n' { incr lineno; buf:=!buf ^ (Lexing.lexeme lexbuf); (str lexbuf) }
  | ['\n' '\r'] { incr lineno; buf:=!buf ^ (Lexing.lexeme lexbuf); (str lexbuf) }
  | ("\\" (['"'  '\'' 'n' 'r' 't' 'b' ] | ['0'-'9'] ['0'-'9'] ['0'-'9']) ) { buf:=!buf ^ (Lexing.lexeme lexbuf);(str lexbuf) }
  | '"' { !buf ^ (Lexing.lexeme lexbuf) }
  | _ { buf:=!buf ^ (Lexing.lexeme lexbuf); (str lexbuf) }
  | eof { Format.eprintf "warning: unterminated comment@." ; !buf}
