# チュートリアル

## 1. はじめに

  newmlはOCamlのトランスレータ言語です。
  OCamlの多くのチュートリアルはOCamlTopのREPLで実行するのですが、ここではファイルに保存してコンパイルして実行するスタイルで説明します。

## 2. インストール

    $ make
    $ make install

## 3. Hello world

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

  TODO: 保存されたmlについて書く

## 4. 算術式とカリー化、改行、セミコロン

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

## 5. open

	open Printf
	open List

## 6. 変数

	variable : int = 2
	a = 1
	b = 2
	_ = 3

## 7. ブロック

	block : unit = {

	  printf("test 1\n")
	}

	block = {
	  printf("test 2\n")
	  printf("test 2\n")
	}

## 8. 関数


	functions() = {

	  printf("test\n")
	} functions()

	curry_function = {

	  f0:()=>int= {|() => 0 }
	  printf("%d\n")(f0())
	  f0():int= { 0 }
	  printf("%d\n")(f0())
	  f0():int= 0 
	  printf("%d\n")(f0())
	  f0()= 0 

	  printf("%d\n")(f0())
	  printf("%d\n"; f0())
	  printf("%d\n" f0())

	  f1:(int)=>int={|a => a }
	  printf("%d\n" f1(1))
	  f1(a:int):int={ a }
	  printf("%d\n" f1(1))
	  f1(a:int):int= a
	  printf("%d\n" f1(1))
	  f1(a:int)= a

	  printf("%d\n")(f1(1))
	  printf("%d\n"; f1(1))
	  printf("%d\n" f1(1))

	  f2:int(int)(int)={| a b => a + b }
	  printf("%d\n" f2(1 2))
	  f2(a:int):(int)=>int={| b => a + b }
	  printf("%d\n" f2(1 2))
	  f2(a:int)(b:int):int={a + b}
	  printf("%d\n" f2(1 2))
	  f2(a:int; b:int):int= a + b
	  printf("%d\n" f2(1 2))
	  f2(a:int b:int)= a + b

	  printf("%d\n")(f2(1)(2))
	  printf("%d\n"; f2(1; 2))
	  printf("%d\n" f2(1 2))

	  f3:int(int int int)={| a b c => a + b + c }
	  printf("%d\n" f3(1 2 3))
	  f3(a:int):int(int int)={| b c => a + b + c}
	  printf("%d\n" f3(1 2 3))
	  f3(a:int)(b:int):int(int)={| c => a + b + c}
	  printf("%d\n" f3(1 2 3))
	  f3(a:int)(b:int)(c:int):int={a + b + c}
	  printf("%d\n" f3(1 2 3))
	  f3(a:int; b:int; c:int):int= a + b + c
	  printf("%d\n" f3(1 2 3))
	  f3(a:int b:int c:int)= a + b + c

	  printf("%d\n")(f3(1)(2)(3))
	  printf("%d\n"; f3(1; 2; 3))
	  printf("%d\n" f3(1 2 3))

	  printf(
	    "%d %d %d %d\n"
	  )(
	    f0()
	  )(
	    f1(1)
	  )(
	    f2(1)(2)
	  )(
	    f3(1)(2)(3)
	  )

	  printf(
	    "%d %d %d %d\n";
	    f0();
	    f1(1);
	    f2(1; 2);
	    f3(1; 2; 3)
	  )

	  printf(
	    "%d %d %d %d\n"
	    f0()
	    f1(1)
	    f2(1 2)
	    f3(1 2 3)
	  )

	  printf("%d\n")(f3(-1)(-2)(-3))
	  printf("%d\n"; f3(-1; -2; -3))
	  printf("%d\n" f3(-1; -2; -3))

	  printf("%d+%d=%d\n")(a)(b)(a+b)
	  printf("%d+%d=%d\n"; a; b; a + b)
	  printf("%d+%d=%d\n" a b a + b)
	}

## 9. if else

	if_else() = {

	  if (a < 10) printf("b1\n")
	  if (a < 10) { printf("b2\n") }
	  if (a < 10) { printf("b2\n") printf("b3\n") }
	  if (a > 10) printf("a\n") else printf("b3\n")

	  printf(if (a < 1) "a\n" else "b1\n")
	} if_else()

## 10. 再帰関数

	recursive_function() = {

	  /* (let rec) */
	  def fib:(int)=>int = {| n =>
	    if (n == 0) 0
	    else if (n == 1) 1
	    else fib(n-2) + fib(n -1)

	  }

	  /*
	  def fib(n:int):int = {
	    if (n == 0) 0
	    else (if (n == 1) 1
	    else fib(n-2) + fib(n-1))
	  }
	  */

	  printf("fib 10 %d\n" fib(10))
	} recursive_function()

