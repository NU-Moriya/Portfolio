# こだわLink
![top画](https://user-images.githubusercontent.com/68894426/100492894-6e370900-3174-11eb-808b-aedecb41681b.png)

## サイト概要
共通のこだわりを持つ人同士や企業と繋がる投稿SNS<br>
実際のサイトはこちらです[Click here](https://codawalink.net)

### サイトテーマ
他の人にはあまり理解されないような"あるこだわり"<br>
マニアックで周囲には語りづらいような”あるこだわり"<br>
もっと探求したい”あるこだわり"<br>
そんなこだわりを持つ人同士が、共通のこだわりで繋がり<br>
自分の活き活きを作れる場にして欲しい。
 
### なぜ”こだわLink”を作ったか
何かに惚れ込んだら熱くなり深く追求していく人が<br>
周りからなかなか理解されずにいることもあると思います。<br>
せっかく活き活きとしたその人の魅力を出せるような機会にもかかわらず<br>
それができないことはもったいないことだと感じでいます。<br>
そんな人達が共通のこだわりを通して情報交換をし、活き活きとした居場所を感じて欲しいと思ったからです。<br>

また、その投稿を見ている企業が、「こだわりさん」たちの意見から<br>
商品開発の参考になるような機会があれば素敵だと感じたからです。

### 主な利用シーン
こだわりに関する新しい発見や感想を発信したいとき<br>
自分が持っていない情報が欲しいとき<br>
シェアされているこだわり分野で企業が有益な情報を得たいとき


## 設計書

### 主な機能
- ログイン機能<br>
- 投稿機能<br>
- お気に入り、Bravoを贈る機能<br>
- 検索機能<br>
- ランキング機能<br>
- DM機能<br>
- お問い合わせ機能<br>

*詳細機能は以下のGoogleドキュメント内に記載しております<br>
[詳細を見る](https://docs.google.com/spreadsheets/d/1k5espNMz27Bz4dX3Puxk6FfYIN1K_7to97ORvlRSQ6c/edit#gid=0)

### 活用gem
- devise(ログイン)<br>
- kaminari(ページネーション)<br>
- dotenv-rails(環境変数)<br>
- Refile(画像投稿)

### テーブル定義書
[詳細をみる](https://docs.google.com/spreadsheets/d/12dH_hzwtzXALE7hzrnb6iPMMWlVsFByG4Xu53JJ97II/edit#gid=0)

### AWS構成図
![AWS 構成図](https://user-images.githubusercontent.com/68894426/101237652-e88bfe00-371d-11eb-8f9e-9c80dbd28388.jpg)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby 2.6.3 ,SQL
- フレームワーク：Ruby on Rails 5.2.4.4
- JSライブラリ：jQuery
- IDE：Cloud9
- フロント:Bootstrap4
