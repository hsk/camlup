# チュートリアル

## 1. はじめに

newmlはOCamlのトランスレータ言語です。
OCamlの多くのチュートリアルはOCamlTopのREPLで実行するのですが、ここではファイルに保存してコンパイルして実行するスタイルで説明します。

## 2. インストール

    $ make
    $ make install

## Hello world

`hello.nml`というファイル名で以下の内容を保存します。

	// hello.nml
	print_string("Hello world!\n")

`hello.nml`ファイルのあるパスに移動し、以下のコマンドを実行します。

	$ nmlc -run hello.nml


すると、`hello.ml`ファイルが生成され、ocamlコマンドで実行されます。

	$ nmlc -run hello.nml
	Hello world!
	$

newmlでは多くのC言語系統の言語と同じように関数呼び出しに()が必須です。


	// hello02.nml
	print_string "Hello world!\n"

OCamlでは以上のようなプログラムが実行出来ますが、newmlでは、２つの式 `print_string` と `"Hello world!\n"`のように認識されます。そのため、何も起こりません。

	$ nmlc -run hello02.nml
	$

## 3. 算術式とカリー化、改行、セミコロン

`arith.ml`と言うファイルを作成し以下の内容を記述して保存します。

	Printf.printf("%d\n")(1)
	Printf.printf("%d %d %d %d\n")(1)(2)(3)(4)
	Printf.printf("%d %d %d %d\n" 1 2 3 4)
	Printf.printf("%d\n" 1+1)
	Printf.printf("%d\n" 1+2*3)
	Printf.printf("%d\n"; -1-2+10/5)
	Printf.printf("%d\n"
		-1)

実行すると

	$ nmlc -run arith.ml
	1
	1 2 3 4
	1 2 3 4
	2
	7
	-1
	-1
	$

と表示されます。Printf.printfを使うとC言語のprintfと同じような出力フォーマットで出力する事が出来ます。
C言語系統の言語と違って、引数の区切り文字`,`が無い事に注意してください。
newml(OCaml)では、printf関数はカリー化された関数です。したがって、

	Printf.printf("%d\n")(1)

のように記述する必要があります。これはこれでなじみのある分かりやすい記述です。
しかし以下のように、４つの引数があった場合を考えるととても括弧が増えてしまいます。

	Printf.printf("%d %d %d %d\n")(1)(2)(3)(4)

そこで、newmlではこの括弧を省略する事が出来ます。

	Printf.printf("%d %d %d %d\n" 1 2 3 4)

いくつも括弧を記述する事はなくスッキリしました。

	Printf.printf("%d\n" 1+1)

足し算等の式を書く事も出来ます。

	Printf.printf("%d\n" 1+2*3)

かけ算と足し算ではかけ算が優先されます。

	Printf.printf("%d\n" -1-2+10/5)

マイナスが手前に来た場合、`"%d\n"`と `-1`が接続してしまいます。

	Printf.printf("%d\n"; -1-2+10/5)

このような場合、`;`を間に記述する事で前の式との接続を切断する事が出来ます。

newmlでは改行も、;と同じ意味を持つので

	Printf.printf("%d\n"
		-1)

のように記述しても接続しないように出来ます。