## 11. tuple

	tuple() = {

	  addt:(int,int)=>int = {| a,b =>
	    a + b
	  }
	  printf("%d\n" addt(1, 2))

	  /*
	  addt(int:a,int:b):int= a + b
	  */

	  /*
	  f3={
	    |(a,b,c) => a*b*c
	  }
	  */
	  /*
	  f3:(int,int,int)=>int={
	    |(a,b,c) => a*b*c
	  }
	  f3:int((int,int,int))={
	    |(a,b,c) => a*b*c
	  }
	  printf("%d" f3(1,2,3))
	  */


	  /*
	  printf("%d\n" addt(1,2))

	  ff2:(int,int)=>(int,int)=>int={
	    |a,b c,d => a*b + c*d
	  }

	  f2:int((int,int))((int,int))={
	    |a,b c,d => a*b + c*d
	  }
	  */
	  /*
	  f2:int((int,int);(int,int))={
	    |a,b c,d => a*b + c*d
	  }
	  */
	  /*
	  ff:int=>int,int=>int={
	    |a c,d => a + c*d
	  }

	  ff:int=>((int,int)=>int)={
	    |a c,d => a + c*d
	  }

	  ff:((int,int)=>int)(int)={
	    |a c,d => a + c*d
	  }

	  ff:int((int,int))(int)={
	    |a c,d => a + c*d
	  }
	  */
	  /*
	  ff:int(int int,int)={
	    |a c,d => a + c*d
	  }
	  */

	  f2:(int,int)=>(int,int)=>int={
	    |a,b c,d => a*b + c*d
	  }
	  /*
	  f2(a:int,b:int)(c:int,d:int):int={
	    a*b + c*d
	  }
	  */
	  printf("%d\n")(f2(1,2)(3,4))
	  printf("%d\n" f2(1,2 3,4))
	} tuple()

## 12. パターンマッチ

	pattern_match() = {

	  def fib:(int)=>int = {| n =>
	    n match {
	      | 0 => 0
	      | 1 => 1
	      | n => fib(n-2) + fib(n-1)
	    }
	  }

	  printf("fib 10 %d\n" fib(10))

	  /*
	  def fib(n:int):int = {
	    n match {
	      | 0 => 0 
	      | 1 => 1 
	      | n => fib(n-2) + fib(n-1)
	    }
	  }
	  */
	} pattern_match()

## 13. パーシャルファンクション

	parcial_function() = {

	  def fib:(int)=>int={
	    | 0 => 0
	    | 1 => 1
	    | n => fib(n-2) + fib(n-1)
	  }
	  
	  printf("fib 10 = %d\n" fib(10))

	  /* tuple parcual function */

	  llor:(int,int)=>int={
	    | 0,0 => a=1 b=2 a | b
	    | a,b => a | b
	  }

	  printf("llor %d\n" llor(1,2))
	} parcial_function()

## 14. リスト

	list() = {

	  iter({|x => printf("%d\n")(x)})([1; 2; 3; 4])
	  iter({|x => printf("%d\n"; x)})([1; 2; 3; 4])
	  iter({|x => printf("%d\n" x)})([1; 2; 3; 4])
	  iter({|x => printf("%d\n" x)}; [1; 2; 3; 4])
	  /* iter({|x = printf("%d\n" x)} [1; 2; 3; 4])*/
	  iter{|x => printf("%d\n" x)}([1; 2; 3; 4])
	  iter{|x => printf("%d\n" x)}([1 2 3 4])

	  [1 2 3 4] |> iter {
	   | x => printf("%d\n" x)
	  }

	  [1 2 3 4] |> map {
	    | x => x * 10
	  } |> iter {
	    | x => printf("%d\n" x)
	  }

	  /*
	  def ps(xs)= {
	    | [] => () ;
	    | x::xs => printf("%d\n" x) ps(xs)
	  }
	  ps(xs)
	  */
	} list()

## 15. レコード

	a type {x:int y:int}

	record() = {

	  a :a= {:x=1 y=2}

	  printf("%d\n" a.x)

	  printf("%d\n"; {:x=1+2*3 y={a=1 a}}.x)

	  aa = {|{:x}=>printf("%d\n" x)}

	  aa({:x=1 y=2})

	} record()

## 16. 代数データ型

	e type | EUnit | EInt(int) | EAdd(e, e)

	variant() = {

	  def eval:e=>int={
	    | EUnit => 0
	    | EInt(i) => i
	    | EAdd(a, b) => eval(a) + eval(b)
	  }

	  printf("1+2=%d\n" eval(EAdd(EInt(1), EInt(2))))
	} variant()

