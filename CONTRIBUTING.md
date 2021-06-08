# データの整備にご協力いただける方へ

アサルトリリィ非公式データベースのデータ整備にご協力いただきありがとうございます。
このページでは、RDFデータの作成方法や当データベースのデータ記述規則などについて説明します。

## TODO

現状最も整備が必要なのはリリィのデータです。収載されているリリィの人数が少ないため、未収載のリリィのデータを作成して頂けるとありがたいです。

## Contribute の方法

- GitHub で PullRequest を送ったりできる方
  
  ご自身のアカウントでリポジトリを fork して頂き、データを追加の上 PullRequest を送ってください。
  
  PullRequest を送ると、送っていただいたデータのフォーマットを rdflint というフォーマット検査ツールが検査しますので、合格するまで修正して頂けるとありがたいです。
  
  最終的にはふぁぼ原がデータをチェックし、取り込みます。

- PullRequest の送り方がよく分からない方
  
  適当なテキストエディタでデータを作成したら、当リポジトリの [Issues](https://github.com/fvh-P/assaultlily-rdf/issues) に新規 issue を建ててデータを貼り付けて頂くか、何らかの方法で[ふぁぼ原](https://twitter.com/fvhP_)までデータをお送りください。
  
## データ形式の概要

当 RDF データベースのデータは XML 形式で書かれています。本リポジトリの `RDFs` ディレクトリの中にデータファイルが格納されています。

百合ヶ丘のリリィは [`RDFs/lily_yurigaoka.rdf`](https://github.com/fvh-P/assaultlily-rdf/blob/master/RDFs/lily_yurigaoka.rdf)、エレンスゲのリリィは [`RDFs/lily_erensuge.rdf`](https://github.com/fvh-P/assaultlily-rdf/blob/master/RDFs/lily_erensuge.rdf) のように、リリィのデータはガーデンごとにファイルを分割しています。

ひとまとまりのデータは、`<rdf:Description rdf:about="...">` と `</rdf:Description>` に挟まれた部分に記述されています。
```rdf
<rdf:Description rdf:about="Hitotsuyanagi_Riri">
  梨璃のデータ
  ...
</rdf:Description>
```
このように、`rdf:about=""` にはそのデータが何のデータかを表すリソース名を付けてください。（他のデータと被ってはいけません。）

データの中身の各項目は、`<種類 形式>データ</種類>` というフォーマットでデータが記述されています。その項目にデータが存在しない、または不明の場合はコメントアウトしておいてください。コメントアウトしたい部分を `<!--` と `-->` で囲むとコメントアウトされます。

以下、一柳梨璃のデータを例に挙げて各項目について説明します。
```rdf
<rdf:Description rdf:about="Hitotsuyanagi_Riri">
  <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">一柳梨璃</rdfs:label> ## データラベル (基本フルネームを記入)
  <schema:familyName xml:lang="ja">一柳</schema:familyName>                  ## 姓
  <schema:familyName xml:lang="en">Hitotsuyanagi</schema:familyName>         ## ┣ 英字表記
  <lily:familyNameKana xml:lang="ja">ひとつやなぎ</lily:familyNameKana>       ## ┗ かな表記
  <!-- <schema:additionalName xml:lang="ja"></schema:additionalName> -->     ## ミドルネーム (梨璃にはミドルネームがないのでコメントアウト)
  <!-- <schema:additionalName xml:lang="en"></schema:additionalName> -->     ## ┣ 英字表記
  <!-- <lily:additionalNameKana xml:lang="ja"></lily:additionalNameKana> --> ## ┗ かな表記
  <schema:givenName xml:lang="ja">梨璃</schema:givenName>                     ## 名
  <schema:givenName xml:lang="en">Riri</schema:givenName>                    ## ┣ 英字表記
  <lily:givenNameKana xml:lang="ja">りり</lily:givenNameKana>                 ## ┗ かな表記
  <schema:name xml:lang="ja">一柳梨璃</schema:name>                           ## フルネーム
  <schema:name xml:lang="en">Hitotsuyanagi Riri</schema:name>                 ## ┣ 英字表記
  <lily:nameKana xml:lang="ja">ひとつやなぎりり</lily:nameKana>                ## ┗ かな表記
  <lily:anotherName xml:lang="ja">スノーフレイク</lily:anotherName>            ## 異名・二つ名
  <foaf:age rdf:datatype="http://www.w3.org/2001/XMLSchema#integer">15</foaf:age>                        # 年齢 (高校1年は15、2年は16、3年は17で固定とします)
  <schema:height rdf:datatype="http://www.w3.org/2001/XMLSchema#float">156.0</schema:height>             # 身長 (必ず .0 まで書きます)
  <schema:weight rdf:datatype="http://www.w3.org/2001/XMLSchema#float">49.0</schema:weight>              # 体重 (必ず .0 まで書きます)
  <schema:birthDate rdf:datatype="http://www.w3.org/2001/XMLSchema#gMonthDay">--06-19</schema:birthDate> # 誕生日 (--mm-dd という形式で月日を指定します) 
  <lily:lifeStatus rdf:datatype="http://www.w3.org/2001/XMLSchema#string">alive</lily:lifeStatus>        # 生命状態 (存命なら alive、故人は dead、不明は unknown)
  <!-- <lily:killedIn xml:lang="ja"></lily:killedIn> -->                                                 # 死因 (lifeStatus が dead で、死因が分かっている場合は記入)
  <lily:bloodType rdf:datatype="http://www.w3.org/2001/XMLSchema#string">A</lily:bloodType>              # 血液型 (不明の場合はコメントアウト)
  <schema:gender rdf:datatype="http://www.w3.org/2001/XMLSchema#string">female</schema:gender>           # 性別
  <lily:color rdf:datatype="http://www.w3.org/2001/XMLSchema#hexBinary">FF9DAE</lily:color>              # イメージカラー (大半のリリィには無い)
  <schema:birthPlace xml:lang="ja">山梨県甲州市</schema:birthPlace>            # 出身地 (市まで分かっていても○○県○○市と県から入れる)
  <schema:birthPlace xml:lang="en">Koshu City, Yamanashi</schema:birthPlace>  # ┗ 英字表記
  <lily:favorite xml:lang="ja">ラムネ</lily:favorite>                         # 好きなもの (複数ある場合このように1つずつ複数行に分けて書く)
  <lily:favorite xml:lang="ja">ハンバーガー</lily:favorite>                    # 好きなもの
  <lily:favorite xml:lang="ja">ジャンクフード</lily:favorite>                  # 好きなもの
  <lily:favorite xml:lang="ja">四つ葉のクローバー</lily:favorite>               # 好きなもの
  <lily:notGood xml:lang="ja">虫</lily:notGood>                               # 苦手なもの
  <lily:hobby_talent xml:lang="ja">身体を動かすこと</lily:hobby_talent>        # 趣味・特技
  <lily:hobby_talent xml:lang="ja">水晶集め</lily:hobby_talent>               # 趣味・特技
  <!-- <lily:skillerVal rdf:datatype="http://www.w3.org/2001/XMLSchema#integer"></lily:skillerVal> -->
  <lily:rareSkill rdf:datatype="http://www.w3.org/2001/XMLSchema#string">カリスマ</lily:rareSkill>         # レアスキル
  <!-- <lily:subSkill rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></lily:subSkill> -->         # サブスキル (複数判明している場合は複数行に分けて書く)
  <lily:isBoosted rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">false</lily:isBoosted>          # 強化リリィと判明している人は true、それ以外は false
  <!-- <lily:boostedSkill rdf:datatype="http://www.w3.org/2001/XMLSchema#string"></lily:boostedSkill> --> # ブーステッドスキル
  <lily:charm rdf:parseType="Resource">                                                       # ┓  使用CHARM情報。1種類につきこのまとまりごと追加する。
    <lily:resource rdf:resource="Gungnir"/>                                                   # ┃  CHARM の参照先リソース名。リソース名は charm.rdf で定義されている。グングニルは <rdf:Description rdf:about="Gungnir"> で定義されているので "Gungnir" と指定
    <lily:usedIn rdf:datatype="http://www.w3.org/2001/XMLSchema#string">舞台LoG</lily:usedIn>  # ┃  そのCHARMをどこで使ったか。
    <lily:usedIn rdf:datatype="http://www.w3.org/2001/XMLSchema#string">舞台TFG</lily:usedIn>  # ┃
    <lily:usedIn rdf:datatype="http://www.w3.org/2001/XMLSchema#string">ラスバレ</lily:usedIn> # ┃
    <lily:usedIn rdf:datatype="http://www.w3.org/2001/XMLSchema#string">アニメ</lily:usedIn>   # ┃
    <!-- <lily:additionalInformation xml:lang="ja"></lily:additionalInformation> -->          # ┃  そのCHARMに関する備考。ユニーク機体だとか試作機だとかSPだとかもここに記入する。
  </lily:charm>                                                                               # ┛
  <lily:charm rdf:parseType="Resource">
    <lily:resource rdf:resource="Brionac"/>
    <lily:usedIn rdf:datatype="http://www.w3.org/2001/XMLSchema#string">ドール Ver.2.0</lily:usedIn>
    <lily:additionalInformation xml:lang="ja">白井夢結より譲渡</lily:additionalInformation>
  </lily:charm>
  <lily:garden rdf:datatype="http://www.w3.org/2001/XMLSchema#string">私立百合ヶ丘女学院</lily:garden>          # 所属ガーデン (なるべく正式名称)
  <lily:gardenDepartment rdf:datatype="http://www.w3.org/2001/XMLSchema#string">普通科</lily:gardenDepartment> # 所属学科 (必ず「科」まで記入する)
  <lily:grade rdf:datatype="http://www.w3.org/2001/XMLSchema#integer">10</lily:grade>                          # 学年 (小学1年から通算した学年。高1は10。)
  <lily:class rdf:datatype="http://www.w3.org/2001/XMLSchema#string">椿組</lily:class>                         # 組 (必ず「組」まで記入する)
  <!-- <lily:gardenJobTitle xml:lang="ja"></lily:gardenJobTitle> -->                                          # ガーデンでの役職 (例: 田中壱なら「学級委員長」、出江史房なら「ブリュンヒルデ」と書かれる)
  <lily:legion rdf:resource="Radgrid"/>                                                                       # 所属レギオンのリソース名 (リソース名は legion.rdf で定義されている)
  <lily:legionJobTitle rdf:datatype="http://www.w3.org/2001/XMLSchema#string">隊長</lily:legionJobTitle>      # レギオンでの役職 (隊長・主将・リーダーなど全て「隊長」に統一)
  <lily:position rdf:datatype="http://www.w3.org/2001/XMLSchema#string">BZ</lily:position>                    # リリィの適正ポジション (複数ポジションをこなすリリィの場合、1つずつ複数行に分けて書く)
  <!-- <lily:pastLegion rdf:resource=""/> -->        # 過去の所属レギオンのリソース名
  <!-- <lily:taskforce rdf:resource=""/> -->         # 参加した臨時・特別部隊のリソース名
  <lily:schutzengel rdf:resource="Shirai_Yuyu"/>     # シュッツエンゲルのリソース名 (ルド女の場合は lily:olderSchwester になっている)
  <!-- <lily:pastSchutzengel rdf:resource=""/> -->   # 過去のシュッツエンゲルのリソース名 (シュッツエンゲル関係を解消していたり、死別している場合はこちらに記入)
  <!-- <lily:schild rdf:resource=""/> -->            # シルトのリソース名 (ルド女の場合は lily:youngerSchwester になっている)
  <!-- <lily:pastSchild rdf:resource=""/> -->        # 過去のシルトのリソース名 (シュッツエンゲル関係を解消していたり、死別している場合はこちらに記入)
  <lily:roomMate rdf:resource="Ito_Shizu"/>          # 寮のルームメイトのリソース名
  <!-- <schema:parent rdf:resource=""/> -->          # 親のリソース名 (現在不使用なので更新不要)
  <!-- <schema:sibling rdf:parseType="Resource"> -->                                                                          # ┓  (疑似でない) 兄弟姉妹のデータ
    <!-- <lily:resource rdf:resource=""/> -->                                                                                 # ┃  # 兄弟姉妹のリソース名 
    <!-- <lily:additionalInformation xml:lang="ja"></lily:additionalInformation> --> # ┃  # 当人から見た関係の説明
  <!-- </schema:sibling> -->                                                                                                  # ┛
  <lily:relationship rdf:parseType="Resource">                                                                                # ┓  その他人間関係のデータ
    <lily:resource rdf:resource="Hata_Matsuri"/>                                                                              # ┃  # 関係のある人物のリソース名
    <lily:additionalInformation xml:lang="ja">師匠</lily:additionalInformation>      # ┃  # 当人から見た関係の説明
  </lily:relationship>                                                                                                        # ┛
  <lily:relationship rdf:parseType="Resource">
    <lily:resource rdf:resource="Hitotsuyanagi_Yuri"/>
    <lily:additionalInformation xml:lang="ja">かけがえのない存在</lily:additionalInformation>
  </lily:relationship>
  <lily:cast rdf:parseType="Resource">                                         # ┓ キャストのデータ
    <schema:name xml:lang="ja">赤尾ひかる</schema:name>                         # ┃ キャスト名
    <lily:resource rdf:resource="http://www.wikidata.org/entity/Q28685785"/>   # ┃ Wikidata や DBPedia でのキャストのリソース
    <lily:performIn rdf:resource="Assault_Lily_Bouquet"/>                      # ┃ 出演作のリソース名
    <lily:performIn rdf:resource="Assault_Lily_Last_Bullet"/>                  # ┃ 
    <lily:performIn rdf:resource="League_of_Gardens"/>                         # ┃ 
    <lily:performIn rdf:resource="The_Fateful_Gift"/>                          # ┃ 
  </lily:cast>                                                                 # ┛
  <rdf:type rdf:resource="https://lily.fvhp.net/rdf/IRIs/lily_schema.ttl#Lily"/> # このデータの種類 (リリィなら末尾 Lily、CHARMなら末尾 Charm、舞台公演なら末尾 Play など)
</rdf:Description>
```

データを作成する際は、基本的に同じ種類（リリィならリリィ）の既存のデータをコピーして、データの部分を書き換えるようにして頂くと素早く作成できます。

### リリィ同士の関係性について

リリィ同士の関係性を記述する場合、「友人」のような双方向の関係は必ず双方のリリィに記述してください。

また、一つの関係性に対して複数の説明が存在する場合、それぞれの説明を別々に `lily:additionalInformation` に記述してください。
例として、二水 -> 日羽梨の関係の説明を載せておきます。

```rdf
  <lily:relationship rdf:parseType="Resource">
    <lily:resource rdf:resource="Yamanashi_Hibari"/>
    <lily:additionalInformation xml:lang="ja">親しい先輩</lily:additionalInformation>
    <lily:additionalInformation xml:lang="ja">戦術を教わる師匠</lily:additionalInformation>
  </lily:relationship>
```
