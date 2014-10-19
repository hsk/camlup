let parse input =
  let inp = open_in input in
  let lexbuf = Lexing.from_channel inp in
  let ast = Parser.prog Lexer.token lexbuf in
  close_in inp;
  ast  

let to_string ast =
  Gen_ml.print_prog Format.std_formatter ast
  
let trans input output =
  let ast = parse input in
  let out = open_out output in
  Gen_ml.print_prog (Format.formatter_of_out_channel out) ast;
  close_out out

let r_parse input =
  let inp = open_in input in
  let lexbuf = Lexing.from_channel inp in
  let ast = R_parser.prog R_lexer.token lexbuf in
  close_in inp;
  ast  

let r_trans input output =
  let ast = r_parse input in
  let out = open_out output in
  Gen_ml.print_prog (Format.formatter_of_out_channel out) ast;
  close_out out

let get_ext name =
  if Str.string_match (Str.regexp ".*\\.\\([^.]*\\)$") name 0 then
    Str.matched_group 1 name
  else
    ""

let replace_ext name ext =
  Str.global_replace (Str.regexp "\\(\\.[^.]*$\\)") ext name

let _ =
  let files: string list ref = ref [] in
  let run = ref false in
  Arg.parse
    [("-run", Arg.Unit(fun()->run:=true), "run")]
    (fun s -> files := !files @ [s])
    ("Newml Compiler (C) Hiroshi Sakurai\n" ^
     Printf.sprintf "usage: %s [-run] ...filenames" Sys.argv.(0));
  List.iter (fun (name) ->
    let ext = get_ext name in
    match ext with
    | "nml" -> trans name (replace_ext name ".ml")
    | "rml" -> r_trans name (replace_ext name ".ml")
    | _ -> failwith "bad filetype."
  ) !files;
  if !run then
    exit(Utils.run("ocaml "^(replace_ext (List.hd !files) ".ml")))
  else
    exit(1)