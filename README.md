# LuciaDB: Lily's unified correlation information as DataBase
![stat](https://img.shields.io/badge/dynamic/json?label=%E3%83%87%E3%83%BC%E3%82%BF%E6%95%B0&query=%24.results.bindings%5B%3A1%5D.stat.value&url=https%3A%2F%2Flily.fvhp.net%2Fsparql%2Fquery%3Fformat%3Djson%26query%3DPREFIX%2520lily%253A%2520%253Chttps%253A%252F%252Flily.fvhp.net%252Frdf%252FIRIs%252Flily_schema.ttl%2523%253E%250D%250APREFIX%2520rdf%253A%2520%253Chttp%253A%252F%252Fwww.w3.org%252F1999%252F02%252F22-rdf-syntax-ns%2523%253E%250D%250ASELECT%2520%2528group_concat%2528concat%2528%2527%2520%2527%252C%2520str%2528%253Fcnt%2529%252C%2520%2527%2520%2527%252C%2520if%2528contains%2528str%2528%253Fo%2529%252C%2520%2522Lily%2522%2529%252C%2520%2522Lilie%2522%252C%2520if%2528contains%2528str%2528%253Fo%2529%252C%2520%2522Play%2522%2529%252C%2520%2522Stage%2522%252C%2520strafter%2528str%2528%253Fo%2529%252C%2520str%2528lily%253A%2529%2529%2529%2529%252C%2520%2527s%2527%2529%253B%2520separator%253D%2527%252C%2527%2529%2520as%2520%253Fstat%2529%250D%250AWHERE%2520%257B%250D%250A%2520%2520SELECT%2520%253Fo%2520%2528COUNT%2528%253Fs%2529%2520AS%2520%253Fcnt%2529%250D%250A%2520%2520WHERE%2520%257B%250D%250A%2520%2520%2520%2520%253Fs%2520rdf%253Atype%2520%253Fo.%250D%250A%2520%2520%2520%2520FILTER%2528%253Fo%2520IN%2520%2528lily%253ALily%252C%2520lily%253ACharm%252C%2520lily%253ALegion%252C%2520lily%253APlay%252C%2520lily%253AMusic%2529%2529%250D%250A%2520%2520%257D%2520GROUP%2520BY%2520%253Fo%250D%250A%257D)
![triples](https://img.shields.io/badge/dynamic/json?color=blue&label=%E7%B7%8F%E9%A0%85%E7%9B%AE%E6%95%B0&query=%24.results.bindings%5B%3A1%5D.c.value&url=https%3A%2F%2Flily.fvhp.net%2Fsparql%2Fquery%3Fformat%3Djson%26query%3DSELECT%28COUNT%28%253Fo%29as%253Fc%29WHERE%257B%255B%255D%2520%253Fp%2520%253Fo.%257D)

![GitHub last commit (branch)](https://img.shields.io/badge/dynamic/json?color=orange&label=最終更新%20%28SPARQL%29&query=%24.last_update&url=https%3A%2F%2Flily.fvhp.net%2Fsparql%2Flast-update)

An unofficial RDF database of Assault Lily

アサルトリリィ非公式データベース

このリポジトリではアサルトリリィに登場するリリィやCHARMなどの情報をRDF形式で蓄積・公開しています。

#### データの収集・加筆にご協力頂ける方は是非 [こちら](CONTRIBUTING.md) をお読みください。

### 注意

本プロジェクトは非公式です。公開しているデータは可能な限りアサルトリリィ公式の情報源をもとに作成していますが、誤った情報あるいは独自の見解が含まれる場合があります。

情報の誤りにお気づきの場合はお手数ですが ↑ の [Issues](https://github.com/fvh-P/assaultlily-rdf/issues) > [New Issue](https://github.com/fvh-P/assaultlily-rdf/issues/new) からご一報ください。また、情報の追加などのご要望があれば同じく Issue へお願いします。

## SPARQL エンドポイントについて

このリポジトリの管理人である[ふぁぼ原](https://twitter.com/fvhP_)が、このリポジトリのデータを SPARQL (スパークル) エンドポイントとして提供しています。

SPARQL という問い合わせ言語を使って、ここで公開されているデータを Web 経由で検索することができます。

注意: データは現在構築中で、頻繁に更新されると思われます。データの構造ごと変化する場合もありますのでご了承ください。

## SPARQL エンドポイントの使い方
https://lily.fvhp.net/sparql/query?format=json&query=
のあとに SPARQL のクエリをつなげてアクセスするとクエリの実行結果が得られます。

### 例

- 吉村・Thi・梅のプロフィールを全て取得するクエリ
  ```sample1.ttl
  PREFIX lilyrdf: <https://lily.fvhp.net/rdf/RDFs/detail/>
  DESCRIBE lilyrdf:Yoshimura_Thi_Mai
  ```
  実行結果は[こちら](https://lily.fvhp.net/sparql/query?format=json&query=PREFIX%20lilyrdf%3A%20%3Chttps%3A%2F%2Flily.fvhp.net%2Frdf%2FRDFs%2Fdetail%2F%3E%0D%0ADESCRIBE%20lilyrdf%3AYoshimura_Thi_Mai)

- レギオン・ヘルヴォルの全メンバーのリソース情報を取得するクエリ
  ```sample2.ttl
  PREFIX lilyrdf: <https://lily.fvhp.net/rdf/RDFs/detail/>
  PREFIX schema: <http://schema.org/>
  
  SELECT ?member
  WHERE {
    lilyrdf:Hervarar schema:member ?member.
  }
  ```
  実行結果は[こちら](https://lily.fvhp.net/sparql/query?format=json&query=PREFIX%20lilyrdf%3A%20%3Chttps%3A%2F%2Flily.fvhp.net%2Frdf%2FRDFs%2Fdetail%2F%3E%0D%0APREFIX%20schema%3A%20%3Chttp%3A%2F%2Fschema.org%2F%3E%0D%0ASELECT%20%3Fmember%0D%0A%20%20WHERE%20%7B%0D%0A%20%20%20%20lilyrdf%3AHervarar%20schema%3Amember%20%3Fmember.%0D%0A%7D%0D%0A)

- レギオン・ヘルヴォルの全メンバーのリソース情報を使って全メンバーのプロフィールを取得するクエリ
  ```sample2.ttl
  PREFIX lilyrdf: <https://lily.fvhp.net/rdf/RDFs/detail/>
  PREFIX schema: <http://schema.org/>
  
  SELECT ?member ?predicate ?object
  WHERE {
    lilyrdf:Hervarar schema:member ?member.
    ?member          ?predicate    ?object.
  }
  ```
  実行結果は[こちら](https://lily.fvhp.net/sparql/query?format=json&query=PREFIX%20lilyrdf%3A%20%3Chttps%3A%2F%2Flily.fvhp.net%2Frdf%2FRDFs%2Fdetail%2F%3E%0D%0APREFIX%20schema%3A%20%3Chttp%3A%2F%2Fschema.org%2F%3E%0D%0ASELECT%20%3Fmember%20%3Fpredicate%20%3Fobject%0D%0A%20%20WHERE%20%7B%0D%0A%20%20%20%20lilyrdf%3AHervarar%20schema%3Amember%20%3Fmember.%0D%0A%20%20%20%20%3Fmember%20%3Fpredicate%20%3Fobject.%0D%0A%7D)

- 氏名の読みがなに「あ」を含むリリィの氏名を日本語の通常表記で取得するクエリ
  ```sample4.ttl
  PREFIX schema: <http://schema.org/>
  PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
  PREFIX lily: <https://lily.fvhp.net/rdf/IRIs/lily_schema.ttl#>

  SELECT ?name
  WHERE {
    ?lily rdf:type lily:Lily;
          lily:nameKana ?namekana.
    FILTER(CONTAINS(?namekana,"あ"))
    ?lily schema:name ?name.
    FILTER(lang(?name)="ja")
  }
  ```
  実行結果は[こちら](https://lily.fvhp.net/sparql/query?format=json&query=PREFIX%20schema%3A%20%3Chttp%3A%2F%2Fschema.org%2F%3E%0D%0APREFIX%20rdf%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX%20lily%3A%20%3Chttps%3A%2F%2Flily.fvhp.net%2Frdf%2FIRIs%2Flily_schema.ttl%23%3E%0D%0ASELECT%20%3Fname%0D%0AWHERE%20%7B%0D%0A%20%20%3Flily%20rdf%3Atype%20lily%3ALily%3B%0D%0A%20%20%20%20%20%20%20%20lily%3AnameKana%20%3Fnamekana.%0D%0A%20%20FILTER(CONTAINS(%3Fnamekana%2C%22%E3%81%82%22))%0D%0A%20%20%3Flily%20schema%3Aname%20%3Fname.%0D%0A%20%20FILTER(lang(%3Fname)%3D%22ja%22)%0D%0A%7D%0D%0A)

SPARQL のクエリの書き方について Web で検索すると色々情報はありますが、それでも結構難しいかもしれません。
「こんな検索したいけどクエリが書けない！」という方は [こちら](https://github.com/fvh-P/assaultlily-rdf/issues/4) に質問を投稿してください。
