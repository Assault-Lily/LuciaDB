# データの整備にご協力いただける方へ

アサルトリリィ非公式データベースのデータ整備にご協力いただきありがとうございます。
このページでは、RDFデータの作成方法や当データベースのデータ記述規則などについて説明します。

## どんな作業に協力すればいい？

当リポジトリの [Issues](https://github.com/fvh-P/assaultlily-rdf/issues) にやるべきことがリストアップされています。各 issue にはラベルが貼ってありますので、 `Priority-High` や `help wanted` が貼られている作業にご協力いただけると大変助かります。

もちろん、それ以外のものでも(極論、issue にないものでも)構いませんので、できる範囲でご協力いただけるとありがたいです。

## Contribute の方法

- GitHub で PullRequest を送ったりできる方
  
  ご自身のアカウントでリポジトリを fork して頂き、データを追加の上 PullRequest を送ってください。
  
  コミットメッセージは [Lemonade](https://lemonade.lily.garden/) のトップページにも表示されるので、変更内容が分かるように**日本語で**書いていただけると助かります。
  
  PullRequest を送ると、送っていただいたデータのフォーマットを rdflint というフォーマット検査ツールが検査しますので、合格するまで修正してください。(assaultlily-rdf に PR を送るのが初めての場合、管理者が承認するまで rdflint による検査は走りません。気づき次第承認しますのでお待ちください。)
  
  最終的には管理者(ふぁぼ原)がデータをチェックし、取り込みます。

- PullRequest の送り方がよく分からない方
  
  適当なテキストエディタでデータを作成したら、当リポジトリの [Issues](https://github.com/fvh-P/assaultlily-rdf/issues) に新規 issue を建ててデータを貼り付けて頂くか、何らかの方法で[ふぁぼ原](https://twitter.com/fvhP_)までデータをお送りください。
  
## データ形式の概要

当 RDF データベースのデータは [Turtle (Terse RDF Triple Language)](https://www.w3.org/TeamSubmission/turtle/) 形式で書かれています。本リポジトリの `RDFs` ディレクトリの中にデータファイルが格納されています。

百合ヶ丘のリリィは [`RDFs/lily_yurigaoka.ttl`](https://github.com/fvh-P/assaultlily-rdf/blob/master/RDFs/lily_yurigaoka.ttl)、エレンスゲのリリィは [`RDFs/lily_herensuge.ttl`](https://github.com/fvh-P/assaultlily-rdf/blob/master/RDFs/lily_herensuge.ttl) といったように、リリィのデータファイルはガーデンごとに分割されています。

ひとまとまりのデータは英文と同じように主題 `<...>` で始まりピリオド `.` で終わります。
```turtle
<Hitotsuyanagi_Riri>
  梨璃のデータ
.
```
`<...>` には他のデータと被らない一意のリソース名を付けてください。

データの中身の各項目は、`項目名 "データ"^^型 ;` の形式で記述されています。その項目にデータが存在しない、または不明の場合は `#` でコメントアウトしておいてください。

以下、一柳梨璃のデータを例に挙げて各項目について説明します。
```turtle
<Hitotsuyanagi_Riri>
    rdfs:label "一柳梨璃"^^xsd:string ;			# データラベル (基本フルネームを記入)
    schema:familyName "一柳"@ja, "Hitotsuyanagi"@en ;	# 姓 ("漢字表記"@ja, "英語表記"@en)
    lily:familyNameKana "ひとつやなぎ"@ja ;		# ┗ かな表記
    # schema:additionalName ""@ja, ""@en ;		# ミドルネーム (梨璃にはミドルネームがないのでコメントアウト)
    # lily:additionalNameKana ""@ja ;			# ┗ かな表記
    schema:givenName "梨璃"@ja, "Riri"@en ;		# 名 ("漢字表記"@ja, "英語表記"@en)
    lily:givenNameKana "りり"@ja ;			# ┗ かな表記
    schema:name "一柳梨璃"@ja, "Hitotsuyanagi Riri"@en ;	# フルネーム ("漢字表記"@ja, "英語表記"@en)
    lily:nameKana "ひとつやなぎりり"@ja ;			# ┗ かな表記
    lily:anotherName "スノーフレイク"@ja ;		# 異名・二つ名
    foaf:age "15"^^xsd:integer ;		# 年齢 (高校1年は15、2年は16、3年は17で固定とします)
    schema:height "156.0"^^xsd:float ;		# 身長 (必ず .0 まで書きます)
    schema:weight "49.0"^^xsd:float ;		# 体重 (必ず .0 まで書きます)
    schema:birthDate "--06-19"^^xsd:gMonthDay ;	# 誕生日 (--mm-dd という形式で月日を指定します) 
    lily:lifeStatus "alive"^^xsd:string ;	# 生死 (存命なら alive、故人は dead、不明は unknown)
    # lily:killedIn ""^^xsd:string ;		# 死因 (lifeStatus が dead で、死因が分かっている場合は記入)
    lily:bloodType "A"^^xsd:string ;		# 血液型 (不明の場合はコメントアウト)
    schema:gender "female"^^xsd:string ;	# 性別
    lily:color "FF9DAE"^^xsd:hexBinary ;	# イメージカラー (大半のリリィには無い)
    schema:birthPlace "山梨県甲州市"@ja,"Koshu City, Yamanashi"@en ;	# 出身地 (○○県○○市と県から入れる)
    lily:favorite				# 好きなもの (複数ある場合このように1つずつ複数行に分けて書く)
        "ラムネ"@ja,				# 好きなもの
        "ハンバーガー"@ja,			# 好きなもの
        "ジャンクフード"@ja,			# 好きなもの
        "四つ葉のクローバー"@ja ;			# 好きなもの
    lily:notGood "虫"@ja ;			# 苦手なもの
    lily:hobby_talent				# 趣味・特技 (複数ある場合このように1つずつ複数行に分けて書く)
        "身体を動かすこと"@ja,			# 趣味・特技
        "水晶集め"@ja ;				# 趣味・特技
    # lily:skillerVal ""^^xsd:integer ;		# スキラー数値
    lily:rareSkill "カリスマ"^^xsd:string ;	# レアスキル
    # lily:subSkill ""^^xsd:string ;		# サブスキル (複数判明している場合は複数行に分けて書く)
    lily:isBoosted false ;			# 強化リリィと判明している人は true、それ以外は false
    # lily:boostedSkill ""^^xsd:string ;	# ブーステッドスキル
    lily:charm [				# ┓  使用CHARM情報。1種類につきこのまとまりごと追加する。
        lily:resource <Gungnir> ;		# ┃  CHARM の参照先リソース名。リソース名は charm.ttl で定義されている。
        lily:usedIn				# ┃  そのCHARMをどこで使ったか。
            "舞台LoG"^^xsd:string,		# ┃
            "舞台TFG"^^xsd:string,		# ┃
            "ラスバレ"^^xsd:string,		# ┃
            "アニメ"^^xsd:string ;		# ┃
        # lily:additionalInformation ""@ja ;	# ┃  そのCHARMに関する備考。ユニーク機体だとか試作機だとかSPだとかもここに記入する。
    ], [					# ┛
        lily:resource <Brionac> ;
        lily:usedIn "ドール Ver.2.0"^^xsd:string ;
        lily:additionalInformation "白井夢結より譲渡"@ja ;
    ] ;
    lily:garden "私立百合ヶ丘女学院"^^xsd:string ;	# 所属ガーデン (なるべく正式名称)
    lily:gardenDepartment "普通科"^^xsd:string ;	# 所属学科 (必ず「科」まで記入する)
    lily:grade "10"^^xsd:integer ;		# 学年 (小学1年から通算した学年。高1は10。)
    lily:class "椿組"^^xsd:string ;		# 組 (必ず「組」まで記入する)
    # lily:gardenJobTitle ""@ja ;		# ガーデンでの役職 (例: 田中壱なら「学級委員長」、出江史房なら「ブリュンヒルデ」と書かれる)
    lily:legion <Radgrid> ;			# 所属レギオンのリソース名 (リソース名は legion.ttl で定義されている)
    lily:legionJobTitle "隊長"^^xsd:string ;	# レギオンでの役職 (隊長・主将・リーダーなど全て「隊長」に統一)
    lily:position "BZ"^^xsd:string ;		# リリィの適正ポジション (複数ポジションをこなすリリィの場合、1つずつ複数行に分けて書く)
    # lily:pastLegion <> ;			# 過去の所属レギオンのリソース名
    # lily:taskforce <> ;			# 所属部隊のリソース名
    # lily:pastTaskforce <> ;			# 過去の所属部隊のリソース名
    lily:schutzengel <Shirai_Yuyu> ;		# シュッツエンゲルのリソース名 (ルド女の場合は lily:olderSchwester になっている)
    # lily:pastSchutzengel <> ;			# 過去のシュッツエンゲルのリソース名 (シュッツエンゲル関係を解消していたり、死別している場合はこちらに記入)
    # lily:schild <> ;				# シルトのリソース名 (ルド女の場合は lily:youngerSchwester になっている)
    # lily:pastSchild <> ;			# 過去のシルトのリソース名 (シュッツエンゲル関係を解消していたり、死別している場合はこちらに記入)
    lily:roomMate <Ito_Shizu> ;			# 寮のルームメイトのリソース名
    # schema:parent <> ;			# 親のリソース名 (現在不使用なので更新不要)
    # schema:sibling [				# ┓  (疑似でない) 兄弟姉妹のデータ
    #    lily:resource <> ;			# ┃ 兄弟姉妹のリソース名 
    #    lily:additionalInformation ""@ja ;	# ┃ 当人から見た関係の説明
    # ] ;					# ┛
    lily:relationship [				# ┓  その他の人間関係のデータ
        lily:resource <Hata_Matsuri> ;		# ┃  # 関係のある人物のリソース名
        lily:additionalInformation "師匠"@ja ;	# ┃  # 当人から見た関係の説明
    ], [					# ┛
        lily:resource <Hitotsuyanagi_Yuri> ;
        lily:additionalInformation "かけがえのない存在"@ja ;
    ] ;
    lily:cast [								# ┓ キャストのデータ
        schema:name "赤尾ひかる"@ja ;					# ┃ キャスト名
        lily:resource <http://www.wikidata.org/entity/Q28685785> ;	# ┃ Wikidata や DBPedia でのキャストのリソース
        lily:performIn							# ┃ 出演作のリソース名
            <Assault_Lily_Bouquet>,					# ┃
            <Assault_Lily_Last_Bullet>,					# ┃
            <League_of_Gardens>,					# ┃
            <The_Fateful_Gift>,						# ┃
            <Lost_Memories> ;						# ┃
        # lily:additionalInformation ""@ja ;				# ┃ キャストに関する備考
    ] ;									# ┛
    a lily:Lily ;	# このデータの種類 (リリィなら末尾 Lily、CHARMなら末尾 Charm、舞台公演なら末尾 Play など)
.
```

データを作成する際は、基本的に同じ種類（リリィならリリィ）の既存のデータをコピーして、データの部分を書き換えるようにして頂くと素早く作成できます。

### リリィ同士の関係性について

リリィ同士の関係性を記述する場合、「友人」のような双方向の関係は必ず双方のリリィに記述してください。

また、一つの関係性に対して複数の説明が存在する場合、それぞれの説明を別々に `lily:additionalInformation` に記述してください。例として、二水 -> 日羽梨の関係の説明を載せておきます。

```turtle
    [
        lily:resource <Yamanashi_Hibari> ;
        lily:additionalInformation
            "親しい先輩"@ja,
            "戦術を教わる師匠"@ja ;
    ] ;
```
