# 変更ログ



## 0.0.6 2014.11.11

- オブジェクト指向の機能追加

mutableなメンバ変数を#で、privateなメソッドを~で、publicなメソッドを+で指定出来るようになりました。また、自分自身はthisでアクセスします。:>を使ってキャストします。

	enemy class (x:float y:float) {
	  // mutable variable
	  # x = x
	  # y = y
	  // private method
	  ~ incx = x <- x +. 1.0
	  ~ incy = y <- y +. 1.0
	  // public method
	  + move = {
	    this->incx
	    this->incy
	  }
	  + draw = {
	    printf("enemy %f %f\n" x y)
	  }
	}

	enemy2 class (x:float y:float) {
	  # x = x
	  # y = y
	  + move = y <- y +. 100.0
	  + draw = {
	  	printf("enemy %f %f\n" x y)
	  }
	}

	_ = {
	  es = [
	    new enemy(10.0 20.0)
	    new enemy2(10.0 20.0) :> enemy
	  ]
	  List.iter{|e=> e->move; e->draw }(es)
	}

- js_of_ocaml対応

js_of_ocamlを使用する事で、javascriptを生成する事が出来ます。
js_of_ocamlの演算子##が追加してあります。

- js_of_ocaml対応に伴って、

	add(a,b) = a + b

形式の関数が動くようになりました。

## 0.0.5 2014.11.03

- windows バイナリビルド漏れ対応

今後気を付けます。

## 0.0.4 2014.11.03

- 名前をnewcamlからcamlupに変更
- `-p` オプションで構文木出力
- x,y = 1,2の対応時のバグ解消
- matchの複数|対応

以下の式が通るようになりました。

    value match {
      | 0
      | 1
      | 2 -> 0
      | n -> n
    }

- ネストしたtupleの対応
	
以下の式が通るようになりました。

    x,y = (1,2),(3,4)

- examples/lablgl/points.nml のサンプルが動作するようになりました。

## 0.0.3 2014.11.02

- moduleのMapファンクタの生成に対応
  詳しくは[チュートリアル](https://github.com/hsk/newml/blob/master/docs/tutorial/README.md#22-%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB)を参照してください。
- コメント後にパースエラーになってしまう不具合対策
- モジュールドキュメントの追加
- 文字列内のエスケープ文字対応
- 前置 `-.` 演算子の追加
- []演算子の優先順位の変更
- レコード定義の`;`(改行)対応
- 2進数、8進数、16進数のリテラル追加

## 0.0.2 2014.10.31

`match`の`as`に対応
`-v` で `version`の表示

## 0.0.1

最初のリリース
バグは多いですが、大まかな機能が動作します。