## 17. リファレンス

	reference() = {

	  a = & 1
	  *a := 2
	  printf("%d\n"; *a)
	  ++a
	  printf("%d\n"; *a)

	  b #= 1
	  ++b

	  printf("++ %d\n"; *b)
	  --b
	  printf("-- %d\n"; *b)
	} reference()

## 18. クロージャ

	closure() = {

	  block(sp)(f)={
	    printf("{\n")
	    f(sp ~ "  ")
	    printf("%s}\n" sp)
	  }
	  p = printf

	  p("def %s() " "a") block(""){|sp=>
	    p("%sdef %s() " sp "b") block(sp){|sp=>
	      p("%sprogram2()\n" sp)
	      p("%sprogram2()\n" sp)
	    }
	    p("%sprogram()\n" sp)
	  }
	  


	  block(sp)(f)={
	    printf("{\n")
	    f(sp ~ "  ")
	    printf("%s}\n" sp)
	  }
	  p = printf

	  p("def %s() " "a") block(""){|sp=>
	    p("%sdef %s() " sp "b") block(sp){|sp=>
	      p("%sprogram2()\n" sp)
	      p("%sprogram2()\n" sp)
	    }
	    p("%sprogram()\n" sp)
	  }
	} closure()

## 19. リスト2

	list_type = {

	  ls = [1 2 3]

	  ls |> iter {
	    |l => printf("%d," l)
	  } printf("\n")

	  ls:list[int] = [1 2 3]
	  
	  ls |> iter {
	    |l => printf("%d," l)
	  } printf("\n")

	  ls:list[(int,int)] = [1,2 3,4]
	  
	  ls |> iter {
	    |(l,r) =>
	      printf("(%d,%d);" l r)
	  } printf("\n")

	  def f={
	    | [] => ()
	    | x::xs =>
	      printf("%d,\n" x)
	      f(xs)
	  }

	  f([1 2 3])

	  printf("1+20=%d\n" 1 +
	    20)
	}

## 20. when

	whens = {

	  def fib:(int)=>int={
	    | n when n == 0 => 0
	    | n when n == 1 => 1
	    | n => fib(n-2) + fib(n-1)
	  }
	  printf("fib 11 %d\n" fib(11))
	}

## 21. モジュール

	A module {
	  a = 1234
	  inc(k) = k + 1
	}

	_ = {
	  
	  printf("A.a = %d A.inc(10) = %d\n" A.a A.inc(10))
	}

## 22. クラス

	ab class {
	  // private member
	  a = 123
	  // public method
	  def c = a

	  /*
	  // private method
	  - d = 10
	  */
	}
	_ = {

	  printf("ab.a = %d\n" new ab->c)
	}

	abc class(b:int c:int) {
	  // public method
	  def c = b
	}

	_ = {

	  printf("ab.a = %d\n" new abc(10 20)->c)
	  printf("ab.a = %d\n" 2*3+1)
	}

	fib class(x:int) {
	  def apply =
	    x match {
	      | 0 => 0
	      | 1 => 1
	      | n => new fib(x-2)->apply +
	             new fib(x-1)->apply
	    }
	}

	_ = {

	  printf("A.a = %d\n" new fib(10)->apply)
	  printf("%d %d\n" 1+2-3;-1)

	}

## 23. ループ

	array_and_loop = {
	  a = [| 1; 2; 3]
	  printf("%d%d%d\n" a[0] a[1] a[2])

	  for (i <- 0 to 3) {
	    printf("%d\n" i)
	  }

	  for (i <- 10 downto 1) {
	    printf("%d\n" i)
	  }

	  i = & 0
	  while (*i < 3) {
	    ++i
	    printf("while %d\n"; *i)
	  }
	}

## 24. 多相ヴァリアント

	variants = {

	  def eval = {
	    | `int(n) => n
	    | `add(a,b) => eval(a) + eval(b)
	    | `mul(a,b) => eval(a) * eval(b)
	  }
	  printf("%d\n" eval(`add(`mul(`int(10),`int(20)),`int(20))))
	}

## 25. キーワード引数

	keyword_params = {
	  f(#a:int=1 #b:int #c d) = a+b+c+d
	  printf("%d\n" f(a=1 b=2 c=5 3))

	  f(~a:int=1; ~b:int; ~c; d) = a+b+c+d
	  printf("%d\n" f(a=1 b=2 c=5 3))
	}

## 26. float

	floats = {
	  n = 1.234
	  m = n +. 10.5
	  printf("%f\n" m)
	}

## 27. コメント

  コメントはネストで来ます。

	/* /*nested comment*/ */

  また、１行コメントも書けます。

	// 1 line comment