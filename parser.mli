type token =
  | INT of (int)
  | ID of (string)
  | SUB
  | ADD
  | OR
  | SEMICOLON
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | LBRACK
  | RBRACK
  | PRINT
  | EOF
  | COLON
  | COMMA
  | COLONASSIGN
  | REFASSIGN
  | ASSIGN
  | RETURN
  | OPEN of (string)
  | STRING of (string)
  | STRUCT
  | THIS
  | DOT
  | IF
  | ELSE
  | IMPLEMENT
  | RIMPLEMENT
  | TRAIT
  | ARROW
  | MEMBER
  | FARROW
  | LT
  | GT
  | LE
  | GE
  | EQ
  | HAT
  | MUL
  | AMP
  | DIV
  | CAST
  | NEW
  | AT
  | DEF
  | CASE
  | MATCH
  | TYPE
  | ADDLIST

val prog :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.prog
