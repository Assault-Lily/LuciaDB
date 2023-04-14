# LuciaDB: Lily's unified correlation information as DataBase
![stat](https://img.shields.io/badge/dynamic/json?label=%E3%83%87%E3%83%BC%E3%82%BF%E6%95%B0&query=%24.results.bindings%5B%3A1%5D.stat.value&url=https%3A%2F%2Fluciadb.assaultlily.com%2Fsparql%2Fquery%3Fformat%3Djson%26query%3DPREFIX%2520lily%253A%2520%253Chttps%253A%252F%252Fluciadb.assaultlily.com%252Frdf%252FIRIs%252Flily_schema.ttl%2523%253E%250D%250APREFIX%2520rdf%253A%2520%253Chttp%253A%252F%252Fwww.w3.org%252F1999%252F02%252F22-rdf-syntax-ns%2523%253E%250D%250ASELECT%2520%2528group_concat%2528concat%2528%2527%2520%2527%252C%2520str%2528%253Fcnt%2529%252C%2520%2527%2520%2527%252C%2520if%2528contains%2528str%2528%253Fo%2529%252C%2520%2522Lily%2522%2529%252C%2520%2522Lilie%2522%252C%2520if%2528contains%2528str%2528%253Fo%2529%252C%2520%2522Play%2522%2529%252C%2520%2522Stage%2522%252C%2520strafter%2528str%2528%253Fo%2529%252C%2520str%2528lily%253A%2529%2529%2529%2529%252C%2520%2527s%2527%2529%253B%2520separator%253D%2527%252C%2527%2529%2520as%2520%253Fstat%2529%250D%250AWHERE%2520%257B%250D%250A%2520%2520SELECT%2520%253Fo%2520%2528COUNT%2528%253Fs%2529%2520AS%2520%253Fcnt%2529%250D%250A%2520%2520WHERE%2520%257B%250D%250A%2520%2520%2520%2520%253Fs%2520rdf%253Atype%2520%253Fo.%250D%250A%2520%2520%2520%2520FILTER%2528%253Fo%2520IN%2520%2528lily%253ALily%252C%2520lily%253ACharm%252C%2520lily%253ALegion%252C%2520lily%253APlay%252C%2520lily%253AMusic%2529%2529%250D%250A%2520%2520%257D%2520GROUP%2520BY%2520%253Fo%250D%250A%257D)
![triples](https://img.shields.io/badge/dynamic/json?color=blue&label=%E7%B7%8F%E9%A0%85%E7%9B%AE%E6%95%B0&query=%24.results.bindings%5B%3A1%5D.c.value&url=https%3A%2F%2Fluciadb.assaultlily.com%2Fsparql%2Fquery%3Fformat%3Djson%26query%3DSELECT%28COUNT%28%253Fo%29as%253Fc%29WHERE%257B%255B%255D%2520%253Fp%2520%253Fo.%257D)

![GitHub last commit (branch)](https://img.shields.io/badge/dynamic/json?color=orange&label=最終更新%20%28SPARQL%29&query=%24.last_update&url=https%3A%2F%2Fluciadb.assaultlily.com%2Fsparql%2Flast-update)

このリポジトリではアサルトリリィに登場するリリィやCHARMなどの情報をRDF形式で蓄積・公開しています。

#### データの収集・加筆にご協力頂ける方は是非 [こちら](CONTRIBUTING.md) をお読みください。

## データに関して

LuciaDBは原著作者である `AZONE INTERNATIONAL・acus` の許可を得て、全てのデータを [CC BY-NC-SA 4.0 国際 ライセンス](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.ja)のもとに公開しています。

RDFデータの更新は不定期に実施されます。なるべく迅速な更新を目指していますが、管理人である[ふぁぼ原](https://twitter.com/fvhP_)のリソース状況によっては更新が遅くなる場合があります。

RDFデータは可能な限りアサルトリリィ公式の情報源をもとに正確を期して作成していますが、誤った情報が含まれる場合があります。

情報の誤りにお気づきの場合はお手数ですが ↑ の [Issues](https://github.com/fvh-P/assaultlily-rdf/issues) > [New Issue](https://github.com/fvh-P/assaultlily-rdf/issues/new) からご一報ください。また、情報の追加などのご要望があれば同じく Issue へお願いします。

## ライセンスについて (License)

LuciaDBは「[クリエイティブ・コモンズ 表示 - 非営利 - 継承 4.0 国際 ライセンス](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.ja)」のもとで開発・提供されており、LuciaDBが公開するRDFファイル群またはAPIエンドポイントが提供する情報を複製、頒布、展示、実演する場合、以下の条件をお守りいただく必要があります。

- ライセンスを表記すること (本DBを利用した二次的著作物である場合はその旨も明記してください。)
- 非営利目的であること (著作権者から個別の許諾を得た場合を除く)
- 本DBを利用した二次的著作物についても、本DBと同じライセンスを適用すること

(これはあくまでライセンスの解説であり、ライセンス本文ではありません。ライセンスの全文は[こちら](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode.ja)をご覧ください。）

LuciaDB is provided under ["Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International" license](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.en). When you reproduce, distribute, display, or perform any of the RDF files published by LuciaDB or information provided by the API endpoints, you must comply with the following conditions

- Indicate the license. (When you created a derivative work using this DB, please indicate that as well.)
- Non-commercial use only. (Except in cases where you have been permitted individually from the copyright holder.)
- The same license as this DB must be applied to derivative works that use this DB.

(This is just an explanation of the license, not the full text of the license. The full text of the license can be found [here](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode.en).)

### ライセンス表記の例 (An example of license display)

|言語 (Language)|ライセンス表記の例 (An example of license display)|
|--|--|
|日本語|<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="クリエイティブ・コモンズ・ライセンス" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />本サイトが利用するアサルトリリィ関連データは、[LuciaDB](https://github.com/Assault-Lily/LuciaDB)によって[クリエイティブ・コモンズ 表示 - 非営利 - 継承 4.0 国際 ライセンス](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.ja)のもとに提供されています。|
|English|<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="クリエイティブ・コモンズ・ライセンス" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />The data of AssaultLily used in this site is provided by [LuciaDB](https://github.com/Assault-Lily/LuciaDB) under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.ja).|

## SPARQL API について

LuciaDB では、このリポジトリのデータを取得できる Web API を提供しています。

SPARQL (スパークル) という問い合わせ言語を使って、ここで公開されているデータを Web 経由で検索することができます。

注意: データは現在構築中で、頻繁に更新されると思われます。データの構造ごと変化する場合もありますのでご了承ください。

## SPARQL API の使い方

https://luciadb.assaultlily.com/sparql/query?format=json&query=
のあとに SPARQL のクエリをつなげてアクセス (GETリクエスト) するとクエリの実行結果が得られます。クエリ中の特殊文字のエスケープには十分注意してください。 `format=` パラメータで欲しいレスポンスデータの形式を指定することができます。 `json`, `xml`, `csv` などが指定できます。

リクエストボディにクエリを持たせて https://luciadb.assaultlily.com/sparql/query に対して POST リクエストを送信する方法でも使用できます。この場合、リクエストの `Content-Type` ヘッダの値は `application/sparql-query` とし、`Accept` ヘッダの値に欲しいレスポンスデータの形式を入れてください。 `application/json`, `application/xml`, `text/csv` などが指定できます。

### 例

- 吉村・Thi・梅のプロフィールを全て取得するクエリ
  ```sample1.ttl
  PREFIX lilyrdf: <https://luciadb.assaultlily.com/rdf/RDFs/detail/>
  DESCRIBE lilyrdf:Yoshimura_Thi_Mai
  ```
  実行結果は[こちら](https://luciadb.assaultlily.com/sparql/query?format=json&query=PREFIX%20lilyrdf%3A%20%3Chttps%3A%2F%2Fluciadb.assaultlily.com%2Frdf%2FRDFs%2Fdetail%2F%3E%0D%0ADESCRIBE%20lilyrdf%3AYoshimura_Thi_Mai)

- レギオン・ヘルヴォルの全メンバーのリソース情報を取得するクエリ
  ```sample2.ttl
  PREFIX lilyrdf: <https://luciadb.assaultlily.com/rdf/RDFs/detail/>
  PREFIX schema: <http://schema.org/>
  
  SELECT ?member
  WHERE {
    lilyrdf:Hervarar schema:member ?member.
  }
  ```
  実行結果は[こちら](https://luciadb.assaultlily.com/sparql/query?format=json&query=PREFIX%20lilyrdf%3A%20%3Chttps%3A%2F%2Fluciadb.assaultlily.com%2Frdf%2FRDFs%2Fdetail%2F%3E%0D%0APREFIX%20schema%3A%20%3Chttp%3A%2F%2Fschema.org%2F%3E%0D%0ASELECT%20%3Fmember%0D%0A%20%20WHERE%20%7B%0D%0A%20%20%20%20lilyrdf%3AHervarar%20schema%3Amember%20%3Fmember.%0D%0A%7D%0D%0A)

- レギオン・ヘルヴォルの全メンバーのリソース情報を使って全メンバーのプロフィールを取得するクエリ
  ```sample2.ttl
  PREFIX lilyrdf: <https://luciadb.assaultlily.com/rdf/RDFs/detail/>
  PREFIX schema: <http://schema.org/>
  
  SELECT ?member ?predicate ?object
  WHERE {
    lilyrdf:Hervarar schema:member ?member.
    ?member          ?predicate    ?object.
  }
  ```
  実行結果は[こちら](https://luciadb.assaultlily.com/sparql/query?format=json&query=PREFIX%20lilyrdf%3A%20%3Chttps%3A%2F%2Fluciadb.assaultlily.com%2Frdf%2FRDFs%2Fdetail%2F%3E%0D%0APREFIX%20schema%3A%20%3Chttp%3A%2F%2Fschema.org%2F%3E%0D%0ASELECT%20%3Fmember%20%3Fpredicate%20%3Fobject%0D%0A%20%20WHERE%20%7B%0D%0A%20%20%20%20lilyrdf%3AHervarar%20schema%3Amember%20%3Fmember.%0D%0A%20%20%20%20%3Fmember%20%3Fpredicate%20%3Fobject.%0D%0A%7D)

- 氏名の読みがなに「あ」を含むリリィの氏名を日本語の通常表記で取得するクエリ
  ```sample4.ttl
  PREFIX schema: <http://schema.org/>
  PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
  PREFIX lily: <https://luciadb.assaultlily.com/rdf/IRIs/lily_schema.ttl#>

  SELECT ?name
  WHERE {
    ?lily rdf:type lily:Lily;
          lily:nameKana ?namekana.
    FILTER(CONTAINS(?namekana,"あ"))
    ?lily schema:name ?name.
    FILTER(lang(?name)="ja")
  }
  ```
  実行結果は[こちら](https://luciadb.assaultlily.com/sparql/query?format=json&query=PREFIX%20schema%3A%20%3Chttp%3A%2F%2Fschema.org%2F%3E%0D%0APREFIX%20rdf%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX%20lily%3A%20%3Chttps%3A%2F%2Fluciadb.assaultlily.com%2Frdf%2FIRIs%2Flily_schema.ttl%23%3E%0D%0ASELECT%20%3Fname%0D%0AWHERE%20%7B%0D%0A%20%20%3Flily%20rdf%3Atype%20lily%3ALily%3B%0D%0A%20%20%20%20%20%20%20%20lily%3AnameKana%20%3Fnamekana.%0D%0A%20%20FILTER(CONTAINS(%3Fnamekana%2C%22%E3%81%82%22))%0D%0A%20%20%3Flily%20schema%3Aname%20%3Fname.%0D%0A%20%20FILTER(lang(%3Fname)%3D%22ja%22)%0D%0A%7D%0D%0A)

SPARQL のクエリの書き方について Web で検索すると色々情報はありますが、それでも結構難しいかもしれません。
「こんな検索したいけどクエリが書けない！」という方は [こちら](https://github.com/fvh-P/assaultlily-rdf/issues/4) に質問を投稿してください。

## 謝辞
LuciaDB のデータは [Contributor の皆様](https://github.com/Assault-Lily/LuciaDB/graphs/contributors)のご協力により作成されています。この場を借りてお礼申し上げます。
